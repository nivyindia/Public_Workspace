# 4.2.1 — DNC Filter + Call-List Prep

## Kya karta hai
Har weekday 9AM `clients_master` se callable leads (Hot/Warm score, phone maujood, internal DNC flag na ho) nikaalta hai, optional external NDNC-registry check karta hai (agar wire kiya ho), VICIdial-ready call-list format banata hai, aur **Hub ko `calllist.ready` event report karta hai** (Module 4.2.2 ko ab seedha nahi bulata — star-topology convention follow karta hai, Hub-Dispatcher route karta hai).

## Import
1. n8n → Workflows → Import from File → `workflow.json`
2. Credential attach: `Odoo Postgres`
3. "Report to Hub" node open karke `workflowId` field mein Hub-Intake (0.0) ka actual n8n workflow ID daalo — 4.2.2 ka ID yahan nahi chahiye, sirf Hub-Intake ka.

## Star-Topology Note (S7a.1-fix)
Pehle ye module seedha `Execute Workflow - 4.2.2 Dialer Trigger` node se 4.2.2 ko call karta tha — ek spoke→spoke direct link, jo star-topology pattern violate karta tha (S7a.1 grep audit me pakda gaya). Ab `Build Call-List (VICIdial format)` ke baad `Report to Hub` fire hota hai: `event_type: calllist.ready`, `client_id`/`odoo_lead_id` dono `null` (kyunki ye ek batch hand-off hai — poore call_list array ke saath, single lead ka context nahi), `payload: { call_list, count, generated_at }`. Hub-Dispatcher ab `calllist.ready` ko 4.2.2 tak route karta hai.

## Setup
1. Migration chalao (`../migration/001_phase4_sms_calling_schema.sql`) — `call_dnc`, `call_attempts`, `last_call_at` columns.
2. **External DNC registry lookup node optional hai** — agar tumhare paas India NDNC (TRAI) registry check karne wala koi subscribed API nahi hai, to `NDNC_REGISTRY_API_URL` env var ko empty/unset chhod do; node automatically internal-only DNC (clients_master.call_dnc) par fallback karega. Jab bhi ye API decide ho, sirf env var set karne se activate ho jayega, code change nahi chahiye.
3. Cadence defaults (⚠️ confirm karo): max 5 attempts/lead, 3-din cooldown beech mein, 100 leads/batch.

## Test
1. Ek test lead `score='Hot'`, `status='Qualified'`, `call_dnc=false`, valid `phone` ke saath banao.
2. Manually execute karo — call-list output mein test lead dikhna chahiye, aur `funnel_events` mein ek `calllist.ready` row insert honi chahiye (`payload.call_list` mein test lead ke saath). Dispatcher wired hai to phir agla 2-minute cycle mein 4.2.2 tak route ho jaayega, VICIdial add-lead call trigger karke.
3. Ek doosra test lead `call_dnc=true` ke saath banao — wo call-list mein NAHI aana chahiye.

## Known Limitations
- External NDNC registry integration sirf placeholder hai — ⚠️ INPUT NEEDED: kaunsa provider/API use karna hai, tracker mein bhi ye open item hai.
- "Calling hours" window abhi sirf cron-day-of-week (weekday-only) tak limited hai — specific hour-range (e.g. 10AM-6PM local time only) enforce nahi karta abhi; agar zaroori ho to IF-node add karna hoga.
