# 🟨 Phase 3 — Systems Execution Plan (Month 2)

> **GOAL: Automate everything, deliver professionally for your first clients, scale to 3–5 active paying clients, and build the full pipeline engine.**
> 

← [Back to Command Center](https://www.notion.so/35be5082b9d4813f9c98d56f3c78bd61)

---

## 🏆 What You Will Have By End of Month 2

- n8n installed with first 3 automation workflows running
- Tally → HubSpot auto-import live
- Auto-WhatsApp response on every new lead
- Full 21-day email + WhatsApp nurture sequence live
- Behavioral trigger emails live (pricing page visit, re-open)
- Lead scoring engine (HOT 70+ / WARM 40–69 / COLD <40) running
- VIP lead routing to founder direct
- Looker Studio dashboard for every client
- AI-generated bi-weekly client reports
- Monthly CSAT survey automated
- 3–5 active paying clients
- Notion client portal template operational
- Google Drive auto-folder structure per client

---

## 🗓️ MONTH 2, WEEK 1 — Install n8n + First 3 Automations

### Install n8n (Free)

**Option A — n8n Cloud (easiest for beginners):**

- [ ]  Go to [n8n.io](http://n8n.io) → "Start for free" → 14-day trial
- [ ]  Use this while learning → self-host later to keep it free

**Option B — Self-hosted on VPS (free forever):**

- [ ]  Get a VPS from Hostinger or DigitalOcean (₹300–500/month)
- [ ]  Install n8n following [docs.n8n.io](http://docs.n8n.io) quick-start guide
- [ ]  This is the free option long-term — recommended for Phase 3+
- [ ]  Bookmark n8n dashboard — this is your automation HQ
- [ ]  ✅ n8n installed

### Automation Workflow 1: Tally Form → HubSpot Auto-Import

**What it does:** Every Tally form submission automatically creates a HubSpot contact and assigns it to "New Lead" stage. No manual entry.

- [ ]  In n8n: New Workflow → Add **Tally Trigger** node
    - Set to trigger on your lead audit form submissions
- [ ]  Add **HubSpot** node: Create/Update Contact
    - Map: Name → First Name, WhatsApp → Phone, Business → Company, Budget → custom field
- [ ]  Set lead status to **New Lead**
- [ ]  Test with a real form submission → confirm contact appears in HubSpot
- [ ]  Activate workflow
- [ ]  ✅ Tally → HubSpot automated

### Automation Workflow 2: Auto-WhatsApp on New Lead

**What it does:** Every new lead gets a WhatsApp reply within 5 minutes. You never miss a hot lead.

- [ ]  Connect **WhatsApp Cloud API** (free tier from Meta: [developers.facebook.com](http://developers.facebook.com))
- [ ]  In n8n: When new HubSpot contact created (status = New Lead) → send WhatsApp
    - Message: *"Hi [Name]! We received your request for a free marketing audit for [Business Name]. Our team will call you within 4 hours. Meanwhile, feel free to book a time directly: [Calendly link]"*
- [ ]  Test with a real submission → confirm WhatsApp fires
- [ ]  Activate
- [ ]  ✅ Auto-WhatsApp response live

### Automation Workflow 3: Lead Magnet Email Delivery

**What it does:** Every new Tally submission instantly receives your lead magnet PDF by email.

- [ ]  In n8n: Tally form trigger → Gmail Send node
    - To: their email
    - Subject: *"Here’s your free 5-point marketing audit [Name]"*
    - Body: *"Hi [Name], thank you for your interest! Here’s your free marketing audit guide: [Google Drive link]. We'll WhatsApp you within 4 hours to book your personalized audit call. Nivy Digital"*
- [ ]  Activate
- [ ]  ✅ Lead magnet auto-delivered

---

## 🗓️ MONTH 2, WEEK 2 — 21-Day Nurture Sequence

**Build this in Brevo (Automation) — set it up once, it runs forever.**

### The Full 21-Day Sequence Blueprint

This runs automatically for every WARM lead (score 40–69).

| Day | Channel | What to Send |
| --- | --- | --- |
| Day 0 | Email | Welcome + lead magnet delivery |
| Day 1 | WhatsApp | *"Did you get the free guide? Any questions?"* |
| Day 3 | Email | Case study with real numbers from a similar business |
| Day 5 | Email | "The #1 mistake [industry] businesses make with [service]" |
| Day 7 | WhatsApp | Personal check-in: *"Hope things are going well at [business]! Any questions about the guide?"* |
| Day 10 | Email | ROI breakdown — what 3x your current leads would mean for revenue |
| Day 12 | Email | Behind the scenes — how Nivy delivers results (your process) |
| Day 14 | Email | *"Your free audit is still available"* — soft CTA |
| Day 16 | LinkedIn | Like/comment on their post (manual touch) |
| Day 18 | WhatsApp | *"Hi [Name], I’d love 20 minutes with you this week — when works?"* |
| Day 21 | Email | *"Still thinking it over? No rush — here’s my calendar whenever you’re ready."* |

**If no engagement by Day 21 → move to Stage 11B Reactivation (30-day dormant)**

**If books call at any point → immediately exit to Stage 6 Conversion**

### Set Up in Brevo:

- [ ]  Brevo → Automations → Create Workflow
- [ ]  Trigger: **Contact added to "New Lead" list**
- [ ]  Add 8 email steps with delays between them (use the day schedule above)
- [ ]  Use the template subjects below for each email:
    - Day 0: *"Your free marketing audit guide is here, [Name]"*
    - Day 3: *"How [similar business] got 47 leads in 30 days"*
    - Day 5: *"The mistake costing [industry] businesses clients every day"*
    - Day 10: *"What would 3x more leads mean for [business name]?"*
    - Day 12: *"How we actually deliver results at Nivy (behind the scenes)"*
    - Day 14: *"Your free audit is still available this week"*
    - Day 21: *"Leaving the door open for you, [Name]"*
- [ ]  Activate automation
- [ ]  ✅ 21-day email nurture live

### WhatsApp Sequence (set up in n8n):

- [ ]  Workflow: HubSpot contact status = WARM → schedule Day 1, Day 7, Day 18 WhatsApp messages
- [ ]  Activate
- [ ]  ✅ WhatsApp nurture live

### Behavioral Trigger Emails:

- [ ]  **Pricing page visit trigger**: When lead visits your pricing/services page → email fires within 1 hour: *"You were just checking our pricing — any questions? Happy to walk through which package fits you best."*
- [ ]  **Re-open after silence**: Lead opens email after 7+ days of no activity → follow-up email within 24hrs
- [ ]  Set up both in Brevo Automations or n8n
- [ ]  ✅ Behavioral triggers live

---

## 🗓️ MONTH 2, WEEK 3 — Lead Scoring Engine (Stage 4)

**Build the HOT/WARM/COLD scoring system so you always know which leads to contact first.**

### Lead Scoring Formula

| Factor | Signal | Points |
| --- | --- | --- |
| Budget | >$5k/month | 30 |
| Budget | $1k–5k | 15 |
| Budget | Unknown | 5 |
| Timeline | This month | 25 |
| Timeline | Next quarter | 15 |
| Timeline | Exploring | 5 |
| Company size | >20 employees | 20 |
| Company size | 5–20 | 12 |
| Company size | Solo | 5 |
| Source quality | Referral | 20 |
| Source quality | Inbound (form/DM) | 12 |
| Source quality | Cold outreach | 5 |
| Engagement | Visited pricing page | 20 |
| Engagement | Clicked email link | 10 |
| Engagement | Opened email | 5 |
| ICP match | Perfect fit | 15 |
| ICP match | Partial | 8 |
| ICP match | Poor | 0 |

**Score thresholds:**

- **🔥 HOT (70+):** Sales contact within 2 hours — alert fires immediately
- **🟡 WARM (40–69):** Auto-enroll in 21-day nurture sequence
- **🟢 COLD (<40):** Long-track monthly newsletter sequence
- **⭐ VIP flag:** Founder contacts directly, skips all sequences

### Set Up in HubSpot (manual scoring now, n8n later):

- [ ]  HubSpot → Contacts → Add custom property: **Lead Score** (number field)
- [ ]  For each new lead, manually calculate score and enter it
- [ ]  Create **Smart Lists** in HubSpot:
    - Hot Leads (Lead Score ≥ 70)
    - Warm Leads (Lead Score 40–69)
    - Cold Leads (Lead Score < 40)
- [ ]  Check Hot Leads list **every morning** — contact all hot leads within 2 hours
- [ ]  ✅ Lead scoring operational

### HOT Lead Alert (n8n workflow):

- [ ]  In n8n: When HubSpot contact score ≥ 70 → send WhatsApp to yourself: *"🔥 HOT LEAD: [Name], [Business], Score [X]/100. Contact NOW."*
- [ ]  Also create HubSpot task automatically: "Contact [Name] within 2 hours"
- [ ]  Activate
- [ ]  ✅ HOT lead alert live

---

## 🗓️ MONTH 2, WEEK 4 — Delivery Engine (Stage 8)

**Deliver professionally. This is what gets referrals and renewals.**

### Client Reporting Setup

- [ ]  Set up **Google Looker Studio** (free): [lookerstudio.google.com](http://lookerstudio.google.com)
    - Connect Google Analytics → create traffic overview template
    - Connect Meta Ads (if running) → ad performance section
    - Share live dashboard link with client in their Notion portal

### AI Report Generation (n8n Workflow):

- [ ]  Workflow: Every 2nd Monday 8am → pull GA4 + Meta metrics → send to OpenAI → generate report → email to yourself for review → forward to client after 2-min check
- [ ]  Use this prompt for OpenAI: *"Write a professional 400-word bi-weekly performance report for [client name] ([industry]). Service: [service]. Metrics: [data]. Include: executive summary, what’s working, what we’re optimizing, next 2 weeks plan. Tone: professional, honest, optimistic."*
- [ ]  Activate
- [ ]  ✅ AI reports live

### Delivery Operating Rhythm (for every active client):

| When | What to Do |
| --- | --- |
| Every Friday | Send WhatsApp update: key win from the week |
| Every 2nd Monday | Send AI-generated performance report (review before sending) |
| Every 25th | Schedule next month’s strategy review call |
| Every 15th | Send CSAT pulse survey (Tally form — create this) |
| Month 2 complete | Start upsell conversation if KPIs exceeded |

### Client Delivery Checklist (do for every client, every month):

| Task | Week 1 | Week 2 | Week 3 | Week 4 |
| --- | --- | --- | --- | --- |
| Execute all agreed deliverables | ⬜ | ⬜ | ⬜ | ⬜ |
| Weekly WhatsApp update | ⬜ | ⬜ | ⬜ | ⬜ |
| Track all KPIs | ⬜ | ⬜ | ⬜ | ⬜ |
| Quality check before delivery | ⬜ | ⬜ | ⬜ | ⬜ |
| Bi-weekly report |  | ⬜ |  | ⬜ |
| Monthly strategy call |  |  |  | ⬜ |
| CSAT survey |  |  | ⬜ |  |

### KPI Thresholds to Monitor:

| Metric | Alert if... | Action |
| --- | --- | --- |
| Meta CTR | < 1% | Review creative, test new ads |
| Meta CPC | > ₹150 | Adjust targeting, optimize bid |
| GA4 sessions | Down >20% WoW | Check traffic sources |
| Lead form submissions | 0 in 7 days | Review form placement + traffic |
| CSAT score | < 8/10 | AM calls client within 24hrs |

---

## 🛠️ New Tools in Phase 3

| Tool | Cost | Purpose |
| --- | --- | --- |
| n8n (self-hosted VPS) | ~₹400/month | All automation workflows |
| WhatsApp Cloud API | Free tier | Auto-WhatsApp responses |
| Google Looker Studio | Free | Client dashboards |
| Brevo Automation | Free tier | 21-day nurture sequence |
| OpenAI API | Pay per use (~₹500/month) | AI report generation |

---

## ✅ Phase 3 Complete Checklist

| Task | Done? |
| --- | --- |
| n8n installed and running | ⬜ |
| Tally → HubSpot auto-import live | ⬜ |
| Lead magnet auto-email delivery live | ⬜ |
| Auto-WhatsApp on new lead live | ⬜ |
| 21-day email nurture sequence live | ⬜ |
| WhatsApp nurture sequence live | ⬜ |
| Behavioral trigger emails live | ⬜ |
| Lead scoring system operational (HOT/WARM/COLD) | ⬜ |
| HOT lead WhatsApp alert live | ⬜ |
| Google Looker Studio dashboard created | ⬜ |
| AI bi-weekly report workflow live | ⬜ |
| Monthly CSAT survey automated | ⬜ |
| 3–5 active paying clients | ⬜ |

**All checked → go to Phase 4.**