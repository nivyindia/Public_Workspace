# M03 — Automation

Same honesty note as M01/M02: **defining the pillars and messaging framework is a judgment call, not a workflow.** No automation decides what Nivy Digital's content pillars should be. What can genuinely be automated, once the pillars are defined, is (a) making sure M09/M08 always have the current pillar list to reference, and (b) lightly tracking pillar balance once real content is being published — per the standing no-fabricated-automation rule in `IMPLEMENTATION-PLAN.md` §6.

## Tier 1 — Manual (the default)

- Pillars, keyword mapping, content-type mapping, and messaging framework defined and documented directly in Notion.
- No workflow tooling needed for a decision made a few times a year.

## Tier 2 — Reference Feed into M09's Brief Template

- The finalized pillar list is pasted or linked directly into M09's Content Brief template (`Marketing/M09.../templates.md` Template 1) as the option set for its "pillar" field, so every brief picks from a fixed list rather than a free-text field that drifts over time.
- Purely manual to set up once; no ongoing automation required unless pillars change frequently (they shouldn't — see `checklists.md`).

## Tier 3 — Pillar Balance Tracking via n8n (optional, once real content volume exists)

```
[M08 Editorial Calendar row marked "Published," with a Pillar field tagged per Template 1]
        ↓ (n8n trigger: scheduled poll on the calendar/tracker)
[n8n: tally published pieces by pillar over the trailing period]
        ↓
[n8n: compare tally against the balance guidance in checklists.md]
        ↓
[n8n: Slack/WhatsApp notification if one pillar has been silent for an extended stretch, or another is significantly over-represented]
```

### Implementation Notes

- Reuses the existing n8n instance already running Sales Funnel and other Track M automations.
- This automates *noticing imbalance*, not *deciding* which pillar to write about next — a human still picks the next topic.
- Genuinely only useful once M08/M09 have enough real publishing history to tally against; premature before that.

## What This Stage Deliberately Does Not Automate

- Deciding what the pillars are
- Writing the messaging framework or headline/CTA options
- Deciding which pillar a specific upcoming piece should be
