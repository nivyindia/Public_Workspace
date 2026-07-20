# 31 Solution Mapping

> **Stage 31 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 8).

---

## Navigation

- ⬅ Previous stage: [30 Needs Analysis](../30 Needs Analysis/README.md)
- ➡ Next stage: [32 Demo and Presentation](../32 Demo and Presentation/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Map each ranked problem from the finalized needs analysis (Stage 30) to a specific service package, deliverable set, and expected outcome — producing the solution design that Stage 32's presentation and Stage 33's proposal are built directly from.

**Purpose:** The discovery call's closing recommendation ("here's what I think would work best") is made live, under time pressure, from memory. This stage is where that recommendation gets checked and refined with the full needs-analysis document in hand — confirming the right package genuinely maps to the prospect's ranked problems rather than defaulting to whichever package the rep is most comfortable pitching. It also catches cases where a standard package doesn't fully fit and a customized scope is genuinely warranted.

**Inputs:**
- Finalized needs-analysis document (Stage 30)
- Current service package/pricing catalog (feeds Stage 33)
- Case study library, matched to the prospect's industry/problem type

**Outputs:**
- A solution map: each ranked problem paired with the specific deliverable(s) that address it and the expected outcome
- A package recommendation (standard or customized) with reasoning tied to the needs analysis
- Matched case studies/proof points to reference in Stage 32/33

**Expected Result:** Every proposal recommends a package because it's demonstrably the right fit for the documented problems — not because it's the default pitch — and the prospect can see the direct line from what they said to what's being proposed.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **31A** Problem-to-Deliverable Mapping | Pairing each ranked problem with specific deliverables that address it |
| **31B** Package Fit Assessment | Standard package match vs. customization required |
| **31C** Outcome Statement Drafting | What result the prospect should expect, tied to their stated desired outcome |
| **31D** Case Study Matching | Selecting 2-3 relevant proof points from the case study library |
| **31E** Internal Review (for customized scope) | Sign-off before a non-standard solution is proposed |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for solution-mapping documentation tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Suggesting a first-pass package/deliverable match against the finalized needs-analysis document
- Pulling 2-3 relevant case studies from the library matched by industry/problem type

**Prompt examples:**
```
"Here is a finalized needs-analysis document: [paste] and our service
package catalog: [paste]. Suggest which package best fits, with
reasoning tied to each ranked problem."
```

**Agent workflows:** An agent can draft the solution map automatically from the finalized needs analysis and package catalog, but any customized (non-standard) scope recommendation should get human/internal review before being presented, since it may involve pricing or delivery commitments beyond the standard catalog.

**RAG / vector database considerations:** As the case study library grows, a simple retrieval setup helps match relevant proof points by industry/problem type; below a few dozen entries, manual/categorized lookup is sufficient.

**LLM recommendations:** Standard current-generation models are sufficient for drafting the solution map and case study matching.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Solution map fields (mandatory)
`Opportunity ID` · `Problem-Deliverable Pairs` · `Recommended Package` · `Customization Required` (boolean) · `Matched Case Studies` · `Status` (Draft/Reviewed/Approved)

### JSON schema
```json
{
  "opportunity_id": "string",
  "problem_deliverable_pairs": [
    {"problem_rank": 1, "deliverable": "string", "expected_outcome": "string"}
  ],
  "recommended_package": "string",
  "customization_required": false,
  "matched_case_studies": ["string"],
  "status": "draft|reviewed|approved"
}
```

### Validation rules
- Every ranked problem from Stage 30 has a corresponding deliverable in the solution map — no problem left unaddressed without explicit reasoning why
- Any `customization_required = true` solution map requires internal sign-off before moving to Stage 32/33
- Case studies referenced must genuinely match the prospect's industry/problem type, not generically reused across every proposal

### Naming conventions
- Package names match the canonical names in the current pricing catalog exactly, so Stage 33's proposal generation pulls consistent data

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every ranked problem addressed by a specific deliverable
- [ ] Customized scope has internal sign-off before proceeding
- [ ] Matched case studies are genuinely relevant, not generic filler

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of solution maps with every ranked problem addressed | 100% | Hard QC gate |
| Standard vs. customized package rate | Track and trend | High customization rate may indicate the standard catalog needs revisiting |
| Solution-map-to-closed-won rate | Track and trend | Validates whether the mapping process predicts real fit |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [30 Needs Analysis](../30 Needs Analysis/README.md)
- **Next stage:** [32 Demo and Presentation](../32 Demo and Presentation/README.md)
- **Depends on:** [30 Needs Analysis](../30 Needs Analysis/README.md)
- **Feeds:** [33 Proposal Creation](../33 Proposal Creation/README.md)

> **Source note:** No internal doc treats solution mapping as its own discrete step; this stage was synthesized to sit between Stage 30's needs analysis and Stage 33's proposal, using the "Section 2: Recommended Solution" structure already present in the internal "Proposal & Deal Closing SOP" as its foundation, and referencing the "Case Studies & Social Proof Library" doc found in this repo's Growth Engine folder for the case-study-matching sub-stage.

[⬅ Back to README](README.md)
