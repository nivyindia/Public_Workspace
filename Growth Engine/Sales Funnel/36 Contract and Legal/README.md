# 36 Contract and Legal

> **Stage 36 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 9).

---

## Navigation

- ⬅ Previous stage: [35 Negotiation](../35 Negotiation/README.md)
- ➡ Next stage: [37 Closing Techniques](../37 Closing Techniques/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Formalize the agreed terms (Stage 35) into a signed service agreement and Statement of Work, collect the required payment, and hand off a Closed Won deal to onboarding (Stage 40) — converting a verbal/negotiated yes into a legally documented, paid client.

**Purpose:** A deal that's verbally agreed but never formally contracted and paid is not secure — this stage exists to protect both sides with a written agreement, ensure the business is paid before work begins, and generate the clean documentation trail (signed contract, SOW, invoice) every client engagement needs.

**Inputs:**
- Agreed final price and terms from negotiation (Stage 35)
- Approved solution map (Stage 31) — feeds the SOW's deliverables/timeline/scope
- Standard contract template (scope, pricing, payment terms, notice period, confidentiality)

**Outputs:**
- Signed service agreement and SOW, filed to company records
- Invoice/payment link sent and payment received
- CRM deal stage updated to Closed Won, onboarding workflow triggered (Stage 40)

**Expected Result:** Every closed deal has a signed, current-policy-compliant contract on file, payment collected before work begins, and a clean automatic handoff into onboarding — with no deal starting delivery on a verbal agreement alone.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **36A** Contract Types & Key Sections | Service agreement, SOW, invoice — standard clauses each must contain |
| **36B** E-Signature Process | Tool selection, send, and execution |
| **36C** Payment Terms & Structures | Monthly retainer / upfront deposit / first-month-in-advance |
| **36D** Notice Period & Termination | Standard termination clause and notice-period policy |
| **36E** Filing & CRM Handoff | Document storage and the Closed Won → onboarding trigger |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting the SOW's deliverables/timeline/scope section from the approved solution map and negotiated terms
- Flagging when a contract draft's price/terms don't match the logged negotiation record (Stage 35)

**Prompt examples:**
```
"Here is the approved solution map: [paste] and the agreed terms from
negotiation: [paste]. Draft the Statement of Work section (deliverables,
timeline, scope) for the standard service-agreement template."
```

**Agent workflows:** An agent can populate the standard contract template and route it for e-signature, but any non-standard clause, client redline, or custom Enterprise-tier term requires human legal review before it is sent — this document is legally binding, and this stage is not a substitute for qualified legal counsel.

**RAG / vector database considerations:** Not required — the standard template and negotiation record together are sufficient structured input.

**LLM recommendations:** Standard current-generation models are sufficient for SOW drafting; the legal/liability clauses themselves should not be AI-drafted without qualified review.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Contract record fields (mandatory)
`Opportunity ID` · `Contract Sent Date` · `Contract Signed Date` · `Final Price` · `Payment Structure` (Monthly Retainer/Upfront Deposit/First Month Advance) · `Notice Period` · `Status` (Draft/Sent/Signed/Declined) · `Filed Location`

### JSON schema
```json
{
  "opportunity_id": "string",
  "contract_sent_date": "ISO 8601 date",
  "contract_signed_date": "ISO 8601 date|null",
  "final_price": 0.0,
  "payment_structure": "monthly_retainer|upfront_deposit|first_month_advance",
  "notice_period_days": 30,
  "status": "draft|sent|signed|declined",
  "filed_location": "string"
}
```

### Validation rules
- `final_price` and terms must match the negotiation record (Stage 35) exactly — no silent drift between what was agreed and what's in the contract
- `status: signed` requires `contract_signed_date` populated and triggers CRM Closed Won + onboarding (Stage 40) + invoice send (Stage 39)
- Work does not begin until payment is received, regardless of contract-signed status

### Naming conventions
- `payment_structure` is a fixed enum matching the three standard structures in [templates.md](templates.md)

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Contract terms match negotiation record exactly
- [ ] Standard clauses present and non-standard clauses reviewed
- [ ] Payment received before work begins
- [ ] CRM updated and onboarding triggered only after signature

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Contract-sent-to-signed time | Track and trend | Slow turnaround risks losing deal momentum |
| Signed-to-paid time | Track and trend | Payment should follow signature promptly per policy |
| Contract-term accuracy | 100% match to negotiation record | Zero tolerance for drift between agreed and contracted terms |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [35 Negotiation](../35 Negotiation/README.md)
- **Next stage:** [37 Closing Techniques](../37 Closing Techniques/README.md)
- **Depends on:** [31 Solution Mapping](../31 Solution Mapping/README.md), [35 Negotiation](../35 Negotiation/README.md)
- **Feeds:** [39 Payment and Invoicing](../39 Payment and Invoicing/README.md), [40 Client Onboarding](../40 Client Onboarding/README.md)

> **Source note:** Built from the internal "Phase 14 — Contract & Payment Setup" doc (tools, key documents, payment structures, contract→payment flow) combined with the "Contract & Sign-Off" section of the "Proposal & Deal Closing SOP" (standard clause list, notice period, payment terms).

[⬅ Back to README](README.md)
