# Tools — 36 Contract and Legal

[⬅ Back to README](README.md)

> Pricing is approximate and sourced from internal docs — **verify current pricing on the vendor site before purchase**, as B2B SaaS pricing changes frequently.

---

## Tier 1 — E-Signature (Core of This Stage's Automation)

| Tool | Purpose | Pricing (approx.) | OSS/Free Alt | Webhook API | Automation |
|---|---|---|---|---|---|
| **Documenso** ⭐ | Open-source e-signature with webhook events for signed/unsigned status | Free (self-hosted) | This *is* the OSS option | Yes | Full — this is the tool the flagged webhook pattern is built on |
| DocuSign | Enterprise-grade e-signature | Subscription, verify current tier pricing | — | Yes | Full |
| Dropbox Sign | Lighter-weight e-signature alternative | Subscription, verify current tier pricing | Free tier (limited) | Yes | Full |
| PandaDoc / Signable | Combined proposal-to-contract e-signature (shared with Stage 33) | Paid, verify current tier pricing | — | Yes | Full |

---

## Tier 2 — Contract Template & Document Generation

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Google Docs (template + Docs API) | Merge negotiated terms into a standard contract template | Free | Free | Yes |
| Odoo Sign / Documents | OSS-native contract templating tied directly to Odoo CRM/Sales data | Free (Community) | This *is* the OSS option | Yes |
| PandaDoc | Same merge function, paid tier, shared pipeline with Stages 33/34 | Paid, verify current tier pricing | — | Yes |

---

## Tier 3 — Filing / Records

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Google Drive / Notion | Signed-document filing and company records | Free–low cost | Free tier | Yes |
| Nextcloud | Self-hosted document storage, OSS-native | Free (self-hosted) | This *is* the OSS option | Yes |

---

## Tier 4 — Payment Tied to the Signed Contract

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Stripe / Razorpay | Payment collection triggered by signature — feeds [39 Payment and Invoicing](../39 Payment and Invoicing/README.md) | Usage-based | — | Yes |
| Odoo Invoicing | OSS-native invoicing, same trigger | Free (Community) | This *is* the OSS option | Yes |

---

## Tier 5 — Automation / Orchestration Layer

| Tool | Purpose | Pricing | OSS/Free Alt |
|---|---|---|---|
| n8n | Webhook listener for signed status → CRM update → invoice/onboarding fanout | Free (self-hosted) | This *is* the OSS option |
| Zapier / Make | Equivalent orchestration if n8n isn't yet deployed | Free tier + paid | n8n is the OSS-preferred substitute |

---

## Recommended Stacks

### OSS-First Stack (Matches Declared Odoo/n8n Architecture)
| Purpose | Tool |
|---|---|
| E-signature + webhook | Documenso |
| Contract template merge | Odoo Sign/Documents |
| Filing | Nextcloud |
| Payment trigger | Odoo Invoicing |
| Orchestration | n8n |

### Professional Stack (Scale Mode)
| Purpose | Tool |
|---|---|
| E-signature + webhook | DocuSign |
| Contract template merge | PandaDoc |
| Filing | Google Drive |
| Payment trigger | Stripe/Razorpay |
| Orchestration | n8n or Zapier |

---

## Selection Notes

- Whichever e-signature tool is used for the proposal (Stage 33) should generally carry through to the contract, to avoid introducing a second unfamiliar tool in the client's signing experience.
- Documenso is the one tool in this stage where the OSS option isn't a lesser substitute for a paid tool — it directly supports the webhook pattern this stage's automation depends on, making it the natural default rather than a budget fallback.

---

## Cross-References

- Stage README: [README.md](README.md)
- Method-by-method usage: [methods.md](methods.md)
- Automation pipelines using these tools: [automation.md](automation.md)
- Triggers into: [39 Payment and Invoicing](../39 Payment and Invoicing/README.md), [40 Client Onboarding](../40 Client Onboarding/README.md)
