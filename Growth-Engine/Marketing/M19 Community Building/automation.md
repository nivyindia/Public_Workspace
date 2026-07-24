# M19 — Automation

Progression from manual to full n8n workflow. Automation here handles the mechanical, repeatable parts of running a community (welcome messages, engagement prompts, invite tracking) — it never substitutes for the founder-led, human presence that Method 1 in `methods.md` depends on, especially in the seeding phase.

## Tier 1 — Manual (no automation)

Founder personally welcomes each new member, starts conversations, and replies to everything by hand. This is the required mode during Phase 1 seeding — see `checklists.md`.

## Tier 2 — Templated Welcome & Prompts

- A standing welcome message template (`templates.md`) is used manually for each new member rather than freehand each time, so the tone stays consistent.
- Weekly engagement prompts (a discussion question, a poll) are drafted from a running content bank rather than improvised.

## Tier 3 — Semi-Automated Welcome

- n8n auto-detects a new member join event (Discord/Slack webhook) and posts the templated welcome message automatically.
- Founder still personally follows up with a direct message to genuinely new/high-value members — automation handles the baseline, not the relationship-building.

## Tier 4 — Full n8n Workflow

```
[New member joins Discord/Slack/WhatsApp group]
        ↓ (webhook trigger)
[n8n: post templated welcome message in the group]
        ↓
[n8n: log new member in Airtable/Notion tracker — name, join date, invite source]
        ↓
[n8n: if invite source = existing member, increment that member's invite count]
        ↓
[n8n: weekly — check top inviter, prep the monthly shoutout data]
        ↓
[n8n: scheduled engagement prompt posted weekly per the content bank]
        ↓
[If a member asks a buying-intent question — flagged manually by a moderator, not auto-detected]
        ↓
[n8n: on moderator flag, log the lead and hand off to M22 intake]
```

### Implementation Notes

- This workflow reuses the same n8n instance already running your Sales Funnel and other Track M automations — no new infrastructure needed.
- Buying-intent detection is flagged manually by a moderator in this workflow rather than auto-detected by keyword matching, since false positives (a member casually mentioning pricing without buying intent) would create noise in the CRM handoff — this can be revisited once M22 is built and there's a clearer sense of what a false-positive rate looks like.
- The monthly top-inviter shoutout is prepared by automation but posted by a human, so it still carries the founder's/moderator's voice rather than reading as a bot announcement.
