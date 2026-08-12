# Module 2.3 — Booking Sync

**Kya karta hai:** Jab koi lead Cal.com par meeting book (ya cancel) karta hai, Cal.com webhook se ye workflow trigger hota hai. Booking confirm hone par: `clients_master` me lead ka email match karke uska status `Booked` set karta hai, Odoo me ek Calendar Event bana deta hai (CRM opportunity se linked, agar lead already convert ho chuki ho), aur team ko Discuss par notify karta hai. Cancel hone par lead ko wapas nurture drip (Module 2.2) me daal deta hai taaki reschedule follow-up ho.

```
Cal.com Webhook (BOOKING_CREATED / BOOKING_CANCELLED)
        ↓
Normalize Payload (attendee email, time, meeting link)
        ↓
   IF Cancelled?
   ┌───────────────┴───────────────┐
  YES                              NO
   ↓                                ↓
Postgres: status = 'Nurtured'   Postgres: find lead by email
(reset nurture_step)                 ↓
   ↓                            Odoo: create Calendar Event
Odoo Discuss: cancel alert          ↓
   └───────────────┬───────────────┘  Postgres: status = 'Booked'
                    ↓                       ↓
              Respond 200 OK          Odoo Discuss: booking confirmed
```

**Funnel me jagah:** Ye module Master Plan ke 19-stage funnel me "Booked" stage set karta hai. Module 1.5 (Central CRM Sync) is stage ko poll karke — jab `status = 'Booked'` ho jaata hai — Module 2.4 (Proposal Generation) ko automatically trigger kar deta hai. Isliye is module ko active karne ke baad 1.5 ka "IF Booked" branch bhi update karna hai (neeche dekho).

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. Is workflow ka ID copy karke `1.5-central-crm-sync/workflow.json` ke naye `IF Booked` branch me daalna zaroori nahi hai (2.3 khud CRM stage change se trigger nahi hota — ye seedha Cal.com se trigger hota hai). Lekin is workflow ke **is** node se pehle Cal.com side setup zaroor karo.

## Setup Karne Se Pehle

### 1. Cal.com Webhook
- Cal.com → **Settings → Developer → Webhooks → New Webhook**
- Payload URL: is workflow ke `Cal.com Booking Webhook` node ka **Production URL** (path: `calcom-booking`)
- Event triggers: `BOOKING_CREATED` aur `BOOKING_CANCELLED` dono select karo
- Agar Cal.com webhook secret set kiya hai, to Node 1 me ek Header-based signature check add kar sakte ho (v1 me skip kiya hai, README ke Known Limitations me note hai)

### 2. Postgres, Odoo API credentials
Wahi jo pehle ke modules me use kiye — `Odoo Postgres` credential, aur `ODOO_URL`, `ODOO_DB`, `ODOO_UID`, `ODOO_API_KEY`, `ODOO_DISCUSS_CHANNEL_ID` environment variables (README top-level dekho).

### 3. Lead-to-Opportunity mapping
`Odoo - Create Calendar Event` node me `opportunity_id` sirf tab set hoga jab lead pehle se Odoo CRM me convert ho chuki hai aur `clients_master.odoo_lead_id` us CRM record ki ID hai. Agar Typebot/form se aane wale saare leads already Module 1.3/1.4 se CRM me create ho rahe hain (jo Phase 1 me set kiya tha), to ye automatically match ho jaayega.

## Test Kaise Kare

1. Cal.com par khud se ek test booking karo, us email se jo `clients_master` me already ek test row ke roop me maujood hai
2. Confirm karo `clients_master` me us lead ka `status = 'Booked'` ho gaya
3. Odoo → Calendar me naya event dikhna chahiye
4. Discuss channel me "New booking confirmed" alert aana chahiye
5. Us booking ko cancel karo, confirm karo status wapas `Nurtured` ho gaya aur "Booking CANCELLED" alert aaya

## Known Limitations (v1)

- Webhook signature verify nahi ho raha — production me Cal.com ka `X-Cal-Signature-256` header check add karna recommend hai (Code node me HMAC verify)
- Agar booking ka email `clients_master` me match nahi karta (koi outside/unknown lead ne directly Cal.com link se book kar diya), to Postgres update 0 rows affect karega aur Calendar Event bhi `opportunity_id: false` ke saath banega (CRM se unlinked) — is case ko catch karke naya lead auto-create karna v2 improvement hai
- `start`/`stop` datetime conversion simple string-replace se ho raha hai (ISO 8601 → Odoo naive datetime) — agar Odoo instance ka timezone UTC nahi hai, to timezone offset manually handle karna hoga
