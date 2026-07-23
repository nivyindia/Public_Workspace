# 02 ICP Definition

> **Stage 2 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 1, Session 2).

---

## Navigation

- ⬅ Previous stage: [01 Market Research](../01 Market Research/README.md)
- ➡ Next stage: [03 Buyer Persona](../03 Buyer Persona/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Convert the market and segment signals from Stage 01 into a small set (typically 3-5) of named, criteria-bound Ideal Client Profiles — plus an explicit Negative ICP of who is deliberately excluded — that every later stage can target against.

**Purpose:** Without a written ICP, every downstream stage silently defaults to "anyone who might buy," which dilutes lead quality (Stage 06), wastes outreach volume (Stages 16-21), and produces sales conversations that don't match the pitch to the actual buyer (Stages 28-37). The ICP is the single filter every lead is checked against.

**Inputs:**
- Market Research brief(s) from Stage 01 — target segments, competitive landscape, buying behavior
- Existing client/revenue data where available (who already buys, at what price, with what satisfaction)
- Service catalog and pricing (an ICP must be able to afford and need what's actually sold)

**Outputs:**
- A written ICP document: one profile card per ICP (role, company size, revenue, geography, industry, pain points, goals, buying triggers, where to find them, messaging angle)
- A Negative ICP table (who is explicitly out of scope and why)
- An ICP summary table for quick reference by outreach/sales teams

**Expected Result:** Every subsequent stage (persona, competitor research, lead source selection, extraction, scoring, outreach copy) can cite a specific named ICP rather than a vague "our target market" description.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **2A** Firmographic Criteria | Define company size, revenue band, industry, geography for each candidate ICP |
| **2B** Role / Buyer Title Criteria | Define the job title(s)/role(s) who hold budget and decision authority for the service |
| **2C** Pain Point Mapping | List the top pain points each ICP experiences that the service category solves |
| **2D** Goals Mapping | List what each ICP is trying to achieve (the "after" state they're buying toward) |
| **2E** Buying Trigger Identification | Identify the events that push an ICP from passive to active buyer (funding raise, growth ceiling, burnout, referral) |
| **2F** Budget / Willingness-to-Pay Banding | Assign a realistic budget range per ICP based on market research and existing client data |
| **2G** Channel Mapping | Note where each ICP can be found/reached (feeds Stage 05 Lead Source Selection) |
| **2H** Messaging Angle Drafting | Draft one core message/hook per ICP that will seed persona and copywriting work later |
| **2I** Negative ICP Definition | Explicitly define who is NOT a fit and why, to prevent wasted outreach and bad-fit client risk |
| **2J** ICP Prioritization | Rank ICPs by size of opportunity, ease of reach, and strategic fit to decide funnel sequencing |

---

## 3. Complete Methods

Full breakdown of ICP-derivation methods (data-driven, interview-driven, competitor-inference, AI-assisted) is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

See [resources.md](resources.md) and [tools.md](tools.md) for ICP-validation and firmographic-lookup sources.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md) for ICP-fit scoring automation patterns that carry forward into Stage 11 (Lead Scoring).

---

## 7. AI Section

**How AI can help:**
- Synthesizing Stage 01 market research plus any existing client data into draft ICP profile cards
- Stress-testing a draft ICP by generating "would this lead qualify?" edge cases for human review
- Drafting the Negative ICP list by inverting the positive criteria and flagging edge cases (e.g. "borderline company size — how do we handle 6-person teams?")
- Generating ICP-fit scoring criteria that Stage 11 (Lead Scoring) can implement directly

**Prompt examples:**
```
"Using this market research brief [paste Stage 01 brief] and this list of our
current best clients [paste anonymized client list with size/revenue/industry],
draft 3-4 ICP profile cards in this format: Role, Company Size, Revenue,
Geography, Industry, Top Pain Points (5), Goals (4), Buying Triggers, Where
to Find Them, one messaging angle. Flag any profile where you had to guess
due to insufficient data."
```
```
"Given these 4 ICP profiles [paste], draft a Negative ICP table listing 5
types of prospect we should explicitly NOT pursue, with a one-line reason
for each grounded in the positive ICP criteria."
```

**Agent workflows:** An agent can pull Stage 01 brief + CRM client-list export → draft ICP cards → flag low-confidence sections → route to the founder/strategy owner for a single review-and-edit pass rather than a from-scratch write.

**RAG / vector database considerations:** Storing finalized ICP cards in a retrievable store lets every later stage (copywriting, qualification scripts, proposal templates) pull the exact current ICP language instead of paraphrasing from memory — reduces drift between what Stage 02 defines and what Stage 22 (Copywriting) actually writes.

**LLM recommendations:** A capable reasoning model is worth it for the initial synthesis and edge-case stress-testing; routine ICP-fit scoring against a finalized profile can run on a smaller/cheaper model once the rubric is set.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### ICP Profile Card — mandatory fields
`ICP Name/Label` · `Role/Title` · `Company Size` · `Revenue Band` · `Geography` · `Industry` · `Top Pain Points (list)` · `Goals (list)` · `Buying Triggers (list)` · `Budget Range` · `Where to Find Them` · `Messaging Angle`

### JSON schema
```json
{
  "icp_id": "string",
  "label": "string (e.g. 'Overwhelmed Founder')",
  "role_titles": ["string"],
  "company_size_min": "integer",
  "company_size_max": "integer",
  "revenue_band": "string",
  "geography": ["string"],
  "industry": ["string"],
  "pain_points": ["string"],
  "goals": ["string"],
  "buying_triggers": ["string"],
  "budget_range": "string",
  "channels": ["string"],
  "messaging_angle": "string",
  "priority_rank": "integer",
  "status": "draft|active|deprecated"
}
```

### Validation rules
- Every ICP must have at least 3 pain points and 2 goals before it's marked `active`
- Budget range must be grounded in either existing client data or Stage 01 market research — not invented
- An ICP with company-size or geography overlap with an existing ICP should be merged or explicitly differentiated, not left ambiguous

### Naming conventions
- ICP label is a short memorable name (e.g. "Overwhelmed Founder", not "ICP-1") so outreach/sales teams can reference it conversationally
- Negative ICP entries use the same table structure as positive ICPs, with a `Reason for Exclusion` column instead of pain points/goals

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] Every ICP has role, size, geography, pain points, goals, triggers, budget, and channel filled
- [ ] Negative ICP table exists with at least 3 explicit exclusions
- [ ] ICPs are mutually distinguishable — no two ICPs would be scored identically by Stage 11
- [ ] Messaging angle for each ICP is a single testable sentence, not a paragraph

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Number of active ICPs | 3-5 | Fewer than 3 under-segments; more than 5-6 fragments outreach effort |
| ICP-fit qualification accuracy (sales QC sample) | > 85% | Sampled from Stage 11/27 qualification outcomes |
| Time since last ICP review | < 1 quarter | ICPs should be revisited as market/client data accumulates |
| % of closed-won deals matching an active ICP | > 70% | Low percentage signals ICP drift from actual buyers |

---

## 11. Templates

See [templates.md](templates.md) for the ICP profile card template and the Negative ICP table template.

---

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [01 Market Research](../01 Market Research/README.md) — supplies segment and demand data this stage narrows into named ICPs
- **Next stage:** [03 Buyer Persona](../03 Buyer Persona/README.md) — adds psychographic depth (demographics, media habits, tone) to each ICP
- **Also feeds:** [05 Lead Source Selection](../05 Lead Source Selection/README.md), [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md), [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)
- **Automation file:** [automation.md](automation.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using Nivy's existing "Ideal Client Profile (ICP) — Full Document" (4 defined ICPs plus Negative ICP table, SD-02 Strategy & Intelligence, last updated May 2026), generalized here for the multi-vertical knowledge base structure. Budget figures are approximate and should be re-verified against current pricing and market conditions.
