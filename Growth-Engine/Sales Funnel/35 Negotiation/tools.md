# Tools — 35 Negotiation

[⬅ Back to README](README.md)

> Pricing is approximate and sourced from internal docs — **verify current pricing on the vendor site before purchase**, as B2B SaaS pricing changes frequently.

---

## Tier 1 — CRM Deal & Negotiation Logging

| Tool | Purpose | Pricing (approx.) | OSS/Free Alt | API | Automation |
|---|---|---|---|---|---|
| **HubSpot deal notes / custom fields** ⭐ | Log negotiation history, discount requests, and approvals per deal | Free with HubSpot | Free tier | Native | Native |
| Odoo CRM — deal notes/fields | Same logging function, OSS-native | Free (Community) | This *is* the OSS option | Yes (Odoo API) | Native |

---

## Tier 2 — Objection/Ask Classification & Response Drafting

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Claude / GPT (API) | Categorize ambiguous asks, personalize standard response drafts | Usage-based | Ollama (self-hosted, free) | Yes |
| Ollama + Open WebUI | Self-hosted LLM for classification/drafting, no per-call cost | Free (self-hosted, needs compute) | This *is* the OSS option | Yes (local API) |

---

## Tier 3 — Approval Routing / Notification

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Slack | Fast internal approval request/response for above-threshold discounts | Free tier + paid | — | Webhooks |
| WhatsApp Business (Evolution API/Wuzapi) | Approval routing where the approver is more responsive on WhatsApp than Slack | Free (self-hosted gateway) | This *is* the OSS option | Yes |
| Telegram Bot API | Lightweight alternative approval channel | Free | This *is* the OSS option | Yes |
| n8n | Orchestrates: threshold check → route to approver's preferred channel → log response back to CRM | Free (self-hosted) | This *is* the OSS option | Native |

---

## Tier 4 — Revised Proposal Re-Generation

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| PandaDoc / Proposify | Revise and re-send a proposal with negotiated terms | Paid, verify current tier pricing | — | API |
| Odoo/Google Docs template merge | Re-generate a revised proposal from the same pipeline as Stage 33/34, OSS-compatible | Free | This *is* the OSS option | API |

---

## Recommended Stacks

### Low-Budget Stack (Start Mode)
| Purpose | Tool |
|---|---|
| Deal/negotiation logging | CRM notes field (whatever CRM is already in use) |
| Classification/drafting | Claude/GPT API on a light per-use budget |
| Approval routing | Slack or WhatsApp, manual message |
| Proposal revision | PandaDoc free tier or Docs template edit |

### OSS-First Stack (Matches Declared Odoo/n8n Architecture)
| Purpose | Tool |
|---|---|
| Deal/negotiation logging | Odoo CRM |
| Classification/drafting | Ollama + Open WebUI |
| Approval routing | n8n → Evolution API (WhatsApp) or Telegram Bot |
| Proposal revision | Odoo → document merge via n8n |

---

## Selection Notes

- No specialized "negotiation software" is required at this business's scale — the discipline is in the categorized-response library and the approval-routing workflow, not the tooling itself.
- Whichever channel (Slack vs. WhatsApp vs. Telegram) the approver actually responds to fastest should be the one wired into the approval-routing flow — the fastest channel in practice matters more than which one looks more "official."

---

## Cross-References

- Stage README: [README.md](README.md)
- Method-by-method usage: [methods.md](methods.md)
- Automation pipelines using these tools: [automation.md](automation.md)
- Shared discount-threshold logging with: [34 Pricing and Packaging](../34 Pricing and Packaging/tools.md)
