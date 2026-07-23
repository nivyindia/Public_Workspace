# M22 — Inbound-to-CRM Bridge: Tools

## CRM Layer

| Tool | Role | Pricing | Notes |
|---|---|---|---|
| **HubSpot CRM (free tier)** | Production CRM as actually wired (per HubSpot CRM Setup & Configuration Guide, n8n Workflows 1/2/3/7) | Free tier in use; paid tiers exist for advanced workflow automation | This is what's actually running — documented here as fact, not aspiration |
| **Odoo** or **SuiteCRM** (fully OSS) | The free/OSS CRM named in `IMPLEMENTATION-PLAN.md` §2 as the standing default for Track M | Free (self-hosted) | Relevant if the aggregator build (a separate initiative) needs its own CRM instance, or if HubSpot's free-tier limits (contact/workflow caps — verify current) are hit and a fully-OSS migration is preferred over a paid HubSpot tier |

## Automation Layer

| Tool | Role | Pricing |
|---|---|---|
| **n8n** (self-hosted) | Runs all four confirmed inbound workflows (Website Form, Chatbot, Cal.com Booking, WhatsApp → CRM) | Free (self-hosted) |
| **Chatwoot** | Inbox for WhatsApp Business API and website chatbot; source of the webhook events 22B/22D consume | Free/OSS core product (verify current tier limits for WhatsApp channel) |
| **Tidio** | Alternative chatbot widget also covered in the n8n Chatbot workflow | Free tier available (verify current cap) |
| **Cal.com** | Booking page; fires `BOOKING_CREATED` webhook consumed by 22C | Free tier available |
| **360Dialog** or **Meta's own WhatsApp Business API** | WhatsApp Business API provider behind Chatwoot's WhatsApp inbox | Paid per-conversation pricing from Meta — verify current rates |

## Per-Channel Webhook Sources

| Channel | Webhook source | Consumed by |
|---|---|---|
| Website form | HubSpot form action, or Typeform/custom form's own webhook setting | 22A |
| Chatbot | Tidio Settings → Integrations → Webhooks, or Chatwoot's `conversation_created` event | 22B |
| Cal.com | Cal.com → Settings → Developer → Webhooks, `BOOKING_CREATED` event | 22C |
| WhatsApp | Chatwoot webhook on `conversation_created` for the WhatsApp inbox | 22D |

## Notification Layer

| Tool | Role |
|---|---|
| Gmail / SMTP node (via n8n) | Founder notification emails, prospect-facing prep emails |
| Slack (optional) | Alternative founder-notification channel if preferred over email |

## What This Stage Deliberately Does Not Cover

- Paid social-inbox unification tools for 22E (Social DM bridge) — not confirmed in use, so not recommended here as fact; flagged as a gap in [methods.md](methods.md#social-dm) instead
- CRM lead-scoring automation beyond the manual scoring table already documented in the HubSpot setup guide (HubSpot's free tier has no native automatic scoring)
