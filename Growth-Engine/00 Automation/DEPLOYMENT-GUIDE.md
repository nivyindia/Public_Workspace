# Growth Engine — Deployment Guide

Ye guide poore stack (Postgres, n8n, Odoo, Ollama, Postal, Nextcloud, Documenso, Mixpost, Metabase, Cal.com, Waha, Typebot) ko ek VPS par live karne ka step-by-step process hai, phir sabhi 15 n8n workflows import + wire karne ka.

---

## 0. VPS Provision

**Minimum spec** (sab tools + Ollama 7B model ek saath chalane ke liye):

| Resource | Minimum | Recommended |
|---|---|---|
| RAM | 16 GB | 32 GB |
| vCPU | 4 | 8 |
| Storage | 100 GB SSD | 200 GB SSD |
| OS | Ubuntu 22.04/24.04 LTS | same |

**Provider:** koi bhi (Hetzner, DigitalOcean, Contabo, AWS Lightsail). Hetzner CPX41 (8vCPU/32GB) is a common cost-effective pick for this kind of self-hosted stack.

**DNS — ek baar setup karo, subdomains sabke liye chahiye:**

```
n8n.yourdomain.com       -> VPS IP
odoo.yourdomain.com      -> VPS IP
mail.yourdomain.com      -> VPS IP   (Postal)
files.yourdomain.com     -> VPS IP   (Nextcloud)
sign.yourdomain.com      -> VPS IP   (Documenso)
social.yourdomain.com    -> VPS IP   (Mixpost)
bi.yourdomain.com        -> VPS IP   (Metabase)
cal.yourdomain.com       -> VPS IP   (Cal.com)
wa.yourdomain.com        -> VPS IP   (Waha)
bot.yourdomain.com       -> VPS IP   (Typebot)
```

A-records add karo, phir aage badho (propagate hone me 5-30 min lagega).

---

## 1. Base Setup

```bash
# SSH in, then:
apt update && apt upgrade -y
apt install -y docker.io docker-compose-plugin ufw fail2ban

# Firewall — sirf zaroori ports khulo
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 25/tcp    # Postal SMTP
ufw allow 587/tcp   # Postal submission
ufw enable

systemctl enable docker
```

**Reverse proxy + auto-SSL (Caddy — sabse simple):**

```bash
apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
apt update && apt install -y caddy
```

Caddyfile (`/etc/caddy/Caddyfile`) — har subdomain ke liye ek block, Caddy khud Let's Encrypt SSL handle karega:

```
n8n.yourdomain.com {
    reverse_proxy localhost:5678
}
odoo.yourdomain.com {
    reverse_proxy localhost:8069
}
files.yourdomain.com {
    reverse_proxy localhost:8080
}
sign.yourdomain.com {
    reverse_proxy localhost:3001
}
social.yourdomain.com {
    reverse_proxy localhost:4200
}
bi.yourdomain.com {
    reverse_proxy localhost:3000
}
cal.yourdomain.com {
    reverse_proxy localhost:3002
}
wa.yourdomain.com {
    reverse_proxy localhost:3003
}
bot.yourdomain.com {
    reverse_proxy localhost:8081
}
```

```bash
systemctl restart caddy
```

---

## 2. Core Infra — Postgres + n8n + Ollama

`docker-compose.yml` (mkdir `/opt/growth-engine`, put this there):

```yaml
version: "3.8"
services:
  postgres:
    image: postgres:16
    restart: unless-stopped
    environment:
      POSTGRES_USER: growthengine
      POSTGRES_PASSWORD: CHANGE_ME_STRONG_PASSWORD
      POSTGRES_DB: growthengine
    volumes:
      - pg_data:/var/lib/postgresql/data
    ports:
      - "127.0.0.1:5432:5432"

  n8n:
    image: n8nio/n8n:latest
    restart: unless-stopped
    environment:
      N8N_HOST: n8n.yourdomain.com
      N8N_PROTOCOL: https
      WEBHOOK_URL: https://n8n.yourdomain.com/
      GENERIC_TIMEZONE: Asia/Kolkata
      N8N_ENCRYPTION_KEY: CHANGE_ME_RANDOM_32_CHARS
    volumes:
      - n8n_data:/home/node/.n8n
    ports:
      - "127.0.0.1:5678:5678"

volumes:
  pg_data:
  n8n_data:
```

```bash
cd /opt/growth-engine
docker compose up -d
```

**Ollama (bare-metal, Docker se bahar — GPU/CPU access simpler hai):**

```bash
curl -fsSL https://ollama.com/install.sh | sh
ollama serve &
ollama pull qwen2.5:7b
ollama pull mistral:7b   # backup model
```

Ollama `http://localhost:11434` par listen karega — sab n8n workflows isi ko assume karte hain (agar Ollama alag machine par hai to workflow ke HTTP nodes me URL badalna hoga).

---

## 3. Odoo Community

```bash
mkdir -p /opt/odoo && cd /opt/odoo
```

`docker-compose.yml`:

```yaml
version: "3.8"
services:
  odoo-db:
    image: postgres:15
    restart: unless-stopped
    environment:
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: CHANGE_ME
      POSTGRES_DB: postgres
    volumes:
      - odoo_db_data:/var/lib/postgresql/data

  odoo:
    image: odoo:17.0
    restart: unless-stopped
    depends_on:
      - odoo-db
    environment:
      HOST: odoo-db
      USER: odoo
      PASSWORD: CHANGE_ME
    volumes:
      - odoo_web_data:/var/lib/odoo
    ports:
      - "127.0.0.1:8069:8069"

volumes:
  odoo_db_data:
  odoo_web_data:
```

```bash
docker compose up -d
```

- `https://odoo.yourdomain.com` khol ke database create karo, admin password set karo
- **Apps activate karo:** CRM, Sales, Invoicing, Project, Website, Discuss, Email Marketing
- **API access:** Settings → Users → apna user → API Keys → naya key generate karo (ye `ODOO_API_KEY` banega)
- User ka internal ID note karo (Settings → Users, URL me `id=` dikhega) — ye `ODOO_UID` hai

---

## 4. Postal (Email Sending)

Postal ka apna installer hai (Docker-based internally), separate se install hota hai:

```bash
git clone https://github.com/postalserver/install /opt/postal-install
cd /opt/postal-install
./postal bootstrap mail.yourdomain.com
# config edit karo: /opt/postal/config/postal.yml (DB creds, domain)
./postal initialize
./postal make-user   # admin account banao
./postal start
```

- DNS me SPF, DKIM, DMARC, MX, rDNS records add karo (Postal install ke output me exact records milenge — `./postal default-dkim-record` se dobara nikaal sakte ho)
- Postal admin UI (`https://mail.yourdomain.com`) me ek Organization + Mail Server banao, SMTP credentials generate karo
- Ye SMTP creds Odoo (Settings → Technical → Outgoing Mail Servers) aur n8n (Credentials → SMTP, naam: `Postal SMTP`) dono me daalo

---

## 5. Nextcloud

```bash
mkdir -p /opt/nextcloud && cd /opt/nextcloud
```

```yaml
version: "3.8"
services:
  nextcloud-db:
    image: postgres:15
    restart: unless-stopped
    environment:
      POSTGRES_USER: nextcloud
      POSTGRES_PASSWORD: CHANGE_ME
      POSTGRES_DB: nextcloud
    volumes:
      - nc_db_data:/var/lib/postgresql/data

  nextcloud:
    image: nextcloud:latest
    restart: unless-stopped
    depends_on:
      - nextcloud-db
    environment:
      POSTGRES_HOST: nextcloud-db
      POSTGRES_DB: nextcloud
      POSTGRES_USER: nextcloud
      POSTGRES_PASSWORD: CHANGE_ME
      NEXTCLOUD_TRUSTED_DOMAINS: files.yourdomain.com
    volumes:
      - nc_data:/var/www/html
    ports:
      - "127.0.0.1:8080:80"

volumes:
  nc_db_data:
  nc_data:
```

```bash
docker compose up -d
```

`https://files.yourdomain.com` khol ke admin account banao. Ek automation/API user bhi bana lo (n8n isi user ke naam se WebDAV calls karega) — ye `NEXTCLOUD_USER` hoga, uska password `Nextcloud WebDAV` credential (HTTP Basic Auth) me n8n me daalo.

---

## 6. Documenso, Mixpost, Metabase, Cal.com, Waha, Typebot

Sab officially Docker-first hain — inke apne GitHub repos ke `docker-compose.yml` use karo (versions/images change hote rehte hain, isliye latest official docs follow karna best hai, exact commands yaha freeze nahi kar raha):

| Tool | Official self-host doc |
|---|---|
| Documenso | github.com/documenso/documenso → `docker` folder |
| Mixpost | github.com/inovector/mixpost → self-hosted install docs |
| Metabase | hub.docker.com/r/metabase/metabase (single container, apni Postgres se connect karo) |
| Cal.com | github.com/calcom/cal.com → self-hosting docs |
| Waha (WhatsApp) | github.com/devlikeapro/waha → docker run |
| Typebot | github.com/baptisteArno/typebot.io → docker-compose (builder + viewer + Postgres) |

Har ek ke liye same pattern:
1. `docker-compose.yml` unke repo se le lo, apni Postgres/domain/ports fill karo
2. Caddy me subdomain block already daal chuke ho (Section 1)
3. `docker compose up -d`
4. Admin account banao, API key/token nikaalo jahan zaroorat ho

**Priority order agar time kam hai:** Cal.com aur Typebot pehle (Phase 1 lead-capture ke liye zaroori), Documenso aur Metabase baad me (Phase 2 ke later modules — 2.5 aur 2.8 — ke liye chahiye), Mixpost aur Waha jab respective modules (1.1, 2.1) test karne ho.

---

## 7. Central Control Table

Postgres (`growthengine` DB) me connect karke (`docker exec -it <postgres-container> psql -U growthengine`):

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
  odoo_partner_id INTEGER,
  odoo_invoice_id INTEGER,
  nextcloud_folder_url TEXT,
  odoo_project_id INTEGER,
  odoo_discuss_channel_id INTEGER,
  last_report_sent_at TIMESTAMP,
  renewal_date DATE,
  renewal_reminder_sent_at TIMESTAMP,
  dunning_attempts INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);
```

(Ye sab columns individual module READMEs me bhi hain — ek saath yaha daal diya taaki ek hi baar chalana pade.)

---

## 8. n8n — Credentials + Environment Variables

n8n UI (`https://n8n.yourdomain.com`) me:

**Credentials → New:**
- Postgres → name it `Odoo Postgres` (points to `growthengine` DB from Section 7)
- SMTP → name it `Postal SMTP` (Section 4 ke creds)
- HTTP Basic Auth → name it `Nextcloud WebDAV` (Section 5 ke automation-user creds)

**Settings → Variables** — sab env vars ek jagah daal do (poori list module READMEs me bikhri hai, consolidated yaha hai):

```
ODOO_URL=https://odoo.yourdomain.com
ODOO_DB=<odoo db name>
ODOO_UID=<api user internal id>
ODOO_API_KEY=<odoo api key>
ODOO_DISCUSS_CHANNEL_ID=<internal sales/ops channel id>
ODOO_LINKEDIN_ACTIVITY_TYPE_ID=<activity type id>
ODOO_SALES_USER_ID=<sales rep odoo user id>
ODOO_FALLBACK_PARTNER_ID=<generic contact id>
ODOO_WON_STAGE_ID=<crm won stage id>
ODOO_DELIVERY_TEAM_PARTNER_IDS=[12,15,18]
ODOO_RENEWAL_ACTIVITY_TYPE_ID=<activity type id>
NEXTCLOUD_URL=https://files.yourdomain.com
NEXTCLOUD_USER=<automation user>
WAHA_URL=https://wa.yourdomain.com
WAHA_API_KEY=<waha key>
WAHA_SESSION=default
PROPOSAL_CUSTOM_THRESHOLD_INR=<amount>
GOTENBERG_URL=<gotenberg url, if self-hosted separately>
PROPOSAL_ACCEPT_BASE_URL=https://n8n.yourdomain.com
DOCUMENSO_API_URL=https://sign.yourdomain.com/api
DOCUMENSO_API_KEY=<documenso key>
DOCUMENSO_CONTRACT_TEMPLATE_ID=<template id>
METABASE_URL=https://bi.yourdomain.com
METABASE_API_KEY=<metabase key>
METABASE_CLIENT_CARD_ID=<card id>
METABASE_CLIENT_DASHBOARD_PUBLIC_UUID=<public dashboard uuid>
OUTREACH_FROM_EMAIL=hello@yourdomain.com
```

---

## 9. Import + Wire the 15 Workflows

Har module folder me `workflow.json` hai. **Ye order follow karo** (chain-dependencies ke hisaab se — top-level `README.md` me bhi hai):

1. `1.1-content-social-factory` → import, test
2. `1.2-seo-automation` → import, GSC OAuth credential connect karo, test
3. `1.3-website-lead-capture` → import, Typebot webhook URL point karo, test
4. `1.4-inbound-form-qualification` → import, Odoo Automation Rule bana ke connect karo, test
5. `2.1-multichannel-outreach` → import, **workflow ID copy karo**
6. `2.2-nurture-sequence` → import, test
7. `2.3-booking-sync` → import, Cal.com webhook connect karo, test
8. `2.6-invoice-payment` → import, **workflow ID copy karo**
9. `2.5-contract-esign` → import, Documenso setup, Step 8 ka ID isme daalo, **apna ID copy karo**
10. `2.4-proposal-generation` → import, Gotenberg binary-step wire karo, Step 9 ka ID isme daalo, **apna ID copy karo**
11. `1.5-central-crm-sync` → import (**sabse last**) — Steps 5/10/9 ke IDs iske Execute Workflow nodes me daalo
12. `2.7-client-onboarding` → import, **workflow ID copy karo**, phir manually `2.6-invoice-payment` me ek Execute Workflow node add karke Step 12 ka ID daalo (2.7 README ke "Wiring" section me exact steps)
13. `2.8-delivery-reporting` → import, Metabase card/dashboard setup, Active karo (cron khud chalega)
14. `2.9-renewal-revenue-ops` → import, `renewal_date` populate karne ka process decide karo, failed-payment webhook gateway me connect karo, Active karo

Har module ko import karte hi **Active** toggle on karo, aur uske README ke "Test Kaise Kare" section follow karke ek dry-run zaroor karo before moving to the next one — chain wale modules (jinka ID doosre workflow me daalna hai) copy karne se pehle bhi test ho sakte hain manual "Execute Workflow" trigger se.

---

## 10. Go-Live Checklist

Launch se pehle in blockers ko close karo (poori list `README.md` ke "Launch-Readiness Blockers" section me hai):

- [ ] Pricing (Module 2.4): Ollama-generated numbers ko fixed rate card se replace karo
- [ ] `odoo_partner_id` per-lead properly link karo (Module 2.4, 2.6, 2.7 abhi fallback generic contact use kar rahe hain)
- [ ] Payment webhook (Module 2.6) + Failed-payment webhook (Module 2.9) par signature verification add karo
- [ ] Gotenberg wiring (Module 2.4) manually complete karo
- [ ] Odoo Contacts portal-access properly enable karo (Module 2.4, 2.6 ke payment/proposal links ke liye)
- [ ] Module 2.6 → 2.7 Execute Workflow node manually add karo
- [ ] `renewal_date` column ko populate karne ka actual process decide + implement karo
- [ ] Metabase public dashboard link ko sensitive-data-safe (signed/embedded) banao agar zaroorat ho

## 11. Backups (mat bhoolna)

```bash
# Daily cron -- Postgres dump (n8n, Odoo, Nextcloud sab databases)
0 3 * * * docker exec growth-engine-postgres-1 pg_dumpall -U growthengine > /backups/growthengine-$(date +\%F).sql
```
Volumes (`n8n_data`, `odoo_web_data`, `nc_data`, Postal's mail storage) bhi periodically off-site backup karo (rsync/restic to S3-compatible storage) — sab client data yahi par hai.
