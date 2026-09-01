# Module 2.8 — Delivery + Reporting

**Kya karta hai:** Har hafte (weekly cron), sabhi active/onboarded clients ke liye automatically ek performance-update email bhejta hai — Metabase se un ke metrics query karta hai, Ollama se ek plain-language summary likhwata hai, aur client ko email + live dashboard link bhejta hai.

```
Weekly Trigger (Monday 8AM)
        ↓
Postgres: status IN ('Onboarded','Active') wale sab clients fetch karo (har row = ek item)
        ↓  [per-client, parallel]
Metabase: saved question query karo (client_id filter ke saath)
        ↓
Metrics parse karo + filtered public dashboard link banao
        ↓
Ollama: raw metrics ko friendly summary me likho (headline + bullets + next-week focus)
        ↓
Summary JSON parse karo
        ↓
Send Weekly Report Email (Postal) -- summary + dashboard link
        ↓
Postgres: last_report_sent_at = now()
```

**Funnel me jagah:** Ye module `Onboarded → (recurring delivery)` loop hai — Module 2.7 ke baad client jab tak active rehta hai, ye har hafte automatically chalta rehta hai. Renewal/churn tracking (agla step) Module 2.9 me hai.

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye setup steps follow karo
3. Workflow **Active** karo (cron khud chalu ho jaayega — koi manual trigger connect nahi karna)

## Setup Karne Se Pehle

### 1. `clients_master` me naya column add karo
```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_report_sent_at TIMESTAMP;
```

### 2. Metabase setup
- Metabase self-host karo (agar abhi tak nahi kiya), GA4/GSC/Odoo data connect karo
- Har client ke liye track karne layak metrics (leads generated, traffic, keyword rankings, social reach, etc.) ka ek **saved question (Card)** banao jisme ek SQL **template-tag variable** ho: `client_id` (isse ek hi question sab clients ke liye reuse hota hai, sirf parameter badalta hai)
- Ek **dashboard** bhi banao jisme wahi client_id-filtered cards ho, aur usse **Public Sharing** se enable karo (Admin → Sharing → Public Sharing ON, phir dashboard ke "Sharing" icon se public link nikaalo — sirf UUID chahiye, poora URL nahi)
- Metabase → Admin → API Keys se ek API key banao

### 3. Naye env variables
| Variable | Kya daalna hai |
|---|---|
| `METABASE_URL` | Self-hosted Metabase ka base URL |
| `METABASE_API_KEY` | Admin → API Keys se generate kiya hua key |
| `METABASE_CLIENT_CARD_ID` | Us saved question (Card) ki ID jisme `client_id` template-tag hai |
| `METABASE_CLIENT_DASHBOARD_PUBLIC_UUID` | Public-shared dashboard ka UUID (poora URL nahi, sirf UUID) |

### 4. Ollama, Postal
Wahi jo pehle ke modules me use kiye.

## Test Kaise Kare

1. Ek `'Onboarded'` status wale test client ka record confirm karo
2. Workflow ko manually **Execute Workflow** se run karo (ya `Fetch Active Clients` node ko individually test-execute karo phir poori chain "Test workflow" se chalao)
3. Metabase se metrics JSON aaya confirm karo (Node 3 output check karo)
4. Ollama summary properly JSON-parse hui confirm karo (agar Ollama malformed JSON de, `Parse Ollama Summary JSON` fallback empty summary use karega — email generic ban jaayegi lekin fail nahi hogi)
5. Client ko email aaya confirm karo, dashboard link click karke public dashboard khulta hai confirm karo
6. `clients_master.last_report_sent_at` update hua confirm karo

## Known Limitations (v1)

- **PDF attachment nahi hai** — Metabase Community edition me API-driven PDF export first-class feature nahi hai (wo Enterprise "Dashboard Subscriptions" ke through email-only hota hai, download API nahi). v1 me isliye ek locked/filtered **public dashboard link** bhej rahe hain instead of attached PDF. v2 options: (a) headless-Chrome screenshot service (e.g. `puppeteer` script alag se) jo dashboard render karke PDF banaye aur n8n ko de, ya (b) Metabase Enterprise upgrade.
- **Public dashboard link** ka matlab hai koi bhi jisके paas link hai wo dekh sakta hai (login nahi chahiye) — agar data sensitive hai to isse **signed/embedded** Metabase link (JWT-based embedding, thoda extra setup) me convert karna chahiye launch se pehle.
- **Monthly-only clients** abhi is weekly cron me hi cover ho rahe hain (har hafte email jaata rahega) — agar kisi client ka reporting cadence monthly honा chahiye, to `clients_master` me ek `reporting_frequency` column add karke Node 2 ki query me filter karna hoga, ya ek alag Monthly Schedule Trigger + same downstream chain duplicate karni hogi.
- **Ollama down/timeout** ka koi retry/fallback nahi hai abhi — agar Ollama server response na de, poora workflow us client ke liye fail ho jaayega (v2: `Continue on Fail` + generic template-based fallback email add karo).
- Weekly summary ke end me koi aggregate "X reports sent" internal alert nahi hai (per-client hi log ho raha hai) — agla batch me add kiya ja sakta hai agar chahiye.

## S4.7 note — koi change nahi kiya

Star-topology plan ke S4.7 step me is module ka naam liya gaya tha (`renewal.due` event ke liye), lekin is workflow me renewal-date logic hai hi nahi — ye sirf weekly performance-report email hai (Metabase metrics + Ollama summary). Renewal/churn/dunning ka poora logic `2.9-renewal-revenue-ops` me hai, aur wahi teeno hand-offs (`renewal.due`, `renewal.overdue`, `payment.failed`) is batch me add kiye gaye hain — dekho `2.9-renewal-revenue-ops/README.md`.

Is module (2.8) ka koi current downstream consumer nahi hai jo "weekly report bhej diya" event par react kare, isliye **as-is chhoda gaya hai** — Module 1.1/1.2 (S3.4) aur 7.2 (S6.12) jaisa hi treatment, jahan koi cross-module hand-off na hone par plan explicitly "leave as-is, confirm no change needed" kehta hai.
