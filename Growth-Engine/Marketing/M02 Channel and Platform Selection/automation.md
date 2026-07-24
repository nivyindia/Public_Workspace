# M02 — Automation

Same honesty note as M01: **channel selection is a judgment call, not something to automate.** No workflow decides whether LinkedIn or YouTube is the better bet for a given ICP — that's Methods 1–3 in `methods.md`. This file is scoped to the smaller, real automation opportunity: keeping the selected-channel list synced and visible to every downstream stage, so M08 and M11–M17 aren't working from a stale or inconsistent picture of "which channels are we actually running."

## Tier 1 — Manual (the default)

- Channel shortlist decided and documented directly in Notion, referencing the ICP/persona and capacity constraints.
- No workflow tooling needed for a decision made a handful of times a year, not daily.

## Tier 2 — Tracked Shortlist, Manual Updates

- Selected channels, their monthly targets, and their primary owner/tool live in a single Airtable or Notion database table (mirrors the existing SD-05 Inbound Channels table structure: Channel / Primary Tool / Monthly Target / Status).
- Updated by hand whenever the shortlist changes.

## Tier 3 — Synced Distribution via n8n (the only tier worth automating)

```
[Channel shortlist table updated in Notion/Airtable — a channel's Status field changes]
        ↓ (n8n trigger: scheduled poll or webhook on the table)
[n8n: detect which channel(s) changed status]
        ↓
[n8n: Slack/WhatsApp notification to affected stage owners — e.g., "M11 LinkedIn Organic Engine is now Active, monthly target: 3 posts/week"]
        ↓
[n8n: (optional) auto-update the corresponding M11–M17 stage's README status line, or at minimum flag it for manual update]
```

### Implementation Notes

- Reuses the existing n8n instance already running Sales Funnel and other Track M automations — no new infrastructure needed.
- This automates *notification and consistency-checking*, not the decision. If a channel's status changes, the people running M08's calendar and the relevant M11–M17 stage should hear about it without someone having to remember to tell them manually.
- This tier is optional and low-priority relative to the rest of Track M's automation work — the manual version (Tier 2) is entirely sufficient at current team size, and this tier mainly pays off once more than a couple of channels are live simultaneously and manual cross-notification starts to slip.

## What This Stage Deliberately Does Not Automate

- Deciding which channels to pursue
- Scoring channel-to-ICP fit
- Capacity planning for who runs each channel
