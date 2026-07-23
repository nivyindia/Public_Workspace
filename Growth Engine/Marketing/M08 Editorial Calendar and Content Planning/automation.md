# M08 — Automation

## Manual (baseline)

A human maintains the calendar directly in Airtable/Notion, running the weekly review from `methods.md` M08.5. For a small team, this manual discipline is the actual bottleneck to solve — not a lack of tooling.

## Semi-Automated

- Airtable/Notion native automations (no n8n needed) can auto-notify the assigned owner when a piece's status hasn't changed in X days, surfacing stalled items without a person having to remember to check.

## Full n8n Workflow

**Trigger:** Daily schedule.

1. **Airtable/Notion node** — reads the calendar for items due to publish this week.
2. **Function node** — checks whether each item has a linked M10 repurposing task and M17 newsletter feature scheduled for the same week (per M08.4); flags any that don't.
3. **Notification node** — sends the assigned owner and the marketing lead a digest of: what's due this week, what's flagged as missing its cross-channel sequencing, and what slipped from last week without a status update.
4. **Weekly digest (Friday)** — summarizes the week's publishing performance (on-time vs. slipped) for the M08.5 review, so the maintenance meeting starts from data rather than memory.

## What Should Never Be Fully Automated

- Deciding the funnel-stage content mix (M08.2) — a judgment call informed by data, not a fixed formula.
- Reassigning a stalled task to someone else — a people-management decision, not a workflow trigger.
