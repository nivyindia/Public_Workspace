# 08 Lead Enrichment

> **Stage 8 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 2, Session 4).

---

## Navigation

- ⬅ Previous stage: [07 Contact Discovery](../07 Contact Discovery/README.md)
- ➡ Next stage: [09 Data Cleaning](../09 Data Cleaning/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Add the firmographic, technographic, and contextual detail (company size, industry, tech stack, revenue estimate, recent news/funding) that turns a bare contact record into a lead the team can score (Stage 11), segment (Stage 12), and personalize outreach to (Stage 22).

**Purpose:** A name + resolved email is enough to send a generic email; it is not enough to send a personalized, ICP-scored one. Enrichment is what makes Stage 11 scoring possible (you can't score fit against company-size/industry criteria you haven't captured) and what gives Stage 22 copywriting real material to reference instead of generic filler.

**Inputs:**
- Leads from Stage 07 with a resolved contact channel
- Access to enrichment tools (Clay, Apollo, Clearbit, BuiltWith)
- ICP criteria from Stage 02 (defines which enrichment fields actually matter for scoring)

**Outputs:**
- Leads updated with company size, industry/sub-industry, tech stack, revenue estimate, founding year, recent news/funding signal, and social profiles where available
- Leads tagged with the segmentation fields Stage 12 will use (country, industry, size band, service interest)

**Expected Result:** Every lead reaching Stage 11 (Scoring) has enough structured data to be scored against ICP criteria, not left as an unscored, unenrichable record.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **8A** Firmographic Enrichment | Company name, size, industry, sub-industry, founding year |
| **8B** Technographic Enrichment | Website CMS, marketing/sales tools, tech stack signals (feeds tech-relevant messaging angles) |
| **8C** Financial Enrichment | Annual revenue estimate, funding history where applicable |
| **8D** Social/Digital Presence Enrichment | LinkedIn company page, other social profiles, follower counts as a rough signal of digital maturity |
| **8E** News & Signal Enrichment | Recent funding, hiring surges, leadership changes — hyper-personalization material |
| **8F** Segmentation Tagging | Apply the fixed tag taxonomy (country, industry, size, service interest, source, status) so Stage 12 can filter reliably |
| **8G** Enrichment Confidence Scoring | Mark each enriched field's confidence (tool-confirmed vs. AI-inferred vs. missing) so Stage 11 scoring can weight accordingly |

---

## 3. Complete Methods

Full breakdown of enrichment methods and tool chains is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

Full per-tool breakdown (Clay, Apollo, Clearbit, BuiltWith, Crunchbase, Perplexity) is in **[tools.md](tools.md)**.

---

## 6. Automation

See [automation.md](automation.md) for the Clay-based enrichment automation pattern already in production use.

---

## 7. AI Section

**How AI can help:**
- Synthesizing multiple enrichment API outputs (Clay, Clearbit, BuiltWith) into a single clean lead record, resolving conflicts between sources
- Using web search/Perplexity-style lookups to surface recent funding/news signals not covered by structured enrichment APIs
- Classifying a company's likely service-interest tag from a description of what they do (feeds Stage 12 segmentation)
- Flagging low-confidence enrichment (e.g. a revenue estimate that seems implausible given company size) for human review rather than silently accepting it

**Prompt examples:**
```
"Here is enrichment data for [Company] from 3 sources: [paste Clay, Apollo,
BuiltWith outputs]. Where sources conflict on company size or industry,
flag the conflict rather than picking one silently. Otherwise merge into
a single clean record matching this schema: [paste schema]."
```
```
"Given this company description: [paste], classify which of our service
tags applies: svc:va, svc:accounting, svc:marketing, svc:webdev,
svc:automation. Explain your reasoning in one sentence."
```

**Agent workflows:** An agent can chain: (1) new resolved-contact lead triggers enrichment webhook → (2) call Clay/Clearbit/BuiltWith in parallel → (3) LLM merges and resolves conflicts → (4) write enriched fields + confidence flags to CRM → (5) apply segmentation tags automatically.

**RAG / vector database considerations:** Useful once enrichment volume is high enough that repeated company-level lookups (same company, multiple contacts) should be cached rather than re-queried and re-billed each time.

**LLM recommendations:** A general-purpose model is sufficient for merging/classification tasks; web-search-enabled models add real value for the news/signal enrichment sub-stage specifically.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Enrichment fields — mandatory
`Company Size` · `Industry` · `Sub-Industry` · `Tech Stack` · `Annual Revenue Estimate` · `Founding Year` · `LinkedIn Company URL` · `Segmentation Tags` · `Enrichment Confidence`

### JSON schema
```json
{
  "lead_id": "string",
  "company_size": "string (e.g. '2-10', '11-50')",
  "industry": "string",
  "sub_industry": "string|null",
  "tech_stack": ["string"],
  "annual_revenue_estimate": "string|null",
  "founding_year": "integer|null",
  "linkedin_company_url": "string|null",
  "recent_signal": "string|null (e.g. 'raised Series A, March 2026')",
  "segmentation_tags": {
    "country": "string",
    "industry": "string",
    "size": "solo|small|mid|large",
    "service_interest": "string",
    "source": "string"
  },
  "enrichment_confidence": "tool_confirmed|ai_inferred|missing"
}
```

### Validation rules
- Every mandatory field is either populated with a source-confidence tag or explicitly marked `missing` — never left blank without indication
- Conflicting data between enrichment sources must be flagged, not silently resolved by picking one arbitrarily
- Segmentation tags must use the fixed taxonomy (see [templates.md](templates.md)) — free-text tags break downstream filtering

### Naming conventions
- Company size uses fixed bands (`solo` = 1, `small` = 2-10, `mid` = 11-50, `large` = 50+) consistent with the segmentation system already in production use

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] Enrichment completion rate target met (>80% of contacts, per existing Data Health KPI)
- [ ] Segmentation tags applied using the fixed taxonomy, not free text
- [ ] Enrichment confidence marked per field
- [ ] Conflicting source data flagged, not silently overwritten

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Enrichment completion rate | > 80% of contacts | Per existing Data Health KPI standard |
| Contacts with country tag | 100% | Weekly-checked |
| Contacts with service-interest tag | > 90% | Weekly-checked |
| Enrichment-to-CRM-write latency | < 24 hours from contact discovery | Stale enrichment loses relevance |

---

## 11. Templates

See [templates.md](templates.md) for the enrichment record template and segmentation tag taxonomy.

---

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [07 Contact Discovery](../07 Contact Discovery/README.md)
- **Next stage:** [09 Data Cleaning](../09 Data Cleaning/README.md)
- **Also feeds:** [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md), [12 Lead Segmentation](../12 Lead Segmentation/README.md), [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)

> **Source note:** This stage was populated using Nivy's existing "Data Infrastructure OS — Scraping, Enrichment & CRM" document (Layer 3 — Lead Enrichment, Layer 4 — Segmentation System, and the Clay/n8n enrichment automation flow already documented for production use). Pricing figures are approximate and should be re-verified before use.
