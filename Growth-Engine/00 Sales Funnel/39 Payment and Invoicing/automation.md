# Automation — 39 Payment and Invoicing

[⬅ Back to README](README.md)

**n8n template(s):** "Airtable to Google Sheets Auto-Sync" did not resolve to one stable, specific n8n.io/GitHub template under that exact name — closest verified matches are generic Airtable↔Sheets sync patterns, not a single canonical build. Use the category browse instead: [n8n.io Airtable integration templates](https://n8n.io/integrations/airtable/). For the Stripe/Odoo webhook half of this line, pair with this stage's own already-linked [QuickBooks/Stripe invoice automation family](https://www.intuz.com/blog/best-n8n-workflow-templates/) referenced in [N8N-AUTOMATION-INDEX.md](../N8N-AUTOMATION-INDEX.md) — same pattern applies to an Odoo Accounting webhook trigger. Checked 23 Jul 2026.

## Manual
Reviewing and approving any late-fee waiver or payment-plan exception — this should route through Stage 38 (Deal Desk and Approval Workflows), not be decided ad hoc by whoever is chasing the payment.

## Semi-Automated
Invoice generation is templated and mostly automatic, but a human reviews before send for anything with non-standard terms (post deal-desk approval).

## Full-Automated
Recurring retainer invoices generated and sent automatically each billing cycle; overdue reminders fire automatically at the day-thresholds in [templates.md](templates.md); payment received via gateway automatically marks the invoice paid.

## AI-Assisted Workflow
1. Contract signed (Stage 36) → invoicing tool generates the first invoice per the agreed payment structure (project/retainer/quarterly/annual).
2. Invoice sent to the client's billing contact with payment details.
3. Payment gateway webhook marks the invoice paid automatically when funds are received; CRM/client record updates in sync.
4. If unpaid past the due date, automated reminders fire per the cadence in [templates.md](templates.md), with tone escalating each stage.
5. If unpaid past 14 days, an internal alert notifies the account manager and finance lead to review before any service suspension is enacted.
6. Recurring retainer invoices repeat this cycle automatically at the start of each billing period without manual re-creation.

## Suggested n8n / integration flow
`Contract signed (Stage 36 webhook)` → `Invoicing tool (generate + send invoice)` → `Payment gateway webhook (mark paid)` → `n8n (if unpaid at day+1/7/14, send reminder)` → `n8n (if unpaid at day 14+, alert AM + finance)` → `CRM update (payment status synced to client record)`
