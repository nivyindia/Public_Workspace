# HubSpot CRM Setup & Configuration Guide

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-09 Targets & CRM

**Tags:** `HubSpot` `CRM` `setup` `configuration` `SD-09`

---

> 🎯 **Purpose:** Step-by-step guide for setting up and configuring HubSpot CRM for Nivy Digital's sales and marketing operations.
> 

---

# 📌 Quick Navigation

- [Initial Setup](#setup)
- [Contact Properties](#contacts)
- [Deal Pipeline](#pipeline)
- [Automation Workflows](#automation)
- [Reporting Dashboards](#reporting)
- [Team Access & Roles](#team)

---

# ⚙️ Initial Setup {#setup}

## Step 1: Account Setup

- [ ]  Create HubSpot account (free tier: up to 1M contacts, 2 users)
- [ ]  Set company name: Nivy Digital
- [ ]  Upload logo and brand colours
- [ ]  Set timezone (IST / UTC+5:30)
- [ ]  Add team members with appropriate roles

## Step 2: Domain Connection

- [ ]  Connect company domain ([nivydigital.com](http://nivydigital.com))
- [ ]  Set up email sending domain (DKIM/SPF/DMARC)
- [ ]  Install HubSpot tracking code on website
- [ ]  Connect Google Analytics 4 if available

## Step 3: Import Existing Data

- [ ]  Export leads from existing spreadsheets
- [ ]  Map CSV columns to HubSpot properties
- [ ]  Import contacts (use "Import" tool)
- [ ]  Review duplicates post-import and merge

---

# 👤 Contact Properties {#contacts}

## Standard Properties to Populate

| Property | Values / Format |
| --- | --- |
| First Name / Last Name | Text |
| Email | Validated email |
| Company Name | Text |
| Job Title | Text |
| Country | US / UK / UAE / AU / India / Other |
| Lead Source | LinkedIn / Cold Email / Referral / WhatsApp / Inbound / Other |
| Lead Status | New / Contacted / Qualified / Meeting Booked / Proposal / Won / Lost |
| Service Interest | Advisory / IT/Next / VA / Full Suite |
| Notes | Free text |

## Custom Properties to Create

- **Market:** US / UK / UAE / AU / India
- **VA Assigned:** Name of VA managing the outreach
- **Outreach Channel:** First touch channel
- **Last Outreach Date:** Date
- **Referral Source:** Name/company of referrer

---

# 📈 Deal Pipeline {#pipeline}

**Pipeline Name:** Nivy Digital Sales Pipeline

| Stage | Definition | Target Exit Rate |
| --- | --- | --- |
| 🟤 New Lead | Contact created, not yet reached | 100% contacted |
| 🟡 Contacted | First outreach sent | 30% reply |
| 🟠 Engaged | Responded positively, in conversation | 50% to meeting |
| 🟢 Meeting Booked | Call scheduled on [Cal.com](http://Cal.com) | 60% to proposal |
| 🔵 Proposal Sent | Proposal / quote delivered | 40% to closed |
| ✅ Closed Won | Contract signed | — |
| ❌ Closed Lost | Not interested / went elsewhere | Log reason |

---

# 🤖 Automation Workflows {#automation}

| Workflow | Trigger | Action |
| --- | --- | --- |
| New Lead Welcome | Contact created via form | Send welcome email |
| Meeting Confirmation | Deal moves to Meeting Booked | Send confirmation + prep doc |
| Follow-Up Reminder | No activity for 5 days | Create task for VA/sales rep |
| Win Notification | Deal closed won | Notify founder, trigger onboarding |
| 90-Day Referral Ask | 90 days after closed won | Send referral request email |
| Cold Re-engagement | No activity for 60 days | Send re-engagement email |

---

# 📊 Reporting Dashboards {#reporting}

**Dashboard 1: Weekly Sales Overview**

- New contacts this week
- Deals by stage
- Meetings booked
- Closed won revenue

**Dashboard 2: Outreach Performance**

- Emails sent / open rate / reply rate (by VA)
- LinkedIn connections sent / accepted
- Meetings per outreach rep

**Dashboard 3: Revenue Tracker**

- MRR (Monthly Recurring Revenue)
- Revenue by service line
- Revenue by market (US/UK/UAE/AU/India)
- Win/loss ratio

---

# 👥 Team Access & Roles {#team}

| Role | HubSpot Access Level |
| --- | --- |
| Founder | Super Admin |
| Sales Manager / Supervisor | Admin |
| VAs | User (contacts + deals only) |
| Finance (view only) | Viewer |

---

---

📋 **PAGE METADATA**

- **Section:** SD-09 — Targets & CRM
- **Parent:** [🎯 SD-09 Hub](https://www.notion.so/359e5082b9d4818da570f193537e5634)
- **Status:** 🟢 Complete | **Last Updated:** May 2026
- **Tags:** `HubSpot` `CRM` `setup` `pipeline` `automation` `SD-09`

---