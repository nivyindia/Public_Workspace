# 04 Competitor Research

> **Stage 4 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 1, Session 3).

---

## Navigation

- ⬅ Previous stage: [03 Buyer Persona](../03 Buyer Persona/README.md)
- ➡ Next stage: [05 Lead Source Selection](../05 Lead Source Selection/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Build and maintain a structured picture of who else is competing for each ICP's budget — across local, national, niche-specialist, freelancer, and premium-agency competitor categories — covering their positioning, pricing signals, strengths, and weaknesses.

**Purpose:** Every objection Sales hears in Stage 26 ("why not just use X") and every positioning claim in outreach copy (Stage 22) is stronger when grounded in specific, current competitor knowledge rather than assumption. Competitor research also directly informs Stage 01's competitive-landscape section and Stage 11's win/loss context.

**Inputs:**
- Market Research brief (Stage 01) — competitor categories already identified at a high level
- ICP profiles (Stage 02) — which competitors actually compete for each specific ICP's budget
- Public competitor websites, pricing pages, review sites, ad libraries

**Outputs:**
- A competitor tracking sheet (minimum 10 competitors: 3 local, 3 national, 2 niche-specialist, 2 high-end) with the 12-section audit per competitor
- A competitor-positioning response guide (how to respond when a prospect brings up a specific competitor type)
- A monthly/weekly competitor-monitoring cadence

**Expected Result:** Sales and outreach teams have a current, specific answer for "why not just use [competitor]" for every competitor category an ICP is likely to compare against.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **4A** Competitor Category Mapping | Identify the 5 competitor categories: local, national, niche-specialist, freelancer, high-end premium |
| **4B** Competitor Shortlisting | Select at least 10 competitors across categories (3 local / 3 national / 2 niche / 2 high-end) to track |
| **4C** Company Overview Audit | Basic firmographic profile per competitor — size, years active, geography served |
| **4D** Services & Pricing Audit | What they sell and at what price point (marked "approximate, verify") |
| **4E** Digital Footprint Audit | Website quality, SEO performance, social media presence, paid ads strategy |
| **4F** Reputation Audit | Reviews (Google, Trustpilot, Clutch, G2) — what clients praise and complain about |
| **4G** Positioning & Messaging Audit | How they position themselves, their stated USP, their target audience framing |
| **4H** Weakness-to-Opportunity Mapping | Convert each documented weakness into a specific positioning angle for Nivy |
| **4I** Positioning Response Scripting | Draft the "why not just use X" response for each competitor category, per the universal positioning-move pattern |
| **4J** Monitoring Cadence Setup | Establish weekly/monthly competitor-monitoring routine so the audit doesn't go stale |

---

## 3. Complete Methods

Full breakdown — manual audit, tool-assisted, AI-assisted competitor research methods — is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

Full competitor-analysis tool categories (social, SEO, ads, content, design, reputation) are in **[resources.md](resources.md)**.

---

## 5. Complete Tool Library

Full per-tool breakdown is in **[tools.md](tools.md)**.

---

## 6. Automation

See [automation.md](automation.md) for the weekly/monthly monitoring workflow.

---

## 7. AI Section

**How AI can help:**
- Synthesizing a competitor's website, pricing page, and review profile into a structured 12-section audit entry
- Drafting positioning-response scripts using the "acknowledge strength, then pivot to USP" pattern
- Summarizing review-site sentiment (what's praised vs. complained about) from bulk review text
- Monitoring for competitor pricing/positioning changes and flagging what changed and why it might matter

**Prompt examples:**
```
"Here is competitor [name]'s website homepage and pricing page content
[paste]. Summarize their positioning, target audience, service packaging,
and pricing (mark pricing 'approximate, verify against current site').
Do not reproduce their marketing copy verbatim — paraphrase."
```
```
"Given this competitor weakness: [paste, e.g. 'slow turnaround, junior
staff on accounts']. Draft a positioning response using the pattern:
acknowledge their strength, pivot to our USP, tie to a specific client
situation. Keep it under 40 words."
```

**Agent workflows:** An agent can chain: (1) fetch competitor site + pricing page → (2) fetch review-site profile → (3) summarize into the 12-section audit → (4) flag pricing/positioning changes vs. the last recorded audit → (5) route to a human for the positioning-response draft, which benefits from strategic judgment an agent shouldn't make unsupervised.

**RAG / vector database considerations:** Useful once tracking more than ~15-20 competitors — lets sales/copy teams query "what's our response to [competitor]" instantly instead of searching a spreadsheet.

**LLM recommendations:** A general-purpose model with web search/fetch is sufficient for audit synthesis; positioning-response scripting benefits from human strategic review before being put in front of prospects, regardless of model capability.

**Automation opportunities:** See [automation.md](automation.md) for the weekly (20 min) and monthly (40 min) monitoring cadence.

---

## 8. Data Structure

### Competitor Audit — 12 mandatory sections (per competitor)
`Company Overview` · `Services & Pricing` · `Target Industries` · `Website Quality` · `SEO Performance` · `Blog Content Strategy` · `Social Media Performance` · `Branding Quality` · `Paid Ads Strategy` · `Portfolio Quality` · `Client Testimonials` · `Sales Funnel & CTAs`

### JSON schema
```json
{
  "competitor_id": "string",
  "name": "string",
  "category": "local|national|niche_specialist|freelancer|high_end",
  "geography": ["string"],
  "services": ["string"],
  "pricing_signal": "string (approximate, verify)",
  "strengths": ["string"],
  "weaknesses": ["string"],
  "positioning_statement": "string",
  "our_response": "string",
  "last_reviewed": "ISO 8601 date",
  "source_confidence": "sourced|estimated"
}
```

### Validation rules
- Pricing figures must be marked "approximate, verify current" — never stated as confirmed fact
- No fabricated client counts, testimonials, or case studies attributed to a competitor — if it can't be found on their public site, it's marked "not publicly disclosed," not invented
- Every tracked competitor must map to at least one active ICP (Stage 02) — competitors irrelevant to any ICP don't need tracking

### Naming conventions
- Category field uses the fixed 5-category enum (`local`, `national`, `niche_specialist`, `freelancer`, `high_end`) for consistent filtering

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] At least 10 competitors tracked across the 5-category mix (3 local / 3 national / 2 niche / 2 high-end)
- [ ] Every competitor has at least one documented weakness converted into a positioning response
- [ ] No fabricated pricing, client counts, or testimonials
- [ ] Audit reviewed/refreshed at least monthly per the monitoring cadence

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Competitors tracked | ≥ 10 (mix per category) | Per the shortlisting standard |
| Positioning responses drafted | 1 per competitor category minimum | Covers the "why not X" objection pattern |
| Audit refresh cadence | Weekly light-touch, monthly full audit | Per [automation.md](automation.md) |
| Sales team confidence in competitor responses (informal survey) | High | Qualitative check that the audit is actually useful in live calls |

---

## 11. Templates

See [templates.md](templates.md) for the competitor audit template and the positioning-response template.

---

## 12. Resources

See [resources.md](resources.md) (competitor-analysis tool categories) and [tools.md](tools.md) (per-tool detail).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [03 Buyer Persona](../03 Buyer Persona/README.md)
- **Next stage:** [05 Lead Source Selection](../05 Lead Source Selection/README.md)
- **Also feeds:** [01 Market Research](../01 Market Research/README.md) (competitive landscape section), [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md), [26 Objection Handling](../26 Objection Handling/README.md)
- **Automation file:** [automation.md](automation.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using Nivy's existing "Competitor Categories You Must Track" system (5-category framework, 12-section audit, weekly/monthly monitoring workflow, and tool bundle for a digital agency), and the "Competitor Positioning" playbook (competitor-type response scripts using the acknowledge-then-pivot pattern). Both generalized here for the broader multi-vertical knowledge base. Pricing figures throughout are approximate and should be re-verified before use.
