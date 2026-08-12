# Module 1.5 — Central CRM Sync

**Kya karta hai:** Ye woh "glue" workflow hai jo Master Plan ke Section 5 (Connection Method) ko actually implement karta hai. Har 5 minute me Odoo CRM (`crm_lead` table) ke andar stage changes detect karta hai, central `clients_master` table ko update (upsert) karta hai, aur jab koi lead important stage par pahunche (Qualified / Proposal Sent / Won), to automatically Phase 2 ke corresponding workflow ko **Execute Workflow** node se trigger kar deta hai — plus team ko Discuss par notify karta hai.

Ye module standalone kaam nahi karta — iska pura fayda tab hai jab Phase 2 ke workflows (2.1 Outreach, 2.5 Contract E-sign, 2.7 Onboarding) already n8n me ban chuke hon, kyunki ye unhe call karta hai.

```
Every 5 min (Schedule)
        ↓
Postgres: crm_lead + crm_stage compare clients_master.status se
   (jo bhi lead ka stage badla hai ya naya hai)
        ↓
Postgres: clients_master UPSERT (naya status + updated_at)
        ↓
   ┌──────────────┬────────────────┬─────────────────────┬───────────────┐
IF Qualified   IF Won          IF Proposal Sent        IF Booked
   ↓              ↓                ↓                       ↓
Execute 2.1    Execute 2.7      Execute 2.5             Execute 2.4
(Outreach)     (Onboarding)     (Contract E-sign)*      (Proposal Generation)
   └──────────────┴────────────────┴─────────────────────┴───────────────┘
        ↓
Odoo Discuss: team ko stage-change notify
```
\* **Note (Phase 2 batch 2 update):** Module 2.5's primary/fast trigger ab ek dedicated webhook hai (client "Accept Proposal" link click karta hai — README 2.5 dekho), na ki sirf CRM stage. Is "IF Proposal Sent" branch ko safety-net/reminder ke roop me treat karo — agar koi lead kisi aur tareeke se (phone call) verbally accept kare aur stage manually update ho, to ye polling isse bhi catch kar lega.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye placeholders set karo
3. Workflow **Active** karo

## Setup Karne Se Pehle

### 1. `clients_master` table
Agar Module 1.3 se pehle already bana liya hai to kuch nahi karna. Nahi banaya to Module 1.3 ke README me diya SQL run karo.

### 2. Odoo CRM stages ka naam confirm karo
Ye workflow `crm_stage.name` ko literal string match karta hai (`Qualified`, `Won`, `Proposal Sent`). Odoo CRM → Configuration → Stages me jaake apne pipeline ke exact stage names Master Plan Section 1 wale funnel status ke mutabiq rename kar lo:

`New → Qualified → Contacted → Nurtured → Booked → Proposal Sent → Won → Onboarded → Delivered → Renewal`

Agar naam alag rakhne hain to Node 2 (`Detect CRM Stage Changes`) aur Nodes 4/5/6 (IF conditions) me exact string update kar dena.

### 3. Postgres credential
Same `Odoo Postgres` credential (1.1 se 1.4 tak jo use kiya).

### 4. Phase 2 workflow IDs (zaroori — bina iske ye module aage kuch trigger nahi karega)
Jab Phase 2 modules ban jayein, unke n8n workflow IDs copy karke in nodes me daalo:
- `Execute Workflow - 2.1 Outreach` → `REPLACE_WITH_2.1_OUTREACH_WORKFLOW_ID`
- `Execute Workflow - 2.4 Proposal Generation` → `REPLACE_WITH_2.4_PROPOSAL_GENERATION_WORKFLOW_ID` (Module 2.4 is batch me hi ban gaya hai — ID daal do)
- `Execute Workflow - 2.5 Contract E-sign` → `REPLACE_WITH_2.5_CONTRACT_ESIGN_WORKFLOW_ID` (safety-net trigger, Section ऊपर ka Note dekho)
- `Execute Workflow - 2.7 Onboarding` → `REPLACE_WITH_2.7_ONBOARDING_WORKFLOW_ID` (abhi tak nahi bana)

**Jab tak koi placeholder ID replace nahi hoti** — us node ko workflow me se disable kar sakte ho, ya bas placeholder rehne do (fail hoga but harmless, kyunki `neverError` sirf Discuss node par hai — production me enable karne se pehle corresponding module zaroor ban chuka ho).

### 5. Odoo Discuss — Environment Variables
`ODOO_URL`, `ODOO_DB`, `ODOO_UID`, `ODOO_API_KEY`, `ODOO_DISCUSS_CHANNEL_ID` — same jo Module 1.4 me use kiye.

## Test Kaise Kare

1. Odoo CRM me ek test lead ka stage manually "Qualified" karo
2. n8n me workflow manually **Execute Workflow** se run karo (5 min wait mat karo)
3. `clients_master` table check karo — status update hua ya nahi (`SELECT * FROM clients_master WHERE odoo_lead_id = <id>;`)
4. Agar Phase 2 workflow ID set hai, confirm karo wo trigger hua
5. Discuss channel me notification aaya ya nahi dekho

## Known Limitations (v1)

- **Polling-based hai, real-time nahi** — 5 min ka delay hai. Agar turant reaction chahiye (e.g. Won hote hi turant onboarding), Odoo Automation Rule (Module 1.4 jaisa) se direct webhook trigger better hoga — is polling module ko sirf "safety net / catch-all sync" ke roop me rakho
- Ab 4 stages (Qualified, Won, Proposal Sent, Booked) ke liye Execute Workflow triggers hain — baaki stages (Contacted, Nurtured, Onboarded, Delivered, Renewal) ke liye Phase 2 modules 2.8/2.9 bante hi yahan aur IF branches add karne honge
- `LIMIT 25` per run hai — agar ek saath 25 se zyada leads ka stage change ho (bulk import jaisa case) to kuch is cycle me miss ho ke agle 5-min cycle me pick honge (data loss nahi, sirf delay)
