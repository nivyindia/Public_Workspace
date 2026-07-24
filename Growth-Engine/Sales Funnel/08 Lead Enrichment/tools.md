# Tools — 08 Lead Enrichment

> Part of Stage 08 (Lead Enrichment). See [README.md](README.md) for the full stage overview.
> Pricing is approximate — verify current pricing before purchase.

---

| Tool | Purpose | Pricing (approx.) | Free/OSS Alt | API | Automation |
|---|---|---|---|---|---|
| Clay | Multi-source enrichment waterfall (company, tech, revenue, social) | Free tier + paid | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Yes | n8n-native integration |
| Apollo.io | Firmographic enrichment alongside contact data | Free tier (~50/mo) + paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes | Yes |
| Clearbit | Company + person enrichment for CRM | Paid | Clay's Clearbit-sourced fields (bundled) | Yes | Yes |
| BuiltWith | Website tech stack detection | Free tier + paid | Wappalyzer (free browser ext) | Yes (paid tiers) | Yes |
| Crunchbase | Funding history, founding year for startups | Freemium/paid | LinkedIn company page (manual) | Yes (paid tiers) | Limited |
| Perplexity / AI web search | Recent news/funding signal synthesis | Subscription (~$20/mo) or API | Ollama / Open WebUI (self-hosted LLM — avoids sending data to a paid API) | API available | Yes |
| n8n | Orchestration of the enrichment waterfall | Free (self-hosted) | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | N/A (is the orchestrator) | Full |
| HubSpot (or equivalent CRM) | Final enriched-record storage | Free tier + paid | Any CRM with custom properties | Yes | Yes |

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods file: [methods.md](methods.md)
