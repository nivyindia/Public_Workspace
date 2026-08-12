# Module 2.4 — Proposal Generation

**Kya karta hai:** Jab koi lead `Booked` status me pahunchta hai (Module 2.3 se), Module 1.5 (Central CRM Sync) is workflow ko **Execute Workflow** se trigger karta hai. Ollama se proposal content (scope, deliverables, 3 pricing tiers, recommended tier) generate hota hai. Deal size ke hisaab se do raaste hain: chhote deals ke liye seedha **Odoo Sales Quotation** (fast, simple), bade deals (`PROPOSAL_CUSTOM_THRESHOLD_INR` se upar) ke liye **Gotenberg** se custom-branded PDF banta hai jo **Nextcloud** par store hokar public share link banta hai. Dono case me client ko email jaata hai jisme proposal link + ek "Accept" link hota hai (jo Module 2.5 ko trigger karta hai).

```
Module 1.5 → Execute Workflow (status = Booked)
        ↓
Postgres: lead ki full detail fetch karo
        ↓
Ollama: proposal draft (scope, deliverables, 3 pricing tiers, recommended tier, email intro)
        ↓
IF recommended_price >= PROPOSAL_CUSTOM_THRESHOLD_INR
   ┌───────────────────────┴───────────────────────┐
  YES (Custom)                                     NO (Simple)
   ↓                                                 ↓
Build HTML → Gotenberg (PDF)                Odoo: Sales Quotation create
   ↓                                                 ↓
Nextcloud: upload + public share link       Portal link build
   └───────────────────────┬───────────────────────┘
                            ↓
              Send Proposal Email (Postal) — includes view link + accept link
                            ↓
              Postgres: status = 'Proposal Sent', proposal_url saved
                            ↓
              Odoo Discuss: proposal sent alert
```

**Funnel me jagah:** Is module ke complete hote hi lead ka status `Proposal Sent` ho jaata hai. Module 1.5 ka existing `IF Proposal Sent` branch is stage ko already poll karta hai, lekin us branch ka असली trigger point ab **client ke "Accept" link click karne par** hona chahiye (Module 2.5 ka apna webhook), na ki sirf proposal bhejne par. Isliye 2.5 ka primary trigger ek dedicated webhook hai (README 2.5 dekho) — 1.5 ka Proposal Sent branch ko safety-net/reminder ke roop me treat karo.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. Is workflow ka ID copy karke `1.5-central-crm-sync/workflow.json` ke naye `IF Booked` branch (`Execute Workflow - 2.4 Proposal Generation`) me daalo — 1.5 README ka updated section dekho

## Setup Karne Se Pehle

### 1. `clients_master` me naya column add karo
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS proposal_url TEXT;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS odoo_partner_id INTEGER;
```
`odoo_partner_id` abhi optional hai (fallback env var use hoti hai) — future me jab lead Odoo me Contact/Customer banta hai, us step me ye column populate karna better rahega.

### 2. Environment Variables (naye)
| Variable | Kya daalna hai |
|---|---|
| `PROPOSAL_CUSTOM_THRESHOLD_INR` | Is se upar recommended-tier price ho to custom-branded PDF banega (default assume `150000` agar set nahi hai) |
| `ODOO_FALLBACK_PARTNER_ID` | Odoo me ek generic/placeholder Contact ka ID (jab tak `odoo_partner_id` per-lead available nahi hai) |
| `GOTENBERG_URL` | Self-hosted Gotenberg instance ka base URL |
| `NEXTCLOUD_URL` | Self-hosted Nextcloud ka base URL |
| `PROPOSAL_ACCEPT_BASE_URL` | Aapke n8n instance ka public base URL (jaise `https://n8n.yourdomain.com`) — accept-link banane ke liye |

### 3. Nextcloud credential
n8n me **Credentials → New → HTTP Basic Auth** — naam `Nextcloud WebDAV` — Nextcloud app-password use karo (regular login password nahi). Ek `Proposals` folder Nextcloud me pehle se bana lo.

### 4. Gotenberg node — binary conversion
Node 9 (`Gotenberg - HTML to PDF`) ko HTML content ek binary file (`index.html` naam se) ke roop me chahiye. `Build Proposal HTML` (Node 8) ke baad ek **Convert to File** node add karo jo `proposal_html` field ko binary `index_html` me convert kare, tabhi Gotenberg node kaam karega — ye ek chhota extra step hai jo import ke baad manually wire karna hoga (n8n ka binary-conversion UI se karna easier hai JSON me hardcode karne se).

### 5. Postgres, Odoo, Postal
Wahi jo pehle ke modules me use kiye.

## Test Kaise Kare

1. Ek test lead ka `clients_master.status` manually `'Booked'` set karo
2. Workflow ko manually **Execute Workflow** se run karo, input me `{ "odoo_lead_id": <id> }` do
3. Chhoti pricing wale lead ke liye: Odoo → Sales me naya Quotation dikhna chahiye
4. Bade pricing wale lead ke liye (`recommended_price` threshold se upar force karne ke liye test data adjust karo): Nextcloud me PDF upload hona chahiye aur share link banna chahiye
5. Email aaya confirm karo — dono links (view + accept) kaam kar rahe hon
6. `clients_master.status` = `'Proposal Sent'` aur `proposal_url` populate hua confirm karo

## Known Limitations (v1)

- Pricing pura Ollama-generated hai — real deployment me ek fixed **rate card** (JSON/Postgres table) se pricing fetch karna zyada reliable hoga, Ollama ko sirf phrasing/scope ke liye use karo (data-quality flag: abhi pricing AI-hallucinated ho sakti hai, launch se pehle rate card banwana zaroori)
- Simple-path portal link (`/my/orders/{id}`) tabhi kaam karega jab lead ka Odoo Contact portal-access enabled ho — nahi to client ko login wall dikhega. Access-token-based no-login link banane ke liye ek extra Odoo read call chahiye (v2)
- Gotenberg binary-conversion step manual wiring maangta hai (upar point 4 dekho) — import ke turant baad workflow run nahi hogi jab tak ye step add na ho
- `ODOO_FALLBACK_PARTNER_ID` placeholder hai — jab tak per-lead `odoo_partner_id` sahi se populate nahi hota, saare simple-quotations ek hi generic contact ke naam par banenge (launch-blocker: real customer records se link karna zaroori hai before going live)
