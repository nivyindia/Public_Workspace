# M17 — Tools

| Tool | Use in M17 | Cost | Notes |
|---|---|---|---|
| Listmonk (self-hosted) | List management, campaigns, basic automation | Free (fully OSS) | Avoids the subscriber-count cliff Mailchimp's free tier tends to have — verify current terms either way; self-hosting requires basic server setup |
| Mailchimp (free tier) | Alternative to Listmonk if self-hosting isn't feasible | Free tier — subscriber/send caps, verify current | Easier initial setup than self-hosted Listmonk; less control over deliverability infrastructure long-term |
| n8n (self-hosted) | Sales-readiness flagging, cross-referencing engagement data, CRM handoff automation | Free | See `automation.md` |
| Domain-level SPF/DKIM/DMARC setup | Deliverability foundation (M17.5) | Free (configured via DNS) | Essential regardless of ESP choice; not a "nice to have" |
| Odoo or SuiteCRM | Destination for sales-ready leads (M17.6 → M22) | Odoo already in use per the existing n8n plan; SuiteCRM fully OSS if starting fresh | Matches the shared CRM entry in IMPLEMENTATION-PLAN.md §2 |

## Paid Upgrade Path (optional)

- A dedicated marketing-automation platform (e.g., a paid ESP tier with advanced behavioral automation) — worth it once list size or sequence complexity outgrows Listmonk/Mailchimp free-tier automation capabilities.
- A dedicated deliverability-monitoring tool — useful once list size is large enough that manual open-rate review isn't sufficient to catch reputation issues early.

No paid tool is required to run M17 at pilot depth for an SMB-scale list.
