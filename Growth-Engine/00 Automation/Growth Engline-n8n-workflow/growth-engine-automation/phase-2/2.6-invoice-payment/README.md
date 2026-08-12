# Module 2.6 — Invoice + Payment

**Kya karta hai:** Ye bhi do entry points ka combination hai — 2.1/2.5 jaisa hi pattern.

1. **Trigger from 2.5 (Contract Signed)** — Module 2.5 jab contract sign hone par "Won" mark karta hai, ye workflow trigger hokar Odoo me draft invoice banata hai, post/validate karta hai, ek payment link nikaalta hai, aur client ko invoice email bhej deta hai.
2. **Payment Received Webhook** — Jab client payment kar deta hai (Odoo portal payment ya external gateway se), ye webhook invoice ko "paid" mark karta hai, client ko receipt bhejta hai, aur team ko onboarding ke liye alert karta hai (Module 2.7 Onboarding is alert ke baad manually/automatically shuru hota hai).

```
[Entry 1] Module 2.5 → Execute Workflow (Contract Signed)
        ↓
Postgres: lead + deal detail fetch
        ↓
Odoo: account.move create (draft invoice)
        ↓
Odoo: action_post (validate/finalize invoice)
        ↓
Odoo: read invoice -> payment link build
        ↓
Send Invoice Email (Postal) -- includes payment link
        ↓
Postgres: status = 'Invoiced'
        ↓
Odoo Discuss: invoice sent alert

[Entry 2] Payment Received Webhook (Odoo portal / gateway callback)
        ↓
Parse payment payload
        ↓
Postgres: find lead by invoice ID
        ↓
Odoo: action_register_payment
        ↓
Postgres: status = 'Paid'
        ↓
Send Receipt Email (Postal)
        ↓
Odoo Discuss: "Payment received - ready for onboarding" alert
```

**Funnel me jagah:** Ye module `Won → Onboarded` transition ka pehla hissa hai (billing). Jab `status = 'Paid'` hota hai, aage Module 2.7 (Client Onboarding — abhi tak nahi bana) ko yahi Discuss alert ya ek future Execute Workflow call trigger karega.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. Is workflow ka ID copy karke `2.5-contract-esign/workflow.json` ke `Execute Workflow - 2.6 Invoice + Payment` node me daalo (agar abhi tak nahi daala)

## Setup Karne Se Pehle

### 1. `clients_master` me naya column add karo
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS odoo_invoice_id INTEGER;
```

### 2. Payment gateway / Odoo portal payment webhook
- Agar Odoo ka built-in portal payment (bank transfer/manual ya koi payment acquirer module) use kar rahe ho, to us acquirer ke "payment confirmed" notification ko is workflow ke `Payment Received Webhook` node (path: `payment-received`) par forward karna hoga — ho sakta hai isके liye ek chhota Odoo Automation Rule chahiye ho jo `account.payment` confirm hone par HTTP call kare (Module 1.4 jaisa pattern)
- Agar Razorpay/Stripe jaisa alag gateway use kar rahe ho, unka webhook seedha is URL par point kar sakte ho — payload field names (`invoice_id`, `amount`, `transaction_id`) Node 11 (`Parse Payment Payload`) me apne gateway ke actual payload ke hisaab se adjust karo

### 3. Postgres, Odoo, Postal
Wahi jo pehle ke modules me use kiye.

## Test Kaise Kare

1. Ek test lead ka `clients_master.status` `'Won'` set karo (ya Module 2.5 flow poora complete karo)
2. Workflow ko manually **Execute Workflow** se run karo, input me `{ "odoo_lead_id": <id> }` do
3. Odoo → Accounting me naya validated invoice dikhna chahiye
4. Invoice email aaya confirm karo (payment link ke saath)
5. `clients_master.status` = `'Invoiced'` confirm karo
6. `Payment Received Webhook` ko test-payload ke saath manually call karo (`{"invoice_id": <odoo_invoice_id>, "amount": <amount>, "transaction_id": "TEST123"}`)
7. Confirm karo Odoo invoice "Paid" mark hui, receipt email aaya, aur `clients_master.status` = `'Paid'`

## Known Limitations (v1)

- Odoo Community me `account.move` par `access_token` field standard set-up me hamesha available nahi hota — agar Node 5 (`Odoo - Read Invoice`) me khali aaye, to payment link plain portal URL banega jisme client ko login karna padega (data-quality flag: launch se pehle confirm karo ki Odoo Contacts portal-access properly enabled hai, warna clients invoice hi nahi dekh payenge)
- `action_register_payment` full invoice amount assume karta hai — partial payments/installments support nahi hai abhi (v2: `account.payment.register` wizard model use karke amount explicitly pass karna hoga)
- Payment webhook par koi signature/authentication verify nahi ho raha — jis bhi gateway se ye connect karo, uska webhook-signature verification zaroor add karna (security flag, launch-blocker)
- Duplicate payment-webhook calls (retries) idempotent nahi hain — agar gateway ek hi payment ka webhook do baar bheje, to receipt email bhi do baar jaa sakta hai (v2: `transaction_id` ko ek dedupe table/column me check karna chahiye)
