# Tools — 38 Deal Desk and Approval Workflows

[⬅ Back to README](README.md)

_Pricing figures are approximate — verify current pricing before purchase._

| Tool | Purpose | Pricing (approx., verify) | OSS/Free Alt | API/Automation |
|---|---|---|---|---|
| HubSpot (deal properties + approval pipeline) | Log discount/term requests against the deal, track approver, decision, timestamp | Free tier / paid tiers for advanced workflow automation | — | Native |
| Slack / Telegram | Approval request routing and notification to the correct approver | Free tier | Telegram fully free | API/webhook |
| n8n | Rule-based routing engine (discount % → approver tier), decision logging back to CRM | Free (self-hosted) | Fully OSS | Native |
| Google Sheets / Airtable | Lightweight approval log for teams not yet using CRM approval fields | Free / free tier | Google Sheets free | API |
| DocuSign / PandaDoc | Records final approved terms into the contract once a deal-desk decision is made | Usage-based / subscription | — | API |

## Selection Notes
- Smaller teams (under ~5 reps) can run this entirely through a Slack channel + a simple rule ("tag @founder for anything over 10%") without dedicated software.
- Larger teams should move the request into the CRM itself so the approval decision is attached permanently to the deal record, not living only in chat history.
