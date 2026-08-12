# Module 2.9 — Renewal + Revenue Ops

**Kya karta hai:** Teen cheezein ek workflow me — retention ke teeno critical paths:

1. **Renewal reminders (daily cron, Branch A)** — jin clients ka `renewal_date` agle 30 din me hai, unke liye Odoo me sales rep ke naam ek "renewal call" activity banata hai, client ko reminder email bhejta hai, aur dobara reminder na jaaye isliye 7-din cooldown rakhta hai.
2. **Churn-risk detection (daily cron, Branch B)** — jin clients ka `renewal_date` beet chuka hai lekin status abhi bhi Onboarded/Active hai (renew nahi hua), unhe `'Churn Risk'` mark karta hai aur team ko urgent alert bhejta hai.
3. **Failed-payment dunning (webhook, Entry 2)** — payment gateway/Odoo se "payment failed" webhook aane par client ko `'Payment Failed'` mark karta hai, dunning attempt count badhata hai, client ko retry-payment email bhejta hai, aur team ko alert karta hai.

```
[Daily Trigger 7AM]
        ↓
   ┌────┴────┐
Branch A          Branch B
(renewals due)    (overdue/churn)
   ↓                  ↓
Postgres: fetch    Postgres: fetch
due in 30 days     renewal_date < now()
   ↓                  ↓
Odoo: renewal      Postgres: status =
call activity      'Churn Risk'
   ↓                  ↓
Send reminder      Discuss: churn
email                 alert
   ↓
Postgres: reminder_sent_at = now()
   ↓
Discuss: renewal reminder alert

[Entry 2 -- separate webhook]
Failed Payment Webhook
        ↓
Parse payload
        ↓
Postgres: find lead by invoice_id
        ↓
Postgres: status = 'Payment Failed', dunning_attempts += 1
        ↓
Send dunning email
        ↓
Discuss: payment-failed alert
        ↓
Respond 200 OK
```

**Funnel me jagah:** Ye module Phase 2 ka aakhri hai — `Onboarded/Active → Renewed / Churn Risk / Payment Failed` ke sab possible outcomes handle karta hai, aur revenue loop ko "top" (naya business) se "bottom" (retention) tak close karta hai.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo — daily cron khud chalega, webhook URL turant live ho jaayega
4. Failed-payment webhook URL apne payment gateway/Odoo acquirer ki notification settings me daalo

## Setup Karne Se Pehle

### 1. `clients_master` me naye columns add karo
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS renewal_date DATE;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS renewal_reminder_sent_at TIMESTAMP;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS dunning_attempts INTEGER DEFAULT 0;
```
`renewal_date` abhi kahi bhi auto-populate nahi hoti — Module 2.7 (onboarding) ke baad ya contract sign hote waqt (Module 2.5) ise manually ya ek chhoti calculation (`contract_start + contract_term_months`) se set karna hoga. v1 me ye ek known gap hai (neeche Limitations me hai).

### 2. Naye env variables
| Variable | Kya daalna hai |
|---|---|
| `ODOO_RENEWAL_ACTIVITY_TYPE_ID` | Odoo Activity Type ID jo renewal call ke liye use hoga (Settings → Technical → Activity Types, e.g. "Call") |

Baaki (`ODOO_URL`, `ODOO_DB`, `ODOO_UID`, `ODOO_API_KEY`, `ODOO_SALES_USER_ID`, `ODOO_DISCUSS_CHANNEL_ID`, `OUTREACH_FROM_EMAIL`) pehle se set hone chahiye.

### 3. Failed-payment webhook signature verification
`Failed Payment Webhook` node par abhi koi authentication/signature-check nahi hai (launch-blocker, neeche dekho). Apne gateway ki webhook-signing scheme ke hisaab se ek verification step add karo before trusting the payload.

## Test Kaise Kare

**Branch A/B (renewal + churn):**
1. Ek test client ka `renewal_date` = `CURRENT_DATE + 10` set karo, `status = 'Onboarded'`
2. Workflow manually run karo (ya `Fetch Renewals Due` node individually test karo)
3. Odoo me renewal-call activity ban gayi confirm karo, client ko reminder email aaya confirm karo, `renewal_reminder_sent_at` update hua confirm karo
4. Ek doosre test client ka `renewal_date` = `CURRENT_DATE - 5` set karo, `status = 'Onboarded'`
5. Workflow re-run karo, `status = 'Churn Risk'` ho gaya confirm karo, Discuss alert aaya confirm karo

**Entry 2 (dunning):**
6. `Failed Payment Webhook` ko test-payload ke saath call karo: `{"invoice_id": <odoo_invoice_id>, "amount": <amount>, "failure_reason": "card_declined", "transaction_id": "TEST123"}`
7. `clients_master.status = 'Payment Failed'` aur `dunning_attempts` +1 hua confirm karo, dunning email aaya confirm karo

## Known Limitations (v1)

- **`renewal_date` auto-population nahi hai** — abhi ye column manually set karna padega. v2: Module 2.5 (contract sign) ke waqt hi `contract_start_date + term_months` se calculate karke isi workflow ki chain me likh diya jaaye.
- **Webhook signature verification missing** (security flag, **launch-blocker** — Module 2.6 ke payment webhook jaisi hi limitation) — jo bhi gateway se connect karo, uska HMAC/signature verify karna production se pehle zaroori hai.
- **Dunning retry-schedule fixed nahi hai** — v1 me har failed-payment event par sirf ek email jaata hai. v2: `dunning_attempts` ke count ke hisaab se escalating sequence (Day 1 soft reminder → Day 3 firmer → Day 7 "service pause warning") banai ja sakti hai, Module 2.2 (nurture) jaisa delay-based pattern reuse karke.
- **Auto service-pause/suspend nahi hai** — kai dunning attempts ke baad bhi payment na aaye to abhi koi automatic action (service pause, escalation to human) nahi hai — sirf Discuss alert hai jisme manual follow-up chahiye.
- **Churn Risk se wapas Active me aana** manual hai — jab client renew kar deta hai, `status` ko wapas `'Active'`/`'Onboarded'` aur `renewal_date` ko naya date karna abhi manual step hai (ya Module 2.6/2.4 dobara chalne par ho sakta hai agar renewal bhi ek "Won" deal ki tarah treat kiya jaaye).
