# Automation — 05 Lead Source Selection

> Part of Stage 05 (Lead Source Selection). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. Source Performance Log Automation
- **Manual:** Analyst manually tallies leads pulled and qualified rate per source monthly
- **Semi-automated:** Spreadsheet formulas pulling from Stage 06 extraction counts and Stage 11 scoring exports
- **Fully automated:** Dashboard auto-joining extraction-source tag (from Stage 06's CRM `Source` field) with Stage 11 scoring outcomes, refreshed continuously
- **AI-assisted:** LLM reviews the refreshed dashboard monthly and drafts a keep/rotate/drop recommendation
- **Required tools:** CRM with source-tagging (per Stage 06 data structure), BI dashboard or spreadsheet, LLM API
- **Expected output:** Monthly source-performance summary with a recommendation
- **Common errors:** Source field inconsistently tagged at extraction time breaks this entire pipeline — enforce the fixed source enum from Stage 06 strictly

### 2. Compliance Check Automation
- **Manual:** Analyst manually confirms data-rule compliance per market before a source goes live
- **Semi-automated:** Checklist template (per [checklists.md](checklists.md)) attached to every new source-selection decision
- **Required tools:** Checklist template, CRM/Notion record
- **Expected output:** Documented compliance sign-off per source/market combination
- **Common errors:** Compliance checks skipped under time pressure for "just a small test batch" — the checklist should apply even to pilot batches

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [04 Competitor Research](../04 Competitor Research/README.md)
- Next stage: [06 Lead Extraction](../06 Lead Extraction/README.md)
