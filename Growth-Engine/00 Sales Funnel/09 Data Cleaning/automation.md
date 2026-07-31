# Automation — 09 Data Cleaning

> Part of Stage 09 (Data Cleaning). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. Duplicate Detection
- **Manual:** Analyst sorts CRM alphabetically and visually scans, per SOP-VA-012 Step 1
- **Semi-automated:** CRM native dedup tool surfaces candidate duplicates for manual confirm/merge
- **AI-assisted:** LLM fuzzy-matches name + company + LinkedIn URL across a CRM export and outputs a candidate-duplicate list with confidence, for human confirmation before any deletion
- **Required tools:** CRM export capability, LLM API or CRM native dedup feature
- **Expected output:** A reviewed, confirmed duplicate-deletion list — never auto-deleted without human confirmation
- **Common errors:** Auto-merging without checking which row has more complete data loses information — always keep the fuller row per the SOP

### 2. Formatting Violation Scan
- **Manual:** Analyst manually checks each record against the formatting standards
- **Semi-automated:** Spreadsheet formulas/conditional formatting flag date-format and market-value violations
- **Fully automated:** Scheduled script scans the full CRM export weekly and outputs a violation list before the Friday cleaning session
- **Required tools:** Spreadsheet tooling or a lightweight script, LLM API for bulk flagging
- **Expected output:** Pre-flagged violation list ready for the weekly cleaning session, reducing manual scan time
- **Common errors:** Treating a scan result as already-fixed — the scan flags, a human still corrects

### 3. Cleaning Log Automation
- **Manual:** Analyst manually tallies and writes the summary row after each session
- **Semi-automated:** Template auto-calculates totals from the session's tracked actions
- **Required tools:** Spreadsheet or Notion database with the Cleaning Log template
- **Expected output:** Consistent, auditable Cleaning Log entry every session

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [08 Lead Enrichment](../08 Lead Enrichment/README.md)
- Next stage: [10 Lead Verification](../10 Lead Verification/README.md)
