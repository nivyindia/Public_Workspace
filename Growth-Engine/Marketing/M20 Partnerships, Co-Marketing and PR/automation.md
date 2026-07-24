# M20 — Automation

Progression from manual to full n8n workflow. This mirrors the referral-tracking automation already built for the Sales Funnel's client-referral program (existing internal "Stage 11 — Referral & Viral Engine" doc) — M20 reuses the same underlying pattern for *external partner* referrals rather than building a separate system from scratch.

## Tier 1 — Manual (no automation)

Partner outreach, agreement, and referral tracking all done by hand — spreadsheet log of who referred what, manual commission calculation.

## Tier 2 — Templated Tracking

- Active Partner Tracker (`templates.md`) is a standing Airtable/Notion base rather than a rebuilt spreadsheet each time.
- Partner agreement template (`templates.md`) is filled in per new partner rather than drafted from scratch.

## Tier 3 — Semi-Automated Referral Logging

- A simple partner referral form (Google Form or Airtable form) feeds directly into the tracker, replacing manual data entry.
- Confirmation email to the partner still sent manually.

## Tier 4 — Full n8n Workflow

```
[Partner submits a referral via form/webhook]
        ↓
[n8n: log the referral in the Active Partner Tracker — referrer, referred lead, status = "Pending", date]
        ↓
[n8n: send confirmation email to the partner — referral received, reward terms restated]
        ↓
[n8n: create the referred lead as a CRM contact, tagged source = "Partner Referral" + partner name]
        ↓
[n8n: notify the sales/founder channel — partner referrals get priority follow-up, per the existing internal doc's note that referral leads close faster]
        ↓
[Lead proceeds through Sales Funnel Stage 06 onward, same as any other inbound record]
        ↓
[On deal closed-won in the CRM — n8n webhook triggers]
        ↓
[n8n: calculate commission owed per the partner's tier (Bronze/Silver/Gold/Platinum rate)]
        ↓
[n8n: log the reward in a reward ledger; notify founder/finance for payout — payout itself is manual, not automated]
```

### PR & Media Outreach Automation (Separate Track, No Revenue-Share Logic)

```
[Media list built manually — journalists/blogs/podcasts researched]
        ↓
[n8n: track each outreach send + follow-up date in the tracker]
        ↓
[n8n: auto-reminder if no reply within a set window (e.g., 7 days) — prompts a manual follow-up, doesn't auto-send one]
        ↓
[On coverage secured — logged manually in the Coverage Tracker]
        ↓
[n8n: notify content stages (M09/M10) that a new press asset exists and can be repurposed]
```

### Implementation Notes

- This workflow reuses the same n8n instance already running Sales Funnel and other Track M automations — no new infrastructure needed.
- Reward payout itself stays a manual, human-approved step — the workflow calculates and logs what's owed, it doesn't move money.
- The 7-day PR follow-up reminder is a nudge, not an auto-send, since a templated follow-up to a journalist reads poorly if it's obviously automated — per general PR best practice, not a fabricated claim from any source doc.
