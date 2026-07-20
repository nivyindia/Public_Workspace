# 29 Discovery Call Execution

> **Stage 29 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 8).

---

## Navigation

- ⬅ Previous stage: [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)
- ➡ Next stage: [30 Needs Analysis](../30 Needs Analysis/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Run a structured 30-minute discovery call using the SPIN framework (Situation → Problem → Implication → Need-Payoff) that surfaces the prospect's real pain, has them articulate their own buying criteria, and ends with either a proposal commitment, a specific follow-up, or a clean disqualification.

**Purpose:** This is the highest-leverage single conversation in the funnel — every prior stage exists to earn this 30 minutes. A rep who pitches before understanding the prospect's situation sounds like every other salesperson and gets a "let me think about it." SPIN's discipline of asking before pitching, and having the prospect state the cost of inaction and the value of a solution *in their own words*, is what turns a discovery call into a genuine buying conversation rather than a sales pitch the prospect tolerates.

**Inputs:**
- Confirmed booking with a completed pre-call brief (Stage 28)
- The SPIN script and objection library (Stage 26)
- Pricing/package reference (feeds Stage 31/33)

**Outputs:**
- Completed call notes: pain points, budget signals, timeline, key quotes
- A BANT/MEDDIC qualification assessment (Stage 27) completed from the conversation
- A clear next action: proposal sent within 24 hours, a rebooked follow-up call, or a documented disqualification

**Expected Result:** Every discovery call ends with a specific next action, not an ambiguous "we'll be in touch" — and the rep walks away with the prospect's own words describing their pain and desired outcome, which becomes the backbone of the proposal (Stage 33).

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **29A** Warm Opening (Min 0-2) | Setting expectations, earning permission to ask questions first |
| **29B** Situation Questions (Min 2-10) | Understanding current setup — team, tools, existing solutions |
| **29C** Problem Questions (Min 10-18) | Surfacing pain — digging past the first, surface-level answer |
| **29D** Implication Questions (Min 18-22) | Helping the prospect feel the cost of not solving it |
| **29E** Need-Payoff Questions (Min 22-26) | Prospect describes the ideal outcome in their own words |
| **29F** Present & Close (Min 26-30) | Recommending ONE package, connecting it to their stated pain, closing question |
| **29G** Post-Call Actions | CRM update, notes, proposal timing, follow-up task |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for call/video and note-taking tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Transcribing and summarizing the call (where legally permitted) into structured notes and a first-pass BANT/MEDDIC draft (feeds Stage 27)
- Flagging which SPIN stage the conversation reached, in case a rep skipped ahead to pitching too early

**Prompt examples:**
```
"Here is a discovery call transcript: [paste]. Extract: stated pain
points, budget signals, timeline, and 2-3 direct quotes worth using in
the proposal."
```

**Agent workflows:** Not automated end-to-end — the call itself is a human conversation. Post-call, an agent can auto-populate CRM notes and the qualification draft from the transcript, but the rep should review and finalize before the proposal is drafted from it.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for transcript summarization. Recording/transcription must be confirmed legal in that market first (see Stage 18's consent considerations).

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Call outcome fields (mandatory)
`Opportunity ID` · `Call Date` · `Pain Points (notes)` · `Budget Signal` · `Timeline` · `Key Quotes` · `Outcome` (Proposal Committed/Follow-Up Rebooked/Disqualified) · `Deal Stage`

### JSON schema
```json
{
  "opportunity_id": "string",
  "call_date": "ISO 8601 date",
  "pain_points": "string",
  "budget_signal": "string",
  "timeline": "string",
  "key_quotes": ["string"],
  "outcome": "proposal_committed|follow_up_rebooked|disqualified",
  "deal_stage": "string"
}
```

### Validation rules
- Deal stage must be updated in CRM within 1 hour of the call ending
- A `proposal_committed` outcome requires the proposal to be sent within 24 hours (feeds Stage 33)
- A `follow_up_rebooked` outcome requires a specific date/time, not an open-ended "check back later"

### Naming conventions
- `Outcome` is a fixed enum so pipeline reporting on call-to-next-step conversion stays consistent across reps

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Rep asked situation/problem questions before pitching (SPIN order followed)
- [ ] Call ends with a specific, unambiguous next action
- [ ] CRM updated with notes within 1 hour of call end
- [ ] Proposal sent within 24 hours where committed

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Call-to-proposal-committed rate | Track and trend | Primary success metric for this stage |
| Same-day proposal-send rate (of committed calls) | 100% within 24 hours | Momentum dies quickly after a good call |
| Post-call CRM update within 1 hour | 100% | Hard QC gate — protects data quality for every downstream stage |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)
- **Next stage:** [30 Needs Analysis](../30 Needs Analysis/README.md)
- **Also feeds:** [26 Objection Handling](../26 Objection Handling/README.md), [27 Qualification BANT MEDDIC](../27 Qualification BANT MEDDIC/README.md), [33 Proposal Creation](../33 Proposal Creation/README.md)

> **Source note:** Built directly from the internal "Discovery Call Script — 30-Min SPIN Framework" doc in this repo's Growth Engine folder, which is already a complete, minute-by-minute script including common mistakes to avoid and closing phrases. Package/pricing figures referenced in the source script (e.g., specific rupee amounts) are illustrative and should be checked against current Stage 31/33 pricing before use.

[⬅ Back to README](README.md)
