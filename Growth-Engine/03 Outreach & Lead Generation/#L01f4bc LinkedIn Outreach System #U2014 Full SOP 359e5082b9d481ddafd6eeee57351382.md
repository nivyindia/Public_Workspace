# 💼 LinkedIn Outreach System — Full SOP

**Parent:** 📣 SD-04 Outbound | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `linkedin` `outreach` `SOP` `connections` `DM` `phantombuster` `SD-04`

---

> 🎯 **Purpose:** The complete step-by-step system for LinkedIn outreach — profile optimization, connection strategy, message sequences, and automation with PhantomBuster.
> 

---

# 📌 QUICK NAVIGATION

- [Profile Optimization Checklist](#profile)
- [Connection Request Strategy](#connections)
- [3-Message DM Sequence](#sequence)
- [PhantomBuster Automation Setup](#automation)
- [Daily LinkedIn SOP (VA Runbook)](#daily-sop)
- [Performance Tracking](#tracking)

---

# ✅ PROFILE OPTIMIZATION CHECKLIST {#profile}

## Company Page

- [ ]  Logo uploaded (400x400px, transparent background)
- [ ]  Cover banner (1128x191px) — tagline + services + website
- [ ]  About section: 2,000 characters, keyword-rich, includes services + website link
- [ ]  Website URL added and verified
- [ ]  Specialties: Virtual Assistant, Digital Marketing, AI Automation, Lead Generation
- [ ]  Location: Lucknow, Uttar Pradesh, India
- [ ]  First 3 posts published before starting outreach

## Founder Profile

- [ ]  Professional headshot (no selfies)
- [ ]  Banner: branded with tagline ("Helping businesses grow | VA + AI + Marketing")
- [ ]  Headline: "Founder @ Nivy Digital | VA Agency India | Helping US/UK Businesses Scale"
- [ ]  About: Story + results + CTA ("DM me "GROWTH" for a free 30-min call")
- [ ]  Featured: Website link + lead magnet + top post
- [ ]  500+ connections (start connecting immediately)
- [ ]  Creator Mode ON

---

# 🔗 CONNECTION REQUEST STRATEGY {#connections}

## Target Profiles

| Market | Title Filters | Company Size | Location |
| --- | --- | --- | --- |
| USA | Founder, CEO, Owner, President | 1–25 employees | United States |
| UK | Managing Director, Founder, Director | 1–25 | United Kingdom |
| UAE | CEO, General Manager, Owner | 1–50 | UAE |
| India | Founder, Director, CEO | 1–50 | India |
| Australia | Managing Director, Business Owner | 1–25 | Australia |

## Connection Note Templates (160 chars max)

**Template A (Pain-focused):**

```
Hi [First Name], I help founders like you reclaim 20+ hrs/week 
by placing dedicated VAs. Happy to connect and share how!
```

**Template B (Result-focused):**

```
Hey [First Name], we just helped a [industry] founder cut 
operations costs by 60% with a VA. Thought you'd find that useful — happy to connect!
```

**Template C (No-pitch, curiosity):**

```
Hi [First Name], saw your work in [industry] — impressive. 
I work with founders on scaling ops. Would love to connect.
```

## Daily Limits (Safe)

- New connection requests: **25–30/day** (LinkedIn limit before flagging)
- Profile views (manual): 50/day
- Post comments: 10/day (builds visibility)

---

# 💬 3-MESSAGE DM SEQUENCE {#sequence}

**Message 1 — Sent immediately after connection accepted**

```
Hi [First Name]! Thanks for connecting 😊

I'm Abhi — founder of Nivy Digital. We help [industry] 
businesses grow by placing trained VAs who handle ops, 
admin, and marketing.

Just curious — what's the one task eating most of your 
time right now?
```

**Message 2 — Sent 2 days later if no reply**

```
Hi [First Name], just following up in case my last message 
got buried!

I wanted to share a quick win: we recently helped a 
[similar industry] founder free up 25 hours/week by 
restructuring their ops with a VA.

Would a 20-min call make sense to explore if we could 
do the same for you?
[Cal.com link]
```

**Message 3 — Sent 5 days later (break-up)**

```
Hi [First Name], I'll keep this short — last outreach, 
promise! 😄

If delegating tasks to a skilled VA to free up your 
schedule ever makes sense, feel free to book a free call:
[Cal.com link]

Either way, good luck with everything you're building!
```

---

# 🤖 PHANTOMBUSTER AUTOMATION SETUP {#automation}

## Setup Steps

1. Sign up at [phantombuster.com](http://phantombuster.com) (free — 20 slots/day)
2. Connect your LinkedIn account (Session Cookie method)
3. Choose Phantom: **LinkedIn Search Export**
4. Input: LinkedIn search URL (filtered by ICP criteria)
5. Set schedule: daily, 20 profiles
6. Output: Google Sheet with name, profile URL, company, title

## n8n Integration

1. n8n trigger: New row in Google Sheet
2. Create HubSpot contact from sheet data
3. Tag: `linkedin-prospect`, `[market]`, `[date]`
4. Assign to outreach queue

## Message Automation (after manual connection accepted)

- Use **Expandi** (free trial) or **Dripify** for DM sequencing after connections
- Set Message 1 → 2-day delay → Message 2 → 5-day delay → Message 3

---

# 📋 DAILY LINKEDIN SOP (VA RUNBOOK) {#daily-sop}

**Every weekday, the VA responsible for LinkedIn should:**

| Time | Task | Tool | Duration |
| --- | --- | --- | --- |

---|

| 9:00 AM | Send 25 connection requests (from PhantomBuster list) | LinkedIn | 20 min |
| --- | --- | --- | --- |
| 9:20 AM | Check accepted connections → send Message 1 | LinkedIn | 15 min |
| 9:35 AM | Follow up on Day 2 & Day 5 messages | LinkedIn | 15 min |
| 9:50 AM | Comment on 5 posts from ICP target list | LinkedIn | 10 min |
| 10:00 AM | Post company/founder content (if scheduled day) | Buffer | 5 min |
| 10:05 AM | Log responses in HubSpot CRM | HubSpot | 10 min |

**Total daily time: ~75 minutes**

---

# 📊 PERFORMANCE TRACKING {#tracking}

| Metric | Daily Target | Weekly Target | Monthly Target |
| --- | --- | --- | --- |
| Connection requests sent | 25 | 125 | 500 |
| Acceptance rate | — | ≥ 30% | ≥ 30% |
| Accepted connections | ≥ 7 | ≥ 35 | ≥ 150 |
| Message 1 sent | = accepted | ≥ 35 | ≥ 150 |
| Replies received | — | ≥ 5 | ≥ 20 |
| Calls booked from LinkedIn | — | 1 | 4–5 |

---

📋 **PAGE METADATA**

- **Section:** SD-04 Outbound
- **Parent:** 📣 SD-04 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `linkedin` `outreach` `SOP` `phantombuster` `connections` `SD-04` `nivy-digital`
- **Related Pages:** Cold Email System | Outreach Templates | SD-03 Lead Generation

---