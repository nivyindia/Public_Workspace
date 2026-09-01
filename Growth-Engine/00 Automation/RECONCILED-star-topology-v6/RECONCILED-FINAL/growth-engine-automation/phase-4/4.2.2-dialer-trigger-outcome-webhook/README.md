# 4.2.2 — Dialer Trigger + Outcome Webhook

## Kya karta hai
Do independent entry points ek hi workflow mein:
1. **Dialer Trigger** (Hub-Dispatcher se `calllist.ready` event ke through call-list receive karta hai — pehle 4.2.1 seedha call karta tha, ab star-topology convention follow karta hai) → har lead ko VICIdial campaign mein queue karta hai (`non_agent_api.php`). **Call khud human agent karta hai** — ye node sirf lead ko dialer-queue mein daalta hai, auto-dial nahi karta (jaisa Sales Funnel Stage 18 khud confirm karta hai: cold calling sirf queue/logging automate ho sakti hai, call nahi).
2. **Outcome Webhook** — VICIdial ke post-call disposition-webform se call outcome receive karta hai, signature/idempotency check karta hai, `clients_master` update karta hai (outcome, attempt count, aur agar outcome = DNC to `call_dnc = true` turant).

## Import
1. n8n → Workflows → Import from File → `workflow.json`
2. Credential attach: `Odoo Postgres`
3. Webhook URL note karo (path: `/webhook/call-outcome`) — VICIdial admin panel mein "Web Form Integration" ke against ye URL set karna hoga.
4. Import ke baad iska workflow ID Hub-Dispatcher ke `Execute Workflow - 4.2.2 Dialer Trigger` node ke `workflowId` field mein daalo (`REPLACE_WITH_4.2.2_DIALER_TRIGGER_WORKFLOW_ID` placeholder ki jagah) — 4.2.1 mein ab kuch import-order dependency nahi hai, wo sirf Hub-Intake ka ID jaanta hai.

## Star-Topology Note (S7a.1-fix)
Trigger node ab `From Hub-Dispatcher (calllist.ready)` hai (pehle "From Module 4.2.1 (Call-List)" tha, 4.2.1 seedha Execute Workflow se call karta tha). Dispatcher poori `funnel_events` row pass-through karta hai (sirf module-specific data spoke-agnostic nahi hota), isliye `Split Out Call List` node ab `call_list` (top-level) ki jagah `payload.call_list` (nested) padhta hai.

## Setup
1. Migration chalao (`../migration/001_phase4_sms_calling_schema.sql`) — same file jo 4.1.3/4.2.1 use karte hain, `webhook_events` idempotency table bhi isi mein hai.
2. **⚠️ INPUT NEEDED — VICIdial/Asterisk production config** (per `Supprting_files.txt` §23, "Do not invent carrier settings"):
   - `VICIDIAL_URL`, `VICIDIAL_SOURCE`, `VICIDIAL_USER`, `VICIDIAL_PASS`, `VICIDIAL_CAMPAIGN_LIST_ID`
   - VICIdial-side: SIP trunk/provider, caller IDs, phone numbers, call recording policy, campaign/agent config, calling hours, compliance rules — ye sab VICIdial/Asterisk admin panel mein configure hote hain, n8n ke bahar.
3. `CALL_OUTCOME_WEBHOOK_SECRET` env var set karo (random string) — VICIdial ke Web Form Integration URL mein `?secret=<same-value>` query-param add karo.
4. VICIdial disposition-webform field names (`status`/`vendor_lead_code`/`uniqueid` etc.) apne actual VICIdial webform-template se verify karo — "Parse Outcome Payload" node mein ye field-names hardcoded hain, adjust kar sakte ho.

## Test
1. **Dialer side:** 4.2.1 manually execute karo (isse ek `calllist.ready` funnel_events row banegi, Dispatcher agle cycle mein route karega) — ya is workflow ko standalone pinned-data ke saath execute karo (`{ payload: { call_list: [...] } }` shape ke saath), confirm karo VICIdial mein lead add ho gaya aur `clients_master.call_attempts` increment hua.
2. **Outcome side:** Postman/curl se ek fake POST bhejo `/webhook/call-outcome` par (sahi `secret` ke saath) — confirm `clients_master.last_call_outcome` update hua aur `webhook_events` mein ek row bani.
3. Same request dobara bhejo (same `uniqueid`) — response "OK (duplicate, already processed)" aana chahiye, `clients_master` dobara update NAHI hona chahiye (idempotency check).
4. Galat `secret` ke saath bhejo — 401 aana chahiye.

## Known Limitations
- VICIdial ka webform-post native HMAC signature support nahi karta (payment-gateway jaisa) — isliye shared-secret query-param pattern use kiya hai, jo tracker ke §16.2 standard se ek chhota deviation hai (usme HMAC-SHA256 recommend hai). Agar VICIdial version HMAC support karta ho to upgrade kar sakte ho.
- `webhook_events` table Phase 3.0 ke patches ke saath SHARED hai — agar dono ek hi Postgres DB par import ho rahe hain to koi conflict nahi (dono `CREATE TABLE IF NOT EXISTS` use karte hain), lekin import-order/DB-target consistent rakhna.
- Calling-compliance (calling hours, recording consent, do-not-call escalation) ka poora enforcement VICIdial/Asterisk-side config par depend karta hai, n8n workflow sirf queue/log karta hai.
