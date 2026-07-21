# Templates — 39 Payment and Invoicing

[⬅ Back to README](README.md)

## Payment Terms by Deal Type

| Deal Type | Structure |
|---|---|
| Project-Based Services | 50% advance before project initiation, 50% due upon completion |
| Monthly Retainer | Full payment in advance at the start of each month |
| Quarterly Package | 100% advance with a 5% discount on total package value |
| Annual Contract | 25% every 3 months, or 10% discount for full advance payment |
| Media Buying / Ad Spend | 100% advance before campaign launch |

## Standard Invoice Structure
```
TAX INVOICE
Invoice No.: [COMPANY-INV-YEAR-NUMBER]
Invoice Date: [DATE]     Due Date: [DATE + 7 DAYS]     Service Period: [PERIOD]

BILL TO: [Client Name/Company] · [Address] · [Email] · [GST No. if applicable]

SERVICES RENDERED:
# | Description | Quantity | Rate | Amount

BILLING SUMMARY:
Subtotal | [Amount]
GST (18%, domestic only) | [Amount]
Discount (if any) | -[Amount]
TOTAL DUE | [Total]

PAYMENT DETAILS: Bank transfer / UPI (domestic) · PayPal / Wise (international)
PAYMENT TERMS: Due within 7 days · Late fee applies after due date
```

## Overdue Reminder Cadence

| Day | Message Tone | Example |
|---|---|---|
| Due date + 1 | Polite reminder | "Hi [Name], just a friendly reminder that invoice [#] was due yesterday — let us know if you need anything from us to process payment." |
| Due date + 7 | Firmer, cites policy | "Invoice [#] is now 7 days overdue. Per our payment terms, a late fee of [X]% applies. Please process payment at your earliest convenience to avoid any disruption to service." |
| Due date + 14 | Escalation warning | "Invoice [#] is now 14 days overdue. Per policy, services may be temporarily suspended until payment is received. Please contact us urgently to resolve this." |
| Due date + 14+ | Service suspension notice (if unresolved) | Formal notice that services are paused pending payment, sent by the account manager with a copy to leadership. |

## Late Payment Policy Summary
- Late fee: 1.5% per week on outstanding amount (verify current company policy before quoting to a client)
- Services may be suspended after 14 days overdue
- Repeated late payment can require 100% advance payment for all future work with that client
