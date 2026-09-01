# Module 6.9 — Advocacy Candidate Report

## Kya karta hai
Har mahine `nps_responses` aur `referrals` data se "advocate candidates" (sustained satisfaction) surface karta hai, Odoo Discuss par curated list post karta hai. **Report-only** — koi outreach automatically nahi jaata, KB khud kehta hai relationship-cultivation hamesha human-led rahega.

## ⚠️ Business assumption
Threshold assume kiya: **6 mahine mein 2+ NPS score 9-10 HO, YA 2+ successfully-converted referrals.** KB "sustained satisfaction" bolta hai par exact number nahi deta. Batao to adjust kar dunga.

## Known Limitations
- No dedicated `advocates` table — candidates har mahine fresh query se nikalte hain, `advocate_flag` column already assumed hai but koi node isko actually set nahi karta abhi (human review ke baad manually set karna hoga, ya batao to auto-set kar dunga review-approval ke baad).

## S6.10 — Star Topology addition (this update)

6.7 aur 6.8 se **alag pattern** — ye module ek single upstream event ka reaction nahi, balki **monthly batch aggregate report** hai (saare clients cross-check karke candidates dhoondta hai). Isliye plan (S6.10) trigger badalne ko nahi kehta — sirf ek naya Hub-report add karne ko kehta hai.

1. **Trigger unchanged** — `Monthly 1st, 9AM` schedule waisa hi rakha, kyunki ye event-driven hand-off nahi hai, ek periodic scan hai.
2. **`Report to Hub - Advocate Flagged`** naya node add kiya, `Fetch Advocate Candidates` ke output se ek parallel branch mein (mode: `each`, har candidate ke liye ek call). Har flagged candidate ke liye `event_type: advocate.flagged` report hota hai.
   - Ye **additive** hai — existing `Odoo Discuss - Advocate Candidate Report` (human-facing curated monthly list) as-is chalta rehta hai. Koi auto-outreach trigger nahi hua, KB ki "relationship cultivation always human-led" requirement respect hoti hai.
   - Ye plan ke audit-item **F6.1** se judta hai: ab human-review step ko future mein ek Hub-routed task/dashboard item bhi banaya ja sakta hai, sirf Discuss message tak limited nahi.

### ⚠️ Same Hub-Intake gap
`Hub-Intake` sub-workflow aur `funnel_events` table (S0–S2) abhi bane nahi hain — is module ka `workflowId` bhi `REPLACE_WITH_HUB_INTAKE_WORKFLOW_ID` placeholder hai. Hub spine banne ke baad hi end-to-end test hoga.
