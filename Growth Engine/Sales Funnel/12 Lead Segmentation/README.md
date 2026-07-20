# 12 Lead Segmentation

> **Stage 12 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 3, Session 5).

---

## Navigation

- ⬅ Previous stage: [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
- ➡ Next stage: [13 CRM Setup and Data Structuring](../13 CRM Setup and Data Structuring/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Group scored, verified leads (Stage 11) into distinct segments — by persona, industry, geography, company size, and funnel stage — so messaging, channel, and cadence can be tailored per segment instead of applying one generic sequence to every lead.

**Purpose:** A single outreach message never fits a Founder in the US and an Operations Manager in India equally well. Segmentation is what makes Stage 22 (Personalization/Copywriting) and Stage 21 (Multi-Channel Sequencing) possible at scale — without defined segments, "personalization" collapses into inserting a first name into a template. Segmentation is also what lets the team measure which audience converts best, informing where to invest more sourcing effort (feeding back to Stage 05).

**Inputs:**
- Scored/tiered lead list from Stage 11
- Buyer Persona definitions from Stage 03
- ICP definition from Stage 02 (industry, geography, company-size bands)
- Campaign objectives (which segment(s) the current push is targeting)

**Outputs:**
- Every lead tagged with one or more segment labels (persona, industry, geography, size-band, tier)
- Segment-specific lists ready for Stage 15 (Channel Strategy) and Stage 21 (Sequencing) to build campaigns against
- A segment performance view (which segments are growing, converting, or underperforming)

**Expected Result:** No lead enters outreach without a segment tag; every active campaign can be traced to a specific, intentional segment rather than "the whole list."

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **12A** Persona-Based Segmentation | Tagging leads to the Buyer Persona (Stage 03) they match most closely |
| **12B** Firmographic Segmentation | Industry, company size, revenue band, growth stage |
| **12C** Geographic Segmentation | Country/region — drives compliance, timing, and channel choices (see Stage 15) |
| **12D** Behavioral/Lifecycle Segmentation | New/engaged/dormant, tier from Stage 11, funnel stage (cold/nurture/active) |
| **12E** Source-Based Segmentation | Which Stage 06 sub-source a lead came from — used for source-performance analysis |
| **12F** Custom Campaign Segments | Ad hoc segments built for a specific campaign (e.g., "attended Webinar X") |
| **12G** Segment Overlap & Hierarchy Rules | How to handle leads matching multiple segments — primary vs. secondary tags |

---

## 3. Complete Methods

See [methods.md](methods.md) for manual, CRM-native, and AI-assisted segmentation approaches.

---

## 4. Complete Website Library

No external website library — segmentation is internal CRM/list-management work. See [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md) for rule-based auto-tagging and list-sync workflows.

---

## 7. AI Section

**How AI can help:**
- Classifying leads into the closest-matching Buyer Persona from unstructured profile/bio text where CRM fields alone are ambiguous
- Detecting natural sub-segments within a large "Warm" tier that a purely rule-based system wouldn't surface (e.g., a cluster of leads all in one under-served industry)
- Writing the segment-specific messaging variants that Stage 22 will use, once segments are defined here

**Prompt examples:**
```
"Given these 5 Buyer Personas [paste Stage 03 summaries] and this lead's
job title, company description, and LinkedIn bio [paste], which persona
is the closest match? Answer with the persona name and a one-line reason."
```
```
"Review this list of 200 'Warm' tier leads [paste CSV]. Are there any
natural sub-clusters (by industry, role pattern, or stated pain point)
worth carving into their own campaign segment? Summarize any you find."
```

**Agent workflows:** A scheduled agent can pull newly-scored leads (Stage 11 output), classify persona + firmographic segment via LLM where CRM fields are incomplete, and write the segment tags back to the CRM — with a human spot-check before the tags drive live campaigns.

**RAG / vector database considerations:** Becomes useful at larger scale — embedding lead profile text and clustering against persona embeddings can surface segmentation patterns a fixed rule table misses. Not required for a funnel at Nivy's current scale; rule-based + LLM-assisted tagging is sufficient.

**LLM recommendations:** Standard current-generation models are sufficient; this is a classification task, not a reasoning-heavy one.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### CRM fields (mandatory)
`Lead ID` · `Primary Segment` · `Persona Tag` · `Industry` · `Geography` · `Company Size Band` · `Lifecycle Stage`

### CRM fields (optional)
`Secondary Segments` (multi-select) · `Source Tag` (from Stage 06) · `Campaign Tags` (custom, ad hoc)

### JSON schema
```json
{
  "lead_id": "string (uuid)",
  "primary_segment": "string",
  "persona_tag": "string",
  "industry": "string",
  "geography": "string",
  "company_size_band": "string",
  "lifecycle_stage": "cold|nurture|active|customer",
  "secondary_segments": ["string"],
  "source_tag": "string",
  "campaign_tags": ["string"]
}
```

### Validation rules
- Every lead must have exactly one Primary Segment — multiple equally-weighted primaries defeats the purpose of segmentation for messaging decisions
- Segment values are drawn from a controlled list matching Stage 02/03 definitions, not free text, to keep campaign list-building reliable
- A lead's segment is re-evaluated whenever its underlying fit data (Stage 11) changes materially

### Naming conventions
- Segment tags mirror Buyer Persona names from Stage 03 exactly, so cross-referencing between stages doesn't require translation

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every scored lead has exactly one Primary Segment
- [ ] Segment values match the controlled list (no free-text drift)
- [ ] Segment counts reconcile against total scored-lead count (no leads silently dropped)
- [ ] Segments feeding an active campaign are reviewed for size (a 3-lead "segment" isn't a viable campaign target)

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of scored leads with a segment tag | 100% | Untagged leads can't enter targeted campaigns |
| Segment size distribution | No single segment > 60% of list | Over-concentration signals sourcing (Stage 06) is too narrow |
| Segment-level conversion tracking | Reviewed monthly | Identifies which segments deserve more sourcing/outreach investment |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
- **Next stage:** [13 CRM Setup and Data Structuring](../13 CRM Setup and Data Structuring/README.md)
- **Also feeds:** [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md), [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md), [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)

> **Source note:** Built from Stage 02 (ICP) and Stage 03 (Buyer Persona) definitions plus general segmentation practice, generalized for a multi-vertical, multi-market B2B knowledge base. No dedicated internal "segmentation SOP" existed in the source material at time of writing — this stage's checklists and rules should be reviewed against real campaign results as they accumulate.

[⬅ Back to README](README.md)
