# 01 Market Research

> **Stage 1 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 1, Session 2).

---

## Navigation

- ⬅ Previous stage: _none — this is the first stage_
- ➡ Next stage: [02 ICP Definition](../02 ICP Definition/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Establish a factual, sourced picture of the industry, market size, trends, regulatory environment, and competitive landscape in each target geography (India, US, UK, UAE, Australia) before any ICP, persona, or outreach decision is made.

**Purpose:** Market Research is the foundation stage — every later decision (which ICP to pursue, which persona to write for, which channel to prioritize, what to charge) inherits its assumptions from what is established here. A funnel built on an untested market assumption ("agencies will pay $500/mo for X") wastes every downstream stage's effort on the wrong audience.

**Inputs:**
- Target geography list (currently India, US, UK, UAE, Australia — see Stage 05 for how new markets get added)
- Company positioning and existing service catalog (what Nivy already sells, so research is scoped to addressable services, not generic industry study)
- Access to secondary research sources (see [resources.md](resources.md)) and, where budget allows, primary research (buyer interviews, surveys)

**Outputs:**
- A per-market research brief covering market size (TAM/SAM/SOM), demand by service line, competitive landscape, regulatory environment, and buying behavior
- A prioritized market list (which geography to pursue first, second, etc.) feeding Stage 05 (Lead Source Selection)
- Raw segment and persona signals that feed Stage 02 (ICP Definition) and Stage 03 (Buyer Persona)

**Expected Result:** A living market research brief per active geography, refreshed at minimum every 2 quarters, that every other funnel stage can cite instead of re-deriving from scratch.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **1A** Industry & Structure Mapping | Define the industry category(s) the business competes in and how the market is structured (fragmented vs. consolidated, traditional vs. platform-based) |
| **1B** Market Sizing (TAM/SAM/SOM) | Estimate total addressable, serviceable available, and serviceable obtainable market at global and per-geography level |
| **1C** Trend & Technology Scan | Identify current industry trends (outsourcing growth, remote-first buying, subscription models) and emerging technologies reshaping demand (AI automation, cloud platforms) |
| **1D** Regulatory Environment Mapping | Document compliance/regulatory drivers per geography that create demand (GST in India, MTD in UK, Corporate Tax in UAE, BAS/ATO in Australia) |
| **1E** Competitor Landscape Scan | Map competitor categories (traditional firms, digital agencies, freelancer platforms, integrated providers) and their strengths/weaknesses — full detail flows into Stage 04 |
| **1F** Customer Needs & Pain Point Research | Capture recurring pain points (vendor fragmentation, high local costs, compliance complexity) directly from forums, reviews, and buyer conversations |
| **1G** Buying Behavior Mapping | Document the typical buyer journey and decision process (problem recognition → research → evaluation → pilot → contract) |
| **1H** Market Segmentation | Break the addressable market into named segments (startups, SMEs, e-commerce, agencies, international entrepreneurs) with distinguishing needs |
| **1I** Porter's Five Forces Analysis | Assess competitive rivalry, entry barriers, buyer power, supplier power, and substitute threat for the industry as a whole |
| **1J** Cross-Market Comparative Scoring | Score each active geography on size, price sensitivity, compliance complexity, trust threshold, and channel fit to produce a priority order |

---

## 3. Complete Methods

Full breakdown — traditional, modern, AI, manual, automated, public-database, and community research methods — is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

Full per-source breakdown (government stats bureaus, industry associations, market research vendors, forums) is in **[resources.md](resources.md)**.

---

## 5. Complete Tool Library

Full per-tool breakdown (research platforms, survey tools, AI research assistants) is in **[tools.md](tools.md)**.

---

## 6. Automation

Manual → semi-automated → AI-assisted research workflows are in **[automation.md](automation.md)**.

---

## 7. AI Section

**How AI can help:**
- Synthesizing dozens of public sources (government SME statistics, industry reports, forum threads) into a structured market brief in a fraction of manual research time
- Drafting first-pass TAM/SAM/SOM estimates from public statistics that a human then sanity-checks and sources
- Summarizing competitor positioning from their own websites, pricing pages, and review-site profiles
- Extracting recurring pain-point language directly from G2/Trustpilot/Reddit/Quora threads to ground persona pain points in real buyer words rather than assumption
- Flagging regulatory changes (new tax regimes, compliance mandates) that create fresh demand windows, by monitoring official government/gazette sources

**Prompt examples:**
```
"Summarize the current market size, primary buyer pain points, and top 5
competitor categories for outsourced [accounting/digital marketing/IT
support] services targeting SMEs in [country]. Cite the type of source for
each claim (government stat, industry report, vendor site) and flag any
claim you could not source."
```
```
"Here are 30 raw forum/review excerpts from SME owners discussing
[bookkeeping/compliance/marketing] vendors [paste text]. Extract the 8 most
frequently repeated pain points, grouped by theme, with a representative
paraphrase for each — do not quote verbatim."
```

**Agent workflows:** A research agent can chain: (1) pull government SME/business-registration statistics → (2) search and summarize the top competitor sites in a category → (3) pull recent regulatory-change news → (4) assemble a structured draft brief in the format below → (5) flag every unsourced or low-confidence claim for human verification before the brief is marked complete.

**RAG / vector database considerations:** Once more than 2–3 markets are active, storing prior research briefs in a vector store lets later stages (ICP, persona, competitor research) query "what do we already know about UK SME compliance pain points" instead of re-researching. Not essential at 1–5 markets; becomes valuable at 10+.

**LLM recommendations:** Frontier reasoning models are worth it here because market-sizing and regulatory synthesis require weighing conflicting sources and flagging uncertainty correctly — a cheap model that confidently invents a TAM number is worse than no number. Use a capable model with web search enabled and require inline sourcing.

**Automation opportunities:** See [automation.md](automation.md) for scheduled refresh patterns (quarterly regulatory scan, competitor pricing re-check).

---

## 8. Data Structure

### Market Research Brief — mandatory sections (per geography)
`Market Overview` · `Market Size (TAM/SAM/SOM)` · `Service Demand Table` · `Target Segments (Primary/Secondary)` · `Competitive Landscape` · `Regulatory Environment` · `Buying Behavior` · `Go-to-Market Notes` · `Cross-Market Score`

### JSON schema (for storing structured briefs)
```json
{
  "market_id": "string (e.g. IN, US, UK, UAE, AU)",
  "market_name": "string",
  "last_updated": "ISO 8601 date",
  "market_size": {"tam_note": "string", "sam_note": "string", "som_note": "string"},
  "service_demand": [{"service": "string", "demand_level": "very_high|high|medium|low", "notes": "string"}],
  "target_segments": {"primary": ["string"], "secondary": ["string"]},
  "competitors": [{"type": "string", "strengths": "string", "weaknesses": "string"}],
  "regulatory_drivers": ["string"],
  "buying_behavior_notes": "string",
  "priority_score": {"size": "string", "price_sensitivity": "string", "compliance_complexity": "string", "trust_threshold": "string", "best_channel": "string"},
  "status": "draft|complete|needs_refresh",
  "source_confidence": "sourced|estimated|unverified"
}
```

### Validation rules
- Every quantitative claim (TAM figures, SME counts, percentages) must carry a source type (government stat, industry report, vendor site) or be explicitly marked "estimated — unverified"
- A market brief cannot move to Stage 02 (ICP Definition) until Service Demand, Target Segments, and Competitive Landscape sections are filled
- Briefs older than 2 quarters are flagged `needs_refresh`, not treated as current

### Naming conventions
- Market ID uses ISO-style short codes (`IN`, `US`, `UK`, `UAE`, `AU`) for consistent cross-referencing in CRM/segmentation fields downstream

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates before a brief is marked complete:
- [ ] Market size section has at least one sourced figure, not only estimates
- [ ] Service demand table covers every service line the business currently sells into that market
- [ ] At least 3 named competitor types/companies documented
- [ ] Regulatory drivers section is present even if "none identified"
- [ ] Cross-market score filled so the market can be ranked against others

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Time to first-draft brief (AI-assisted) | < 1 day per market | Human review/sourcing pass adds 1-2 days |
| Source-confidence ratio | > 70% of quantitative claims sourced | Remainder must be explicitly flagged estimated |
| Brief refresh cadence | Every 2 quarters minimum | Faster in fast-changing regulatory markets (e.g. UAE post-CT rollout) |
| Markets with complete briefs | 100% of active outreach geographies | No market should be actively pursued in Stage 06+ without a brief |

---

## 11. Templates

See [templates.md](templates.md) for the market brief template, TAM/SAM/SOM worksheet, and competitor scan table.

---

## 12. Resources

See [resources.md](resources.md) (source library) and [tools.md](tools.md) (research tool library).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** _none — this is the first stage_
- **Next stage:** [02 ICP Definition](../02 ICP Definition/README.md) — narrows the segments identified here into a specific ideal customer profile
- **Also feeds:** [03 Buyer Persona](../03 Buyer Persona/README.md), [04 Competitor Research](../04 Competitor Research/README.md), [05 Lead Source Selection](../05 Lead Source Selection/README.md)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using Nivy's existing market research documentation (India market research, International US/UK/UAE/Australia market research, and the broader Nivy Empires market research brief covering TAM/SAM/SOM, Porter's Five Forces, and customer personas), generalized here for the multi-vertical, multi-market knowledge base. Figures are approximate as of the source docs' last update (May 2026) and should be re-verified before operational use, per the plan's constraint on unverified pricing/market data.
