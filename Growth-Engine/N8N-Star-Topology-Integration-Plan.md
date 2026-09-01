# N8N Growth Engine — Star-Topology Integration Plan

> **What this changes:** today, modules call each other directly — 1.5 Central CRM Sync holds `Execute Workflow` nodes pointing straight at 2.1, 2.4, 2.5, 2.7; 2.5 points at 2.6; 2.6 points at 2.7. That's a **mesh/chain**: every module that calls another has to know that other module's live workflow ID, which is exactly why the audit found stale `REPLACE_WITH_..._WORKFLOW_ID` placeholders and two diverging copies of the same 14 modules (§1.1 of the audit). Adding a 15th module means editing whichever existing modules need to call it.
>
> **Star topology instead:** one central **Hub** workflow sits in the middle. Every module (**spoke**) only ever talks to the Hub — never to each other. A spoke finishes its job, reports what happened to the Hub, and the Hub decides what runs next. No spoke needs to know any other spoke's workflow ID; only the Hub does. Adding module #15 later means wiring it to the Hub once, touching zero existing spokes.

---

## 0. Architecture — what the Hub actually is

Two things, kept as separate n8n workflows so each stays simple:

### 0.1 The spine: one Postgres table

```sql
CREATE TABLE funnel_events (
  id SERIAL PRIMARY KEY,
  event_type TEXT NOT NULL,        -- e.g. 'lead.qualified', 'proposal.sent', 'payment.received'
  source_module TEXT NOT NULL,     -- e.g. '1.4', '2.4', '2.6'
  client_id INTEGER,               -- FK-ish to clients_master.id
  odoo_lead_id INTEGER,
  payload JSONB,                   -- whatever the receiving spoke needs
  status TEXT DEFAULT 'pending',   -- pending -> dispatched -> done | failed
  error_message TEXT,
  created_at TIMESTAMP DEFAULT now(),
  dispatched_at TIMESTAMP,
  completed_at TIMESTAMP
);
CREATE INDEX idx_funnel_events_pending ON funnel_events (status, created_at) WHERE status = 'pending';
```

This table is the one thing every module in the company will eventually touch. It replaces the informal "read `clients_master.status`, guess what to do" pattern currently only used by 1.5, and replaces every direct `Execute Workflow` cross-link.

### 0.2 The Hub — two workflows

- **Hub-Intake**: a thin, reusable **sub-workflow** (`Execute Workflow Trigger` entry point) that any spoke calls with one line — `{event_type, client_id, payload}` — and it does exactly one thing: `INSERT INTO funnel_events`. Every spoke gets a single new node at its end: "Report to Hub." That's the only new thing spokes need to know about.
- **Hub-Dispatcher**: a `Schedule Trigger` (every 1–2 min, same pattern 1.5 already uses today) that:
  1. Fetches `funnel_events WHERE status = 'pending'`, oldest first.
  2. A `Switch` node keyed on `event_type` — one output per event type, one `Execute Workflow` node per output, pointed at the correct spoke.
  3. Marks the event `dispatched`, then `done` (or `failed`, with `error_message`, wired into the error-handling work from the previous audit's Phase F1 — the Hub becomes the **one** place that needs an error workflow, and every spoke inherits it for free).

Visually:

```
                         ┌─────────────────────────┐
                         │   HUB-INTAKE (sub-wf)    │
                         │  spokes call this to     │
                         │  report what happened    │
                         └────────────┬─────────────┘
                                      │ INSERT
                                      ▼
                         ┌─────────────────────────┐
                         │   funnel_events table     │
                         └────────────┬─────────────┘
                                      │ poll every 1-2 min
                                      ▼
                         ┌─────────────────────────┐
                         │   HUB-DISPATCHER          │
                         │  Switch on event_type →   │
                         │  Execute Workflow (spoke)  │
                         └─────┬──────┬──────┬───────┘
                 ┌─────────────┘      │      └──────────────┐
                 ▼                    ▼                     ▼
            1.1 spoke            2.4 spoke              6.5 spoke
         (Content→Social)    (Proposal Gen)          (Churn Win-back)
                 │                    │                     │
                 └──── all report back to HUB-INTAKE ────────┘
```

Every spoke keeps its own natural trigger where it has one (webhooks stay webhooks — Typebot, Cal.com, Documenso, payment gateway — the Hub doesn't replace those, it only replaces module-to-module calls). The only rewiring is: **remove direct Execute Workflow links between spokes, add one "Report to Hub" node at the end of each spoke, and let the Dispatcher own all the routing decisions that 1.5's four IF nodes currently make inline.**

### 0.3 Why this is worth doing (concretely, against what the audit found)

| Audit finding | How the star topology fixes it |
|---|---|
| §1.1 — two diverging copies of Phase 1/2, stale `REPLACE_WITH_..._WORKFLOW_ID` placeholders | Only the Hub-Dispatcher's Switch node needs real workflow IDs — one place, not five modules each holding a copy of another's ID. |
| §2.1 — 1.5's four IF nodes silently drop unmatched stages | Dispatcher's Switch node has a default/"no match" output by construction — route it to a `flagged_events` log instead of dropping. |
| §1.3 — no error handling anywhere | One `errorWorkflow` set on the Hub-Dispatcher (or even simpler: on Hub-Intake, since every spoke funnels through it) covers the whole system's routing layer in one place. Per-spoke internal error handling from Phase F1 of the previous plan is still needed for logic *inside* each spoke, but the hand-off layer is fixed centrally. |
| Adding a new module | Wire it to Hub-Intake (one node) + add one Switch branch on the Dispatcher. Zero existing spokes touched. |

---

## 1. Integration Plan — Micro-Phases (Phase S, "Star")

Same granularity as the audit's Phase F and the master tracker's MAXSPLIT sessions. Do **Phase F0–F2 from the audit first** (canonical repo, error handling, retry) — this plan assumes a clean single source of truth to rewire, not two diverging copies.

### S0 — Build the spine

|Done|Step|Action|
|-|-|-|
|[ ]|S0.1|Create the `funnel_events` table (§0.1 SQL) — add it to the `00-MASTER-MIGRATIONS.sql` file from the audit's Phase F5.|
|[ ]|S0.2|Define the initial `event_type` taxonomy — one row per current cross-module hand-off. Minimum set to start: `lead.qualified`, `lead.booked`, `proposal.ready`, `contract.signed`, `payment.received`, `client.onboarded`. (Exact list built in S0.3.)|
|[ ]|S0.3|Walk every existing `Execute Workflow` node in the current mesh (1.5→2.1/2.4/2.5/2.7, 2.5→2.6, 2.6→2.7) and every module that currently *should* hand off but doesn't yet (e.g. 6.6 NPS "promoter flagged" → 6.7 Case Study ask, 6.9 Advocacy) — write the full `event_type` list down as a one-page reference doc before building anything.|

### S1 — Build Hub-Intake

|Done|Step|Action|
|-|-|-|
|[ ]|S1.1|New workflow, `Execute Workflow Trigger` as entry node, three input fields: `event_type`, `client_id`, `payload`.|
|[ ]|S1.2|One Postgres Insert node → `funnel_events`.|
|[ ]|S1.3|Return the new `funnel_events.id` to the caller (lets a spoke log its own event ID for traceability).|
|[ ]|S1.4|Test standalone: call it manually with a dummy `lead.qualified` event, confirm the row lands.|

### S2 — Build Hub-Dispatcher

|Done|Step|Action|
|-|-|-|
|[ ]|S2.1|`Schedule Trigger`, every 1–2 min (match 1.5's existing polling cadence so nothing changes response-time expectations).|
|[ ]|S2.2|Postgres node: `SELECT * FROM funnel_events WHERE status='pending' ORDER BY created_at LIMIT 50`.|
|[ ]|S2.3|`Switch` node on `event_type`, one output per type from the S0.2/S0.3 taxonomy.|
|[ ]|S2.4|Add a default/no-match output on the Switch → insert into a `flagged_events` review table + Odoo Discuss alert (this is the fix for §2.1's silent-drop problem — build it in from day one).|
|[ ]|S2.5|For each Switch output: one `Execute Workflow` node pointed at the correct spoke, passing `payload`.|
|[ ]|S2.6|After dispatch: Postgres Update → `status='dispatched', dispatched_at=now()`. On the spoke's own success/fail report-back (via S1), a second small listener marks `done`/`failed`.|
|[ ]|S2.7|Set `settings.errorWorkflow` on the Dispatcher itself, pointed at the shared error handler from the audit's Phase F1.|
|[ ]|S2.8|Test standalone with the dummy event from S1.4 — confirm it dispatches to the right spoke.|

### S3 — Migrate Phase 1 spokes (5 modules)

|Done|Step|Action|
|-|-|-|
|[ ]|S3.1|1.3 Website Lead Capture: after `Insert into clients_master`, add "Report to Hub" node → `event_type: lead.captured`.|
|[ ]|S3.2|1.4 Inbound Form Qualification: after `Update clients_master with Score`, add "Report to Hub" → `event_type: lead.qualified`.|
|[ ]|S3.3|1.5 Central CRM Sync: this is the big one — **remove all 4 IF nodes and all 4 Execute Workflow nodes**. Replace the whole back half of this workflow with a single "Report to Hub" call using whatever stage was detected as the `event_type` (`lead.qualified`, `lead.booked`, `proposal.ready`, `client.won`). The Dispatcher now owns what happens next, not 1.5.|
|[ ]|S3.4|1.1 Content→Social Factory, 1.2 SEO Automation: no cross-module hand-off currently exists for these (they're standalone content pipelines) — leave as-is, just confirm no change needed.|
|[ ]|S3.5|End-to-end test: submit a test lead through Typebot, confirm it flows 1.3 → Hub → 1.4 → Hub → 1.5 → Hub → correct Phase 2 spoke, with a `funnel_events` row at every hop.|

### S4 — Migrate Phase 2 spokes (9 modules)

|Done|Step|Action|
|-|-|-|
|[ ]|S4.1|2.1 Multichannel Outreach: add "Report to Hub" on reply-received path → `event_type: lead.replied` (currently this loops back into nurture logic inline — decide in S0.3 whether that stays inline or also routes through the Hub; recommend keeping same-module internal loops inline, only cross-module hops go through the Hub).|
|[ ]|S4.2|2.3 Booking Sync: after `Postgres - Mark Booked`, add "Report to Hub" → `event_type: lead.booked` (this currently isn't called by anything upstream via Execute Workflow — it's webhook-triggered by Cal.com directly, which stays as-is; only its *outbound* hand-off changes).|
|[ ]|S4.3|2.4 Proposal Generation: remove its trigger dependency on being called directly; add `Execute Workflow Trigger` input instead (Dispatcher calls it), plus "Report to Hub" after `Postgres - Mark Proposal Sent` → `event_type: proposal.sent`.|
|[ ]|S4.4|2.5 Contract E-Sign: remove the direct `Execute Workflow - 2.6 Invoice + Payment` node; replace with "Report to Hub" after `Postgres - Mark Won` → `event_type: contract.signed`.|
|[ ]|S4.5|2.6 Invoice Payment: remove the `Execute Workflow - 2.7 Client Onboarding` node (added during the audit's merge fix); replace with "Report to Hub" after `Postgres - Mark Paid` → `event_type: payment.received`.|
|[ ]|S4.6|2.7 Client Onboarding: add `Execute Workflow Trigger` input (Dispatcher calls it now, not 2.6 directly); add "Report to Hub" after `Postgres - Mark Onboarded` → `event_type: client.onboarded`.|
|[ ]|S4.7|2.8 Delivery Reporting, 2.9 Renewal Revenue Ops: these run on their own schedule triggers already (weekly/30-day polling) — add "Report to Hub" on their key transitions (`event_type: renewal.due`, `event_type: payment.failed`) so Phase 6 churn/win-back modules can react without polling `clients_master` themselves.|
|[ ]|S4.8|End-to-end test: run a lead all the way from qualified through onboarded, confirm every hop shows in `funnel_events` with correct timestamps and no manual Execute Workflow links remain in 1.5, 2.5, or 2.6.|

### S5 — Migrate Phase 4–5 spokes (reply-tracking + qualification, 8 modules)

|Done|Step|Action|
|-|-|-|
|[ ]|S5.1|4.3.1 Waha WhatsApp Reply Tracking, 4.3.2 LinkedIn Reply Check Polling, 4.3.3 Reply Merge/Nurture Suppression: add "Report to Hub" → `event_type: reply.received` at the point each currently updates `clients_master`.|
|[ ]|S5.2|5.1.1 BANT/MEDDIC Extraction: add `Execute Workflow Trigger` input so the Dispatcher can call it off a `reply.received` event instead of whatever currently triggers it; "Report to Hub" on completion → `event_type: qualification.scored`.|
|[ ]|S5.3|5.1.2 Write Qualification to Odoo: same pattern — trigger from Dispatcher on `qualification.scored`, report `event_type: qualification.written`.|
|[ ]|S5.4|4.1.3 SMS Re-engagement, 4.2.1 DNC Call List Prep, 4.2.2 Dialer Trigger/Outcome: these are schedule/webhook-triggered already with no upstream module dependency — just add "Report to Hub" on their outcome events (`event_type: reengagement.sent`, `event_type: call.outcome`) so Phase 6 can react.|

### S6 — Migrate Phase 6–7 spokes (13 modules)

|Done|Step|Action|
|-|-|-|
|[ ]|S6.1|6.1.1 Account Health Rollup: add "Report to Hub" → `event_type: health.scored` (feeds 6.2.2 Milestone Missed Alert and 6.4.1 Upsell Trigger, which currently poll independently).|
|[ ]|S6.2|6.2.1, 6.2.2, 6.3.1, 6.4.1: switch these from independently polling `clients_master`/health scores to being triggered off `health.scored` / `support.ticket_logged` events via the Dispatcher — cuts down on 4 separate cron jobs all reading the same table.|
|[ ]|S6.3|6.5 Churn Win-back: trigger off `event_type: renewal.overdue` (from S4.7) instead of its own independent schedule poll; report `event_type: winback.escalated` on the day-21 founder escalation step specifically, so that one gets its own alert path.|
|[ ]|S6.4|6.6 NPS Feedback: report `event_type: nps.promoter_flagged` when a promoter score lands — this is the hand-off 6.7 (Case Studies) and 6.8 (Referral) currently each poll for independently; have both subscribe to the same event instead.|
|[ ]|S6.5|6.7 Case Studies, 6.8 Referral Program: switch from independent `Fetch Un-Asked Promoters` / `Fetch Promoters Without Referral Link` polling to being Dispatcher-triggered off `nps.promoter_flagged`.|
|[ ]|S6.6|6.9 Advocacy: report `event_type: advocate.flagged` when the 2-in-6-months threshold hits (ties into the audit's F6.1 sign-off item — the human-review step can now be a Hub-routed task instead of a manual polling job).|
|[ ]|S6.7|7.1 Deliverability Monitor: report `event_type: deliverability.alert` on the over-threshold branch (this is also the audit's §2.1/§3.4 unwired-branch fix — building the Hub report-out *is* the fix, do them together).|
|[ ]|S6.8|7.2 List Auto-Refresh: no cross-module hand-off needed, leave as-is.|

### S7 — Decommission the old mesh, validate, document

|Done|Step|Action|
|-|-|-|
|[ ]|S7.1|Grep every spoke for any remaining `Execute Workflow` node that points at another spoke directly (should be zero outside the Hub-Dispatcher itself) — this is the final proof the mesh is gone.|
|[ ]|S7.2|Re-generate the merged single-file funnel export (if still used) from the now-star-shaped sources, so it doesn't silently reintroduce direct links.|
|[ ]|S7.3|Build one simple dashboard (Metabase, already in the stack per module 2.8) on `funnel_events`: counts by `event_type` and `status`, oldest pending event age, failed-event list. This becomes the single screen that shows the health of the entire funnel — something the current mesh has no equivalent of.|
|[ ]|S7.4|Full end-to-end regression test: one synthetic lead run all the way from Typebot capture through onboarding through a simulated renewal, confirming every single hop routes through `funnel_events` and the Metabase dashboard shows it live.|
|[ ]|S7.5|Update `DEPLOYMENT-GUIDE.md` and the module READMEs: replace "copy this workflow ID into that placeholder" instructions (the ones the original audit flagged in §1.1) with "point the Dispatcher's Switch node at this workflow's ID" — one place to document instead of five.|
|[ ]|S7.6|Write a one-page "adding a new module" doc: (1) build the spoke, (2) give it an `Execute Workflow Trigger` input if the Hub should call it, (3) add a "Report to Hub" node if other modules need to react to it, (4) add one Switch branch on the Dispatcher. That's the entire integration cost for module #15 onward.|

---

## 2. Rollout order and risk notes

- **Do this after, not instead of, the audit's Phase F0–F2.** Rewiring a system that still has zero error handling and two diverging copies just moves the same problems into a new shape. Clean single source of truth first.
- **S3.3 (rewiring 1.5) is the highest-risk single step** — it's the busiest hub in the current mesh, touched by the most other modules. Do it in a maintenance window, keep the old IF-node version available to roll back to for one full business cycle before deleting it.
- **Migrate in the batches above, test after each batch**, not all 40 modules in one sitting — same philosophy as the master tracker's micro-sessions.
- **Latency trade-off, worth knowing up front:** direct Execute Workflow calls are synchronous (instant). Routing through the Hub's 1–2 min poll adds that much delay to every hand-off. For anything time-sensitive (e.g. instant auto-response after form qualification), keep that specific step's immediate action inline in the spoke itself, and only use the Hub for the *next* module's hand-off — don't route something that needs to happen in the same second through a polling queue.
- **This does not replace webhook-triggered entry points** (Typebot, Cal.com, Documenso, payment gateway, Postal inbound replies) — those stay exactly as they are today. The star topology only replaces module-to-module calls, not external-event-to-module calls.
