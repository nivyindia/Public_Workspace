# 32 Demo and Presentation

> **Stage 32 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 8).

---

## Navigation

- ⬅ Previous stage: [31 Solution Mapping](../31 Solution Mapping/README.md)
- ➡ Next stage: [33 Proposal Creation](../33 Proposal Creation/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Present the mapped solution (Stage 31) back to the prospect — as a live walkthrough, a working process demo, or a short deck — in a way that visibly connects each recommended deliverable to the specific problem it addresses, before the formal proposal document is sent.

**Purpose:** For a service business like this funnel's VA/agency model, "demo" doesn't mean a software product walkthrough — it means making the proposed solution tangible: showing how the engagement would actually work (onboarding process, communication cadence, example deliverables, a relevant case study walkthrough) so the prospect isn't buying on a verbal description alone. This stage is optional in scope and depth depending on deal size — a straightforward standard-package opportunity may fold this into the tail end of the discovery call (Stage 29's Present & Close), while a larger or customized opportunity may warrant its own dedicated follow-up session.

**Inputs:**
- Approved solution map (Stage 31)
- Case studies and proof points matched in Stage 31
- Any process walkthrough materials (onboarding steps, example deliverables, sample reports)

**Outputs:**
- A presentation (live walkthrough or short deck) that maps each deliverable to the prospect's stated problem
- Prospect questions/reactions captured, feeding final adjustments to the proposal (Stage 33)
- A clear decision on whether this step is folded into the discovery call or run as a separate session, logged per opportunity

**Expected Result:** The prospect leaves the presentation step able to picture concretely how working together would look, with any remaining doubts identified before the formal proposal is drafted — not surprised by scope or process for the first time when reading the proposal document.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **32A** Fold-In vs. Dedicated-Session Decision | Whether this happens at the tail of the discovery call or as its own session, based on deal complexity |
| **32B** Presentation Structure | Problem → Solution → Process → Proof, mirroring the solution map |
| **32C** Process Walkthrough | Onboarding steps, communication cadence, example deliverables — making the engagement tangible |
| **32D** Proof Point Delivery | Weaving in the matched case studies (Stage 31) naturally, not as a separate slide dump |
| **32E** Objection Surfacing | Actively inviting questions/pushback before the proposal is sent, so it can be addressed proactively |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for presentation/deck tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting a short presentation/deck outline from the approved solution map, structured as Problem → Solution → Process → Proof
- Summarizing prospect questions/reactions from the session into notes that inform final proposal adjustments

**Prompt examples:**
```
"Here is an approved solution map: [paste]. Draft a 5-slide presentation
outline: Problem, Solution, Process, Proof, Next Steps."
```

**Agent workflows:** Not automated end-to-end — the presentation itself is typically a live, human-delivered conversation. An agent can generate the deck/outline draft from the solution map, but delivery and handling live questions remain a human skill.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for outline drafting.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Presentation session fields (mandatory)
`Opportunity ID` · `Session Type` (Folded-into-call/Dedicated-session) · `Date` · `Questions Raised` · `Adjustments Needed for Proposal`

### JSON schema
```json
{
  "opportunity_id": "string",
  "session_type": "folded_into_call|dedicated_session",
  "date": "ISO 8601 date",
  "questions_raised": ["string"],
  "adjustments_needed": ["string"]
}
```

### Validation rules
- The decision to fold this into the discovery call vs. run a dedicated session must be documented, not defaulted inconsistently
- Any adjustment needed for the proposal (surfaced during this stage) must be resolved before Stage 33 finalizes the document

### Naming conventions
- `Session Type` is a fixed enum so reporting on deal complexity (how often a dedicated session is needed) stays consistent

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Presentation content mirrors the approved solution map, not an ad hoc pitch
- [ ] Questions/objections raised during this step are logged and resolved before the proposal is sent
- [ ] Fold-in vs. dedicated-session decision documented with reasoning

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of opportunities requiring a dedicated session vs. fold-in | Track and trend | Signals typical deal complexity for the pipeline |
| Objection-surfaced-here vs. surfaced-after-proposal rate | Track and trend, favor "surfaced here" | Catching objections before the proposal is sent is cheaper than after |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [31 Solution Mapping](../31 Solution Mapping/README.md)
- **Next stage:** [33 Proposal Creation](../33 Proposal Creation/README.md)
- **Depends on:** [31 Solution Mapping](../31 Solution Mapping/README.md)
- **Feeds:** [33 Proposal Creation](../33 Proposal Creation/README.md)

> **Source note:** No dedicated internal demo/presentation SOP was found in this repo's source material — this business sells VA/agency services, not software, so no "product demo" material exists. This stage was built by generalizing the Present & Close structure already used in Stage 29's discovery-call script, extended into a standalone step for opportunities complex enough to warrant a dedicated session beyond what fits in the discovery call's closing minutes.

[⬅ Back to README](README.md)
