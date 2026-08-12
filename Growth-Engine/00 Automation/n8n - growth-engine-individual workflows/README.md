# Nivy Automated Funnel — n8n Workflows

Ye folder poore funnel ke ab tak ke **importable n8n workflows** rakhta hai — plan document (`n8n-Automated-Funnel-Plan.md`) ka implementation.

## Phase 1 — Marketing Engine (Traffic → Qualified Lead)

| Module | Folder | Status |
|---|---|---|
| 1.1 — Content → Social Factory | `growth-engine-automation/phase-1/1.1-content-social-factory/` | ✅ Built (import + configure ready) |
| 1.2 — SEO Automation (Weekly) | `growth-engine-automation/phase-1/1.2-seo-automation/` | ✅ Built (import + configure ready) |
| 1.3 — Website Lead Capture | `growth-engine-automation/phase-1/1.3-website-lead-capture/` | ✅ Built (import + configure ready) |
| 1.4 — Inbound Form Qualification | `growth-engine-automation/phase-1/1.4-inbound-form-qualification/` | ✅ Built (import + configure ready) |
| 1.5 — Central CRM Sync | `growth-engine-automation/phase-1/1.5-central-crm-sync/` | ✅ Built (import + configure ready) |

Phase 1 (1.1 → 1.5) **complete** hai.

## Phase 2 — Sales + Delivery Engine (Lead → Paying Client → Delivery)

| Module | Folder | Status |
|---|---|---|
| 2.1 — Multi-channel Outreach | `growth-engine-automation/phase-2/2.1-multichannel-outreach/` | ✅ Built (import + configure ready) |
| 2.2 — Nurture Sequence | `growth-engine-automation/phase-2/2.2-nurture-sequence/` | ✅ Built (import + configure ready) |
| 2.3 — Booking Sync | `growth-engine-automation/phase-2/2.3-booking-sync/` | ✅ Built (import + configure ready) |
| 2.4 — Proposal Generation | `growth-engine-automation/phase-2/2.4-proposal-generation/` | ✅ Built (import + configure ready) |
| 2.5 — Contract + E-sign | `growth-engine-automation/phase-2/2.5-contract-esign/` | ✅ Built (import + configure ready) |
| 2.6 — Invoice + Payment | `growth-engine-automation/phase-2/2.6-invoice-payment/` | ✅ Built (import + configure ready) |
| 2.7 — Client Onboarding | `growth-engine-automation/phase-2/2.7-client-onboarding/` | ✅ Built (import + configure ready) |
| 2.8 — Delivery + Reporting | `growth-engine-automation/phase-2/2.8-delivery-reporting/` | ✅ Built (import + configure ready) |
| 2.9 — Renewal + Revenue Ops | `growth-engine-automation/phase-2/2.9-renewal-revenue-ops/` | ✅ Built (import + configure ready) |

Phase 2 (2.1 → 2.9) ab **complete** hai — poora funnel plan (traffic se lekar renewal tak) ab importable workflows me ban chuka hai.

**Zaroori:** Har module import karne ke baad uska workflow ID copy karke jahan bhi placeholder hai wahan daalo, taaki chain actually live ho jaaye (Master Plan Section 5.2):
- `2.1` ka ID → `1.5-central-crm-sync/workflow.json` ke `Execute Workflow - 2.1 Outreach` node me
- `2.4` ka ID → `1.5-central-crm-sync/workflow.json` ke `Execute Workflow - 2.4 Proposal Generation` node me
- `2.5` ka ID → `1.5-central-crm-sync/workflow.json` ke `Execute Workflow - 2.5 Contract E-sign` node me
- `2.6` ka ID → `2.5-contract-esign/workflow.json` ke `Execute Workflow - 2.6 Invoice + Payment` node me
- `2.7` ka ID → `2.6-invoice-payment/workflow.json` me naya **Execute Workflow** node add karke daalo (abhi wahan placeholder node nahi hai — `2.7-client-onboarding/README.md` ke "Wiring" section me exact steps hain)

## Common Setup (sabhi modules ke liye zaroori)

Sab modules 2 cheezein share karte hain — pehle inhe ek baar setup kar lo:

### 1. n8n me Postgres credential banao
- **Credentials → New → Postgres**
- Odoo instance ki database ke connection details daalo (Host, Port, Database name, User, Password)
- Name: `Odoo Postgres` (sab workflows me isi naam se reference hai)

### 2. `clients_master` control table banao (ek baar, Postgres par)
```sql
CREATE TABLE clients_master (
  id SERIAL PRIMARY KEY,
  odoo_lead_id INTEGER UNIQUE,
  name TEXT,
  email TEXT,
  phone TEXT,
  company TEXT,
  service_type TEXT,
  intent_summary TEXT,
  urgency TEXT,
  score TEXT,
  score_reason TEXT,
  source TEXT,
  status TEXT DEFAULT 'New',
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);
```
Ye Master Plan ke Section 5.1 wala central sync table hai — Module 1.3, 1.4, aur 1.5 sab isi ko read/write karte hain.

### 3. Ollama server chalu rakho
```bash
ollama serve
ollama pull qwen2.5:7b
```
Sab workflows `http://localhost:11434` assume karte hain — agar Ollama alag machine/container par hai to har workflow ke HTTP nodes me URL update karna hoga.

### 4. Odoo API access (Modules 1.3, 1.4, 1.5 ke liye)
n8n → Settings → Variables me ye set karo:

| Variable | Kya daalna hai |
|---|---|
| `ODOO_URL` | Odoo instance ka base URL |
| `ODOO_DB` | Odoo database ka naam |
| `ODOO_UID` | API user ka internal user ID |
| `ODOO_API_KEY` | Odoo → Settings → Users → API Key |
| `ODOO_DISCUSS_CHANNEL_ID` | Sales team ke Discuss channel ID |
| `ODOO_LINKEDIN_ACTIVITY_TYPE_ID` | Odoo Activity Type ID (Module 2.1 ke LinkedIn task ke liye) |
| `ODOO_SALES_USER_ID` | Sales rep ka Odoo user ID (Module 2.1 ke LinkedIn task assignee) |
| `WAHA_URL`, `WAHA_API_KEY`, `WAHA_SESSION` | Waha WhatsApp gateway details (Module 2.1, 2.2 ke liye) |
| `PROPOSAL_CUSTOM_THRESHOLD_INR` | Is se upar recommended-tier price ho to custom-branded PDF banega (Module 2.4) |
| `ODOO_FALLBACK_PARTNER_ID` | Generic/placeholder Odoo Contact ID jab tak per-lead `odoo_partner_id` available nahi (Module 2.4, 2.6) |
| `GOTENBERG_URL` | Self-hosted Gotenberg base URL (Module 2.4) |
| `NEXTCLOUD_URL` | Self-hosted Nextcloud base URL (Module 2.4) |
| `PROPOSAL_ACCEPT_BASE_URL` | n8n instance ka public base URL — accept/webhook links banane ke liye (Module 2.4, 2.5) |
| `DOCUMENSO_API_URL`, `DOCUMENSO_API_KEY`, `DOCUMENSO_CONTRACT_TEMPLATE_ID` | Self-hosted Documenso details (Module 2.5) |
| `ODOO_WON_STAGE_ID` | Odoo CRM "Won" stage ki internal ID (Module 2.5) |
| `ODOO_DELIVERY_TEAM_PARTNER_IDS` | Odoo partner IDs ka JSON array — delivery team jo har client Discuss channel me default add hoti hai (Module 2.7) |
| `METABASE_URL`, `METABASE_API_KEY`, `METABASE_CLIENT_CARD_ID`, `METABASE_CLIENT_DASHBOARD_PUBLIC_UUID` | Self-hosted Metabase details — saved question + public dashboard (Module 2.8) |
| `ODOO_RENEWAL_ACTIVITY_TYPE_ID` | Odoo Activity Type ID renewal-call activity ke liye (Module 2.9) |

Naye credentials bhi chahiye: **Nextcloud WebDAV** (HTTP Basic Auth, Module 2.4 aur 2.7 dono me reuse hoti hai).

## Import Order

1. `1.1-content-social-factory/workflow.json` — import, README follow karo, test karo
2. `1.2-seo-automation/workflow.json` — import, README follow karo, test karo
3. `1.3-website-lead-capture/workflow.json` — import, Typebot webhook connect karo, test karo
4. `1.4-inbound-form-qualification/workflow.json` — import, Odoo Automation Rule connect karo, test karo
5. `2.1-multichannel-outreach/workflow.json` — import, credentials set karo, workflow ID copy karo
6. `2.2-nurture-sequence/workflow.json` — import, README follow karo, test karo
7. `2.3-booking-sync/workflow.json` — import, Cal.com webhook connect karo, test karo
8. `2.6-invoice-payment/workflow.json` — import, credentials set karo, workflow ID copy karo (2.5 isko call karta hai)
9. `2.5-contract-esign/workflow.json` — import, Documenso setup karo, workflow ID copy karo (Step 8 ka 2.6 ID isme daalo), 2.4 se link hoga
10. `2.4-proposal-generation/workflow.json` — import, Gotenberg binary-conversion step wire karo (README dekho), workflow ID copy karo
11. `1.5-central-crm-sync/workflow.json` — sabse last import karo — ab is workflow ke `Execute Workflow - 2.1 Outreach`, `Execute Workflow - 2.4 Proposal Generation`, `Execute Workflow - 2.5 Contract E-sign` nodes me Steps 5/9/10 ke workflow IDs daal do
12. `2.7-client-onboarding/workflow.json` — import, credentials set karo, workflow ID copy karke `2.6-invoice-payment/workflow.json` me manually Execute Workflow node add karo (README ke "Wiring" section dekho)
13. `2.8-delivery-reporting/workflow.json` — import, Metabase saved question + public dashboard setup karo, Active karo (cron khud chalega)
14. `2.9-renewal-revenue-ops/workflow.json` — import, `renewal_date` column populate karne ka process decide karo, payment-gateway failed-payment webhook connect karo, Active karo

Har module ke apne folder me detailed README hai (credentials, placeholders, test steps, known limitations).

## Master Plan File

Poora funnel plan, tool stack, aur progress tracker `n8n-Automated-Funnel-Plan.md` me hai — us file ke Section 9 me progress tracker update kiya gaya hai (1.1–1.5 aur 2.1–2.9 sab ✅ Done — poora funnel ab built hai).

## Launch-Readiness Blockers (in modules ko live karne se pehle)

Ye woh cheezein hain jo abhi placeholder/assume kiya gaya hai — har module ke README ke "Known Limitations" me detail hai, yahan sirf summary:

- **Pricing** (Module 2.4): Ollama-generated hai, ek fixed rate card se replace karna chahiye — abhi AI-hallucinated numbers client ko ja sakte hain
- **Contact/Partner linking** (Module 2.4, 2.6): `odoo_partner_id` per-lead abhi populate nahi hota, fallback generic contact use ho raha hai — real Odoo Contacts se link karna zaroori hai
- **Security** (Module 2.5 accept-link, Module 2.6 payment webhook): dono par abhi koi signature/token verification nahi hai — production se pehle add karna zaroori hai
- **Gotenberg wiring** (Module 2.4): binary-conversion step import ke baad manually wire karna hoga, warna custom-proposal path fail hoga
- **Odoo portal access** (Module 2.4, 2.6): payment/proposal links tabhi login-less kaam karenge jab Contacts ka portal access properly configured ho
- **2.6 → 2.7 wiring pending**: Module 2.6 me abhi Module 2.7 ko call karne wala Execute Workflow node manually add karna hai (README 2.7 dekho) — tab tak onboarding auto-trigger nahi hoga
- **`renewal_date` auto-population nahi hai** (Module 2.9): abhi manually set karna padega, warna renewal reminders aur churn detection kaam nahi karenge
- **Failed-payment webhook signature verification missing** (Module 2.9, same class of issue as Module 2.6's payment webhook) — production se pehle add karna zaroori hai
- **Metabase PDF export nahi hai** (Module 2.8): Community edition me API se PDF nahi milta, v1 me public dashboard link bhej rahe hain instead — sensitive data ho to signed/embedded link me upgrade karo launch se pehle
