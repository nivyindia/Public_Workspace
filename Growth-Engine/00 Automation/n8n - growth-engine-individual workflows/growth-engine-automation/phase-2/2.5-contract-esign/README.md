# Module 2.5 — Contract + E-sign

**Kya karta hai:** Ye module do webhook entry points ka combination hai.

1. **Proposal Accept** — Module 2.4 ke proposal email me diya "Accept" link jab client click karta hai, ye workflow **Documenso** me ek pre-built contract template se document create karke client ko e-sign ke liye bhej deta hai.
2. **Documenso Signed** — Jab client contract sign kar deta hai, Documenso callback webhook fire karta hai; ye workflow lead ko `Won` mark karta hai, Odoo CRM stage `Won` set karta hai, aur Module 2.6 (Invoice + Payment) ko automatically trigger kar deta hai.

```
[Entry 1] Proposal Accept Webhook (client click)
        ↓
Postgres: lead + proposal detail fetch
        ↓
Documenso: contract template se document create (externalId = lead-<id>)
        ↓
Documenso: send for signature
        ↓
Postgres: status = 'Contract Sent'
        ↓
Odoo Discuss: "Proposal accepted" alert
        ↓
Respond: thank-you page

[Entry 2] Documenso Signed Webhook (document completed)
        ↓
Extract lead ID (externalId se)
        ↓
Postgres: status = 'Won'
        ↓
Odoo: CRM stage_id = Won
        ↓
Execute Workflow → 2.6 Invoice + Payment
        ↓
Odoo Discuss: "Deal Won" alert
```

**Funnel me jagah:** Ye module `Proposal Sent → Won` transition ko close karta hai. Module 1.5 (Central CRM Sync) ka existing `IF Proposal Sent` branch already 2.5 ko call karta hai — us wiring ko safety-net ke roop me rehne do (agar client webhook link ke bajaye kisi aur tareeke se — jaise phone call par — verbally accept kare, to sales rep Odoo me stage manually "Proposal Sent" rakh sakta hai aur 1.5 ka polling ise catch kar lega). Primary/fast path hamesha webhook hi hai.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo
4. Is workflow ka ID copy karke (a) `1.5-central-crm-sync/workflow.json` ke `Execute Workflow - 2.5 Contract E-sign` node me, aur (b) `2.4-proposal-generation` ke email me accept-link already is workflow ke path (`proposal-accept`) ko point karta hai — sirf `PROPOSAL_ACCEPT_BASE_URL` sahi hona chahiye

## Setup Karne Se Pehle

### 1. Documenso setup
- Documenso self-host karo, ek **Contract Template** banao (Nivy ka standard service agreement, signer field pre-placed)
- Template ID copy karke `DOCUMENSO_CONTRACT_TEMPLATE_ID` env var me daalo
- Documenso me API key generate karo (`DOCUMENSO_API_KEY`)

### 2. Environment Variables (naye)
| Variable | Kya daalna hai |
|---|---|
| `DOCUMENSO_API_URL` | Self-hosted Documenso ka base URL |
| `DOCUMENSO_API_KEY` | Documenso API key |
| `DOCUMENSO_CONTRACT_TEMPLATE_ID` | Standard contract template ka ID |
| `ODOO_WON_STAGE_ID` | Odoo CRM me "Won" stage ki internal ID |
| `PROPOSAL_ACCEPT_BASE_URL` | Same jo Module 2.4 me use kiya (n8n public base URL) |

### 3. Postgres, Odoo API
Wahi jo pehle ke modules me use kiye.

### 4. Module 2.6 workflow ID (bana lene ke baad)
`Execute Workflow - 2.6 Invoice + Payment` node me `REPLACE_WITH_2.6_INVOICE_PAYMENT_WORKFLOW_ID` ko actual workflow ID se replace karo (Module 2.6 is batch me hi bana hai — README + workflow uska bhi neeche folder me hai).

## Test Kaise Kare

1. Ek test lead ka `clients_master.status` `'Proposal Sent'` set karo, `odoo_lead_id` note kar lo
2. Browser me manually accept URL kholo: `{PROPOSAL_ACCEPT_BASE_URL}/webhook/proposal-accept?lead_id=<id>`
3. Confirm karo Documenso me naya document bana aur test email par sign-request aaya
4. `clients_master.status` = `'Contract Sent'` confirm karo
5. Documenso me us document ko test-sign karo (ya Documenso ka "simulate completed" test feature use karo)
6. Confirm karo `documenso-signed` webhook fire hua, `clients_master.status` = `'Won'`, Odoo CRM stage Won hua, aur Discuss alert aaya

## Known Limitations (v1)

- Accept webhook `GET` request hai (email link ke liye zaroori) — isme koi authentication/signature nahi hai, matlab agar koi lead_id guess kar le to unauthorized accept trigger kar sakta hai. Production me ek signed/expiring token (JWT ya HMAC) use karna chahiye, sirf `lead_id` nahi (security flag — launch se pehle fix karna recommended)
- Documenso webhook payload structure version ke hisaab se vary kar sakta hai — Node 9 (`Extract Lead ID from Document`) me `body.data?.externalId` path apne Documenso version ke actual payload se verify kar lena
- Agar client Documenso par "Decline" kare, uske liye koi alag handling nahi hai abhi (v2: declined webhook event ke liye alag branch — lead ko wapas `Proposal Sent` ya ek `Contract Declined` status me daalna)
- Module 2.6 workflow ID set na hone tak `Execute Workflow - 2.6` node fail hoga — baaki flow (Won status, Discuss alert) fir bhi chalta rahega, invoice sirf manually trigger karna hoga tab tak
