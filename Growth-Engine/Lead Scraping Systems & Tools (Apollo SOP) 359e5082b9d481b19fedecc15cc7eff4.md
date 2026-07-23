# Lead Scraping Systems & Tools (Apollo SOP)

**Owner:** Nivy Digital Founder | **Status:** 🟡 In Progress | **Last Updated:** May 2026 | **Section:** SD-03

**Tags:** `apollo` `linkedin` `lead-scraping` `email-list` `SOP` `SD-03`

---

> 🎯 **Purpose:** Step-by-step SOPs for scraping, collecting, and validating leads using [Apollo.io](http://Apollo.io) and LinkedIn. This is the operational playbook for the lead generation VA.
> 

---

# 📌 Quick Navigation

- [Apollo.io](http://Apollo.io) [Scraping SOP](#apollo)
- [LinkedIn Manual Prospecting SOP](#linkedin)
- [Email Validation Process](#validation)
- [Data Hygiene Rules](#hygiene)
- [Output Format & Naming Conventions](#output)

---

# 🚀 [Apollo.io](http://Apollo.io) Scraping SOP {#apollo}

## Setup

1. Log into [Apollo.io](http://Apollo.io) account
2. Navigate to **People Search** (not Company Search)
3. Set filters per ICP (see ICP Document for targeting criteria)

## Filter Settings (Standard ICP #1 — Founder/Solopreneur)

- **Job Title:** Founder, Co-founder, CEO, Managing Director, Owner, Solopreneur
- **Employee Count:** 1–10 (for solo/small), 10–50 (for SME)
- **Location:** United States / United Kingdom / Australia / UAE / India
- **Industry:** Select relevant niches (coaching, consulting, SaaS, e-commerce, services)
- **Email Status:** Verified only
- **Keywords (optional):** Add niche keywords if targeting specific sectors

## Scraping Steps

1. Apply all filters above
2. Review sample leads — spot check 10 profiles for quality
3. Select all on page → Add to List (name: `[Market]-[ICP]-[Date]` e.g. `US-Founder-May2026`)
4. Export list to CSV: Name, Title, Company, Email, LinkedIn URL, Location
5. Save CSV in Drive folder: `Lead Gen > Apollo Exports > [Month Year]`

## Apollo Limits (Free/Basic Plan)

- 50 exports/day on free plan
- Upgrade to Basic ($49/mo) for 1,000 exports/month
- Use credits wisely — prioritise verified emails only

## Quality Check Before Export

- ✅ Email is verified (green tick in Apollo)
- ✅ LinkedIn profile URL is populated
- ✅ Company name is real (not blank)
- ✅ Title matches ICP targeting
- ❌ Skip: generic emails (info@, hello@, admin@)
- ❌ Skip: profiles with no photo or minimal data

---

# 💼 LinkedIn Manual Prospecting SOP {#linkedin}

## When to Use LinkedIn vs Apollo

- Use **Apollo** for bulk email list building
- Use **LinkedIn** for direct DM outreach + connection requests
- Both can be used together: scrape email from Apollo, connect on LinkedIn

## LinkedIn Search Steps

1. Go to LinkedIn Search → filter by People
2. Set filters: Job Title, Location, Industry, Connections (2nd degree preferred)
3. Review profiles one by one — look for signals of pain (recent posts about being overwhelmed, hiring, scaling)
4. Add to tracking sheet: `[Name, Title, Company, LinkedIn URL, Pain Signal, Date Found]`
5. Hand off to outreach VA with note on personalisation angle

## Boolean Search Examples

```
"Founder" OR "CEO" OR "Owner" (coaching OR consulting OR SaaS) -"VP" -"Director"
```

## LinkedIn Sales Navigator (When Available)

- Use Lead Lists to save searches
- Set up Lead Alerts for job changes, posts, company news
- Export to CSV (with Sales Nav) and feed into Apollo for email enrichment

---

# ✅ Email Validation Process {#validation}

## Why Validate?

- Sending to invalid emails = bounce rate spike = domain reputation damage
- Target: Keep bounce rate under 2%

## Validation Steps

1. Export raw Apollo CSV
2. Upload to [**Hunter.io**](http://Hunter.io) (Domain Search → Bulk Verify) OR **NeverBounce**
3. Remove all emails marked: Invalid, Disposable, Unknown
4. Keep only: Valid, Accept-All (use carefully)
5. Save cleaned file as: `[Original-Name]-CLEAN.csv`

## Acceptable Bounce Threshold

- Below 2%: ✅ Safe to send
- 2–5%: ⚠️ Review domain before sending
- Above 5%: ❌ Do not send — re-validate or discard list

---

# 🧹 Data Hygiene Rules {#hygiene}

1. **No duplicates** — check against existing CRM before importing new leads
2. **No generic emails** — info@, admin@, hello@, support@ are blacklisted
3. **No competitors** — check company name against competitor list
4. **Consistent naming** — First name capitalised, no ALL CAPS
5. **LinkedIn URL format:** Always `https://www.linkedin.com/in/[handle]`
6. **Date stamp every batch** — so we know when each lead was sourced

---

# 📄 Output Format & Naming Conventions {#output}

## CSV Column Headers (standard)

```
First Name | Last Name | Title | Company | Email | LinkedIn URL | Location | Country | Source | Date Scraped | ICP Type | Notes
```

## File Naming

```
[Market]-[ICP]-[Source]-[YYYY-MM-DD].csv
Examples:
US-Founder-Apollo-2026-05-08.csv
IN-SME-LinkedIn-2026-05-08.csv
UK-Coach-Apollo-2026-05-08.csv
```

## Storage Location

```
Google Drive > Nivy Digital > Lead Gen > Apollo Exports > [YYYY-MM]
```

---

📋 **PAGE METADATA**

- **Section:** SD-03 — Lead Generation & Data
- **Parent:** [🎣 SD-03 Lead Gen Hub](https://www.notion.so/359e5082b9d481429921cdc02141c77a)
- **Owner:** Nivy Digital Founder
- **Status:** 🟡 In Progress
- **Last Updated:** May 2026
- **Tags:** `apollo` `linkedin` `scraping` `SOP` `email-validation` `SD-03`
- **Related Pages:** [Lead Gen Master Index] | [SD-04 Outbound Outreach] | [Lead Qualification Framework]

---