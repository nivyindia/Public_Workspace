# Tools — 39 Payment and Invoicing

[⬅ Back to README](README.md)

_Pricing figures are approximate — verify current pricing before purchase._

| Tool | Purpose | Pricing (approx., verify) | OSS/Free Alt | API/Automation |
|---|---|---|---|---|
| Razorpay / Stripe | Payment gateway — cards, UPI, international wire, subscriptions | Transaction-fee based (no fixed cost) | n/a — this source is already free to use | API |
| PayPal / Wise | International client payments, especially USD/GBP/EUR invoicing | Transaction-fee based | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | API |
| Zoho Invoice / QuickBooks | Invoice generation, recurring billing, payment status tracking | Free tier / paid tiers for advanced features | Zoho Invoice has a generous free tier | API |
| Google Sheets | Lightweight payment tracker for very small operations | Free | Free | API |
| n8n | Automated reminder sequences, gateway-to-CRM reconciliation | Free (self-hosted) | Fully OSS | Native |
| Bank NEFT/RTGS/IMPS (India) | Direct bank transfer for domestic clients | Free / bank-fee dependent | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Limited |

## Selection Notes
- International clients are typically billed via PayPal, Wise, or wire transfer in USD/GBP/EUR, while domestic (India) clients are billed in INR via bank transfer, UPI, or card — per the source Payment Terms Policy.
- A recurring-billing-capable invoicing tool pays for itself quickly once a team is running more than a handful of monthly retainer clients.
