# FAQ — 08 Lead Enrichment

> Part of Stage 08 (Lead Enrichment). See [README.md](README.md) for the full stage overview.

---

**Q: What if enrichment tools return conflicting company sizes?**
A: Flag the conflict rather than silently picking one. If it matters for a scoring or messaging decision, a quick manual check (company LinkedIn page) resolves it faster than debating which API is "more right" in general.

**Q: Should every lead get full enrichment, including the more expensive API calls (Crunchbase, deep firmographic)?**
A: Not necessarily for high-volume, low-cost campaigns — consider gating the more expensive enrichment steps behind a minimum ICP-fit pre-check so spend concentrates on leads likely to convert.

**Q: How current does a "recent signal" (funding/news) need to be to still be useful?**
A: Generally within the last 1-3 months for outreach personalization to feel current rather than stale — older signals read as out-of-date research.

**Q: What happens to a lead that can't be enriched at all (very small/obscure company)?**
A: Mark the enrichment fields `missing` rather than leaving them blank with no indication, and let it proceed to Stage 11 scoring with whatever data does exist — a thin enrichment profile is still usable, just scored accordingly.

**Q: Who owns the segmentation tag taxonomy — can teams add their own tags?**
A: The taxonomy should stay fixed (see [templates.md](templates.md)) — free-text or ad hoc tags break downstream filtering in Stage 12 and reporting. New tag values should be proposed and added centrally, not created ad hoc per campaign.

---

## Cross-References

- Stage README: [README.md](README.md)
