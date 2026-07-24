# 📧 Email Newsletter System — Brevo Setup & Weekly SOP

**Parent:** 🌊 SD-05 Inbound | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `email` `newsletter` `brevo` `nurture` `subscribers` `SD-05`

---

> 🎯 **Purpose:** Complete system for building, managing, and monetizing Nivy Digital's email newsletter — from list setup in Brevo to weekly send SOPs and automation sequences.
> 

---

# 📌 QUICK NAVIGATION

- [Platform Setup — Brevo](#setup)
- [List Segmentation Strategy](#segments)
- [Weekly Newsletter SOP](#weekly-sop)
- [Email Sequences (Automations)](#sequences)
- [Newsletter Templates](#templates)
- [Growth Tactics — Building the List](#growth)
- [Performance Benchmarks](#benchmarks)

---

# 🛠️ PLATFORM SETUP — BREVO {#setup}

## Why Brevo (formerly Sendinblue)?

- Free: 300 emails/day, unlimited contacts
- Built-in automation workflows
- SMS + WhatsApp channel available
- GDPR compliant
- Better deliverability than Mailchimp on free tier

## Setup Steps

1. Sign up at [brevo.com](http://brevo.com) → free plan
2. Complete sender verification (add domain DNS records)
3. Create sender: `hello@nivydigital.com` — verify email
4. Create lists (see segmentation below)
5. Install Brevo WordPress plugin (auto newsletter signup on blog)
6. Connect Brevo to n8n (for automated contact creation from CRM leads)

## DNS Records for Brevo

- Add DKIM + SPF records provided by Brevo to your domain DNS
- Verify domain in Brevo → Senders & IP → Domains
- Test deliverability with [mail-tester.com](http://mail-tester.com) (target: 9+/10)

---

# 📂 LIST SEGMENTATION STRATEGY {#segments}

| List Name | Source | Content Sent | Size Target |
| --- | --- | --- | --- |
| **All Subscribers** | All opt-ins | Weekly newsletter | 1,000+ |
| **Hot Leads** | Score ≥50 in HubSpot | Sales sequences | 50–200 |
| **VA Prospects** | Interested in VA | VA-specific nurture | Variable |
| **Marketing Prospects** | Interested in marketing | Marketing nurture | Variable |
| **Existing Clients** | Active clients | Client updates, upsell | Actual client count |
| **India Market** | Indian contacts | India-focused content | Variable |
| **International** | US/UK/UAE/AU | Global-focused content | Variable |

---

# 📅 WEEKLY NEWSLETTER SOP {#weekly-sop}

**Send day:** Friday | **Send time:** 10am IST | **Length:** 300–500 words

## Newsletter Structure (Every Week)

```
📧 Subject Line: [Hook — curiosity or benefit]
Preview text: [Second hook — complement the subject]

--- EMAIL BODY ---

👋 Hi [First Name],

[Opening — 1 sentence: relevant to week/season/event]

📌 THIS WEEK'S INSIGHT
[Key lesson, tip, or insight — 100–150 words]
[Optional: link to full blog post]

⚡ QUICK WIN
[One actionable thing they can do THIS week — 2–3 sentences]

📖 FROM THE BLOG
[Title of newest blog post + 1-sentence tease + link]

🎯 FEATURED SERVICE
[Rotate weekly: VA / Marketing / Automation / Lead Gen]
[1–2 sentences on the service + soft CTA]

That's it for this week!
[Sign-off line]

— Abhi
Nivy Digital | [Website] | [Cal.com link]

[Unsubscribe] [View in browser]
```

## Weekly Production Workflow

| Step | Task | Tool | Time |
| --- | --- | --- | --- |
| 1 | Pick insight/topic from content calendar | Notion | 5 min |
| 2 | Draft newsletter body | Claude | 10 min |
| 3 | Human edit + add personal touch | Manual | 10 min |
| 4 | Load into Brevo, format | Brevo | 10 min |
| 5 | Preview on mobile + desktop | Brevo preview | 5 min |
| 6 | Schedule for Friday 10am IST | Brevo | 2 min |

**Total: ~42 minutes per newsletter**

---

# ⚡ EMAIL SEQUENCES (AUTOMATIONS) {#sequences}

## Sequence 1 — Welcome Sequence (5 emails over 10 days)

| Email | Day | Subject | Content |
| --- | --- | --- | --- |
| 1 | Day 0 | "Welcome to the Nivy Digital community 👋" | Who we are, what to expect, free resource |
| 2 | Day 2 | "The #1 mistake founders make with their time" | VA delegation insight + soft CTA |
| 3 | Day 5 | "How [client type] saved 20 hrs/week" | Mini case study + services overview |
| 4 | Day 7 | "Free resource: VA Hiring Checklist" | Send lead magnet + build trust |
| 5 | Day 10 | "Ready to talk?" | Direct CTA to book a discovery call |

## Sequence 2 — Hot Lead Nurture (score ≥50)

| Email | Day | Subject | Content |
| --- | --- | --- | --- |
| 1 | Immediate | "Quick follow-up from Nivy Digital" | Personal note, direct CTA |
| 2 | Day 2 | "Just 3 questions, [Name]" | Qualify: budget, timeline, need |
| 3 | Day 5 | "Here's what we'd do for [Company]" | Personalised value proposition |

## Sequence 3 — Re-engagement (inactive 60+ days)

```
Subject: "Still there, [Name]?"

Hi [Name], we haven't heard from you in a while.

If running or growing your business is still a priority,
we'd love to help. Here's what's new at Nivy Digital: [update]

If you'd like to unsubscribe, click here. No hard feelings!

[Book a call] [Read our latest post]
```

---

# 📝 NEWSLETTER TEMPLATES {#templates}

## Subject Line Formulas That Work

- "How [person] did [result] in [timeframe]"
- "The [number] [things] every [audience] should know"
- "Why [common belief] is wrong"
- "[Question]? Here's the answer."
- "[First Name], quick question"
- "This week: [topic]"

## High-Performing Opening Lines

- "Here's something most [audience] don't know..."
- "Last week, a client told me something that stopped me cold."
- "I made a mistake last month. Here's what I learned."
- "Real talk: [honest observation about their situation]"

---

# 📈 GROWTH TACTICS — BUILDING THE LIST {#growth}

| Tactic | Expected Signups | Effort |
| --- | --- | --- |
| Blog post opt-in form (inline + exit popup) | 5–20/month | Low |
| Lead magnet (VA Hiring Checklist PDF) | 10–30/month | Medium (setup) |
| LinkedIn CTA "Join my newsletter" | 5–15/month | Low |
| WhatsApp broadcast: invite to subscribe | 10–20 (one-time) | Low |
| Partner newsletter mention / swap | 20–50 (campaign) | Medium |
| [Cal.com](http://Cal.com) post-booking: subscribe offer | 2–5/month | Low |
| Referral: "Forward to a founder friend" | Organic | Very Low |

**Month 1 target:** 50 subscribers | **Month 6:** 500+ | **Month 12:** 2,000+

---

# 📊 PERFORMANCE BENCHMARKS {#benchmarks}

| Metric | Industry Average | Nivy Target | Check In |
| --- | --- | --- | --- |
| Open rate | 20–25% | >35% | Brevo dashboard |
| Click-through rate | 2–3% | >5% | Brevo dashboard |
| Unsubscribe rate | <0.5% | <0.3% | Brevo dashboard |
| List growth rate | — | +10%/month | Monthly |
| Revenue attributed | — | Track via HubSpot source | Monthly |

---

📋 **PAGE METADATA**

- **Section:** SD-05 Inbound Marketing
- **Parent:** 🌊 SD-05 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `newsletter` `email` `brevo` `sequences` `nurture` `SD-05` `nivy-digital`
- **Related Pages:** Content Marketing Plan | Lead Magnet Library | SD-08 Automation Systems

---