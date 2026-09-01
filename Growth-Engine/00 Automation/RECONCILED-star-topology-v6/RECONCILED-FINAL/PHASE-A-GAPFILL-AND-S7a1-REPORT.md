# Phase A gap-fill (5.1.2, 6.6, 7.2) + client.won decision + S7a.1 audit

Continuation of `PHASE-0-RECONCILIATION-REPORT.md`. Starting point was
`RECONCILED-star-topology-v2.zip` — confirmed against it directly (not
assumed from the chat export) that 5.1.2, 6.6, 7.2 were genuinely still
un-migrated (`___NOT-STAR-MIGRATED` folder suffix / `README-OLD-PRESTAR.md`
present), matching where the exported session's narrative left off.

## 1. What got built

### 5.1.2 — Write Qualification to Odoo → `qualification.written`
Added `Report to Hub` off the success path (`Write Failed?`'s false branch,
parallel to `Done - Write Confirmed`, doesn't block it). `client_id` comes
from the trigger item itself (`5.1.2 Trigger - From 5.1.1`) since the
in-between Postgres/code nodes don't carry it forward at top level;
`odoo_lead_id`/`framework`/`decision`/`assessed_at`/`assessed_by` come from
`Map Fields to Odoo Custom Fields` (the Odoo HTTP response afterward
overwrites `$json`, so that node is the last point those fields are still
directly on the item).

### 6.6 — NPS Survey + Routing → `nps.promoter_flagged`
Added `RETURNING *, (SELECT odoo_lead_id FROM clients_master WHERE id =
nps_responses.client_id) AS odoo_lead_id` to `Postgres - Insert NPS
Response` — it had `RETURNING *` already but `nps_responses` doesn't itself
store `odoo_lead_id`, so a correlated scalar subquery pulls it in without a
second DB round-trip. `Report to Hub` fires only off the **promoter branch**
(`Postgres - Flag Promoter`), parallel to `Respond 200 OK` — matches the
event name and the taxonomy's stated consumers (6.7, 6.8). The **detractor**
branch intentionally does not report to Hub — taxonomy only ever specified a
promoter-flag event; detractors stay on the existing internal Discuss alert.

### 7.2 — List Auto-Refresh → `list_segment.refreshed` ⚠️ pattern deviation, flagging explicitly
7.2 is a bulk, all-rows `UPDATE` with no `WHERE` — there's no single lead in
scope, so the usual `client_id`/`odoo_lead_id` shape doesn't fit. Rather than
force a fake per-lead shape, I sent `client_id: null, odoo_lead_id: null`
(Hub-Intake already supports this via `client_id ?? null`) with an aggregate
`payload.segment_counts`. Also added a `SELECT list_segment, count(*) ...
GROUP BY` after the `UPDATE` so there's something meaningful to report —
otherwise there was no output row at all to attach to the event. This is a
**new event type**, not in the plan's original S0.2 minimum set — added to
the taxonomy doc with its own note. Flagging this one specifically because
it's the one place this batch deviated from the established convention
rather than mechanically following it — worth a second look if it doesn't
sit right.

## 2. Hub-Dispatcher — `client.won → 2.7` decision: resolved (Option A)

The open decision flagged in `README-S4b-DISPATCHER-UPDATE.md` — I applied
the doc's own recommended **Option A**: removed the `client.won` Switch rule
and its `Execute Workflow - 2.7 Onboarding` node entirely. Onboarding now
fires **only** on `payment.received`. Reasoning: billing (2.6) now sits
between Won and Onboarded, so starting onboarding on `client.won` risks
onboarding a client before they've paid.

This changes production wiring behavior, so calling it out plainly rather
than burying it: **if unpaid/NET-30 onboarding is actually a real business
case for you, this is the wrong call — say so and I'll revert to Option B**
(keep both branches, add a duplicate-onboarding guard in 2.7 instead).
`1.5` still reports `client.won` regardless — that event just falls through
to `flagged_events` now instead of triggering anything, same as several
other already-unwired events.

Switch-node connections were **fully rebuilt**, not just had one entry
deleted — n8n Switch outputs are positional against the rules array, so
removing one rule without reindexing the rest would've silently mis-wired
`contract.signed`/`payment.received` to the wrong branches.

## 3. Taxonomy doc — refreshed

`docs/S0-EVENT-TYPE-TAXONOMY.md` now reflects the **actual current state**
of all 36 workflows, not just the S3/S4.4-S4.7 snapshot it was frozen at:
added `proposal.sent` and `health.scored` (built in the predecessor session
but never added to the table), added `qualification.written`,
`nps.promoter_flagged`, `list_segment.refreshed` (this batch), and updated
`client.won`'s row to reflect the Dispatcher branch removal.

## 4. S7a.1 grep audit — done, one real finding

Grepped all 36 `workflow.json` files for `executeWorkflow` nodes not
pointing at Hub-Intake. Result:

- **Expected, fine:** Hub-Dispatcher's 5 `Execute Workflow - 2.x` nodes
  (that's its entire job — Hub→spoke, not spoke→spoke).
- **🔴 One real violation found:** `4.2.1-dnc-call-list-prep` still has a
  direct `Execute Workflow - 4.2.2 Dialer Trigger` node — a genuine
  spoke→spoke link, exactly the pattern star-topology is meant to eliminate.
  Its own README even describes it as following "the 2.5→2.6 chaining
  pattern" — but that reference is now **stale**: 2.5→2.6 direct-chaining
  was deliberately removed during the conflict-merge (2.5 now reports
  `contract.signed` to the Hub instead). 4.2.1 was never updated to match.

**Fixed, following session.** 4.2.1 no longer calls 4.2.2 directly:

- `Execute Workflow - 4.2.2 Dialer Trigger` node in 4.2.1 replaced with
  `Report to Hub` — `event_type: calllist.ready`, `client_id`/`odoo_lead_id`
  both `null` (batch hand-off, same reasoning as `list_segment.refreshed` —
  the whole call-list array, not a single lead), `payload: { call_list,
  count, generated_at }`.
- Hub-Dispatcher got a new `calllist.ready` Switch branch + `Execute
  Workflow - 4.2.2 Dialer Trigger` node (placeholder ID
  `REPLACE_WITH_4.2.2_DIALER_TRIGGER_WORKFLOW_ID`). Unlike the other
  un-wired new event types, this one **is** wired — 4.2.2 already existed
  as the obvious consumer, no reason to leave it un-routed.
- 4.2.2's entry trigger renamed `From Hub-Dispatcher (calllist.ready)` and
  its `Split Out Call List` node updated: `fieldToSplitOut` changed from
  `call_list` to `payload.call_list`, since Dispatcher passes the whole
  `funnel_events` row through (module-specific data lives under `payload`,
  not at top level — matches how every other spoke reads its data).
- Both modules' READMEs updated; taxonomy doc got a `calllist.ready` row +
  note.
- Re-ran the S7a.1 grep after the fix: confirmed the only remaining
  `executeWorkflow` nodes across all 36 files belong to Hub-Dispatcher
  itself — no spoke→spoke links left.

## 5. Validation

All 36 `workflow.json` files across the final tree: JSON parses clean, no
duplicate node IDs, no dangling connections (checked programmatically, not
just eyeballed).

## 5. Phase 6 Dispatcher wiring — done

Both remaining planned event types now have Dispatcher branches. Both are
**fan-out** branches (one event, two independent consumers), same as how
`Postgres - Mark Booked` fans out to two downstream nodes in 2.3 — the
Switch node's `main` array entry for each rule just lists two targets
instead of one:

- `health.scored` (from 6.1.1) → **6.2.2 Milestone Missed Alert** AND
  **6.4.1 Upsell/Cross-sell Trigger**, in parallel. Both already had their
  `executeWorkflowTrigger` entry nodes built and Dispatcher-shaped
  (`{event_type, client_id, odoo_lead_id, source_module, payload}`) from
  earlier work — this batch only added the Dispatcher-side half.
- `nps.promoter_flagged` (from 6.6) → **6.7 Case Studies** AND **6.8
  Referral Program**, in parallel. Same situation — consumer triggers
  already existed, only the Dispatcher-side branch was missing.

Placeholder workflow IDs follow the established naming:
`REPLACE_WITH_6.2.2_MILESTONE_MISSED_ALERT_WORKFLOW_ID`, etc. — fill in
after importing each module.

## 6. Merged reference file — regenerated

`merged-reference/growth-engine-FULL-FUNNEL-merged.json` rebuilt from
scratch off this final tree (all 36 workflow.json files, post gap-fill +
S7a.1-fix + Phase-6-wiring). 420 total nodes across 36 source workflows,
node names/IDs prefixed per-workflow to avoid collisions, connections
remapped consistently, zero dangling references (validated
programmatically). **Reference/documentation only** — each module still
imports into n8n as its own separate `workflow.json`; this merged file is
for Metabase dashboard queries and full-funnel visual review, matching the
convention established back in S7.2.

## 7. Validation

All 36 individual `workflow.json` files, plus the regenerated merged
reference file: JSON parses clean, no duplicate node IDs, no dangling
connections (checked programmatically). Re-ran the S7a.1 grep audit after
all changes — confirmed the only `executeWorkflow` nodes anywhere in the
tree now belong to Hub-Dispatcher itself; no spoke→spoke links remain.

## 8. `client.won` decision — reverted to Option B

Abhi confirmed NET-30/unpaid onboarding is a real case. **Reverted**:

- Hub-Dispatcher: `client.won → 2.7` branch added back, alongside
  `payment.received → 2.7` (both wired, each its own named Execute Workflow
  node, both pointing at the same 2.7 workflow).
- 2.7: added `IF Not Yet Onboarded (duplicate guard)` right after `Fetch
  Lead + Deal Detail` — checks `clients_master.odoo_project_id`. If already
  set (client onboarded via the other event already), the whole
  Nextcloud/Odoo/email chain skips safely instead of duplicating it. This
  also closes 2.7's own previously-documented known limitation ("Duplicate
  trigger safety nahi hai").
- Taxonomy doc + both READMEs updated accordingly.
- Merged reference file regenerated again to reflect this.

## 9. What's still open

- S3.5, S4.9/S4.10, S6.13, S7.4 (end-to-end tests) and S7.3 (Metabase
  dashboard) — need a live n8n instance, can't be done from files alone.
- Everything else in this doc's original scope (Phase A gap-fill, S7a.1,
  Phase 6 wiring, client.won decision) is now closed.
