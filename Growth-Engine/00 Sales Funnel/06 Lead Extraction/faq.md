# FAQ — 06 Lead Extraction

> Part of Stage 06 (Lead Extraction). See [README.md](README.md) for the stage overview.

---

**Q: What's the minimum a "lead" needs to be usable?**
A: At least one contact anchor (email, phone, or a verifiable profile/listing URL) plus a company name and a job title (or business category, for local-business leads). A row with none of these should be rejected before CRM entry, not counted toward the daily target.

**Q: Should I prioritize volume or precision when extracting?**
A: Precision. A batch of 15 well-qualified leads outperforms 30 leads where a third fail the ICP check downstream — every unqualified lead wastes Stage 07/08 enrichment effort and Stage 16+ outreach capacity.

**Q: How do I know if a source is legally safe to use?**
A: Check it against the [Legal & Ethical Map in methods.md](methods.md#legal--ethical-map-applies-across-all-methods). Public registries, job postings, and vendor-ToS-compliant databases are safe; leaked/stolen/"database seller" lists are never acceptable regardless of price or convenience.

**Q: What do I do if my Boolean search or Apollo filter returns zero results?**
A: Simplify — drop to 2 keyword groups max, or loosen one filter (usually company size or an overly narrow industry tag) rather than adding more conditions.

**Q: A scraper/automation ran but returned almost no results — what does that usually mean?**
A: Usually one of: the site changed its page structure (scraper selector broke), a login/session expired, or the platform is soft-blocking the account for scraping too aggressively. Treat a near-zero-result run as a signal to investigate, not as "just a quiet day."

**Q: How often should I re-run the same saved search (Apollo/Sales Navigator)?**
A: Only as often as the underlying data plausibly changes — re-running daily against an unchanged filter mostly produces duplicates. Weekly re-runs, or re-runs after materially changing the filter, are usually sufficient.

**Q: Do I need to cross-reference every Google Maps lead with LinkedIn?**
A: For any lead you intend to route to a personal (not just business-line) outreach channel, yes — a business listing with no named decision-maker is much harder to convert in Stage 16/17 outreach.

**Q: What's the difference between this stage and Stage 07 (Contact Discovery)?**
A: Stage 06 captures *who/what* the lead is (name, company, a profile or listing anchor). Stage 07 resolves the actual *contact channel* (verified email, direct phone) when it wasn't captured directly during extraction.

---

## Cross-References

- Stage README: [README.md](README.md)
- Legal map referenced above: [methods.md](methods.md)
- Next stage: [07 Contact Discovery](../07 Contact Discovery/README.md)
