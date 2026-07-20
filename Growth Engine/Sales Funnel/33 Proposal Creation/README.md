# 33 Proposal Creation

> **Stage 33 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 8). Batch 6 complete — Stages 28-33 now at pilot depth.

---

## Navigation

- ⬅ Previous stage: [32 Demo and Presentation](../32 Demo and Presentation/README.md)
- ➡ Next stage: [34 Pricing and Packaging](../34 Pricing and Packaging/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Produce and send a structured, professional proposal document — built directly from the approved solution map (Stage 31) — within 24 hours of the discovery call/presentation, and manage the send/follow-up/negotiation process through to a signed agreement.

**Purpose:** A proposal sent cold, without the discovery-call-to-solution-mapping context this funnel builds, becomes a price comparison document with no persuasive context — the single mistake this stage's source SOP most explicitly warns against. This stage exists to standardize the proposal's structure so every proposal demonstrably reflects what the prospect actually said (Stage 30) and what was mapped to address it (Stage 31), and to standardize the send, follow-up, and negotiation-handling process so deals don't stall from a slow or generic post-send process.

**Inputs:**
- Approved solution map (Stage 31) and any adjustments surfaced in Stage 32
- Current pricing/packaging catalog (Stage 34)
- Case studies/testimonials matched in Stage 31

**Outputs:**
- A sent proposal document (PDF or tracked quote tool) within 24 hours of the qualifying call
- A documented follow-up cadence if no response
- A negotiation-handling record and, on agreement, a signed contract (feeds Stage 35)

**Expected Result:** Proposals go out fast, are structured consistently, and are followed up on a defined cadence rather than sent-and-forgotten — maximizing the conversion of everything the earlier funnel stages built toward a signed deal.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **33A** Proposal Structure | Executive Summary, Recommended Solution, Pricing, Timeline & Onboarding, Why Us, Next Steps |
| **33B** Send Timing & Format | Within 24 hours, professional PDF or tracked quote tool, personal email note |
| **33C** Follow-Up Cadence | Day 3, Day 7, Day 12 follow-ups if no response |
| **33D** Negotiation Handling | Standard responses to common asks (discount, phased start, "comparing others") |
| **33E** Discount Authorization | Maximum discretionary discount before requiring founder/leadership approval |
| **33F** Contract & Sign-Off | Agreement structure, e-signature, CRM update to Closed Won, onboarding trigger |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for proposal/e-signature tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting the proposal document's narrative sections (Executive Summary, Recommended Solution write-up) from the approved solution map, for human review before sending
- Drafting follow-up message variants for the Day 3/7/12 cadence

**Prompt examples:**
```
"Here is an approved solution map: [paste]. Draft the Executive Summary
and Recommended Solution sections of a proposal, in a confident,
non-generic tone, referencing the prospect's specific stated problems."
```

**Agent workflows:** An agent can generate a full proposal draft from the approved solution map and current pricing catalog immediately after the qualifying call, but a human should review pricing, terms, and tone before it's sent — this document represents a real commercial offer and pricing errors here are costly. Follow-up sends on the standard cadence can run automatically once the initial proposal is confirmed sent.

**RAG / vector database considerations:** Not required at this stage's scale; the solution map and pricing catalog are sufficient structured input.

**LLM recommendations:** Standard current-generation models are sufficient for drafting; human review is mandatory before send given the commercial and legal weight of this document.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Proposal fields (mandatory)
`Opportunity ID` · `Proposal Sent Date` · `Proposal Value` · `Status` (Draft/Sent/Viewed/Negotiating/Signed/Declined/Expired) · `Follow-Up Step` · `Discount Applied` (%) · `Discount Approved By`

### JSON schema
```json
{
  "opportunity_id": "string",
  "proposal_sent_date": "ISO 8601 date",
  "proposal_value": 0.0,
  "status": "draft|sent|viewed|negotiating|signed|declined|expired",
  "follow_up_step": 0,
  "discount_applied_pct": 0.0,
  "discount_approved_by": "string|null"
}
```

### Validation rules
- No proposal is drafted without an approved solution map (Stage 31) as its source
- Proposal must be sent within 24 hours of the qualifying call/presentation
- Any discount above the standard discretionary threshold (10%, per source SOP — verify current policy) requires a named approver before the revised proposal is sent
- Proposal validity window (typically 14 days) must be stated in the document itself

### Naming conventions
- Status values are a fixed enum so pipeline reporting on proposal-stage conversion stays consistent

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Proposal sent within 24 hours of the qualifying call
- [ ] Proposal content traceable to the approved solution map, not generic boilerplate
- [ ] Follow-up cadence followed if no response
- [ ] Any discount above threshold has a named approver on record

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Proposal-sent-within-24-hours rate | 100% | Momentum dies quickly past this window (Stage 29) |
| Proposal-to-signed rate | Track and trend | Primary success metric for this stage |
| Average discount applied | Track and trend, flag if trending above threshold | Signals whether pricing/positioning needs review |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [32 Demo and Presentation](../32 Demo and Presentation/README.md)
- **Next stage:** [34 Pricing and Packaging](../34 Pricing and Packaging/README.md)
- **Depends on:** [31 Solution Mapping](../31 Solution Mapping/README.md), [26 Objection Handling](../26 Objection Handling/README.md)
- **Feeds:** [35 Negotiation](../35 Negotiation/README.md), [36 Contract and Legal](../36 Contract and Legal/README.md)

> **Source note:** Built directly from the internal "Proposal & Deal Closing SOP" doc in this repo's Growth Engine folder, which is already a complete SOP covering proposal structure, tools, send/follow-up timing, negotiation-handling scripts, and contract/sign-off steps.

[⬅ Back to README](README.md)
