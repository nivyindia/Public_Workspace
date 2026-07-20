# FAQ — 09 Data Cleaning

> Part of Stage 09 (Data Cleaning). See [README.md](README.md) for the full stage overview.

---

**Q: How often should data cleaning actually run?**
A: Weekly at minimum (every Friday per the SOP), plus immediately after any bulk import — Apollo pulls, CSV uploads, manual batch entry all introduce fresh duplicate/formatting risk.

**Q: What if two leads look like duplicates but the company name differs slightly?**
A: Don't confirm as duplicate on name similarity alone — check Company Name and LinkedIn URL together. A slight company-name variation might mean two different people at similarly-named companies, not a duplicate.

**Q: Can a lead be marked Dead just because it's been sitting untouched for a while?**
A: No — only if it completed the full follow-up sequence, explicitly opted out, or failed a hard disqualifier. Staleness alone isn't a valid reason; that's a routing/re-engagement decision, not a cleaning decision.

**Q: Who should run the cleaning session — can it be delegated to a junior VA?**
A: Yes, per the SOP this is a VA Executive/VA Manager-level task, but deletions should be logged transparently enough that a Manager can audit the session afterward.

**Q: What's the single most common mistake in data cleaning sessions?**
A: Deleting a duplicate without checking which row has more complete data first — always keep the fuller row, per the SOP's explicit common-mistakes list.

---

## Cross-References

- Stage README: [README.md](README.md)
