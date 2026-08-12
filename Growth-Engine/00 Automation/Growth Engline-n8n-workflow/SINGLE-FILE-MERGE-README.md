# growth-engine-FULL-FUNNEL-merged.json

All 14 modules combined into **one workflow, one canvas, 161 nodes**. Import this
single file (n8n → Import from File) and the entire Marketing + Sales funnel exists
as one flow — no separate imports, no ID wiring needed.

## What changed vs. the 14 separate files

- Every node renamed with a `[1.1]` / `[2.6]` etc. prefix so nothing collides.
- Every `Execute Workflow` → `Execute Workflow Trigger` pair was **collapsed into a
  direct connection** (the calling module now flows straight into the called
  module's first node — no sub-workflow hop).
- The step that used to run *after* an Execute Workflow call (mostly the "Odoo
  Discuss - Notify" alerts) now fires **in parallel** with the sub-flow instead of
  strictly after it finishes. In the 14-file version the Execute Workflow node waited
  for the sub-workflow to complete before notifying; collapsing to one canvas removes
  that wait, so notify and the next stage now start at the same time. Functionally
  near-identical, just not sequential anymore.
- **One exception, not something I invented:** `1.5 → 2.5 (Contract E-sign)` was
  never a real hand-off — 2.5 is actually started by a client clicking the
  "Accept Proposal" link (a webhook), not by 1.5 calling it. So that Execute Workflow
  node was dropped and 1.5 just fires its Discuss notify there; 2.5 still runs fine,
  triggered independently by its own webhook, same as before.

## Trade-off, honestly

One 161-node canvas is harder to read, harder to debug (one crashed node can be
tougher to spot), and any edit means opening this whole thing instead of one small
module. The 14-file version is still what I'd actually run in production — this is
for the "paste once, see everything" case.

## Import

n8n → Workflows → **Import from File** → select `growth-engine-FULL-FUNNEL-merged.json`.
After import, still needed (same as before, not automatable): fill in the
`REPLACE_WITH_CREDENTIAL_ID` credential references and the env vars in the top-level
`README.md`, then activate the workflow.
