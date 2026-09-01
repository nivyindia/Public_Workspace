# 4.1.3 — SMS Re-engagement

## Kya karta hai
Roz 10AM ek batch (max 50) inactive leads ko re-engagement SMS bhejta hai — **lekin sirf un leads ko jinke saath pehle se koi transactional/consented relationship hai** (already onboarded/active client, churn-risk client, ya jo pehle kabhi SMS par reply kar chuka hai). Cold / first-touch leads ko ye workflow **kabhi** SMS nahi bhejta.

**Ye scoping jaanbujh kar tight rakhi gayi hai** — tumhare apne tracker document (`N8N-MASTER-FULL-FUNNEL-WORKFLOW-AND-PROGRESS-TRACKER.md`, §16.4) mein explicitly likha tha ki agar consented list na ho to ye step "blocked rehna chahiye, general lead list ke against unsafe tareeke se nahi banana chahiye." Maine ise isi rule ke andar banaya hai, block nahi kiya — kyunki tumhare paas already `status` field se ek proxy-consent signal maujood hai (Onboarded/Active/Churn Risk = existing client relationship).

## Import
1. n8n → Workflows → Import from File → `workflow.json`
2. Credential attach karo: `Odoo Postgres` (existing credential, dropdown se select karo)

## Setup
1. **Migration pehle chalao:** `../migration/001_phase4_sms_calling_schema.sql` — `sms_opt_out`, `active_sequence_suppressed`, `last_sms_sent_at` columns add karta hai.
2. **⚠️ INPUT NEEDED — Jasmin SMS Gateway credentials** (env vars, n8n → Settings → Variables):
   - `JASMIN_HTTP_API_URL`
   - `JASMIN_SYSTEM_ID`
   - `JASMIN_PASSWORD`
   - `JASMIN_SOURCE_ADDR`
   
   Ye Jasmin server-side hi decide honge (SMPP host/port/carrier tumhare Jasmin instance ki config hai, isse alag). `Supprting_files.txt` §22 ke mutabik in sabke bina production mein SMS jaa hi nahi sakta — is workflow ko import karne se pehle Jasmin instance already deployed aur ek carrier se SMPP-connected hona chahiye.
3. `CALCOM_BOOKING_LINK` env var (already existing convention se reuse hoga).
4. Thresholds jo maine default rakhe hain, apne cadence ke hisaab se confirm/adjust karo:
   - Inactive threshold: 30 din se koi update nahi
   - Re-send cooldown: 90 din
   - Batch size: 50/din

## Test
1. Ek test lead ko manually `status = 'Onboarded'`, `sms_opt_out = false`, `phone = <apna test number>` set karo, `last_sms_sent_at = NULL` rakho.
2. Workflow ko manually execute karo — SMS aana chahiye, `last_sms_sent_at` update hona chahiye.
3. Dobara turant execute karo — is baar lead query se hi exclude ho jani chahiye (suppress-repeat check).

## Known Limitations
- Jasmin HTTP API ke exact param names (`username`/`password`/`to`/`from`/`content`) Jasmin ke standard documented `/send` endpoint se match karte hain — lekin apne Jasmin version ke against verify zaroor karo, minor version differences ho sakte hain.
- STOP/opt-out reply handling **iss module mein nahi hai** — agar lead "STOP" reply kare, use `sms_opt_out = true` set karne wala koi listener abhi nahi hai (Jasmin ki inbound-SMS webhook side alag se wire karni hogi — ye Module 4.3 Unified Reply Tracker ke scope mein aana chahiye, isse jorna baaki hai).
- External NDNC (India telecom DNC registry) check nahi hai — sirf internal `sms_opt_out` flag honor hoti hai.
