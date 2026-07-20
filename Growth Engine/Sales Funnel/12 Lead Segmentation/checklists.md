# 12 Lead Segmentation — Checklists

[⬅ Back to README](README.md)

---

## Before a Segment Is Used for a Campaign

- [ ] Every lead in the segment has a matching Primary Segment tag (spot-check a sample)
- [ ] Segment size is large enough to justify a dedicated campaign (no viable minimum is fixed — but a 3-5 lead "segment" should usually be merged into a broader one)
- [ ] Segment definition doesn't overlap so heavily with another active segment that the same leads are being double-messaged
- [ ] Geography-based segments have been checked against Stage 15's channel/compliance notes for that country (e.g., outreach law differences)

## Weekly Audit

- [ ] % of leads tagged "Needs Manual Review" isn't growing unchecked — a rising backlog means the rule table needs updating
- [ ] Segment counts reconcile: sum of all Primary Segment counts equals total scored-lead count
- [ ] No lead has been left with a stale segment tag after a material field change (e.g., company size updated by enrichment but segment not re-evaluated)

## Rule Table Change Control

- [ ] Changes to the persona/industry/geography mapping rules are logged (who, why, date)
- [ ] Bulk re-tagging after a rule change is a deliberate, reviewed action — not silently applied to the whole historical list

[⬅ Back to README](README.md) · [Next: templates.md](templates.md)
