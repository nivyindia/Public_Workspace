# 🗄️ HubSpot CRM Setup & Configuration Guide

**Parent:** 🎯 SD-09 CRM | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `HubSpot` `CRM` `setup` `configuration` `pipeline` `SD-09`

---

> 🎯 **Purpose:** Step-by-step guide to setting up and configuring HubSpot CRM free tier for Nivy Digital — from account creation to a fully working sales pipeline.
> 

---

# 📌 QUICK NAVIGATION

- [Account Setup](#account)
- [Contact Properties Setup](#contacts)
- [Deal Pipeline Configuration](#pipeline)
- [Lead Scoring Setup](#scoring)
- [Automation Rules](#automation)
- [Reports & Dashboards](#reports)
- [Team Training Notes](#training)

---

# ✅ ACCOUNT SETUP {#account}

## Step 1 — Create Free Account

1. Go to [hubspot.com](http://hubspot.com) → "Get started free"
2. Sign up with: [hello@nivydigital.com](mailto:hello@nivydigital.com)
3. Company name: Nivy Digital
4. Company size: 1–10
5. Industry: Marketing & Advertising

## Step 2 — Basic Configuration

- [ ]  Company info filled: address, website, timezone (India/Kolkata)
- [ ]  Logo uploaded
- [ ]  Connect Gmail (for email tracking: see opens, clicks in CRM)
- [ ]  Install HubSpot Chrome extension (tracks email opens in Gmail)
- [ ]  Install HubSpot tracking code on website
- [ ]  Connect [Cal.com](http://Cal.com) (via HubSpot integration or n8n)

## Step 3 — Invite Team Members

- Founder: Admin
- VA 1 (outreach): Sales rep access
- VA 2 (operations): View access

---

# 👤 CONTACT PROPERTIES SETUP {#contacts}

## Default Properties to Use (Already in HubSpot)

- First Name, Last Name, Email, Phone, Company, Job Title, Country, Website

## Custom Properties to Create

| Property Name | Type | Values |
| --- | --- | --- |
| Lead Source | Dropdown | Website / Chatbot / LinkedIn / Cold Email / WhatsApp / Directory / Referral / Other |
| Service Interest | Dropdown | VA Services / Digital Marketing / Automation / Lead Gen / Multiple |
| Market | Dropdown | India / USA / UK / UAE / Australia / Other |
| VA Hours/Week | Dropdown | 10 hrs / 20 hrs / Full-time / Unknown |
| Budget Range | Dropdown | <$300 / $300–$600 / $600–$1,500 / $1,500+ / Unknown |
| Outreach Channel | Dropdown | LinkedIn / Cold Email / WhatsApp / Social DM / Inbound |
| Referral Source | Text | [name of referrer] |

## How to Create Custom Properties

1. HubSpot → Settings → Properties
2. Filter by: Contacts
3. Click "Create property"
4. Fill in: Label, Field type, Group ("Contact information")
5. Save

---

# 📊 DEAL PIPELINE CONFIGURATION {#pipeline}

## Pipeline: Nivy Digital Sales

Go to: CRM → Deals → Pipeline settings → Edit pipeline

| Stage # | Stage Name | Probability | Description |
| --- | --- | --- | --- |
| 1 | 🔵 New Lead | 10% | Lead entered CRM from any source |
| 2 | 🟡 Contacted | 20% | First outreach sent / responded |
| 3 | 🟠 Discovery Scheduled | 40% | Call booked on [Cal.com](http://Cal.com) |
| 4 | 🟢 Proposal Sent | 60% | Proposal document shared |
| 5 | 🔵 Negotiation | 75% | Client reviewing / asking questions |
| 6 | ✅ Closed Won | 100% | Contract signed, onboarding starts |
| 7 | ❌ Closed Lost | 0% | Deal declined (add lost reason) |

## Deal Custom Properties

- Deal Value (USD or INR)
- Service Type (VA / Marketing / Automation / Bundle)
- Lost Reason (Price / Timing / Competitor / No Need / Unresponsive)
- Expected Start Date

---

# 🎯 LEAD SCORING SETUP {#scoring}

HubSpot Free doesn’t have automatic lead scoring, but you can manually score using a custom property:

**Manual Scoring Process:**

1. Create custom contact property: "Lead Score" (number)
2. VA updates score manually based on actions below
3. Any score ≥50: flag contact with tag "Hot Lead" + notify founder

| Action | Score to Add |
| --- | --- |
| Visited pricing page (from website analytics) | +15 |
| Submitted contact form | +30 |
| Opened 3+ emails | +10 |
| Replied to outreach | +25 |
| Booked discovery call | +50 |
| Chatbot conversation with email captured | +10 |
| From US/UK/UAE/AU market | +15 |

**Automation (HubSpot Free alternative):**

- Use n8n: When [Cal.com](http://Cal.com) booking created → update HubSpot contact "Lead Score" +50

---

# ⚡ AUTOMATION RULES {#automation}

## Sequences to Set Up (HubSpot Free — manual + n8n)

| Trigger | Action | Tool |
| --- | --- | --- |
| New contact created | Send welcome email template | HubSpot email template |
| Deal moved to "Discovery Scheduled" | Send confirmation email | HubSpot workflow (Starter) or n8n |
| Deal moved to "Proposal Sent" | Create task: follow up in 48h | HubSpot task |
| Deal moved to "Closed Won" | Trigger onboarding sequence | n8n |
| No activity 14 days | Create task: re-engagement | HubSpot task |

---

# 📊 REPORTS & DASHBOARDS {#reports}

## Reports to Create in HubSpot

1. **Deals by Stage** — funnel view of all open deals
2. **Leads by Source** — which channel brings most leads
3. **Deals Closed This Month** — revenue tracking
4. **Activities by Rep** — VA outreach volume
5. **Average Deal Close Time** — identify bottlenecks

## Setup

1. HubSpot → Reports → Create report
2. Select report type: Deals, Contacts, or Activities
3. Configure filters + date range
4. Add to dashboard: "Nivy Digital Sales Dashboard"
5. Share dashboard with team

---

📋 **PAGE METADATA**

- **Section:** SD-09 Targets & CRM
- **Parent:** 🎯 SD-09 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `HubSpot` `CRM` `setup` `pipeline` `automation` `SD-09` `nivy-digital`
- **Related Pages:** Lead Scoring Rules | Weekly KPI Tracker | SD-08 Automation Systems

---