# Module 2.7 — Client Onboarding

**Kya karta hai:** Module 2.6 jab payment "Paid" mark karta hai, ye workflow trigger hokar poora onboarding automate karta hai — client ke liye Nextcloud folder banata hai, Odoo Project + starter tasks create karta hai, ek dedicated Odoo Discuss channel banakar delivery team ko add karta hai, client ko welcome email bhejta hai, aur internal team ko alert karta hai.

```
Module 2.6 → Execute Workflow (Payment Received)
        ↓
Postgres: lead + deal detail fetch
        ↓
Nextcloud: client folder create (MKCOL) -- /Clients/{company}-{id}/
        ↓
Nextcloud: public share link banao (client ko dene ke liye)
        ↓
Odoo: project.project create ("{company} - Delivery")
        ↓
Build 6-task onboarding checklist (kickoff, access, brand assets, team assign, strategy doc, first deliverable)
        ↓
Odoo: project.task create (batch)
        ↓
Odoo: mail.channel create ("Client - {company}")
        ↓
Odoo: delivery team members ko channel me add karo
        ↓
Welcome email info build karo (folder link + project ref)
        ↓
Send Welcome Email (Postal) -- folder link ke saath
        ↓
Postgres: status = 'Onboarded' + folder/project/channel IDs save
        ↓
Odoo Discuss (internal): "Client onboarded" alert
```

**Funnel me jagah:** Ye module `Paid → Onboarded` transition hai. Master Plan ke Phase 2 me 2.7 hai — deal won/paid ke baad ka pehla "delivery-side" step, jiske baad Module 2.8 (recurring reporting) shuru hota hai.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. Is workflow ka ID copy karke `2.6-invoice-payment/workflow.json` me ek naya **Execute Workflow** node add karo (README ke "Wiring" section me exact jagah bataya hai)

## Setup Karne Se Pehle

### 1. `clients_master` me naye columns add karo
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS nextcloud_folder_url TEXT;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS odoo_project_id INTEGER;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS odoo_discuss_channel_id INTEGER;
```

### 2. Nextcloud
- `NEXTCLOUD_URL`, `NEXTCLOUD_USER` env vars set (Module 2.4 me already set hone chahiye)
- `Nextcloud WebDAV` credential (HTTP Basic Auth) — Module 2.4 wali hi reuse hogi
- Root me ek `/Clients/` folder pehle se bana lo (agar WebDAV parent-folder auto-create nahi karta)

### 3. Naya env variable
| Variable | Kya daalna hai |
|---|---|
| `ODOO_DELIVERY_TEAM_PARTNER_IDS` | Odoo partner IDs ka JSON array, e.g. `[12,15,18]` — delivery/account-management team jo har naye client Discuss channel me by-default add honi chahiye |

### 4. Odoo model naam confirm karo
Kuch Odoo versions me Discuss channel model `mail.channel` hai, kuch newer versions (17+) me `discuss.channel`. Apne instance me Settings → Technical → Database Structure → Models me confirm karo, aur Node 8/9/13 ke `jsonBody` me model name adjust karo agar zaroorat pade.

## Wiring — 2.6 se call karwana

`2.6-invoice-payment/workflow.json` me `Postgres - Mark Paid` node ke baad, `Send Receipt Email` se pehle (ya baad me, parallel branch se) ek naya node add karo:

- Type: **Execute Workflow**
- `workflowId`: is module (2.7) ka n8n workflow ID (import karne ke baad milega)
- `workflowInputs`: `{ "odoo_lead_id": "={{$('Postgres - Mark Paid').item.json.odoo_lead_id}}" }`

Tab tak Module 2.7 sirf **manually** (Postgres se `Paid` status wale lead ka `odoo_lead_id` deke) test kiya ja sakta hai.

## Test Kaise Kare

1. Ek test lead ka `clients_master.status` `'Paid'` set karo (ya Module 2.6 poora flow chalao)
2. Workflow ko manually **Execute Workflow** se run karo, input me `{ "odoo_lead_id": <id> }` do
3. Nextcloud me `/Clients/{company}-{id}/` folder ban gaya confirm karo
4. Odoo → Project me naya project + 6 tasks dikhne chahiye
5. Odoo → Discuss me naya client channel dikhna chahiye, delivery team members add hone chahiye
6. Welcome email aaya confirm karo (folder link ke saath)
7. `clients_master.status = 'Onboarded'` aur teeno naye columns populate hue confirm karo

## Known Limitations (v1)

- **Task template fixed hai** — sabhi service types (SEO/Design/VA/etc.) ke liye same 6 tasks banti hain. v2: `service_type` ke hisaab se alag templates ek Postgres table (`onboarding_templates`) se pull karo.
- **Batch `project.task` create** Odoo 17+ ka behavior assume karta hai (list of dicts ek call me). Purane Odoo versions par ye fail ho sakta hai — us case me loop-based single-create pattern (Module 2.1/2.2 jaisा) use karna hoga.
- **`odoo_partner_id` per-lead** abhi bhi populate nahi hota (Module 2.4/2.6 wali same limitation) — fallback `ODOO_FALLBACK_PARTNER_ID` use ho raha hai, jisse project ka client-link generic reh sakta hai.
- **Duplicate trigger safety nahi hai** — agar 2.6 ka Execute Workflow call retry ho jaaye, to duplicate project/folder/channel ban sakte hain (v2: pehle check karo ki `odoo_project_id` already set hai to skip karo).
- **Nextcloud folder-exists case** ko `neverError` se silently ignore kiya ja raha hai — agar folder pehle se hai (retry scenario), share-link step phir bhi chalega, jo theek hai, lekin duplicate share links ban sakte hain.
