# Module 2.7 — Client Onboarding

**Kya karta hai:** Module 2.6 jab payment "Paid" mark karta hai aur Hub ko `payment.received` event report karta hai, Hub-Dispatcher us event se ye workflow trigger karta hai — poora onboarding automate karta hai: client ke liye Nextcloud folder banata hai, Odoo Project + starter tasks create karta hai, ek dedicated Odoo Discuss channel banakar delivery team ko add karta hai, client ko welcome email bhejta hai, internal team ko alert karta hai, aur Hub ko `client.onboarded` event report karta hai.

> **S4.6 update (star topology):** Is module me pehle se `Execute Workflow Trigger` entry node tha (2.6 seedha isse call karta tha) — wo structurally already Dispatcher-compatible hai, isliye us node ko naya add karne ki zaroorat nahi padi, sirf naam/notes update kiye taaki clear ho ki ab caller 2.6 nahi, Hub-Dispatcher hai. Naya add hua hai **Report to Hub** node: `Postgres - Mark Onboarded` ke turant baad, parallel branch me (internal Discuss alert ke saath), `event_type: client.onboarded` bhejta hai.

```
Dispatcher Trigger (payment.received)
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

        (parallel, off "Postgres: status = 'Onboarded'")
        ↓
Report to Hub → funnel_events (event_type: client.onboarded)
```

**Funnel me jagah:** Ye module `Paid → Onboarded` transition hai. Master Plan ke Phase 2 me 2.7 hai — deal won/paid ke baad ka pehla "delivery-side" step, jiske baad Module 2.8 (recurring reporting) shuru hota hai.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. `Report to Hub` node me `REPLACE_WITH_0.0_HUB_INTAKE_WORKFLOW_ID` ko Hub-Intake ke actual workflow ID se replace karo

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

## Wiring — ab Hub-Dispatcher se call hota hai

2.6 is workflow ko ab seedha call nahi karta — sirf `payment.received` event Hub ko report karta hai. Is module ko actually trigger karne ke liye Hub-Dispatcher ke Switch node me ek `payment.received` branch chahiye jo is workflow ke ID par point kare (S4 batch scope, ye ek README ka kaam nahi — Hub-Dispatcher ki apni file me hota hai).

Tab tak Module 2.7 sirf **manually** (Postgres se `Paid` status wale lead ka `odoo_lead_id` deke, Execute Workflow se) test kiya ja sakta hai.

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
- ~~**Duplicate trigger safety nahi hai**~~ **FIXED (S4b-revert)** — ab
  `IF Not Yet Onboarded (duplicate guard)` node `Fetch Lead + Deal Detail`
  ke turant baad check karta hai ki `clients_master.odoo_project_id`
  already set hai ya nahi. Agar set hai (matlab is client ka onboarding
  pehle ho chuka), poora chain skip hota hai — koi duplicate
  project/folder/channel/email nahi banta. Ye zaroori tha kyunki Dispatcher
  ab **dono** `client.won` aur `payment.received` events se 2.7 ko trigger
  kar sakta hai (Option B, NET-30/unpaid-onboarding case ke liye) — dono aa
  gaye to guard ke bina duplicate side-effects ban jaate.
- **Nextcloud folder-exists case** ko `neverError` se silently ignore kiya ja raha hai — agar folder pehle se hai (retry scenario), share-link step phir bhi chalega, jo theek hai, lekin duplicate share links ban sakte hain.
- **(S4.6)** Hub-Dispatcher me `payment.received` ka Switch branch abhi tak wired nahi hai — jab tak wo branch + is module ka real workflow ID Dispatcher me add nahi hote, onboarding manually trigger karna hoga
