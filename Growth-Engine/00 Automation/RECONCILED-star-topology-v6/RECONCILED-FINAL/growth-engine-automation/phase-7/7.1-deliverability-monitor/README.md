# Module 7.1 — Deliverability / Domain Health Monitor

## Kya karta hai
Daily Postal ke send-stats check karta hai, bounce/complaint rate calculate karta hai, threshold cross hone par Odoo Discuss alert deta hai.

## ⚠️ Assumptions
- **Thresholds:** bounce rate >5%, complaint rate >0.1% — industry-standard defaults hain, KB mein specific number nahi tha.
- **Postal API endpoint path** version-dependent hai — deploy karte waqt confirm karna, exact path badal sakta hai.

## Known Limitations
- SPF/DKIM/DMARC record health khud check nahi karta (sirf send-stats) — agar DNS-record-level monitoring bhi chahiye, wo alag node (external DNS-check API) hoga.

## S6.11 — Star Topology addition (this update)

7.1 ka apna natural trigger hai (Daily 6AM Postal stats poll) — module-to-module mesh ka hissa kabhi nahi tha, isliye **trigger unchanged** rakha. Plan (S6.11) sirf ek naya Hub-report add karne ko kehta hai:

1. **`Report to Hub - Deliverability Alert`** naya node, `Odoo Discuss - Deliverability Alert` ke baad chain mein, **sirf over-threshold (IF-true) branch par**. `event_type: deliverability.alert` report karta hai. `client_id` yahan `null` hai kyunki ye ek account-wide alert hai (kisi specific client se link nahi), payload mein bounce/complaint rates carry hoti hain.
2. Ye **audit ke §2.1/§3.4 "unwired branch" finding ka fix bhi hai** — pehle ye alert sirf Odoo Discuss tak jaata tha aur system ke baaki hisse mein kahi wire nahi tha; Hub-report add karna hi wo fix hai (jaisa plan ne khud combine karke bola hai).
3. IF node ka false (not-over-threshold) branch **intentionally empty rakha** — plan isko touch nahi karta, kuch action nahi chahiye jab threshold cross na ho.

### ⚠️ Same Hub-Intake gap
`Hub-Intake` sub-workflow aur `funnel_events` table (S0–S2) abhi bane nahi hain — `workflowId` placeholder (`REPLACE_WITH_HUB_INTAKE_WORKFLOW_ID`) hai. Hub spine banne ke baad end-to-end test hoga.
