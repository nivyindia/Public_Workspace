# 09 Data Cleaning

> **Stage 9 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 2, Session 4).

---

## Navigation

- ⬅ Previous stage: [08 Lead Enrichment](../08 Lead Enrichment/README.md)
- ➡ Next stage: [10 Lead Verification](../10 Lead Verification/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Regularly clean the CRM — removing duplicates, correcting invalid data, and standardizing formatting — so the accumulated output of Stages 06-08 stays accurate and usable rather than degrading over time.

**Purpose:** Extraction, discovery, and enrichment all add data continuously; without a dedicated cleaning cadence, duplicates accumulate, formatting drifts (inconsistent date/market/status values break reporting and automation), and dead leads clutter active views. Unlike the earlier stages which process a batch once, Data Cleaning is a recurring maintenance stage that runs against the whole accumulated CRM.

**Inputs:**
- The full CRM/lead database as it stands, not just the most recent batch
- The approved formatting standards (date format, market value list, status value list)

**Outputs:**
- A CRM with zero confirmed duplicates, zero invalid email formats, and all fields matching approved formatting standards
- An updated Cleaning Log documenting what was removed/corrected and why

**Expected Result:** A CRM that stays reliable as a source of truth for every downstream stage (scoring, segmentation, outreach, reporting) rather than silently accumulating rot.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **9A** Duplicate Detection | Sort and scan for identical/near-identical leads; confirm via Name + Company + LinkedIn URL before merging/deleting |
| **9B** Duplicate Resolution | Keep the row with more complete data, delete the other, log the deletion |
| **9C** Invalid Contact Flagging | Flag malformed emails, phone numbers without country code, broken LinkedIn URLs, placeholder company names |
| **9D** Invalid Contact Resolution | Attempt to verify and correct flagged fields; mark unverifiable leads as Dead |
| **9E** Formatting Standardization | Enforce date format, market value list, status value list, LinkedIn URL format, phone number format |
| **9F** Dead Lead Review | Confirm every lead marked Dead has completed the follow-up sequence, explicitly opted out, or failed a hard disqualifier |
| **9G** Cleaning Log Maintenance | Record every cleaning session's totals (duplicates removed, invalid contacts corrected/deleted, formatting fixes) |

---

## 3. Complete Methods

Full breakdown of cleaning methods and cadence is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

Not typically applicable — this stage is internal CRM maintenance. See [tools.md](tools.md) for the relevant tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md) for semi-automated duplicate detection and formatting-validation patterns.

---

## 7. AI Section

**How AI can help:**
- Flagging likely duplicate pairs by fuzzy-matching name + company + LinkedIn URL, surfacing candidates for human confirmation rather than auto-deleting
- Detecting formatting violations in bulk (wrong date format, non-standard market values) across the full CRM export
- Drafting the weekly Cleaning Log summary from a list of session actions

**Prompt examples:**
```
"Here is a CRM export [paste/attach CSV]. Flag any rows that are likely
duplicates of another row based on similar name + same company + same
LinkedIn URL. For each flagged pair, state which row has more complete
data. Do not auto-delete — just flag for human confirmation."
```
```
"Scan this CRM export for formatting violations: date format not
yyyy-mm-dd, market values outside the approved list [US/UK/Canada/AU/UAE],
phone numbers missing a country code. List every violation with the row
identifier."
```

**Agent workflows:** An agent can run the fuzzy-duplicate-detection and formatting-violation scan automatically on a weekly schedule, output a review list, and route it to the VA/Manager for the confirm-and-execute step — full auto-deletion without human confirmation is not recommended given the cost of wrongly deleting a unique lead.

**RAG / vector database considerations:** Not applicable — this is a structured-data maintenance task, not a retrieval task.

**LLM recommendations:** A standard capable model is sufficient for fuzzy matching and formatting-violation detection; this is a pattern-recognition task, not one requiring frontier reasoning.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Cleaning Log — mandatory fields (per session)
`Date of Clean` · `Total Duplicates Removed` · `Total Invalid Contacts Corrected/Deleted` · `Total Formatting Issues Fixed` · `VA/Analyst Who Ran the Clean`

### Duplicate deletion log entry
`Name` · `Company` · `Date Removed` · `Reason`

### Approved Formatting Standards
- **Date format:** `yyyy-mm-dd` (not `dd/mm` or `mm/dd`)
- **Market values:** `US` / `UK` / `Canada` / `AU` / `UAE` (exact — not "United States", "Britain", etc.)
- **Status values:** fixed enum only (see Stage 06/11 status fields — no free text)
- **LinkedIn URLs:** full `https://` format, not shortened
- **Phone numbers:** country code included (`+1`, `+44`, `+971`, etc.)

### Validation rules
- A duplicate is only confirmed (and one row deleted) after checking Name + Company Name + LinkedIn URL together — name similarity alone is not sufficient confirmation
- When deleting a confirmed duplicate, always keep the row with more complete data
- A lead marked `Dead` must have either completed the full follow-up sequence, explicitly opted out, or failed a hard disqualifier — a lead marked Dead after only 1-2 follow-ups is flagged for Manager review, not accepted as-is

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary output standard:
- [ ] Zero confirmed duplicates after cleaning
- [ ] Zero invalid email formats
- [ ] All date and status values follow the approved format
- [ ] Cleaning Log updated after every session

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Duplicate contact rate | < 3% | Per existing Data Health KPI standard |
| Cleaning cadence | Weekly (every Friday) minimum, plus after every bulk import | Per SOP |
| Cleaning Log completeness | 100% of sessions logged | Manager needs to be able to audit what was removed |
| Formatting compliance | 100% of active records | Wrong dates/markets break downstream automation and reporting |

---

## 11. Templates

See [templates.md](templates.md) for the Cleaning Log template and formatting-standards checklist.

---

## 12. Resources

See [resources.md](resources.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [08 Lead Enrichment](../08 Lead Enrichment/README.md)
- **Next stage:** [10 Lead Verification](../10 Lead Verification/README.md)
- **Also feeds:** [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md) (a clean CRM is a precondition for reliable scoring/reporting)
- **Automation file:** [automation.md](automation.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated directly from Nivy's existing "SOP-VA-012 — Data Cleaning SOP" (live, version 1.0, last updated April 2026), generalized here for the multi-vertical knowledge base while preserving the original step-by-step structure, output standard, and common-mistakes list.
