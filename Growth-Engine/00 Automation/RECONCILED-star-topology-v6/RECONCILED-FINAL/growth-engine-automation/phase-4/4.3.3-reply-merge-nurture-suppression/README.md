# 4.3.3 — Merge Reply Channels + Nurture Filter Patch

**Plan ID:** 4.3.3 (Phase 4, parent session 3 of 3 under "Reply Tracking")
**Depends on:** 4.3.1 (Waha WhatsApp reply tracking) ✅, 4.3.2 (LinkedIn reply-check polling) ✅ — both marked done.
**File:** `4.3.3-Reply-Merge-Nurture-Suppression.json`

> **S5.3 update (star topology):** Added a **Report to Hub** node right after `Update clients_master (reply + suppress)` → `event_type: reply.received`. This is the one place in the whole reply-tracking chain where the Hub needs to be told "a reply came in" — see "Why only this file reports to the Hub" below.

---

## What this actually is

4.3.1 and 4.3.2 each already write their own reply signal straight into `clients_master.last_reply_channel` / `last_reply_at`. What was still missing (the point of 4.3.3) is:

1. One shared place all three reply channels (email, WhatsApp, LinkedIn) land, instead of three separate ad-hoc updates.
2. A `communication_events` row per reply, so reply history isn't lost when the next channel overwrites `last_reply_channel`.
3. A suppression flag Module 2.2 (Nurture) can actually check — today 2.2's known limitation (per its own README, §10A.3) is that it doesn't auto-exit a replied lead from the drip.

This workflow is built from what's already specified in the master plan (§16.4 Consent & Suppression Engine, §16.5 Canonical Data Model) — nothing here is invented; both sections were already resolving this exact gap, just not yet turned into an importable workflow.

## Node-by-node (maps to sub-steps)

| Sub-step | Node(s) |
|---|---|
| 4.3.3.1 (merge) | `Validate & Normalize Reply Signal` → `Resolve client_id` → `Client Found?` → `Insert communication_events` → `Update clients_master (reply + suppress)` |
| S5.3 (Hub report) | `Update clients_master (reply + suppress)` → `Report to Hub` → `Done` |
| 4.3.3.2 (nurture filter patch) | Not a node in this file — see **Manual Patch Required** below |
| 4.3.3.3 (suppression test) | See **Test Checklist** below |

## Why only this file reports to the Hub (not 4.3.1 / 4.3.2 separately)

The star-topology plan's S5a batch lists three separate steps — S5.1 (4.3.1), S5.2 (4.3.2), S5.3 (4.3.3) — each saying "add Report to Hub at the point it currently updates `clients_master`." Taken literally that's 3 Hub-report nodes. But per this file's own design (see "Rewiring required" below), once 4.3.1 and 4.3.2 are rewired to call into 4.3.3 instead of updating `clients_master` themselves, **this workflow becomes the only place that actually touches `clients_master` for a reply** — regardless of which channel (email, WhatsApp, LinkedIn) it came from. So one `Report to Hub` node here covers all three channels once the rewiring lands; adding separate Hub-report nodes to 4.3.1/4.3.2 as well would double-report the same reply once they're rewired.

**Current state (as of S5.3):** the rewiring on 4.3.1/4.3.2 has **not** been applied yet — both still end in their own `Postgres update` node and never call this workflow (see "Rewiring required" below, unchanged from before). So right now this file's new `Report to Hub` node only fires on a manual/test call, not from real WhatsApp/LinkedIn traffic. No regression — it's additive and harmless either way. Once the rewiring is applied (still open, not S5.1/S5.2 as separately-reporting spokes, just the plumbing fix already specified below), replies from all 3 channels will flow through here and start reporting live.

## Rewiring required on 4.3.1 / 4.3.2 (small change, do this first)

Both already end in their own `Postgres update — last_reply_channel/last_reply_at` node. Replace that final Postgres node in each with an **Execute Workflow** node pointing at this workflow (`4.3.3 - Unified Reply Merge + Nurture Suppression`), passing:

```
client_id (if known), email, channel ('whatsapp' | 'linkedin'), reply_content, occurred_at, workflow_source
```

This is the actual "merge" — both channels now funnel through one place instead of writing `clients_master` independently. (Recommend also repointing Module 2.1's existing email-reply webhook the same way for full 3-channel coverage — flagging this as a decision for Nivy since 2.1 is an already-built Phase 2 module and touching it needs sign-off, not something to change silently.)

## One-time schema setup

The last node, `[Manual] Schema Setup - run once`, is **disabled by default**. Before first live run: enable it, execute once, disable again. It creates `communication_events` (§16.5) and adds `active_sequence_suppressed` (§16.4) to `clients_master` via `ADD COLUMN IF NOT EXISTS` — safe to re-run.

## Hub-Intake workflow ID (S5.3)

`Report to Hub` node me `REPLACE_WITH_0.0_HUB_INTAKE_WORKFLOW_ID` ko Hub-Intake ke actual workflow ID se replace karo (`phase-0-hub/hub-intake/workflow.json` se milega). Jab tak placeholder hai, node fail hoga but harmless — `communication_events` insert aur `clients_master` update already ho chuke honge us point tak, sirf Hub-report miss hoga.

**Hub-Dispatcher me `reply.received` ka Switch branch abhi wired nahi hai** (S5.4/S5.5 scope — 5.1.1 BANT/MEDDIC Extraction isse consume karega). Tab tak event `funnel_events` me record hoga lekin `flagged_events` me fall through hoga — koi crash nahi.

## Manual Patch Required — 4.3.3.2 (Module 2.2 Nurture)

Module 2.2's `workflow.json` isn't in this upload, so it can't be edited directly here. Apply this to its due-lead query node (the one currently filtering by `status`):

```sql
-- Before (per 2.2's documented known limitation):
SELECT * FROM clients_master
WHERE status IN ('Contacted') AND nurture_step < 3
LIMIT 50;

-- After:
SELECT * FROM clients_master
WHERE status IN ('Contacted') AND nurture_step < 3
  AND active_sequence_suppressed = false
LIMIT 50;
```

Per §16.4, this is deliberately a flag check, not a hardcoded `status != 'Replied'` string check — it stays correct even if other future modules also need to suppress the same lead for reasons other than a reply.

## Test Checklist — 4.3.3.3

1. Send this workflow a test WhatsApp-style payload manually (execute-workflow test with sample `channel: 'whatsapp'`) → confirm `communication_events` row inserted and `clients_master.active_sequence_suppressed` flips to `true`.
2. Repeat with `channel: 'linkedin'` for the same `client_id` → confirm `last_reply_channel` overwrites to `'linkedin'` but the WhatsApp row from step 1 is still present in `communication_events` (i.e. merge doesn't destroy history).
3. Run Module 2.2's patched query against a lead with `active_sequence_suppressed = true` → confirm it's excluded from the result set (suppression actually works).
4. Send a payload with an unmatched email → confirm it lands in `Log Unmatched Reply` / `workflow_errors`, not silently dropped.
5. Send a payload missing `channel` → confirm it lands in `Log Invalid Reply Signal`.
6. **(S5.3)** After a successful merge (step 1 or 2 above), check `funnel_events` — confirm a new row with `event_type = 'reply.received'`, `source_module = '4.3.3'`, correct `client_id`/`odoo_lead_id`, and `payload` containing the channel + reply content.

## Blockers/flags carried forward, not resolved by this file

- `workflow_errors` table (used by the error-logging nodes here) is specified in §16.3 of the master plan but its own build session isn't confirmed done in this upload — if it doesn't exist yet on the live DB, those two logging nodes will fail. Flagging per §69 of the supporting context (do not silently assume schema).
- Repointing Module 2.1's email-reply webhook into this workflow is a real change to an already-built Phase 2 module — flagged as a decision, not done automatically (per §70).

---

**Next unblocked plan ID:** Phase 4's remaining sessions (4.1.x SMS, 4.2.x dialer, 4.4.x objection handling) are all ⛔ blocked on pending tool/template decisions per the tracker. Next buildable step is **Phase 5, session 5.1.1 — BANT/MEDDIC extraction.**
