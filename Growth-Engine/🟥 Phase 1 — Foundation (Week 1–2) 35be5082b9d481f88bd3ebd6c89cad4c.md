# 🟥 Phase 1 — Foundation (Week 1–2)

← [Back to Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)

---

> **Week 1–2. This phase is 100% manual by design. You're proving the model before you automate it. Goal: 50 leads in CRM, 5 calls booked, enquiry method running daily.**
> 

---

## 🎯 Phase 1 Objectives

| Objective | Target | Measure |
| --- | --- | --- |
| Leads scraped and validated | 200+ | HubSpot contact count |
| Leads in CRM (cleaned) | 50+ | HubSpot |
| Cold email sequence live | Day 10 | Instantly dashboard |
| Enquiry method posts daily | From Day 5 | LinkedIn + FB Groups |
| WhatsApp community created | Day 7 | Group member count |
| Calls booked | 5+ | [Cal.com](http://Cal.com) |
| Lead magnet built | Day 13 | PDF ready |

---

## 🗓️ Day-by-Day Execution

### DAY 1 — Data Infrastructure Setup

**Morning (3 hrs):**

- [ ]  Create HubSpot account → add custom contact properties: `ai_qualification_score`, `ai_pain_point`, `service_interest`, `lead_source_detail`, `country_code`, `outreach_sequence_active`
- [ ]  Set up HubSpot pipeline stages: Attention → Interested → Lead → Qualified → Call Booked → Proposal Sent → Negotiating → Won → Lost
- [ ]  Create [Apollo.io](http://Apollo.io) account → set first ICP filter: UK e-commerce founders (Title: Founder/Director, Industry: Ecommerce, Location: UK, Size: 1–25)
- [ ]  Export first 50 contacts from Apollo → download CSV

**Afternoon (2 hrs):**

- [ ]  Create Reoon account → upload CSV → validate emails → remove Invalid + Disposable
- [ ]  Import clean list to HubSpot → tag all: `source:apollo`, `country:uk`, `ind:ecommerce`, `status:cold`
- [ ]  Purchase cold email domain (e.g. `nivydigital.co` or `getnivy.com`) on Namecheap
- [ ]  Set up Google Workspace on new domain → create `growth@[domain]` mailbox
- [ ]  Connect domain to Instantly for warmup → enable warmup (min 14 days before sending)

**Deliverable:** 50 validated UK ecommerce leads in HubSpot. Email domain warming.

---

### DAY 2 — LinkedIn Scraping

- [ ]  Create PhantomBuster account → connect LinkedIn via cookies
- [ ]  Set Phantom: LinkedIn Search Export
- [ ]  Build LinkedIn search URL: Title=Founder OR Director, Industry=E-commerce, Location=United Kingdom
- [ ]  Run phantom → export 100–150 profiles to Google Sheet
- [ ]  Cross-reference with Apollo list → remove duplicates
- [ ]  Run new contacts through Reoon → import validated to HubSpot
- [ ]  Tag: `source:linkedin`, `country:uk`, `status:cold`
- [ ]  Run Apollo for second ICP: US Real Estate (Title: Broker/CEO/Owner, Location: US, Size: 1–10)

**Deliverable:** 150+ leads in HubSpot across UK ecommerce + US real estate.

---

### DAY 3 — Cold Email Sequence

- [ ]  Write 5-email cold email sequence in Google Doc:
    - Email 1: Pattern-interrupt hook + specific result for their industry
    - Email 2 (Day 3): Different angle — pain point + case study
    - Email 3 (Day 7): Social proof — testimonial or result
    - Email 4 (Day 12): "Breakup" — last message, easy re-engage
    - Email 5 (Day 21): Reactivation — new angle
- [ ]  Load sequence into Instantly → connect warmed mailbox
- [ ]  Set sending schedule: 9am–5pm Monday–Friday, max 30 emails/day
- [ ]  Add personalization variables: `{{first_name}}`, `{{company}}`, `{{industry_pain}}`
- [ ]  Set up reply detection webhook (Instantly → n8n — build in Phase 3, manual handling for now)

**Deliverable:** 5-email cold sequence ready in Instantly. Not sent yet — domain warming.

---

### DAY 4 — Google Maps Scraping

- [ ]  Create Apify account
- [ ]  Use Actor: Google Maps Scraper
- [ ]  Run searches:
    - `"accountant Lucknow"`, `"digital marketing agency Lucknow"`, `"CA firm Varanasi"`
    - `"restaurant Varanasi"`, `"clinic Lucknow"`, `"law firm Lucknow"`
- [ ]  Filter results: rating >3.5 AND has website
- [ ]  For each result with website: use [Hunter.io](http://Hunter.io) to find email from domain
- [ ]  Validate found emails in Reoon
- [ ]  Import to HubSpot → tag: `source:maps`, `country:in`, `status:cold`

**Deliverable:** 50+ local Indian business leads in HubSpot with verified emails.

---

### DAY 5 — Enquiry Method Goes Live

**LinkedIn (post by 10am):**

```
Looking for e-commerce brands based in the UK who want to scale their revenue 
through paid ads + email marketing.

We've helped 3 similar businesses grow 40–80% in 90 days.

If that sounds relevant, drop a ✅ below or DM me “scale” and I'll share details.
```

**Facebook Groups (post in 3 relevant groups):**

- Find groups: "UK Ecommerce Sellers", "Shopify UK", "Digital Marketing UK"
- Post format:

```
Quick question for ecommerce store owners in the UK —

Are you currently running paid ads? And if so, what's your biggest challenge with them right now?

Asking because we help brands fix exactly this and I'm curious what the common pain points are.

Comment below — happy to share what's working for our clients.
```

- [ ]  Monitor comments every 2 hours → DM anyone who engages
- [ ]  Log all DM conversations in HubSpot manually today

**WhatsApp Status:**

- [ ]  Post a tip or result on WhatsApp status: "How we helped an ecommerce brand reduce CAC by 40% in 60 days — 3 things they changed"

**Deliverable:** First enquiry method posts live. First organic leads from engagement.

---

### DAY 6–7 — WhatsApp Community

- [ ]  Create WhatsApp Business group: "Business Growth Circle — Nivy"
- [ ]  Write pinned welcome message explaining the group value
- [ ]  Invite first 20 people: existing contacts, network, LinkedIn connections who engaged
- [ ]  Post first value content: "5 free tools every business owner should be using in 2025"
- [ ]  Set up WhatsApp Business profile: logo, description, booking link
- [ ]  Create Telegram channel as backup/secondary: "Nivy Growth Insights"
- [ ]  Post 3 days of scheduled content in advance

**Deliverable:** WhatsApp community live with 20+ members. Telegram channel active.

---

### DAY 8 — Lead Capture Infrastructure

- [ ]  Create [Tally.so](http://Tally.so) account
- [ ]  Build 4 forms:
    1. **Free Business Audit Request** — Fields: Name, Email, WhatsApp, Company, Country, Service interest, Biggest challenge (free text)
    2. **Contact / Get a Quote** — Fields: Name, Email, Company, Service, Message
    3. **Community Join** — Fields: Name, Email, WhatsApp, Industry
    4. **Lead Magnet Download** — Fields: Name, Email, Company
- [ ]  Add all forms to website (or create simple landing pages on [Carrd.co](http://Carrd.co) if no website)
- [ ]  Set up [Cal.com](http://Cal.com) → connect Google Calendar → set availability 9am–6pm Mon–Fri
- [ ]  Add booking link to: email signature, LinkedIn bio, WhatsApp bio, all Tally forms

**Deliverable:** All lead capture forms live. Booking link accessible.

---

### DAY 9 — Client Portal Template

- [ ]  Create Notion client portal template page with sections:
    - Welcome message
    - Project timeline (week by week)
    - Deliverables tracker (table)
    - KPI dashboard (embed)
    - Communication notes
    - Access credentials (Bitwarden link)
- [ ]  Create Google Drive folder template structure:
    - `Client Name → Campaign → Assets → Reports → Contracts`
- [ ]  Create PandaDoc account → build 3-tier proposal template:
    - Starter Package
    - Growth Package
    - Scale Package
- [ ]  Set up Bitwarden (free) for secure credential storage

**Deliverable:** All client infrastructure templated and ready to deploy.

---

### DAY 10 — Cold Email Goes Live

- [ ]  Check Instantly domain health score (must be >80 before sending)
- [ ]  If healthy: start cold email sequence — 30 emails/day, max
- [ ]  Set reply notifications to your main email
- [ ]  Continue enquiry method: new LinkedIn post + new Facebook Group post (different groups)
- [ ]  Monitor HubSpot — any inbound from forms or booking link?
- [ ]  Continue scraping: add 50 more contacts from Apollo (new ICP: UAE business owners)

**Deliverable:** Cold email live. Enquiry method daily rhythm established.

---

### DAY 11–12 — Monitor + Optimise

- [ ]  Check Instantly: open rates, reply rates per email
- [ ]  Any replies? Log in HubSpot immediately. HOT reply? Book call today.
- [ ]  Review LinkedIn post engagement: who liked/commented? DM them.
- [ ]  Review Facebook Group comments: DM every engager
- [ ]  Add 30 more contacts to Apollo scrape (Australian SMB owners)
- [ ]  Rewrite Email 1 subject line if open rate <20% (A/B test: curiosity vs. direct benefit)

---

### DAY 13 — Lead Magnet

- [ ]  Choose lead magnet topic based on your strongest ICP:
    - UK ecommerce: "The 7-Point Paid Ads Checklist for E-commerce Brands"
    - OR: "How to Hire a VA Without Getting Burned: A Founder's Guide"
- [ ]  Design in Canva (PDF, 5–8 pages, branded)
- [ ]  Upload to Google Drive → get shareable link
- [ ]  Update Tally lead magnet form with the resource
- [ ]  Create 1-page Carrd landing page for the lead magnet
- [ ]  Post lead magnet offer on LinkedIn and WhatsApp status

**Deliverable:** Lead magnet live. First email list signups expected.

---

### DAY 14 — Phase 1 Review

**Check these numbers:**

- [ ]  Total contacts in HubSpot: target 200+
- [ ]  Cold email open rate: target >25%
- [ ]  Cold email reply rate: target >3%
- [ ]  Calls booked: target 5+
- [ ]  HOT leads identified: target 3+
- [ ]  Enquiry method responses: track all
- [ ]  Community members: target 30+

**If open rate <20%:** Rewrite subject lines. Check domain health in Instantly.

**If reply rate <3%:** Rewrite Email 1 body. Add more personalization.

**If 0 calls booked:** Make booking link more prominent. Add it to every touchpoint.

---

## 🛠️ Tools to Set Up in Phase 1

| Tool | Purpose | Cost | Action |
| --- | --- | --- | --- |
| HubSpot | CRM | Free | Create account Day 1 |
| [Apollo.io](http://Apollo.io) | B2B lead scraping | Free (50/mo) | Create account Day 1 |
| Reoon | Email validation | ~$10/mo | Create account Day 1 |
| Instantly | Cold email sending | ~$37/mo | Create account Day 1 |
| PhantomBuster | LinkedIn scraping | Free tier | Create account Day 2 |
| Apify | Google Maps scraping | Free tier | Create account Day 4 |
| [Hunter.io](http://Hunter.io) | Email finding from domain | Free (25/mo) | Create account Day 4 |
| [Tally.so](http://Tally.so) | Lead capture forms | Free | Create account Day 8 |
| [Cal.com](http://Cal.com) | Booking system | Free | Create account Day 8 |
| Notion | Client portal | Free | Create account Day 9 |
| PandaDoc | Proposals + e-sign | Free tier | Create account Day 9 |
| Bitwarden | Credential vault | Free | Create account Day 9 |
| Canva | Lead magnet design | Free | Create account Day 13 |

**Total Phase 1 cost: ~$47/mo**

---

## 🔗 Next Phase

**➡️ [Phase 2 — Conversion](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)** | **⬅️ [Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)**