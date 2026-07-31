# Checklists — 39 Payment and Invoicing

[⬅ Back to README](README.md)

## Invoice Generation QC
- [ ] Invoice number follows the sequential company format (e.g., `BDU-INV-[YEAR]-[NUMBER]`) — never reused or skipped
- [ ] Billing period, due date (issue date + 7 days per standard policy), and services rendered are all correctly populated
- [ ] GST/tax applied correctly for domestic clients (18% per Indian policy); international clients billed per applicable tax treaty
- [ ] Payment terms structure matches the deal type (project-based 50/50, monthly retainer in advance, quarterly with discount, annual, or media-buying 100% advance)
- [ ] Any deal-desk-approved deviation (Stage 38) from standard terms is reflected exactly, not a generic template default

## Send QC
- [ ] Invoice sent to the correct billing contact/email, not just the primary contact
- [ ] Invoice sent with enough lead time that payment is realistically possible before the due date
- [ ] Bank/UPI/PayPal/Wise payment details are current and correctly filled in — not left as placeholder text

## Collection QC
- [ ] Overdue invoices flagged and a reminder sent per the escalation cadence in [templates.md](templates.md)
- [ ] Late-payment fee applied consistently per policy (do not selectively waive without an approval record — see Stage 38)
- [ ] Services suspended per policy if payment is more than 14 days overdue, and this is communicated to the client before suspension, not silently

## Reconciliation QC
- [ ] Every payment received is matched to its invoice and marked paid in the tracking system
- [ ] TDS certificates (where applicable) received and filed within 30 days of deduction
- [ ] Monthly reconciliation of gateway/bank settlements against invoices issued — no unexplained gaps
