# ✉️ Cold Email System — Apollo + Instantly Method

**Parent:** 📣 SD-04 Outbound | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `cold-email` `apollo` `instantly` `sequences` `templates` `SD-04`

---

> 🎯 **Purpose:** Complete cold email outreach system using [Apollo.io](http://Apollo.io) for lead sourcing and [Instantly.ai](http://Instantly.ai) for campaign management — targeting US/UK/UAE/AU businesses.
> 

---

# 📌 QUICK NAVIGATION

- [Setup Checklist](#setup)
- [Email Infrastructure](#infrastructure)
- [Campaign Strategy](#strategy)
- [7-Email Sequence Templates](#sequences)
- [Apollo.io](http://Apollo.io) [Setup](#apollo)
- [Instantly.ai](http://Instantly.ai) [Campaign Setup](#instantly)
- [Performance Benchmarks](#benchmarks)

---

# ✅ SETUP CHECKLIST {#setup}

- [ ]  Dedicated outreach domain purchased (e.g., [nivemail.com](http://nivemail.com) — NOT main domain)
- [ ]  2–3 email accounts created on outreach domain
- [ ]  Domain warmed up for 14 days (Instantly auto-warmup)
- [ ]  SPF, DKIM, DMARC records configured
- [ ]  [Apollo.io](http://Apollo.io) account set up (free: 50 exports/month)
- [ ]  [Instantly.ai](http://Instantly.ai) account set up (free trial)
- [ ]  First lead list built (200+ verified contacts)
- [ ]  First campaign draft written and reviewed

---

# 📧 EMAIL INFRASTRUCTURE {#infrastructure}

## Why a Separate Domain?

- Protects your main domain ([hello@nivydigital.com](mailto:hello@nivydigital.com)) from spam flags
- If outreach domain gets flagged, main domain is safe

## Recommended Setup

| Email Account | Purpose |
| --- | --- |
| [abhi@nivemail.com](mailto:abhi@nivemail.com) | Primary outreach |
| [team@nivemail.com](mailto:team@nivemail.com) | Secondary (rotation) |
| [growth@nivemail.com](mailto:growth@nivemail.com) | Tertiary (rotation) |

## DNS Records to Configure

```
SPF:  v=spf1 include:_spf.google.com ~all
DKIM: [Set up via Google Workspace / Zoho Mail]
DMARC: v=DMARC1; p=quarantine; rua=mailto:dmarc@nivemail.com
```

## Warmup Process

1. Add email accounts to [Instantly.ai](http://Instantly.ai)
2. Enable Auto Warmup (sends/receives warmup emails between Instantly users)
3. Wait 14 days before starting real campaigns
4. Daily send limit: Start at 20/day, scale to 50/day after 30 days

---

# 🎯 CAMPAIGN STRATEGY {#strategy}

## Campaign Structure

| Campaign | Target | Message Angle | Volume |
| --- | --- | --- | --- |
| US Real Estate | Real estate brokers, agents 1–10 staff | "Free up 20 hrs/week from admin" | 200 leads |
| UK E-commerce | E-com founders, Shopify store owners | "Scale your store without hiring full-time" | 200 leads |
| India SaaS | Indian startup founders | "Get a trained ops VA for ₹15k/month" | 300 leads |
| International Coaches | Business/life coaches US/UK/AU | "Handle your admin while you coach" | 150 leads |

## Campaign Settings (Instantly)

- Send days: Monday–Friday
- Send window: 8am–12pm (target timezone)
- Daily limit per account: 30–50 emails
- Step delays: 3 days between follow-ups
- Stop on reply: YES
- Stop on auto-reply: YES

---

# ✉️ 7-EMAIL SEQUENCE TEMPLATES {#sequences}

## Campaign: US Real Estate

**Email 1 (Day 0) — The Hook**

```
Subject: Quick question, [First Name]

Hi [First Name],

I noticed [Company] is active in [market/city] real estate.

Quick question: are you handling your own CRM updates, 
lead follow-ups, and admin — or do you have someone doing that?

The reason I ask: we place trained VAs who handle exactly 
that for real estate teams, typically saving 15–25 hours/week.

Worth a quick 20-min call?

[Your name]
Nivy Digital | Virtual Assistants & Automation
```

**Email 2 (Day 3) — The Proof**

```
Subject: RE: Quick question, [First Name]

Hi [First Name],

Following up quickly — wanted to share a fast result:

We helped a real estate team in [US city] cut their 
admin time by 60% in 30 days by placing a dedicated VA 
for CRM management and lead follow-up.

Would something like that be useful for [Company]?

[Cal.com link]
```

**Email 3 (Day 7) — The Value Add**

```
Subject: 5 tasks your VA could handle this week

Hi [First Name],

Whether or not we end up working together, here are 
5 tasks most real estate founders delegate to a VA:

1. CRM updates + data entry
2. Lead follow-up emails & calls
3. Transaction coordination paperwork
4. Social media scheduling
5. Calendar management + appointment setting

If any of these are eating your time, we should talk.

[Cal.com link]
```

**Email 4 (Day 14) — The Case Study**

```
Subject: How [similar company type] saved 22 hrs/week

Hi [First Name],

Quick story: A solo real estate broker we work with was 
spending 3+ hours/day on admin tasks. We placed a 
dedicated VA for $600/month.

Result: He closed 2 more deals that month.

Open to exploring if we can do the same for you?
[Cal.com link]
```

**Emails 5–6 — Soft follow-ups (3-day gaps)**

```
[First Name] — just bumping this up. Still worth a chat?
[Cal.com link]
```

**Email 7 (Day 30) — Break-up**

```
Subject: Closing the loop, [First Name]

Hi [First Name],

I'll stop reaching out after this — just wanted to leave 
the door open.

If delegating operations to a VA ever makes sense, 
here's how to book a call:
[Cal.com link]

Either way, best of luck with [Company]!
```

---

# 🔭 [APOLLO.IO](http://APOLLO.IO) SETUP {#apollo}

## Building a Lead List

1. Login → People Search
2. Filters:
    - Job Title: Founder, CEO, Owner, Broker, Managing Director
    - Location: United States (or UK/UAE/AU per campaign)
    - Company headcount: 1–25
    - Industry: Real Estate (or target niche)
3. Save search as "[Campaign Name] — [Date]"
4. Export: up to 50 emails/month free
5. Import to Instantly as CSV

## Email Verification

- In Apollo: enable "Verified emails only" filter
- Additional verification: NeverBounce or ZeroBounce (free tiers)
- Target: <5% bounce rate on all campaigns

---

# 📊 PERFORMANCE BENCHMARKS {#benchmarks}

| Metric | Bad | Good | Excellent |
| --- | --- | --- | --- |
| Open rate | <30% | 40–60% | >60% |
| Reply rate | <2% | 3–5% | >7% |
| Positive reply rate | <0.5% | 1–2% | >3% |
| Calls booked per 100 emails | <1 | 2–3 | 5+ |
| Bounce rate | >5% | 2–5% | <2% |
| Unsubscribe rate | >3% | 1–3% | <1% |

**Monthly Target (100 emails/day × 20 days = 2,000 emails):**

- 5% reply rate = 100 replies
- 20% of replies positive = 20 interested leads
- 50% book a call = 10 calls/month
- 30% close = 3 new clients/month

---

📋 **PAGE METADATA**

- **Section:** SD-04 Outbound
- **Parent:** 📣 SD-04 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `cold-email` `apollo` `instantly` `sequences` `outreach` `SD-04` `nivy-digital`
- **Related Pages:** LinkedIn Outreach SOP | Outreach Templates | SD-03 Lead Generation

---