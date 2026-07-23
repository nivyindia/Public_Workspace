# 11 Lead Scoring and Prioritization — Tools

[⬅ Back to README](README.md)

> Pricing is approximate as of the source SOPs' last update (May 2026) — verify current pricing on the vendor site before committing budget.

| Tool | Purpose | Pricing (approx., verify current) | OSS/Free Alt | API/Automation Support |
|---|---|---|---|---|
| HubSpot CRM (Free tier) | Contact properties, manual "Lead Score" custom field, activity feed | Free | — | REST API, webhooks (Free tier has API rate limits) |
| HubSpot Starter/Professional | Native automated lead scoring engine | ~$20-90/mo+ | — | Full API + native scoring workflows |
| n8n | Webhook-triggered scoring automation, CRM field updates | Free (self-hosted) / ~$20/mo (cloud) | Self-hosted is the free/OSS option | Native — this is the automation layer |
| Google Sheets | Manual/formula-based scoring for pre-CRM teams | Free | N/A — already free/OSS-equivalent | Apps Script, Sheets API |
| Slack | Hot-lead alerting | Free tier sufficient for alert use case | Discord/WhatsApp group as free alt | Incoming Webhooks (used by n8n alert step) |
| Salesforce | Native scoring (Einstein predictive scoring at higher tiers) | Enterprise pricing, verify current | — | Full API, well-documented |
| Pipedrive | Native deal/lead scoring | ~$14-49/mo+ | — | REST API |
| Claude / GPT-4-class LLM (via API or chat) | Qualitative fit scoring, bulk backlog scoring, score-reason summaries | Usage-based API pricing / subscription for chat | N/A | API — used in AI-assisted methods above |

---

## Notes on Selection

- Teams should not adopt a paid CRM tier purely for scoring — the free-tier + n8n semi-automated pattern (Section 3 of [methods.md](methods.md)) is a fully functional substitute at low volume.
- n8n is the connective layer referenced throughout this knowledge base (see Stage 06, Stage 08) — standardizing on it avoids fragmenting automation across multiple platforms.
- If the team already runs HubSpot for other stages (CRM Setup, Stage 13), staying within HubSpot's own scoring tooling (once upgraded) avoids double-entry between systems.

[⬅ Back to README](README.md) · [Next: automation.md](automation.md)
