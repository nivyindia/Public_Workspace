# Module 6.8 — Referral Link Generation + Reward Trigger

## Kya karta hai
Promoter-flagged clients ke liye unique referral code/link generate karta hai, referral-ask email bhejta hai, aur jab koi referred lead `Won`/`Paid` status tak pahunche to Odoo Discuss par payout-due alert deta hai.

## ⚠️ Sabse critical assumption — payout amount deliberately auto-calculate NAHI kiya
KB (Stage 53) explicitly kehta hai commission/incentive rate **"deliberate business decision, documented consistently, not negotiated ad hoc"** — koi number kahi nahi diya. Isliye is workflow ka reward-alert node **sirf "payout due hai" bolta hai, amount calculate nahi karta.** Jab tumhara commission % (ya flat amount) decide ho jaye, ek chhota patch node add kar dunga jo amount bhi calculate kare.

## Integration gap (flag kar raha hoon, fix nahi kiya)
`?ref=<code>` se aane wale referred leads ko track karne ke liye Module 1.3 (website lead capture) ya 1.4 (form qualification) mein ek chhota patch chahiye — query param capture karke `clients_master.referral_code_used` mein save karna. Ye is module ka scope nahi tha (wo Phase 3-era modules hain), par is workflow ke reward-trigger ka poora working isi field par depend karta hai. Batao to wahan bhi patch kar deta hoon.

## Naya DB table + column chahiye
```sql
CREATE TABLE IF NOT EXISTS referrals (
  id SERIAL PRIMARY KEY,
  referrer_client_id INTEGER REFERENCES clients_master(id),
  referral_code TEXT UNIQUE,
  status TEXT DEFAULT 'link_generated',
  converted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS referral_code_used TEXT;
```

## Known Limitations
- Reward amount not calculated (see above — by design, not a bug).
- `referral_code_used` capture not yet wired into Module 1.3/1.4 (see integration gap above).

## S6.9 — Star Topology rewiring (this update)

Plan ke S6.9 step ke hisab se **sirf link-generation flow** rewire hua:

1. **`Daily 11AM` schedule trigger hataya**, `Triggered by Hub (nps.promoter_flagged)` Execute Workflow Trigger se replace kiya. Hub-Dispatcher isi event par is workflow ko call karega jis par Module 6.7 (Case Studies) bhi react karta hai — dono spokes independently same event subscribe karte hain.
2. **`Fetch Promoters Without Referral Link` bulk query → `Fetch Flagged Promoter Without Referral Link` single-row lookup.** Event ke `client_id` payload se seedha client fetch; `NOT IN referrals` guard idempotency ke liye rakha hai (agar client ke paas already code hai to dobara generate na ho).
3. Baaki link-gen chain (code generate, referrals insert, Ollama ask draft, email send) **bina badlaav**.

### ⚠️ Reward-check flow (Daily 12PM) jaan-boojh kar untouched chhoda
`Daily 12PM - Reward Check` → `Fetch Referrals with Closed-Won Conversion` → payout alert — ye ek **alag polling concern** hai (referred lead ka `Won`/`Paid` conversion check karta hai), aur plan ke S6.9 mein iska zikr nahi hai. Isko event-driven banane ke liye ek naya event chahiye hoga jaise `deal.won` ya `payment.received` (jo already S4 series mein 2.6 se report ho raha hai) — agar chaho to ye bhi Hub-triggered kar sakta hoon, lekin abhi plan ke scope se bahar rakha hai.

### ⚠️ Same Hub-Intake gap
`Hub-Intake` sub-workflow aur `funnel_events` table (S0–S2) abhi bane nahi hain — ye module Dispatcher se call hone ke liye ready hai, lekin end-to-end test Hub spine banne ke baad hi ho payega.

### ⚠️ Pehle se flagged gaps (still open)
- `referral_code_used` capture Module 1.3/1.4 mein abhi bhi patch nahi hua (README ke top mein already flagged tha) — is rewiring se ye gap change nahi hua.
