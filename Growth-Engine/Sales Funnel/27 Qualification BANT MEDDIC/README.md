# 27 Qualification BANT MEDDIC

> **Stage 27 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 5, Session 7). Batch 5 complete — Stages 22-27 now at pilot depth.

---

## Navigation

- ⬅ Previous stage: [26 Objection Handling](../26 Objection Handling/README.md)
- ➡ Next stage: [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Apply a deeper, conversation-based qualification framework (BANT or MEDDIC) once a contact has replied and shown interest, to confirm real opportunity fit before investing further sales time — distinct from Stage 11's earlier, data-driven lead-scoring pass.

**Purpose:** Stage 11 scores a lead's fit *before* any conversation happens, using firmographic and enrichment signals. This stage qualifies the *opportunity* once a real conversation is underway — Budget, Authority, Need, Timeline (BANT) or the more sales-process-oriented Metrics, Economic Buyer, Decision Criteria, Decision Process, Identify Pain, Champion (MEDDIC) — because a contact can be a perfect ICP match on paper and still not be a real near-term opportunity once you actually talk to them.

**Inputs:**
- Interested reply or booked discovery call (Stage 25/28)
- Stage 11 lead score as prior context, not a substitute for conversation-based qualification
- Discovery call notes/transcript (Stage 29) where qualification questions are actually asked

**Outputs:**
- A completed BANT or MEDDIC assessment per opportunity, logged in CRM
- A qualified/not-yet-qualified/disqualified decision with reasoning
- Qualified opportunities progressed to Stage 30 (Proposal), not-yet-qualified ones routed to further nurture

**Expected Result:** Sales time is spent on real opportunities, not on contacts who look good on paper but lack budget, authority, urgent need, or a realistic timeline — reducing wasted proposal effort and pipeline that never closes.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **27A** Framework Selection | Choosing BANT (simpler, faster) vs. MEDDIC (deeper, better for complex/enterprise deals) per segment |
| **27B** BANT Assessment | Budget, Authority, Need, Timeline questions and scoring |
| **27C** MEDDIC Assessment | Metrics, Economic Buyer, Decision Criteria, Decision Process, Identify Pain, Champion questions and scoring |
| **27D** Qualification Question Bank | Specific questions mapped to each framework element |
| **27E** Qualification Decision Rules | What combination of answers means Qualified / Not-Yet-Qualified / Disqualified |
| **27F** CRM Logging | Recording the assessment against the opportunity record |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for qualification-tracking tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Summarizing a discovery call transcript into a first-pass BANT/MEDDIC assessment for a rep to confirm/correct
- Flagging which framework elements weren't clearly addressed in a call, so the rep knows what to follow up on

**Prompt examples:**
```
"Here is a discovery call transcript: [paste]. Summarize what was learned
about Budget, Authority, Need, and Timeline. Flag any element that wasn't
clearly addressed."
```

**Agent workflows:** Not typically automated end-to-end — qualification depends on a live conversation. An agent can pre-fill a BANT/MEDDIC assessment draft from call notes/transcript for rep review, but the qualification decision itself is a human sales judgment call.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for transcript summarization and gap-flagging.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Qualification assessment fields (mandatory)
`Opportunity ID` · `Framework Used` (BANT/MEDDIC) · `Assessment Fields` (framework-dependent) · `Decision` (Qualified/Not-Yet-Qualified/Disqualified) · `Assessed Date` · `Assessed By`

### JSON schema (BANT example)
```json
{
  "opportunity_id": "string",
  "framework_used": "BANT",
  "budget": "confirmed|unclear|no_budget",
  "authority": "decision_maker|influencer|unknown",
  "need": "urgent|moderate|unclear",
  "timeline": "string",
  "decision": "qualified|not_yet_qualified|disqualified",
  "assessed_date": "ISO 8601 date",
  "assessed_by": "string"
}
```

### Validation rules
- No opportunity progresses to Stage 30 (Proposal) without a completed qualification assessment on file
- `Disqualified` opportunities require a documented reason, not a blank field
- Framework choice (BANT vs. MEDDIC) should be consistent within a segment, not switched ad hoc per opportunity

### Naming conventions
- Field names for BANT/MEDDIC follow each framework's standard terminology, not invented shorthand, so the data stays interpretable by any rep or future tool integration

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every opportunity has a completed qualification assessment before a proposal is sent (Stage 30)
- [ ] Disqualified opportunities carry a documented reason
- [ ] Framework used is consistent per segment, per Stage 27A's selection guidance

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of booked calls resulting in a completed qualification assessment | 100% | No opportunity should skip this step |
| Qualified-to-proposal conversion rate | Track and trend | Validates whether the qualification bar is set correctly |
| Qualified-to-closed-won rate | Track and trend | The ultimate test of whether qualification criteria predict real deals |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [26 Objection Handling](../26 Objection Handling/README.md)
- **Next stage:** [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)
- **Related:** [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md) (pre-conversation scoring vs. this stage's post-conversation qualification)
- **Feeds:** [29 Discovery Call Execution](../29 Discovery Call Execution/README.md), [30 Proposal Development](../30 Proposal Development/README.md)

> **Source note:** No internal doc used the BANT or MEDDIC framework names directly by the time of writing; this stage was built from the internal "Lead Qualification Framework" and "Lead Qualification" docs in this repo's Growth Engine folder (which define ICP-match scoring criteria, closer to Stage 11's role) mapped onto the standard, widely-used BANT/MEDDIC frameworks named in this stage's title, since those frameworks are industry-standard rather than company-proprietary. The BANT/MEDDIC element definitions themselves are standard sales methodology, not sourced from the internal docs.

[⬅ Back to README](README.md)
