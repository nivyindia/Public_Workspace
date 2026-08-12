# Module 1.4 — Inbound Form Qualification

**Kya karta hai:** Jab bhi koi naya lead form submit hota hai (Typebot via Module 1.3, ya direct Odoo Website Form), ye workflow Ollama se lead ko score karwata hai (hot / warm / cold + reason), Odoo lead ki priority update karta hai, aur score ke hisaab se route karta hai — hot lead par sales team ko turant Discuss alert milta hai, sabko auto-response email jaata hai.

```
Lead event → Webhook (n8n)
        ↓
clients_master me lead already hai? (1.3 se aaya)
   ├── Haan → wahi data use karo
   └── Nahi → seedha Odoo Website Form ke webhook body se fields banao
        ↓ (dono merge)
Ollama: score karo (hot/warm/cold + reason + next step)
        ↓
Postgres: clients_master update (status = Qualified)
        ↓
Odoo: lead priority update (JSON-RPC write)
        ↓
   IF hot → Odoo Discuss alert + auto-response email
   ELSE   → sirf auto-response email
```

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Credentials/placeholders set karo (neeche dekho)
3. Workflow **Active** karo

## Setup Karne Se Pehle

### 1. Do jagah se is webhook ko trigger karna hai

**Source A — Module 1.3 (Typebot leads):** 1.3 workflow ke end me ek extra HTTP Request node add kar sakte ho jo is workflow (1.4) ke webhook URL ko `{ odoo_lead_id }` bhejta hai. (Abhi 1.3 seedha respond kar deta hai — agar chaho to 1.3 ke "Respond to Typebot" node se pehle ek parallel branch me is 1.4 webhook ko bhi call kara sakte ho.)

**Source B — Direct Odoo Website Form submissions:** Odoo me **Settings → Technical → Automation Rules** khol ke ek naya rule banao:
- Model: `crm.lead`
- Trigger: **On Creation**
- Action: **Execute Code** (Python) ya **Webhook** action type — is workflow ka Production URL (`.../lead-qualification`) call karo, body me `{ odoo_lead_id, name, email_from, phone, partner_name, description }` bhejo

### 2. Postgres credential
Same `Odoo Postgres` credential jo 1.1/1.2/1.3 me use kiya.

### 3. Ollama
`qwen2.5:7b` pulled hona chahiye; alag server hai to Node 6 (`Ollama - Score Lead`) ka URL update karo.

### 4. Odoo API — Environment Variables

| Variable | Kya daalna hai |
|---|---|
| `ODOO_URL`, `ODOO_DB`, `ODOO_UID`, `ODOO_API_KEY` | Wahi jo Module 1.3 me use kiye (README 1.3 dekho) |
| `ODOO_DISCUSS_CHANNEL_ID` | Sales team ke Discuss channel ka numeric ID |

### 5. Postal SMTP credential (auto-response email ke liye)
- n8n → Credentials → New → **SMTP**
- Postal ke SMTP host/port/username/password daalo
- Name: `Postal SMTP` (workflow me isi naam se reference hai)
- Environment Variables: `OUTREACH_FROM_EMAIL`, `CALCOM_BOOKING_LINK`

## Test Kaise Kare

1. Ek test lead Typebot se ya Odoo Website Form se submit karo
2. n8n execution log check karo — `IF Lead Already in clients_master` kis branch se gaya
3. Ollama ka score output valid JSON hai ya nahi confirm karo
4. Odoo CRM me lead ki priority (stars) update hui ya nahi dekho
5. Agar score = hot aaya, Discuss channel me alert message aaya ya nahi check karo
6. Test email inbox me auto-response aaya ya nahi confirm karo

## Known Limitations (v1)

- `IF Lead Already in clients_master` sirf `odoo_lead_id` match karta hai — agar webhook body me ye field missing aaya (kisi galat automation rule config ki wajah se) to fallback branch fire hoga lekin kuch fields empty rah sakte hain
- Score sirf ek baar calculate hota hai is workflow run me — agar lead baad me apna message update kare (dusra form submit) to re-scoring ke liye ye workflow dobara manually trigger karna padega (v2 me "on lead update" automation rule add kar sakte hain)
- `mail.channel` model ka naam Odoo version ke hisaab se `discuss.channel` bhi ho sakta hai (Odoo 17+ me rename hua tha) — apne Odoo version ke hisaab se Node 11 (`Odoo Discuss - Alert Sales Team`) me model name confirm/update kar lena
