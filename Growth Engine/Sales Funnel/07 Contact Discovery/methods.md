# Methods — 07 Contact Discovery

> Part of Stage 07 (Contact Discovery). See [README.md](README.md) for the full stage overview.

---

## Domain-Pattern Methods

- **Pattern lookup via Hunter/Snov** — query by company domain to get the most common email pattern used at that company (`first.last@`, `flast@`, etc.), then apply it to the target name
- **Pattern inference from known samples** — where 2-3 real emails at the company are already known (from other resolved leads), infer the pattern manually or via AI, then validate before use

## Database Methods

- **Direct Apollo/database pull** — many leads extracted via Apollo (Stage 06) already carry a verified email in the same record; check before running additional discovery
- **Cross-database check** — if the primary database lacks the contact, check a secondary tool (Lusha, RocketReach, SalesQL) before falling back to inference

## LinkedIn-to-Email Methods

- **Enrichment tool lookup from profile URL** — Hunter, Snov, and SalesQL can often resolve a work email directly from a LinkedIn profile URL
- **PhantomBuster profile scrape + email-finder chain** — for bulk LinkedIn-sourced leads, chain a profile scrape into an email-finder API step (see [automation.md](automation.md))

## Fallback Methods

- **Website contact-page pull** — manually or via browser-automation, pull published team/contact page details when tool-based discovery fails
- **Contact form as last resort** — for leads with no discoverable direct contact, a website contact-form submission (see Stage 06's website contact-form pattern) may be the only available channel — use sparingly and track separately from standard outreach

## AI-Assisted Methods

- LLM-assisted pattern inference and contact-page text parsing (see [README.md §7](README.md#7-ai-section))

## Manual vs. Automated

| Method | Manual | Semi-Automated | Fully Automated |
|---|---|---|---|
| Domain pattern lookup | Analyst queries Hunter manually per lead | Bulk CSV upload to Hunter/Snov | API call triggered per new CRM row |
| LinkedIn-to-email | Analyst pastes profile URL into a tool | Batch profile list processed | PhantomBuster → enrichment API → CRM write chain |
| Website fallback | Analyst visits site manually | Browser-automation script extracts contact page | Rare to fully automate — contact pages vary too much in structure |

---

## Cross-References

- Stage README: [README.md](README.md)
- Feeds into: [08 Lead Enrichment](../08 Lead Enrichment/README.md), [10 Lead Verification](../10 Lead Verification/README.md)
