# 30 Needs Analysis

> **Stage 30 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 8).

---

## Navigation

- ⬅ Previous stage: [29 Discovery Call Execution](../29 Discovery Call Execution/README.md)
- ➡ Next stage: [31 Solution Mapping](../31 Solution Mapping/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Take the Problem/Implication/Need-Payoff findings surfaced on the discovery call (Stage 29) and structure them into a documented needs analysis — a clear, written statement of the prospect's priority problems, ranked by cost/urgency, that becomes the direct input to solution mapping (Stage 31) and the proposal (Stage 33).

**Purpose:** A discovery call surfaces pain conversationally, in real time, and often across several loosely connected threads. Left as raw call notes, that information is hard to act on precisely — a rep drafting a proposal from memory or a messy notes doc tends to either miss the prospect's actual priority or propose a generic package that doesn't map cleanly to what was said. This stage exists to turn the conversation into a structured document before moving to solution design, so the eventual proposal demonstrably answers what the prospect actually said, in their own words.

**Inputs:**
- Discovery call notes and key quotes (Stage 29)
- BANT/MEDDIC qualification assessment (Stage 27)
- Any additional follow-up clarification gathered after the call

**Outputs:**
- A structured needs-analysis document per opportunity: ranked problems, implications, desired outcomes, and the prospect's own language for each
- Direct input to Stage 31 Solution Mapping

**Expected Result:** Every proposal (Stage 33) can be traced back to a specific, documented problem statement in the prospect's own words — not a generic pitch loosely adapted from a call the rep half-remembers.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **30A** Problem Extraction | Pulling every distinct problem mentioned on the call into a list |
| **30B** Problem Ranking | Ordering by stated urgency/cost, using the prospect's own implication answers |
| **30C** Desired Outcome Mapping | Recording the need-payoff answer for each ranked problem |
| **30D** Gap Identification | Flagging where the call didn't fully surface enough detail to design a solution confidently |
| **30E** Follow-Up Clarification | A short clarifying message/call if a gap is significant enough to warrant it |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for documentation/note-structuring tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Structuring raw call notes/transcript into a ranked problem list with the prospect's own quotes attached
- Flagging gaps where a problem was mentioned but its implication/desired outcome wasn't fully explored

**Prompt examples:**
```
"Here are my discovery call notes: [paste]. Extract every distinct
problem mentioned, rank by stated urgency/cost, and attach the
prospect's own words for each where available."
```
```
"Review this needs-analysis draft: [paste]. Flag any problem that's
missing a clear desired-outcome statement."
```

**Agent workflows:** An agent can auto-draft the structured needs-analysis document immediately after a call from the transcript/notes (feeding directly from Stage 29's post-call automation), but a rep should review it before it's used to design a solution — AI-drawn problem rankings can miss conversational nuance a human caught live.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for structuring and gap-flagging.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Needs analysis fields (mandatory)
`Opportunity ID` · `Problem List` (ranked) · `Implication per Problem` · `Desired Outcome per Problem` · `Gaps Identified` · `Status` (Draft/Reviewed/Finalized)

### JSON schema
```json
{
  "opportunity_id": "string",
  "problems": [
    {"rank": 1, "problem": "string", "implication": "string", "desired_outcome": "string", "quote": "string"}
  ],
  "gaps_identified": ["string"],
  "status": "draft|reviewed|finalized"
}
```

### Validation rules
- No opportunity proceeds to Stage 31 Solution Mapping without a `Finalized` needs-analysis document
- Every ranked problem must have a corresponding desired-outcome entry — a problem without one is a flagged gap, not silently dropped
- Rankings should be traceable to something the prospect actually said (implication answers), not the rep's assumption

### Naming conventions
- Problem entries carry a stable rank order matching the priority used downstream in Stage 31/33, so the proposal structure mirrors this document directly

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every problem traceable to something the prospect actually said
- [ ] Every ranked problem has a desired-outcome entry or a flagged gap
- [ ] Document reviewed and finalized before Stage 31 begins

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of proposals traceable to a finalized needs analysis | 100% | Hard QC gate for proposal quality |
| Gap-clarification follow-up rate | Track and trend | High rate may indicate discovery calls aren't probing deep enough (Stage 29) |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [29 Discovery Call Execution](../29 Discovery Call Execution/README.md)
- **Next stage:** [31 Solution Mapping](../31 Solution Mapping/README.md)
- **Feeds:** [33 Proposal Creation](../33 Proposal Creation/README.md)

> **Source note:** No internal doc treats needs analysis as a standalone documentation step separate from the discovery call itself; this stage was synthesized from the Problem/Implication/Need-Payoff structure already present in the internal Discovery Call Script (SPIN Framework), formalized into a discrete documentation stage that sits between the call (Stage 29) and solution design (Stage 31).

[⬅ Back to README](README.md)
