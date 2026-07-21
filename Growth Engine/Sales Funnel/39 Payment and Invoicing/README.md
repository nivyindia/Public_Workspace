# 39 Payment and Invoicing

> **Stage 39 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7).

---

## Navigation

- ⬅ Previous stage: [38 Deal Desk and Approval Workflows](../38 Deal Desk and Approval Workflows/README.md)
- ➡ Next stage: [40 Client Onboarding](../40 Client Onboarding/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Convert a signed contract into a correctly structured invoice, collect payment on the agreed schedule, and manage overdue payments through a consistent, policy-driven reminder and escalation process — so cash actually lands before or alongside delivery, not chronically behind it.

**Purpose:** A signed deal has no operational value until payment is collected. This stage exists to make sure every client is billed on the correct structure for their deal type (project, retainer, quarterly, annual, or media-buying), that invoices are professional and compliant (correct tax treatment, sequential numbering), and that late payment is handled consistently rather than through awkward, inconsistent, relationship-dependent follow-up.

**Inputs:**
- Signed contract (Stage 36) with agreed pricing and payment structure
- Any deal-desk-approved payment-term deviation (Stage 38)
- Client billing details (name, address, GST number if applicable, billing email)

**Outputs:**
- A correctly structured, sequentially numbered invoice sent to the client
- Payment collected and reconciled against the invoice
- For overdue invoices: a logged reminder cadence and, where necessary, a documented service-suspension decision

**Expected Result:** Predictable, on-schedule cash collection with minimal manual chasing, invoices that hold up to tax/compliance scrutiny, and a documented, non-awkward process for the (inevitable) small percentage of late payments.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **39A** Payment Structure Selection | Determine the correct structure for the deal type — project (50/50), retainer (advance), quarterly (advance + discount), annual (quarterly or full-advance discount), or media-buying (100% advance) |
| **39B** Invoice Generation | Build the tax invoice with correct numbering, billing period, services rendered, and tax treatment |
| **39C** Invoice Delivery | Send to the correct billing contact with clear payment details and due date |
| **39D** Payment Collection | Client pays via the offered method (bank transfer, card, UPI, PayPal, Wise, wire) |
| **39E** Reconciliation | Match payment received to the invoice and update records |
| **39F** Overdue Management | Reminder cadence, late fees, and — if necessary — service suspension for payments significantly overdue |
| **39G** Recurring Billing | Automatic re-invoicing at each billing cycle for retainer/subscription-style engagements |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for payment gateway and invoicing tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting overdue-payment reminder messages calibrated in tone to how late the invoice is (see the cadence in [templates.md](templates.md))
- Summarizing a client's payment history (on-time rate, average days-late) to flag accounts that may need a payment-term change (routed through Stage 38)
- Flagging invoices with unusual characteristics (amount mismatch vs. contract, missing GST number for a domestic client) before they're sent

**Prompt examples:**
```
"Draft a day-7-overdue payment reminder for invoice [#], amount [amount],
client [name]. Tone: firmer than a first reminder but still professional —
reference the [X]% late fee that now applies per policy, and ask them to
confirm a payment date."
```

**Agent workflows:** An agent can fully own steps 39B (generate), 39C (send), and 39F (reminder cadence) without human involvement once the payment structure and terms are confirmed. A human should review any invoice tied to a deal-desk-approved deviation (Stage 38) to confirm the invoice reflects the approved terms exactly, not the standard template default.

**RAG / vector database considerations:** Not required; invoicing is a structured-data task using the contract and pricing catalog as direct input.

**LLM recommendations:** Any current-generation model is sufficient for reminder drafting and payment-history summarization; this task does not require frontier reasoning capability.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Invoice fields (mandatory)
`Invoice Number` · `Client/Company` · `Invoice Date` · `Due Date` · `Service Period` · `Line Items` (description, quantity, rate, amount) · `Subtotal` · `Tax` · `Discount` · `Total Due` · `Payment Method` · `Status` (Draft/Sent/Paid/Overdue/Disputed)

### JSON schema
```json
{
  "invoice_number": "string",
  "client_id": "string",
  "invoice_date": "ISO 8601 date",
  "due_date": "ISO 8601 date",
  "service_period": "string",
  "line_items": [{"description": "string", "quantity": 0, "rate": 0.0, "amount": 0.0}],
  "subtotal": 0.0,
  "tax": 0.0,
  "discount": 0.0,
  "total_due": 0.0,
  "currency": "INR|USD|GBP|EUR",
  "payment_method": "string|null",
  "status": "draft|sent|paid|overdue|disputed"
}
```

### Validation rules
- Invoice number must be sequential and unique — never reused, never skipped
- Domestic (India) invoices apply 18% GST; international invoices apply tax per relevant treaty, not Indian GST
- Total Due must reconcile exactly to Subtotal + Tax − Discount
- Any payment-term deviation from the standard structures in [templates.md](templates.md) must trace back to a Stage 38 approval record

### Naming conventions
- `status` uses a fixed enum so accounts-receivable reporting (aging, overdue rate) stays consistent across all clients

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Invoice numbering, tax treatment, and payment structure all correct for the deal type
- [ ] Sent to the correct billing contact with accurate, current payment details
- [ ] Overdue invoices followed up per the defined reminder cadence, not inconsistently
- [ ] Monthly reconciliation confirms no unexplained gap between invoices issued and payments received

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| On-time payment rate | > 90% of invoices paid within the 7-day term | Chronic lateness across many clients signals a terms or client-quality problem, not just individual slow payers |
| Days Sales Outstanding (DSO) | Track and trend, minimize | Standard accounts-receivable health metric |
| Invoice-to-payment turnaround | < 7 days from send to payment, per standard terms | |
| Overdue rate (>14 days) requiring suspension consideration | Track and trend, minimize | High rate suggests either collections process gaps or a client-vetting problem upstream |
| Reconciliation accuracy | 100% of payments matched to an invoice monthly | Unmatched payments are a red flag for either process or fraud risk |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [38 Deal Desk and Approval Workflows](../38 Deal Desk and Approval Workflows/README.md)
- **Next stage:** [40 Client Onboarding](../40 Client Onboarding/README.md)
- **Depends on:** [36 Contract and Legal](../36 Contract and Legal/README.md), [34 Pricing and Packaging](../34 Pricing and Packaging/README.md)
- **Feeds:** [40 Client Onboarding](../40 Client Onboarding/README.md) — onboarding typically begins only once initial payment is confirmed received

> **Source note:** This stage is built directly from two complete internal documents — the Payment Terms Policy and the Invoice Template — Standard — both already in production use at Nivy Digital, supplemented by process context from Phase 14 — Contract & Payment Setup. Tax rates, fee percentages, and bank/GST placeholder details should be verified against current company and government policy before operational use.

[⬅ Back to README](README.md)
