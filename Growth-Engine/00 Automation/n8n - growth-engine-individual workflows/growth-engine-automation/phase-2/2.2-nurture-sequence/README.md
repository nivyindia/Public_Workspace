# Module 2.2 — Nurture Sequence

**Kya karta hai:** Jo leads turant "ready" nahi hain (score warm/cold), unko ek 3-step drip sequence me daalta hai — Day 3 (useful tip), Day 7 (case study/social proof), Day 14 (final check-in). Har roz 9 baje check karta hai kaun sa lead next step ke liye due hai, Ollama se us step ke hisaab se content likhwata hai, email + WhatsApp bhejta hai, aur progress track karta hai.

```
Daily 9AM (Schedule)
        ↓
Postgres: kaunse leads next nurture step ke due hain (nurture_step + last_nurture_sent ke hisaab se)
        ↓
Step theme decide karo (0=tip, 1=case study, 2=final check-in)
        ↓
Ollama: is step ke liye email + WhatsApp content generate karo
        ↓
   ┌──────────────┬───────────────────┐
Send Email      Send WhatsApp
(Postal)        (Waha)
   └──────────────┴───────────────────┘
        ↓
Postgres: nurture_step ++ , status update
        ↓
   IF final step (3rd touch) → Odoo Discuss alert (manual follow-up/archive decide karo)
```

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo

## Setup Karne Se Pehle

### 1. `clients_master` table me 2 naye columns add karo
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS nurture_step INTEGER DEFAULT 0;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_nurture_sent TIMESTAMP;
```

### 2. Credentials
Postgres, Ollama, Postal SMTP, Waha, Odoo API — sab wahi jo Module 2.1 me use kiye (README 2.1 dekho). Koi naya Environment Variable nahi chahiye.

### 3. Drip timing customize karna ho to
Node 2 (`Fetch Leads Due for Nurture`) ki SQL query me `INTERVAL '3 days'`, `'7 days'`, `'14 days'` — apni pasand ke hisaab se change kar sakte ho.

## Test Kaise Kare

1. Ek test row `clients_master` me manually insert/update karo: `score = 'warm'`, `status = 'Qualified'`, `nurture_step = 0`, `last_nurture_sent = NULL`
2. Workflow ko manually **Execute Workflow** se run karo
3. Email + WhatsApp aaya confirm karo
4. `clients_master` me `nurture_step` 1 ho gaya aur `last_nurture_sent` update hua confirm karo
5. `last_nurture_sent` ko manually 8 din purana kar do (`UPDATE ... SET last_nurture_sent = now() - interval '8 days'`) aur dobara run karo — step 2 (case study) content aana chahiye

## Known Limitations (v1)

- Agar lead beech me khud reply kar de (Module 2.1 ke reply webhook se), to abhi ye workflow use automatically nurture list se nahi hataata — recommend hai `Fetch Leads Due for Nurture` query me `AND status != 'Replied'` condition add karna (chhota fix, but pehle test kar lena)
- 3-step ke baad "Nurture Complete" leads permanently us status par reh jaate hain — koi automatic re-engagement/archive workflow nahi hai abhi (chaho to future module 2.9 Renewal + Revenue Ops ke saath combine kar sakte ho)
- `LIMIT 50` per run hai — bahut zyada leads ek din due ho jaayein to kuch agle din process honge (delay, data loss nahi)
