# M10 — Automation

## Tier 1-3 — Manual through AI-Assisted Manual Handoff

Same structure as M09's Tiers 1-3: manual intake of the M09 handoff packet, manual or AI-assisted drafting per format, manual movement into the review queue and then into Postiz.

## Tier 4 — Full n8n Workflow

```
[M09 publish event: piece marked "Ready for M10" with handoff packet]
        ↓ (n8n trigger: webhook or polling the M09 tracker)
[n8n: pull handoff packet — URL, pull-quotes, key stat, suggested formats]
        ↓
[n8n: fan-out — one branch per target format]
   ├─ LinkedIn post draft (AI drafting node)
   ├─ Instagram carousel outline (AI drafting node)
   ├─ X/Twitter thread draft (AI drafting node)
   ├─ Facebook post draft (AI drafting node)
   ├─ Video script outline (AI drafting node)
   ├─ Secondary-platform copy (AI drafting node)
   └─ Email nurture segment draft (AI drafting node)
        ↓ (each branch)
[n8n: drop each draft into "Pending Human Review" queue, tagged by format]
        ↓
[HUMAN REVIEW GATE — see checklists.md — mandatory, not automatable]
        ↓
[Human approves per-format draft]
        ↓
[n8n: on approval, push approved copy + any graphics into Postiz via its API]
        ↓
[Postiz: scheduled per-platform, per each channel stage's (M11-M16) own cadence rules]
        ↓
[Email segment approved copy handed to M17's ESP separately — not scheduled via Postiz]
```

### Implementation Notes

- The fan-out design means one M09 publish event can trigger all seven format branches in parallel, but each branch still stops at its own human-review gate — approving the LinkedIn draft doesn't auto-approve the IG carousel.
- As with M09, a fully automated AI-drafting call (no human copy-paste) requires either a paid API call or a self-hosted open model — the free Claude.ai/ChatGPT UI has no API for this workflow to call directly.
- Reuses the same n8n instance as M09 and the Sales Funnel — no new infrastructure.
- The repurposing tracker (Airtable/Notion free tier, per `tools.md`) should be updated by this workflow at each stage so nothing silently stalls in the review queue.
