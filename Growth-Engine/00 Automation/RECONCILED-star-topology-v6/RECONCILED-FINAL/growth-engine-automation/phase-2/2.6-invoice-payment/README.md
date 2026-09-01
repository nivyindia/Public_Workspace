# Module 2.6 — Invoice + Payment

**Kya karta hai:** Ye bhi do entry points ka combination hai — 2.1/2.5 jaisa hi pattern.

1. **Trigger from 2.5 (Contract Signed)** — Module 2.5 jab contract sign hone par "Won" mark karta hai, ye workflow trigger hokar Odoo me draft invoice banata hai, post/validate karta hai, ek payment link nikaalta hai, aur client ko invoice email bhej deta hai.
2. **Payment Received Webhook** — Jab client payment kar deta hai (Odoo portal payment ya external gateway se), ye webhook invoice ko "paid" mark karta hai, client ko receipt bhejta hai, team ko alert karta hai, aur Hub ko `payment.received` event report karta hai.

> **S4.5 update (star topology):** Pehle yahan seedha `Execute Workflow - 2.7 Client Onboarding` node tha — module-to-module direct call. Ab uski jagah **Report to Hub** node hai: `Postgres - Mark Paid` ke turant baad, parallel branch me (receipt email ke saath), `event_type: payment.received` Hub-Intake ko bhej deta hai. 2.6 ko ab 2.7 ka workflow ID jaanne ki zaroorat nahi. Side note: `Postgres - Mark Paid` query me pehle `RETURNING *` nahi tha, jabki purana `Execute Workflow - 2.7` node `odoo_lead_id` isi node ke output se padhne ki koshish karta tha — ye ek chhota pre-existing bug tha jo is update me fix ho gaya (ab RETURNING * hai, is naye node ko bhi chahiye tha).

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
Odoo Discuss: "Payment received" alert

        (parallel, off "Postgres: status = 'Paid'")
        ↓
Report to Hub → funnel_events (event_type: payment.received)
```

**Funnel me jagah:** Ye module `Won → Onboarded` transition ka pehla hissa hai (billing). Jab `status = 'Paid'` hota hai, `payment.received` event Hub me chala jaata hai — Hub-Dispatcher usi event se Module 2.7 (Client Onboarding) ko trigger karega.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. `Report to Hub` node me `REPLACE_WITH_0.0_HUB_INTAKE_WORKFLOW_ID` ko Hub-Intake ke actual workflow ID se replace karo — 2.7 ka ID yahan kahin nahi chahiye, wo Hub-Dispatcher ke Switch node me `payment.received` branch se wire hoga (S4 batch scope, is file ka nahi)

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
- **(S4.5)** Hub-Dispatcher me `payment.received` ka Switch branch abhi tak wired nahi hai. Jab tak wo branch + 2.7 ka real workflow ID Dispatcher me add nahi hote, `payment.received` events `funnel_events` me record honge but `flagged_events` me fall through honge — onboarding tab tak manually trigger karna hoga, koi crash nahi hoga
