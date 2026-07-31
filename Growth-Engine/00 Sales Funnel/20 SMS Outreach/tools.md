# Tools — 20 SMS Outreach

[⬅ Back to README](README.md)

_Pricing figures are approximate — verify current pricing before purchase._

| Tool | Purpose | Pricing (approx., verify) | OSS/Free Alt | API/Automation |
|---|---|---|---|---|
| Twilio SMS | SMS gateway for transactional sends | Usage-based (~$0.0079/msg US, verify) | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Full API |
| MessageBird / Bird | SMS gateway, multi-market coverage | Usage-based | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Full API |
| Calendly/Cal.com native SMS reminders | Built-in confirmation/reminder SMS tied to booking | Often bundled with scheduling tool tier | Cal.com (OSS scheduling) | Native |
| n8n | Orchestrating booking-event → SMS triggers | Free (self-host) / ~$20+/mo cloud | Self-hosted free | Yes |

## Selection Notes
- Prefer a scheduling tool's native SMS reminder feature (Stage 28) over a standalone SMS build where available — it removes an integration point and keeps consent tied directly to the booking action.
