# 05 Lead Source Selection

> **Stage 5 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 1, Session 3). Batch 1 complete — Stages 01–05 now at pilot depth.

---

## Navigation

- ⬅ Previous stage: [04 Competitor Research](../04 Competitor Research/README.md)
- ➡ Next stage: [06 Lead Extraction](../06 Lead Extraction/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Decide, per campaign/market/ICP combination, which specific lead source(s) (Apollo, LinkedIn, Google Maps, Companies House, JustDial, etc.) will be used for extraction — before Stage 06 begins pulling leads.

**Purpose:** Stage 06 (Lead Extraction) executes fast and in volume; if the wrong source is chosen for a given ICP/market, that volume becomes wasted effort — low ICP-fit leads, high bounce rates, or extraction from a source that doesn't cover the target geography at all. Source selection is the decision point; extraction is the execution.

**Inputs:**
- Active ICP(s) from Stage 02 — role, company size, geography
- Market Research brief (Stage 01) — which channels are known to work in that geography
- Budget/tooling constraints (which paid tools are currently active)

**Outputs:**
- A source-selection decision per campaign: which source(s), why, and what daily/weekly volume target
- An updated source-effectiveness log (which sources are producing quality vs. wasted volume, feeding future selection decisions)

**Expected Result:** Every extraction batch (Stage 06) starts from a deliberately chosen source matched to the ICP and market, not a default habit.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **5A** Source Inventory | Maintain the master list of available sources (paid databases, free directories, government registries, social platforms) per market |
| **5B** Source-to-ICP Fit Mapping | Match each source's typical coverage (roles, company size, geography) against the active ICP(s) |
| **5C** Cost/Volume Tradeoff Assessment | Weigh paid-tool cost against expected qualified-lead volume per source |
| **5D** Compliance Check | Confirm the source and intended contact method comply with the target market's data/privacy rules (e.g. GDPR for UK/EU) |
| **5E** Pilot Batch Test | Run a small test extraction from a newly-considered source before committing full volume to it |
| **5F** Source Performance Logging | Track which sources actually convert to qualified leads over time, not just which sources are easiest to pull from |
| **5G** Source Reselection / Rotation | Periodically re-evaluate and rotate sources based on the performance log, avoiding over-reliance on a single depleting source |

---

## 3. Complete Methods

Full breakdown of source-selection methods is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

Full per-market source library (Apollo, LinkedIn, Google Maps, JustDial, Companies House, ABR, Crunchbase, etc.) is in **[resources.md](resources.md)**.

---

## 5. Complete Tool Library

Full per-tool breakdown is in **[tools.md](tools.md)**.

---

## 6. Automation

See [automation.md](automation.md) for source-performance tracking automation.

---

## 7. AI Section

**How AI can help:**
- Recommending which source(s) best match a given ICP + market combination based on the source library and past performance log
- Drafting the pilot-batch test plan (sample size, success criteria) before committing to a source
- Summarizing source-performance data into a simple "keep / rotate / drop" recommendation each review cycle

**Prompt examples:**
```
"Given this ICP [paste: role, company size, geography] and this source
library [paste resources.md table], recommend the top 2 lead sources to
use for this campaign, with reasoning tied to source coverage and past
performance data if available."
```
```
"Here is 90 days of source-performance data [paste: source, leads pulled,
qualified rate, cost] — recommend which sources to keep, which to rotate
out, and which to test next, with reasoning."
```

**Agent workflows:** An agent can maintain the source-performance log automatically by pulling Stage 06 extraction counts and Stage 11 scoring outcomes per source, then surface a rotation recommendation each review cycle rather than requiring a manual spreadsheet review.

**RAG / vector database considerations:** Not essential at a handful of active markets/sources; becomes useful once tracking source performance across many ICP × market combinations simultaneously.

**LLM recommendations:** A standard capable model is sufficient — this stage is a data-driven recommendation task, not a task requiring frontier reasoning.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Source Selection Record — mandatory fields
`Campaign/Market` · `ICP` · `Selected Source(s)` · `Rationale` · `Daily/Weekly Volume Target` · `Compliance Notes` · `Decision Date`

### JSON schema
```json
{
  "selection_id": "string",
  "market": "string (ISO-style code, e.g. UK, US, IN, UAE, AU)",
  "icp_id": "string",
  "selected_sources": ["string"],
  "rationale": "string",
  "volume_target": "string",
  "compliance_notes": "string",
  "decision_date": "ISO 8601 date",
  "status": "active|testing|deprecated"
}
```

### Source Performance Log — mandatory fields
`Source` · `Market` · `Leads Pulled` · `Qualified Rate` · `Cost (if paid)` · `Review Period` · `Recommendation (keep/rotate/drop)`

### Validation rules
- A source cannot be marked `active` for a market without a documented compliance check (especially GDPR-relevant markets like UK/EU)
- Cost-per-qualified-lead should be calculable for every paid source before it's scaled beyond a pilot batch

### Naming conventions
- Market field uses the same ISO-style short codes as Stage 01/02 (`IN`, `US`, `UK`, `UAE`, `AU`) for consistent cross-stage filtering

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] Selected source(s) documented with rationale tied to ICP fit, not just habit/convenience
- [ ] Compliance check completed for the target market
- [ ] Pilot batch run and reviewed before committing to full volume on a new source
- [ ] Source performance log updated at least monthly

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Sources actively used per market | 2-4 | Enough for redundancy without fragmenting effort |
| Qualified-lead rate by source | Tracked per source | Feeds Stage 11 scoring context |
| Email bounce rate (source-dependent) | < 3% | Per Nivy's existing data-quality standard |
| Source rotation review cadence | Monthly | Prevents over-reliance on a single depleting or underperforming source |

---

## 11. Templates

See [templates.md](templates.md) for the source-selection decision template and performance log template.

---

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [04 Competitor Research](../04 Competitor Research/README.md)
- **Next stage:** [06 Lead Extraction](../06 Lead Extraction/README.md) — executes extraction from the source(s) selected here
- **Also feeds:** [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md) (source becomes a scoring input over time)
- **Automation file:** [automation.md](automation.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using Nivy's existing "Data Sources & Databases Guide" (primary tools table, Apollo/LinkedIn Sales Navigator setup guides, free/alternative source list per market, and data-quality rules) and "International Lead Sources (US, UK, UAE, AU)" guide. Both generalized here for the broader multi-vertical knowledge base. Pricing figures are approximate as of the source docs' last update (May 2026) and should be re-verified before use.
