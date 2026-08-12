# Module 1.3 — Website Lead Capture

**Kya karta hai:** Website par jab visitor Typebot widget se chat karke apna detail deta hai, tab Typebot ek webhook call karta hai. n8n us data ko normalize karta hai, Ollama se visitor ke message ko classify karwata hai (SEO / AI Automation / VA / Design / Video / Other + urgency), aur Odoo me naya CRM lead automatically create kar deta hai — saath hi central `clients_master` table me bhi entry daal deta hai.

```
Typebot conversation complete → Webhook (n8n)
        ↓
Normalize payload (name, email, phone, company, message)
        ↓
Ollama: service_type + intent_summary + urgency classify karo
        ↓
Odoo JSON-RPC: crm.lead create karo
        ↓
Postgres: clients_master me insert (central sync table)
        ↓
Respond to Typebot (lead_id confirm)
```

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json` select karo
2. Neeche diye credentials/placeholders set karo
3. Workflow ko **Active** karo

## Setup Karne Se Pehle

### 1. `clients_master` control table (agar abhi tak nahi banaya)
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
Ye table poore funnel (1.3 se 2.9 tak) ka "single source of truth" hai — Master Plan Section 5.1 dekho.

### 2. Postgres credential
Agar 1.1/1.2 me pehle se `Odoo Postgres` credential banaya hai, to wahi reuse karo — sab workflows isi naam se reference karte hain.

### 3. Ollama
`qwen2.5:7b` model pulled hona chahiye, aur agar Ollama alag server par hai to Node 3 (`Ollama - Classify Service Type`) ka URL update karo.

### 4. Typebot setup
- Typebot me apna chat flow banao (naam, email, phone, aur ek open text "aapko kis service me interest hai" jaisa question)
- Last block me **Webhook** action add karo, jisme is n8n workflow ka **Production Webhook URL** paste karo (path: `typebot-lead-capture`)
- Body me answers ko `answers` key ke andar bhejna — agar Typebot ka export format alag hai to `Normalize Typebot Payload` (Node 2) me field names match kar lena

### 5. Odoo API credentials (Environment Variables — n8n Settings → Variables)

| Variable | Kya daalna hai |
|---|---|
| `ODOO_URL` | Odoo instance ka base URL (e.g. `https://crm.yourdomain.com`) |
| `ODOO_DB` | Odoo database ka naam |
| `ODOO_UID` | API user ka internal user ID (ek baar login RPC call karke nikal lo — [Odoo external API docs](https://www.odoo.com/documentation/18.0/developer/reference/external_api.html)) |
| `ODOO_API_KEY` | Odoo → Settings → Users → us user ke liye API Key generate karo |

⚠️ **Important:** Odoo JSON-RPC ka exact schema (`execute_kw` args order, field names jaise `email_from`, `contact_name`) Odoo version ke hisaab se same rehta hai but ek test lead bana ke confirm zaroor kar lena pehli baar run karne se pehle.

**Simpler alternative agar chaho:** Agar sirf Odoo Website Forms (native) use karna hai, to Odoo khud hi lead create kar deta hai bina kisi extra API call ke — is case me ye poora module (1.3) sirf Typebot jaise **external** chat/lead sources ke liye zaroori hai.

## Test Kaise Kare

1. Typebot preview me ek test conversation complete karo
2. n8n execution log me check karo — Ollama ka JSON output valid aaya ya nahi
3. Odoo CRM → Leads me naya lead dikhna chahiye
4. Postgres me `SELECT * FROM clients_master ORDER BY created_at DESC LIMIT 5;` chala ke confirm karo

## Known Limitations (v1)

- Duplicate detection nahi hai — agar same visitor 2 baar chat complete kare to 2 alag leads banenge (v2 me email-based de-dup add karenge)
- Agar Odoo lead create fail ho jaaye (network/auth issue), `clients_master` insert bhi skip ho jaayega kyunki wo `Odoo - Create CRM Lead` ke result (`$json.result.id`) par depend karta hai — is failure ko catch karke retry/alert add karna production ke liye recommend hai
