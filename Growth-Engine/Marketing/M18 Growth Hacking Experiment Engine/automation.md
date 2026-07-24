# M18 — Automation

Progression from manual to full n8n workflow, mirroring the four methods in `methods.md`. Every tier terminates at the same human scale/kill decision — automation here accelerates scoring, reminders, and logging; it never makes the judgment call itself.

## Tier 1 — Manual (no automation)

Founder browses the tactic bank monthly, scores by hand, logs results directly in Airtable/Notion. No workflow tooling involved.

## Tier 2 — Templated Tracking

- Tracker (`templates.md`) is a standing Airtable/Notion base with the Impact/Effort formula and decision-date columns pre-built, so each month's cycle is fill-in-the-blank rather than rebuilt from scratch.
- Still manually triggered — someone opens the base and does the monthly selection.

## Tier 3 — Reminder Automation

- n8n sends a monthly reminder (e.g., 1st of the month) to review the tactic bank and select the next batch.
- n8n flags any experiment row approaching its 30-day decision date so scale/kill calls don't get forgotten.
- Selection and scoring are still manual — automation here is purely about not letting the cadence lapse.

## Tier 4 — Full n8n Workflow

```
[Monthly trigger — n8n schedule node, 1st of month]
        ↓
[n8n: pull open tactic bank rows not yet tested, sorted by Priority Score]
        ↓
[n8n: Slack/WhatsApp notification — "N tactics ready for selection, top 5 by score attached"]
        ↓
[HUMAN SELECTION — picks 3-5 tactics for the month — not automatable]
        ↓
[n8n: create Experiment Tracker rows for each selected tactic, status = "In Progress", decision-date = today + 30]
        ↓
[Tactic executed per the owning channel stage's own process (M09-M17)]
        ↓
[n8n: on decision-date, auto-flag row and notify owner — "Decision due: scale, iterate, or kill"]
        ↓
[HUMAN DECISION — scale / iterate / kill — not automatable]
        ↓
[If scaled: n8n creates a task to update the relevant M09-M17 stage's methods.md]
[If killed: row stays logged as-is, status = "Killed", reason field required]
```

### Implementation Notes

- This workflow reuses the same n8n instance already running your Sales Funnel and other Track M automations — no new infrastructure needed.
- The "decision due" flag is a reminder, not an auto-decision — Impact × Effort scoring at selection time is a judgment call, and so is scale/iterate/kill at the end. Automating either away would defeat the point of treating these as real experiments rather than assumptions.
- If a tactic requires a statistical significance check (e.g., a subject-line A/B test), that check happens manually via the free calculators in `tools.md` before the scale/kill decision — n8n does not calculate significance on its own in this workflow.
