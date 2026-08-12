# Module 2.1 — Multi-channel Outreach

**Kya karta hai:** Jab koi lead Odoo CRM me "Qualified" stage par pahunchta hai (Module 1.5 automatically trigger karta hai), ye workflow Ollama se personalized email + LinkedIn message + WhatsApp message likhwata hai, email Postal (SMTP) se aur WhatsApp Waha se seedha bhej deta hai, aur LinkedIn ke liye Odoo me ek task bana deta hai (LinkedIn direct automation risky hai — neeche wajah dekho). Reply aane par bhi track karta hai.

```
Module 1.5 → Execute Workflow Trigger (n8n)
        ↓
Postgres: lead ki full detail fetch karo (clients_master)
        ↓
Ollama: email_subject + email_body + linkedin_message + whatsapp_message generate karo
        ↓
   ┌─────────────┬──────────────────┬──────────────────────┐
Send Email    Send WhatsApp     Odoo: LinkedIn task
(Postal)      (Waha)            (human sends manually)
   └─────────────┴──────────────────┴──────────────────────┘
        ↓
Postgres: clients_master status = 'Contacted'

--- separate entry point ---
Postal Inbound Reply Webhook → clients_master status = 'Replied' → Odoo Discuss alert
```

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Credentials/placeholders set karo (neeche)
3. Workflow **Active** karo
4. **Zaroori:** is workflow ka ID copy karke Module 1.5 ke `Execute Workflow - 2.1 Outreach` node me daalo (README 1.5 dekho)

## Setup Karne Se Pehle

### 1. `clients_master` me koi naya column nahi chahiye — 1.3/1.5 wala table hi kaafi hai

### 2. Postgres, Ollama, Postal SMTP, Odoo API credentials
Wahi jo Phase 1 modules me already setup kiye (README 1.1–1.5 dekho). Naye Environment Variables:

| Variable | Kya daalna hai |
|---|---|
| `WAHA_URL` | Waha instance ka base URL |
| `WAHA_API_KEY` | Waha API key |
| `WAHA_SESSION` | Waha me connected WhatsApp session ka naam (default: `default`) |
| `ODOO_LINKEDIN_ACTIVITY_TYPE_ID` | Odoo → Settings → Technical → Activity Types me se koi ID (ya naya "LinkedIn Outreach" type banao) |
| `ODOO_SALES_USER_ID` | Jis Odoo user ko LinkedIn task assign karna hai uska internal user ID |

### 3. LinkedIn — kyun automated nahi hai
LinkedIn par bina official API ke automated messaging LinkedIn ke Terms of Service ke against hai aur account restriction/ban ka risk hai. Isliye ye module LinkedIn message khud nahi bhejta — Ollama se message draft karke Odoo me ek activity/task bana deta hai jise sales rep copy-paste karke khud LinkedIn se bhej sakta hai (1 click, ~10 second ka kaam). Agar aap apne risk par koi third-party LinkedIn automation tool (jaise Unipile) use karna chahte ho, to `Odoo - Create LinkedIn Task` node ki jagah uska HTTP call daal sakte ho.

### 4. Postal inbound reply webhook
- Postal admin panel → apna mail server → **Webhooks** (ya "Routes" agar aapka Postal version wahan configure karta hai) → is workflow ke `Postal Inbound Reply Webhook` node ka Production URL (`.../postal-reply-webhook`) add karo, event: inbound message received
- Ek test reply bhej ke payload structure confirm kar lena (`from`/`mail_from` field ka naam Postal version ke hisaab se vary kar sakta hai — Node 10 me update kar lena)

## Test Kaise Kare

1. Ek test lead ka Odoo CRM stage manually "Qualified" karo (ya Module 1.5 workflow manually run karo us lead ke liye)
2. Confirm karo email + WhatsApp dono aaye
3. Odoo → Activities me LinkedIn task dikhna chahiye
4. `clients_master` me status "Contacted" ho gaya confirm karo
5. Us test email ka reply bhejo → check karo status "Replied" ho gaya aur Discuss alert aaya

## Known Limitations (v1)

- Agar lead ka `phone` field khali hai to WhatsApp node fail-safe hai (`neverError`) lekin message obviously nahi jaayega — future me IF check add kar sakte ho taaki empty phone par node skip ho
- Reply-tracking sirf email-based hai (Postal inbound webhook) — WhatsApp replies track karne ke liye alag Waha webhook (`onMessage` event) add karna hoga (v2)
- LinkedIn step semi-automated hai (jaan-bujh kar) — pura automate karna chahte ho to compliance risk khud assess karna hoga
