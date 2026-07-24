# Tools — 34 Pricing and Packaging

[⬅ Back to README](README.md)

> Pricing is approximate and sourced from internal docs — **verify current pricing on the vendor site before purchase**, as B2B SaaS pricing changes frequently.

---

## Tier 1 — Pricing Catalog / Quoting (System of Record)

| Tool | Purpose | Pricing (approx.) | OSS/Free Alt | API | Automation | Learning Curve |
|---|---|---|---|---|---|---|
| **HubSpot Quotes / Product Library** ⭐ | Central pricing catalog synced into every proposal and quote | Free with HubSpot | Free tier | Native | Native | Low |
| Odoo Sales — Pricelists | Tier × market × add-on pricing, natively tied to Odoo CRM/Invoicing | Free (Community) | This *is* the OSS option | Yes (Odoo API) | Native | Medium |
| Google Sheets / Notion database | Internal master pricing table (tiers × market × add-ons) when not yet on a CRM-native catalog | Free | Free | API (Notion API / Sheets API) | Via n8n/Zapier/Make | Low |
| PandaDoc / Proposify — Pricing Tables | Pricing table rendering inside proposal documents | Paid, verify current tier pricing | — | API | Yes | Low |

---

## Tier 2 — Add-On / Bundle Configuration

| Tool | Purpose | Pricing | OSS/Free Alt | Notes |
|---|---|---|---|---|
| HubSpot Product Library — bundles | Tier/add-on compatibility mapping | Free with HubSpot | Free tier | Prevents invalid tier+add-on combinations at selection time |
| Odoo Sales — Product Variants | Same compatibility mapping, OSS-native | Free (Community) | This *is* the OSS option | Ties directly into Odoo's own pricelist engine |
| Notion relation/rollup fields | Manual-but-structured compatibility table when not on a CRM-native option | Free | Free | Lowest setup effort, most manual upkeep |

---

## Tier 3 — Payment Collection (Once a Tier Is Agreed)

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Stripe | Payment collection tied to the agreed tier — feeds [39 Payment and Invoicing](../39 Payment and Invoicing/README.md) | Usage-based (~2–3% + fee) | — | Yes |
| Razorpay | India-market equivalent to Stripe | Usage-based | — | Yes |
| PayPal / Wise | International invoicing/collection alternative | Usage-based | — | Yes |
| Odoo Invoicing | OSS-native invoicing tied directly to the same pricelist used above | Free (Community) | This *is* the OSS option | Yes |

---

## Tier 4 — Discount-Threshold Guardrail & Approval Logging

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| CRM discount/approval field (HubSpot or Odoo) | Structured logging of any above-threshold discount request | Free with base CRM | Odoo (free) is the OSS option | Native |
| Slack / WhatsApp (internal) | Fast founder/approver notification for a pending above-threshold request | Free–low cost | Free tier | Webhooks |
| n8n | Orchestrates: threshold check → notify approver → write result back to CRM log | Free (self-hosted) | This *is* the OSS option | Native |

---

## Recommended Stacks

### Low-Budget Stack (Start Mode)
| Purpose | Tool |
|---|---|
| Pricing catalog | Notion/Sheets database |
| Compatibility mapping | Notion relation fields |
| Proposal pricing table | PandaDoc free tier or a Google Docs merge |
| Payment collection | Stripe/Razorpay (usage-based, no fixed cost) |
| Approval logging | CRM note field + Slack/WhatsApp message |

### OSS-First Stack (Matches Declared Odoo/n8n Architecture)
| Purpose | Tool |
|---|---|
| Pricing catalog | Odoo Sales — Pricelists |
| Compatibility mapping | Odoo Product Variants |
| Proposal pricing table | Odoo → document merge via n8n |
| Payment collection | Odoo Invoicing |
| Approval logging | Odoo CRM discount field + n8n → Slack/WhatsApp notify |

### Professional Stack (Scale Mode)
| Purpose | Tool |
|---|---|
| Pricing catalog | HubSpot Product Library |
| Proposal pricing table | PandaDoc/Proposify (paid tier) |
| Payment collection | Stripe (international) + Razorpay (India) |
| Approval logging | HubSpot workflow + Slack |

---

## Selection Notes

- The pricing catalog should live in exactly one place (Notion/Odoo/CRM product library) and be referenced by every proposal and quoting tool, not re-typed per deal — this prevents a stale figure from ever reaching a prospect.
- No dedicated CPQ (configure-price-quote) platform is justified at this business's current scale — a well-maintained catalog + compatibility mapping in an existing tool (HubSpot, Odoo, or Notion) covers this stage's actual needs.

---

## Cross-References

- Stage README: [README.md](README.md)
- Method-by-method usage: [methods.md](methods.md)
- Automation pipelines using these tools: [automation.md](automation.md)
- Payment collection continues in: [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
