# Methods — 39 Payment and Invoicing

[⬅ Back to README](README.md)

## Traditional
A manually typed invoice emailed as a PDF attachment, with payment tracked in a spreadsheet.

## Modern / Tool-Assisted
An invoicing tool (Zoho Invoice, QuickBooks, Razorpay/Stripe invoicing) that generates, sends, and tracks payment status automatically, replacing the manual PDF-and-spreadsheet approach.

## AI-Assisted
An LLM drafts payment-reminder messages calibrated to how overdue an invoice is (polite nudge at day 1, firmer language at day 7+), pulled from the standard templates in [templates.md](templates.md).

## Manual
Reconciling bank/gateway settlement records against invoices issued — automatable in mature setups, but many small teams still do this by hand monthly.

## Automated
Recurring retainer invoices generated and sent automatically at the start of each billing period; overdue-payment reminders triggered automatically at defined day-thresholds.

## API / Integration
Payment gateway (Razorpay/Stripe/PayPal/Wise) ⇄ invoicing tool ⇄ CRM, so a payment received automatically marks the invoice paid and updates the deal/client record without manual entry.

## Browser Automation
Not applicable to this stage.

## Scraping
Not applicable to this stage.

## Public Database / Government
Not applicable directly, though GST/tax-compliance rules (India) or equivalent international tax regulations govern invoice format and are treated as an external constraint, not a data source.

## Community / Referral
Not applicable to this stage.

## Method Selection Guidance
Use a dedicated invoicing tool with gateway integration from day one — the manual spreadsheet approach breaks down quickly once client count grows past a handful, and reconciliation errors directly cost revenue.
