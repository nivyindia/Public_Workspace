# Module 6.5 — Churn Win-back + Escalation

## Kya karta hai
`clients_master.status = 'Churn Risk'` (Module 2.9 ka existing flag) wale clients ko ek 3-touch win-back sequence deta hai — Day 0 email, Day 7 WhatsApp, Day 14 email — aur agar 21 din tak koi response nahi to founder ko direct escalate karta hai, bina koi aur client-facing message bheje.

## ⚠️ Business assumptions (Nivy sign-off chahiye)
- **Cadence:** 7-din gap har touch ke beech, 3 touches ke baad escalation — ye KB mein defined nahi tha (KB sirf pre-churn "save-a-client call" cover karta hai, post-churn win-back nahi). SQL query ke intervals badal ke actual cadence set kar sakte ho.
- **Escalation trigger:** koi response track nahi ho raha explicitly (reply-tracking Module 4.3 se link nahi kiya abhi) — sirf "status abhi bhi Churn Risk hai" ke base par escalate karta hai. Agar client respond kare, uska status change karna manual/Module-4.3-linked hona chahiye taaki sequence ruk jaye.

## Naye DB fields chahiye
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS winback_step INTEGER DEFAULT 0;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_winback_sent_at TIMESTAMP;
```

## Import
Standard n8n import → `workflow.json` → set Postgres/Odoo credentials → set env vars (`OUTREACH_FROM_EMAIL`, `WAHA_URL`, `WAHA_API_KEY`, `WAHA_SESSION`, `ODOO_*`) → activate.

## Known Limitations
- No reply-suppression yet (see assumption above) — client jawab de bhi de, sequence chalta rahega jab tak status manually change na ho.
- Founder escalation sirf Odoo Discuss alert hai, koi task/reminder auto-create nahi hota.

## S6.6 — Star Topology rewiring (this update)

Plan ke S6.6 step ke hisab se ye do changes kiye gaye:

1. **`Triggered by Hub (renewal.overdue)`** — naya `Execute Workflow Trigger` node add kiya, taaki Hub-Dispatcher is module ko `event_type: renewal.overdue` par kick kar sake, independent poll ke bajaye jaisa plan bolta hai.
   - ⚠️ **Kept `Daily 8AM` schedule trigger bhi** — delete nahi kiya. Wajah: 6.5 ek single hand-off nahi hai, 21-din ka 4-touch cadence hai (Day 0/7/14/21). Ek `renewal.overdue` event sirf client ko sequence mein *daakhil* karta hai; Day-7/14/21 ke follow-up touches ko roz check karna padta hai ki `last_winback_sent_at` interval poora hua ya nahi. Isliye Hub-trigger sirf ek naya entry point hai (fresh renewal.overdue par turant kick, agle 8AM poll ka wait nahi), aur Daily 8AM sequence ko carry-forward karne ke liye safety-net poll ke roop mein chalta rehta hai. Dono same "Fetch Churn-Risk Clients Due for Next Touch" query node par feed karte hain.
   - Is design decision par Nivy sign-off chahiye — agar Hub-only trigger chahiye (pura poll hataana), to alag approach lagega (jaise Hub khud har din re-check kare aur re-fire kare, jo Hub-Dispatcher ke responsibility badha dega).

2. **`Report to Hub - Winback Escalated`** — naya node, sirf Day-21 founder-escalation step (`step4_escalate`) ke baad chalta hai, `Odoo Discuss - Founder Escalation Alert` aur `Postgres - Mark Win-back Step Sent` ke beech mein. Event `event_type: winback.escalated` report karta hai, jaisa plan bolta hai ("so that one gets its own alert path"). Steps 1–3 (email/WhatsApp touches) Hub ko kuch report nahi karte.

### ⚠️ Gap flagged — Hub-Intake abhi repo mein nahi hai
Poore automation repo mein `Hub-Intake` sub-workflow ya `funnel_events` table kahin bhi nahi bana hua mila (S0–S2 abhi pending hain). Is wajah se:
- `Report to Hub - Winback Escalated` node ka `workflowId` abhi `REPLACE_WITH_HUB_INTAKE_WORKFLOW_ID` placeholder hai — Hub-Intake workflow banne ke baad iski real ID daalni hogi.
- `event_type: renewal.overdue` ka exact naam bhi confirm karna hoga — plan ke S4.7 mein isi hand-off ko `renewal.due` bola gaya hai, jabki S6.6 usko `renewal.overdue` bulata hai. Dono ek hi event hain ya alag (due vs overdue), ye decide karke Hub-Dispatcher ke Switch node mein sahi naam use karna.
- Is module ko poora test karne ke liye pehle S0 (spine table) aur S1 (Hub-Intake) build karne honge.
