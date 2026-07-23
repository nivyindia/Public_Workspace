# M22 — Inbound-to-CRM Bridge: Resources

## Internal Sources Mined for This Stage

| Doc | What it provided |
|---|---|
| SOP-VA-011 — CRM Entry & Status Update | Field standard, approved Status values, update SLAs |
| 6. CRM & Tracking System | Lead Tracker sheet convention, follow-up stage logic |
| HubSpot CRM Setup & Configuration Guide | Contact custom properties, deal pipeline stages, manual lead-scoring table |
| n8n Workflow 1 — Website Form → HubSpot CRM | 22A node sequence and field mapping |
| n8n Workflow 2 — Chatbot → CRM | 22B node sequence (Tidio + Chatwoot variants) |
| n8n Workflow 3 — Cal.com Booking → CRM | 22C node sequence, prep-email template |
| n8n Workflow 7 — WhatsApp → CRM | 22D node sequence, privacy rule |
| Sales Funnel — 06 Lead Extraction (README, tools.md) | The Source enum and Status values M22 must remain compatible with on the outbound side |

## External Tool Documentation

| Tool | Docs |
|---|---|
| HubSpot | https://developers.hubspot.com/docs/api/overview |
| n8n | https://docs.n8n.io |
| Chatwoot | https://www.chatwoot.com/docs |
| Cal.com | https://cal.com/docs |
| Tidio | https://www.tidio.com/help/ |
| Meta WhatsApp Business Platform | https://developers.facebook.com/docs/whatsapp |
| Odoo CRM (free/OSS alternative) | https://www.odoo.com/documentation |
| SuiteCRM (fully OSS alternative) | https://docs.suitecrm.com |

## Gaps (no internal doc — flagged, not fabricated)

- No dedicated automation exists yet for Social DM → CRM (22E) — see methods.md
- No confirmed webhook path for the newsletter ESP's opt-in event (22F) — the manual export/import fallback is the only documented method until this is built
