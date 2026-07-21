# 38 Deal Desk and Approval Workflows

> **Stage 38 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7).

---

## Navigation

- ⬅ Previous stage: [37 Closing Techniques](../37 Closing Techniques/README.md)
- ➡ Next stage: [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Provide a controlled, logged approval path for any deal term that falls outside the standard pricing, payment terms, or scope published in Stage 34 — discounts, non-standard payment schedules, custom scope, or rush timelines — so exceptions are made deliberately by a named approver, not silently by whichever rep is closing the deal.

**Purpose:** Every sales team eventually faces the moment a prospect asks "can you do better on price / can we pay differently / can you skip that deliverable." Handled ad hoc, this creates margin leakage, inconsistent client expectations, and no audit trail for why one client got different terms than another. This stage exists to make the exception path visible, fast, and accountable — fast enough that it doesn't kill deal momentum, but logged well enough that leadership always knows what was approved, by whom, and why.

**Inputs:**
- A deal in Proposal Sent or Negotiation stage (Stage 33/35) where the prospect is asking for something outside standard terms
- The standard pricing/terms catalog (Stage 34) and standard payment terms (Stage 39) as the baseline being deviated from
- Context on why the deviation is being requested (competitive pressure, cash-flow constraint, strategic account value, etc.)

**Outputs:**
- A logged, named-approver decision (approved / rejected / approved with modification) attached to the specific deal
- Updated proposal or contract terms that exactly match what was approved
- An audit trail leadership can review at any time without reconstructing it from email/chat history

**Expected Result:** Non-standard terms get a fast, consistent answer instead of stalling in a rep's inbox or being granted informally with no record — protecting margin and giving leadership real visibility into how often and how far the standard terms are being bent.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **38A** Deviation Identification | Rep recognizes a request falls outside standard pricing/terms/scope and needs approval, not a personal judgment call |
| **38B** Request Submission | Structured request logged with deal value, requested deviation, and reason (see [templates.md](templates.md)) |
| **38C** Tiered Routing | Request auto-routed to the correct approver based on discount size / term-deviation severity |
| **38D** Approver Review | Named approver evaluates the request against policy and deal context |
| **38E** Decision & Logging | Approve / reject / approve-with-modification, time-stamped and attached to the CRM deal record |
| **38F** Terms Reconciliation | Proposal (Stage 33) or contract (Stage 36) updated to exactly match the approved terms before re-sending to the prospect |
| **38G** Audit & Policy Review | Periodic sampling of closed deals to confirm every deviation has a matching approval record, and trend review of how often/how far terms are bent |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — this is an internal governance stage. See [tools.md](tools.md) for CRM/routing tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Pre-screening a deal-desk request against the tier table in [templates.md](templates.md) so the approver sees the classification (Tier 1/2/3) immediately, not just the raw ask
- Summarizing a stacked or unusual request (e.g., a discount combined with a payment-term deviation) into a single clear brief for the approver
- Flagging pattern risk — e.g., the same rep requesting discount approval unusually often, or discounts trending upward over a quarter — for leadership review

**Prompt examples:**
```
"Here is a deal-desk request: [paste request template]. Classify it against
this tier table: [paste tier table]. State the tier, the standard term being
deviated from, and one sentence flagging anything unusual about the request
(e.g., stacked deviations, repeat requester, above-median deal value)."
```

**Agent workflows:** An agent can handle steps 38B–38C end-to-end (structuring the request, classifying its tier, routing the notification) without human involvement. The decision itself (38D–38E) must remain human — this is a control gate specifically because it involves financial and contractual judgment an approver is accountable for, not a pattern-matching task.

**RAG / vector database considerations:** Not required at this stage's scale; the tier table and current pricing catalog (Stage 34) are sufficient structured input for classification.

**LLM recommendations:** Any current-generation model is sufficient for classification and summarization; no frontier reasoning model is needed since the underlying decision logic (the tier table) is simple and rule-based.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Deal-desk request fields (mandatory)
`Deal/Opportunity ID` · `Request Type` (Discount/Payment Terms/Scope/Timeline) · `Standard Term` · `Requested Deviation` · `Reason` · `Deal Value (Standard)` · `Deal Value (Requested)` · `Requested By` · `Request Date` · `Tier` (1/2/3) · `Approver` · `Decision` (Approved/Rejected/Modified) · `Decision Date` · `Modified Terms (if any)`

### JSON schema
```json
{
  "deal_id": "string",
  "request_type": "discount|payment_terms|scope|timeline",
  "standard_term": "string",
  "requested_deviation": "string",
  "reason": "string",
  "deal_value_standard": 0.0,
  "deal_value_requested": 0.0,
  "requested_by": "string",
  "request_date": "ISO 8601 date",
  "tier": 1,
  "approver": "string|null",
  "decision": "pending|approved|rejected|modified",
  "decision_date": "ISO 8601 date|null",
  "modified_terms": "string|null"
}
```

### Validation rules
- No deal closes with a term outside the standard catalog (Stage 34) or standard payment terms (Stage 39) without a matching approval record
- Every decision has a named approver — a request can never be silently treated as approved through non-response
- Tier-3 requests (largest deviations) always route to founder/leadership, never resolved at a lower tier regardless of urgency
- Approved terms in the final contract must exactly match the logged decision — any drift is a QC failure

### Naming conventions
- `request_type` and `decision` use fixed enums so approval-rate and deviation-type reporting stays consistent across the pipeline

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every non-standard term has a logged, named-approver decision before the deal closes
- [ ] Request routed to the correct tier based on the deviation size, not chosen by the requesting rep
- [ ] Final contract/proposal terms match the approved decision exactly
- [ ] Monthly audit sample confirms no un-logged deviations slipped through

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Approval turnaround time | < 24 hours for Tier 1/2, < 48 hours for Tier 3 | Slow approvals are a common cause of lost deal momentum |
| % of closed deals with an un-logged deviation (audit sample) | 0% | Any non-zero result is a process failure, not a rounding error |
| Average discount applied across closed deals | Track and trend; flag if drifting upward quarter over quarter | Signals whether standard pricing (Stage 34) needs review |
| Tier distribution of requests | Track and trend | A high proportion of Tier 3 requests may indicate Stage 34's standard terms are miscalibrated to the market |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [37 Closing Techniques](../37 Closing Techniques/README.md)
- **Next stage:** [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
- **Depends on:** [34 Pricing and Packaging](../34 Pricing and Packaging/README.md), [33 Proposal Creation](../33 Proposal Creation/README.md)
- **Feeds:** [36 Contract and Legal](../36 Contract and Legal/README.md), [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)

> **Source note:** No dedicated internal "deal desk" SOP existed under that name in the Nivy Digital documentation. This stage formalizes the discount-approval and named-approver requirement already implicit in the Stage 33 Proposal Creation SOP and the negotiation policy in the Pricing Strategy — Tiers & Packaging doc, generalized into a standalone governance stage covering discounts, payment-term deviations, scope changes, and rush timelines. Threshold figures in [templates.md](templates.md) are illustrative — calibrate to actual company policy before operational use.

[⬅ Back to README](README.md)
