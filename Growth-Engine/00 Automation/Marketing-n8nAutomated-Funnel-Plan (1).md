# Nivy International Agency — Automated n8n Funnel (Master Plan)

> Source: `Marketing-funnel-automation.md` (ChatGPT export) — sabhi n8n workflows, tools aur channels ko ek connected system me joda gaya hai.
> Ye document sirf **PLAN** hai — koi build nahi hua hai abhi. Approve karne ke baad hi implementation shuru hogi.

---

## 1. Core Idea — Ek Funnel, n8n se Connected

Doc me jitne bhi individual n8n workflows diye the (lead qualification, outreach, nurture, proposal, contract, payment, onboarding, reporting, etc.) — wo sab **standalone** the. Plan ka goal hai unko ek **single orchestrated funnel** me jodna, jaha:

- Har workflow ek **module** banega (apna trigger + apna kaam)
- Sab modules **PostgreSQL (central database)** se connected honge — ek hi "lead/client record" sabhi jagah update hota rahega
- Ek module dusre ko **"Execute Workflow" node** ya **Webhook** se call karega
- Har lead/client ek "status field" ke through funnel me aage badhega (New → Qualified → Contacted → Nurtured → Booked → Proposal Sent → Won → Onboarded → Delivered → Renewal)

```
TRAFFIC (SEO + Social + Ads)
        ↓
LEAD CAPTURE (Website form / Typebot / LinkedIn / Cold Email reply)
        ↓
AI QUALIFICATION (Ollama scoring)
        ↓
CRM SYNC (Odoo — single source of truth)
        ↓
     ┌──┴──┐
OUTREACH   NURTURE (agar turant qualified nahi)
     └──┬──┘
        ↓
BOOKING (Cal.com / Calendly sync)
        ↓
PROPOSAL GENERATION (AI + PDF)
        ↓
CONTRACT + E-SIGN
        ↓
INVOICE + PAYMENT
        ↓
ONBOARDING (folder + project + chat channel auto-create)
        ↓
DELIVERY + REPORTING (recurring)
        ↓
RENEWAL / UPSELL / REFERRAL (loop back to top)
```

---

## 2. Final Tool Stack (Odoo-Maximized, 100% Free / Open-Source)

Odoo Community edition khud ek full ERP hai (LGPL license, 100% free, no user limit) — CRM, Sales, Invoicing, Project, Website, Discuss, Email Marketing (mass mailing) sab already free hain. Jaha jaha Odoo ka free module kaam kar sakta tha, wahan alag tool hata diya hai. Sirf wahi external tool rakha hai jo Odoo Community me **Enterprise-locked** hai ya Odoo se better suited hai.

| Function | Tool | Kyun |
|---|---|---|
| Automation engine | **n8n** (self-hosted) | Sabko connect karne wala orchestrator |
| AI (scoring, content, copywriting) | **Ollama** — Qwen 2.5 7B (primary), Mistral 7B (backup) | Odoo Community me koi AI feature nahi hai (AI = Enterprise-only) |
| CRM + Sales pipeline | **Odoo Community (CRM + Sales)** | Free |
| Project management | **Odoo Community (Project app)** | ✅ Replaced OpenProject — Odoo Project free hai, aur CRM/client se directly linked rahega |
| Invoicing / Payment | **Odoo Community (Invoicing app)** | Free — basic invoicing built-in |
| Internal team chat/notifications | **Odoo Community (Discuss)** | ✅ Replaced Rocket.Chat — same database me rehta hai, alag app maintain nahi karna padega |
| Website + Blog + SEO | **Odoo Community (Website app)** | ✅ Replaced WordPress — free, drag-drop builder, built-in SEO tools (sitemap, meta, redirects). *Trade-off: WordPress ka plugin ecosystem bada hai, agar heavy custom blog/SEO plugins chahiye to WordPress better rahega — bata dena, dono setup ke instructions de dunga.* |
| Website forms | **Odoo Community (Website Forms)** | ✅ Replaced NocoDB — form submission directly CRM lead banata hai, extra tool nahi chahiye |
| Bulk/campaign email composer | **Odoo Community (Email Marketing / Mailing app)** | Free — campaign banane/bhejne ka UI, lekin isko delivery ke liye SMTP relay chahiye (neeche dekho) |
| Email sending (SMTP/delivery layer) | **Postal** (self-hosted) | Section 7 me detailed comparison — Postal best hai |
| Database | **PostgreSQL** | Odoo aur n8n dono isi par chalte hain |
| WhatsApp | **Waha** (open-source gateway) or WhatsApp Cloud API free tier | Odoo ka native WhatsApp app **Enterprise-only** hai — n8n directly Waha/Cloud API se WhatsApp bhejega aur Odoo CRM me log karega |
| Website chatbot (lead qualification) | **Typebot** | Odoo ka free Livechat basic hai, complex branching logic ke liye Typebot better hai |
| Document/proposal PDF | **Odoo Sales Quotation (built-in)** for simple proposals, **Gotenberg** for AI-personalized/custom-designed proposals | Odoo Sales PDF free hai; Gotenberg tab chahiye jab fully custom-branded AI proposal banani ho |
| E-signature | **Documenso** (open-source, self-hosted) | Odoo Sign **Enterprise-only** hai — Documenso free DocuSign-alternative hai |
| File storage (client documents/assets) | **Nextcloud** | Odoo Documents app **Enterprise-only** hai, isliye Nextcloud zaroori hai |
| Social scheduling | **Mixpost** | Odoo me koi social scheduler nahi hai |
| Analytics / cross-tool reporting | **Metabase** (+ GSC, GA4 feeds) | Odoo ke apne module reports free hain (Sales/CRM pivot & graph views), lekin n8n+multi-tool data ko ek dashboard me lane ke liye Metabase zaroori hai |
| Booking | **Cal.com** | Odoo Appointments **Enterprise-only** hai |

Sab tools free/self-hosted hain — koi monthly SaaS cost nahi.

---

## 3. Odoo Community me kya FREE hai vs kya ENTERPRISE-only hai (verified)

| Odoo Free (Community) | Odoo Enterprise-only (isliye external tool use kiya) |
|---|---|
| CRM, Sales, Invoicing (basic), Project, Website, eCommerce, HR, Discuss, Email Marketing (mass mailing) | **Documents** (→ Nextcloud) |
| | **Sign** / e-signature (→ Documenso) |
| | **Marketing Automation** (drip/trigger flows) (→ n8n + Odoo CRM stages) |
| | **Appointments** / booking (→ Cal.com) |
| | **WhatsApp integration** (→ Waha/Cloud API via n8n) |
| | **Helpdesk (advanced)**, **Studio**, **AI features** (lead scoring, AI agents) (→ Ollama + n8n) |

Ye split confirm kiya hua hai (2026 ke current Odoo docs ke hisaab se) — koi assumption nahi.

---

## 4. Phase-wise Implementation

### **PHASE 1 — Marketing Engine (Traffic → Qualified Lead)**

**Goal:** Content se lekar CRM tak — poora "top-of-funnel" fully automated ho.

| # | Module | Workflow | Trigger | Output |
|---|---|---|---|---|
| 1.1 | Content → Social Factory | Odoo Website blog publish → n8n webhook → Ollama rewrites for LinkedIn/X/Instagram/FB → Mixpost schedules | New blog post | Auto social posts on all platforms |
| 1.2 | SEO Automation | GSC API → Ollama keyword clustering; Odoo Website → Ollama meta description generator; broken-link crawler | Weekly cron | SEO fixes + weekly report |
| 1.3 | Website Lead Capture | Typebot widget → n8n webhook → Ollama classifies service type → Odoo CRM lead created | Visitor interaction | New CRM lead |
| 1.4 | Inbound Form Qualification | Odoo Website Form / Typebot → Ollama scores lead (hot/warm/cold) → routes + auto-response | Form submit | Scored + routed lead |
| 1.5 | Central CRM Sync | Odoo as single source of truth — all above modules write here | Every lead event | Unified lead record |

**Deliverable of Phase 1:** Website traffic → automatically becomes a scored, CRM-logged lead, with zero manual work. Social + SEO content pipeline is self-running.

---

### **PHASE 2 — Sales + Delivery Engine (Lead → Paying Client → Delivery)**

**Goal:** Qualified lead se lekar payment, onboarding, delivery, reporting, renewal tak — poora "bottom-of-funnel + retention" automated ho.

| # | Module | Workflow | Trigger | Output |
|---|---|---|---|---|
| 2.1 | Multi-channel Outreach | Odoo lead → Ollama writes personalized email + LinkedIn + WhatsApp message → Postal/Waha sends → reply tracked | New/unqualified-hot lead | Outreach sequence running |
| 2.2 | Nurture Sequence | Delayed email + WhatsApp drip based on lead stage | Lead not yet ready | Warmed-up lead |
| 2.3 | Booking Sync | Cal.com booking → Odoo CRM activity auto-created | Meeting booked | CRM activity logged |
| 2.4 | Proposal Generation | Lead marked "qualified for proposal" → Ollama drafts proposal → Odoo Sales Quotation PDF (simple) or Gotenberg (custom-branded) → stored in Nextcloud → emailed | CRM stage change | Auto-sent proposal |
| 2.5 | Contract + E-sign | Proposal accepted → contract auto-generated → **Documenso** e-sign flow | Proposal accepted | Signed contract |
| 2.6 | Invoice + Payment | Contract signed → Odoo Invoicing invoice created → payment link sent → receipt on payment | Contract signed | Paid invoice + receipt |
| 2.7 | Client Onboarding | Deal marked "Won" in Odoo → Nextcloud folder + **Odoo Project** created + **Odoo Discuss** channel + welcome email + recurring task templates, all auto-created | Deal won | Client fully onboarded |
| 2.8 | Delivery + Reporting | Recurring Metabase report generation → auto-email to client | Weekly/monthly cron | Client report delivered |
| 2.9 | Renewal + Revenue Ops | Contract renewal reminders, Stripe/Odoo payment recovery, churn alerts | Renewal date approaching / failed payment | Retention actions triggered |

**Deliverable of Phase 2:** Ek "Won" deal se lekar recurring delivery + renewal tak — sab automatic. Human involvement sirf strategy calls, negotiation, aur final creative QA me rehta hai (~1%).

---

## 5. Connection Method (Kaise sab jud ke ek funnel banega)

1. **Central Postgres table** (`clients_master`) — har module isi table ko read/write karega, taaki ek client ka status hamesha sync rahe.
2. **"Execute Workflow" node** — Phase 1 ka last step (CRM sync) directly Phase 2 ke pehle module (outreach) ko trigger karega.
3. **Odoo CRM stage changes** as universal trigger — jab bhi CRM me stage change hoti hai (New → Qualified → Won → Renewal), n8n uss par listen karke agla workflow chalayega.
4. **Odoo Discuss notifications** — har major step par team ko alert milega (same Odoo database ke andar), taaki human checkpoint (approval, QA) miss na ho.

---

## 6. Suggested Build Sequence

1. Infra setup: n8n + PostgreSQL + Odoo + Ollama server-side install (VPS)
2. Phase 1 modules 1.3 → 1.4 → 1.5 (lead capture pehle, kyunki baaki sab isi par depend karta hai)
3. Phase 2 modules 2.1 → 2.4 → 2.6 → 2.7 (outreach → proposal → payment → onboarding — revenue-critical path)
4. Phase 1 modules 1.1 → 1.2 (content/SEO — top-of-funnel scale-up)
5. Phase 2 remaining modules 2.2, 2.3, 2.5, 2.8, 2.9 (nurture, booking sync, e-sign, reporting, renewal)

---

## 7. Email Sending — Best Tool Kaunsa Hai (Postal vs Mautic vs Listmonk)

Ye teeno tools alag kaam karte hain — inme "best" choose karne se pehle samajhna zaroori hai:

| Tool | Kya hai | Delivery khud karta hai? | Fit hamare stack me |
|---|---|---|---|
| **Postal** | Full self-hosted mail server (MTA) — SMTP + DKIM/SPF/DMARC + open/click/bounce tracking + webhooks | ✅ Haan — ye khud ek mail server hai | ✅ **Best fit** — isse Odoo Email Marketing app aur n8n dono ka email SMTP powered hoga |
| **Mautic** | Full marketing automation platform — drip campaigns, lead scoring, landing pages | ❌ Nahi — isko bhi ek SMTP relay chahiye (Postal/SES/Mailgun) | ❌ Redundant — ye jo karta hai (lead scoring, drip, campaigns) wo already Odoo CRM + n8n kar rahe hain. Extra tool = extra maintenance. Iske alawa 2024 se Mautic ka corporate backing kam hua hai, maintenance dheeli ho gayi hai. |
| **Listmonk** | Lightweight newsletter/broadcast tool — bahut fast, single binary | ❌ Nahi — isko bhi SMTP relay chahiye | ❌ Zaroorat nahi — Odoo Email Marketing app already newsletter/campaign UI de raha hai |

### Final Recommendation: **Postal**

**Reason:** Postal hi asli "email sending engine" (SMTP relay) hai — baaki dono (Mautic, Listmonk) sirf campaign-building tools hain jo khud delivery ke liye Postal jaisa relay maangte hain. Chunki humare paas already Odoo (CRM + Email Marketing app + campaign UI) aur n8n (automation logic) hai, Mautic ya Listmonk add karna duplicate kaam hoga.

**Setup:** Postal ek baar VPS par self-host karo (apna domain, SPF/DKIM/DMARC configure karo) → uske SMTP credentials Odoo ke **Settings → Technical → Outgoing Mail Servers** me daal do → ab Odoo Email Marketing app, CRM notifications, aur n8n ke email nodes — sab Postal se hi bhejenge, ek hi jagah se deliverability track hogi.

**Volume high hone par:** Multiple sending domains/IPs Postal me configure kar sakte ho reputation isolate karne ke liye (e.g. cold-outreach@ alag domain, transactional@ alag domain).

---

## 8. Aapse chahiye (before build start)

- [ ] VPS/server details (RAM, storage) — Ollama 7B model ke liye kam se kam 16GB RAM recommend
- [ ] Konsi services pehle launch karni hain (SEO / AI Automation / VA / Design / Video)? — priority decide karega ki kaunsa outreach template pehle banega
- [ ] Domain access, Odoo instance status (naya banana hai ya existing hai)
- [ ] Confirm: Phase 1 se shuru karein ya seedha Phase 2 revenue-critical path (2.1→2.4→2.6→2.7) se?

Confirm karo, phir main is plan ko actual n8n workflow JSON + node-by-node build instructions me convert karna shuru karunga.

---

## 9. Progress Tracker

> Jaise jaise build hota jaayega, yaha checkbox tick karte jaana — is file me hi status track hoga.

### A. Infra Setup

- [ ] VPS provision (RAM/storage confirm)
- [ ] PostgreSQL install
- [ ] Odoo Community install (CRM, Sales, Invoicing, Project, Website, Discuss apps activate)
- [ ] n8n self-hosted install
- [ ] Ollama install + Qwen 2.5 7B model pull
- [ ] Postal install + domain SPF/DKIM/DMARC configure
- [ ] Postal SMTP credentials → Odoo Outgoing Mail Server me add
- [ ] Nextcloud install
- [ ] Documenso install
- [ ] Mixpost install
- [ ] Metabase install (+ GSC/GA4 connect)
- [ ] Cal.com install
- [ ] Waha install / WhatsApp Cloud API setup
- [ ] Typebot install

### B. Phase 1 — Marketing Engine

| # | Module | Status |
|---|---|---|
| 1.1 | Content → Social Factory | ✅ Done |
| 1.2 | SEO Automation | ✅ Done |
| 1.3 | Website Lead Capture | ✅ Done |
| 1.4 | Inbound Form Qualification | ✅ Done |
| 1.5 | Central CRM Sync | ✅ Done |

### C. Phase 2 — Sales + Delivery Engine

| # | Module | Status |
|---|---|---|
| 2.1 | Multi-channel Outreach | ✅ Done |
| 2.2 | Nurture Sequence | ✅ Done |
| 2.3 | Booking Sync | ✅ Done |
| 2.4 | Proposal Generation | ✅ Done |
| 2.5 | Contract + E-sign | ✅ Done |
| 2.6 | Invoice + Payment | ✅ Done |
| 2.7 | Client Onboarding | ✅ Done |
| 2.8 | Delivery + Reporting | ✅ Done |
| 2.9 | Renewal + Revenue Ops | ✅ Done |

**Status legend:** ⬜ Not started · 🟨 In progress · ✅ Done · ⛔ Blocked

**Last updated:** 2 August 2026 — Phase 1 (1.1–1.5) aur Phase 2 (2.1–2.9) dono ab poori tarah ban chuke hain — poora funnel (traffic → lead → outreach → booking → proposal → contract → payment → onboarding → recurring reporting → renewal/churn/dunning) importable n8n workflows ke roop me ready hai. Importable workflows `growth-engine-automation/phase-1/` aur `growth-engine-automation/phase-2/` folders me hain. **Zaroori:** Module 2.6 → 2.7 ka Execute Workflow wiring abhi manual add karna hai (2.7 README ka "Wiring" section dekho); baaki chain (1.5 → 2.1/2.4/2.5, 2.5 → 2.6) already wired hai import ke baad ID daalne se. Launch se pehle ke data-quality/security blockers ke liye top-level `README.md` ka "Launch-Readiness Blockers" section dekho.
