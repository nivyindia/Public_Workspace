# 13 CRM Setup and Data Structuring — Tools

[⬅ Back to README](README.md)

> Pricing approximate as of source docs' last update (May 2026) — verify current pricing before committing budget.

| Tool | Purpose | Pricing (approx.) | OSS/Free Alt | API/Automation Support |
|---|---|---|---|---|
| HubSpot CRM (Free) | Full contact/deal/pipeline CRM, entry point for this funnel | Free | Odoo Community (CRM module, self-hosted, free) | REST API (rate-limited on Free) |
| HubSpot Starter/Professional | Adds native scoring, automation workflows, more custom fields | ~$20-90/mo+ | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Full API |
| Salesforce | Enterprise-grade CRM, highly configurable | Enterprise pricing, verify current | Odoo Community (CRM module, self-hosted, free) | Extensive API |
| Pipedrive | Sales-pipeline-focused CRM | ~$14-49/mo+ | Odoo Community (CRM module, self-hosted, free) | REST API |
| Bitrix24 | CRM + collaboration suite, generous free tier | Free tier available | Odoo Community (CRM module, self-hosted, free) | REST API |
| Google Sheets (bridge/pre-CRM) | Manual CRM substitute for very early-stage teams | Free | Odoo Community (CRM module, self-hosted, free) | Sheets API |
| Cal.com | Booking tool integration feeding pipeline stage changes | Free tier available | Self-hosted OSS option | API + webhooks |
| n8n | Integration/automation glue between CRM and other tools | Free (self-hosted) / ~$20/mo cloud | Self-hosted free | Native |

## Platform Selection Notes

- HubSpot Free is the documented default for this funnel's early stage (Nivy Digital's own production setup) — sufficient for contact/deal management with n8n filling automation gaps
- Upgrade triggers: need for native lead scoring (Stage 11), more than a handful of custom automation workflows, or API rate limits becoming a bottleneck
- Bitrix24 is a viable low-cost alternative for teams wanting an all-in-one suite (CRM + tasks + chat) rather than best-of-breed tools connected via n8n

[⬅ Back to README](README.md) · [Next: automation.md](automation.md)
