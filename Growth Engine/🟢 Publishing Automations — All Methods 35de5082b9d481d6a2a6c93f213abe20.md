# 🟢 Publishing Automations — All Methods

> These automations run 24/7 to attract new people across every channel. They are separate from pipeline automations but feed directly into them the moment someone responds.
> 

---

## AUTO-01 — Daily AI Content Generation & Scheduling

**Stage:** TOFU — Engine 1 (Attention)

**What it does:** Generates and schedules platform-specific posts every day across Instagram, LinkedIn, Twitter/X, Facebook, and YouTube — automatically.

**Flow:**

1. **7:00 AM daily** — n8n schedule trigger fires
2. GPT-4o generates 5 platform-specific posts in JSON format
3. Posts saved to Google Sheets content calendar → status = `Pending Approval`
4. Team approves in Sheets → status = `Approved` → n8n detects change
5. Buffer API schedules each post at optimal time per platform
6. Long-form content → n8n clips into Reels captions, blog intros, WhatsApp status

**Tools:** n8n · GPT-4o · Google Sheets · Buffer API · Instagram API · LinkedIn API

---

## AUTO-02 — Trend Monitoring & Viral Content Hijacking

**Stage:** TOFU — Engine 1 (Attention)

**What it does:** Monitors trending topics every hour and alerts the team with ready-to-post content so you can ride viral waves within 30 minutes.

**Flow:**

1. Every hour — n8n fetches RSS feeds, Twitter Trending, Google Trends API
2. GPT-4o analyzes trends → outputs top 3 hijackable trends relevant to marketing/business
3. Alert sent to content manager on WhatsApp + Slack with trend + suggested angle
4. If approved → AI generates post → immediate publish within 30 mins of trend peak

**Tools:** n8n · GPT-4o · Twitter API · Google Trends API · WhatsApp · Buffer

---

## AUTO-03 — AI-Personalized Cold Email Sequences

**Stage:** TOFU — Engine 1 (Attention/Outbound)

**What it does:** Finds ideal clients, enriches their data, writes personalized emails, and sends 30–100/day automatically. Replies are classified by AI and routed to CRM.

**Flow:**

1. [Apollo.io](http://Apollo.io) scrapes ICP leads (industry, role, country, company size) → exports CSV
2. Clay enriches each lead: LinkedIn bio, company revenue, tech stack, recent news
3. GPT-4o writes personalized opening line per lead using their data
4. Instantly sends `30–100 emails/day` from warmed secondary domain — 3-step sequence (Day 1, 3, 7)
5. Reply detected → n8n webhook → classified by AI (interested / not now / unsubscribe)
6. "Interested" reply → Stage 3 Lead Capture triggered automatically

**Tools:** [Apollo.io](http://Apollo.io) · Clay · GPT-4o · Instantly · n8n · HubSpot

---

## AUTO-04 — LinkedIn Connect + DM Sequence

**Stage:** TOFU — Engine 1 (Attention/Outbound)

**What it does:** Automatically connects with 15–20 decision-makers per day on LinkedIn and sends a value-first DM sequence that converts connections into leads.

**Flow:**

1. PhantomBuster scrapes Sales Navigator for decision-makers (Founder, CMO, CEO)
2. Auto-sends `15–20 connection requests/day` with personalized note (Clay + GPT generated)
3. Accepted connection → Day 1: value insight DM → Day 3: share resource → Day 7: offer free audit
4. Positive reply → n8n detects → CRM contact created → team notified on WhatsApp

**Tools:** PhantomBuster · Clay · GPT-4o · n8n · HubSpot · WhatsApp Alert

---

## AUTO-05 — Freelance Platform Bidding Automation

**Stage:** TOFU — Engine 1 (Outbound)

**What it does:** Monitors Upwork, Fiverr, Freelancer, PeoplePerHour for new marketing job posts, scores them for fit, drafts personalized proposals, and sends for 1-click approval.

**Flow:**

1. n8n monitors Upwork, Fiverr, Freelancer, PeoplePerHour RSS/API for new posts matching: "digital marketing", "social media", "paid ads", "SEO"
2. New post detected → GPT-4o reads job description → scores fit (budget, scope, ICP match)
3. Score ≥ threshold → GPT-4o auto-drafts proposal personalized to the job post
4. Draft sent to team on WhatsApp/Slack for 1-click approval → submitted to platform
5. Client replies on platform → team notified → move to Stage 3 Lead Capture

**Tools:** n8n · GPT-4o · Upwork API · Fiverr API · WhatsApp Alert · HubSpot

---

## AUTO-06 — Social Listening — Find Buyer Intent Posts

**Stage:** TOFU — Engine 1 (Outbound)

**What it does:** Monitors LinkedIn, Facebook Groups, Twitter/X, and Reddit for people actively posting that they need marketing help — and alerts your team to engage instantly.

**Keywords monitored:**

- "looking for marketing agency"
- "need social media help"
- "want to grow my brand"
- "hiring digital marketer"
- "need someone for paid ads"

**Flow:**

1. n8n + Apify monitors LinkedIn, Facebook Groups, Twitter/X, Reddit continuously
2. Match found → GPT-4o reads post → drafts helpful reply (value-first, not a pitch)
3. Reply + poster's profile sent to team on WhatsApp for review → approved → posted
4. They engage → DM sent → Lead captured in CRM → Stage 3 pipeline begins

**Tools:** n8n · Apify · GPT-4o · LinkedIn API · Facebook API · WhatsApp Alert · HubSpot

---

## AUTO-07 — Google Maps Local Business Scraping → Outreach

**Stage:** TOFU — Engine 1 (Outbound)

**What it does:** Scrapes local businesses from Google Maps, filters ones that clearly need marketing (low ratings, no website), and sends personalized WhatsApp/email outreach.

**Filter criteria (who needs marketing help):**

- Google rating < 4.2
- No website listed
- Low review count vs competitors
- No social media presence

**Flow:**

1. Apify scrapes Google Maps by city + category (restaurants, salons, clinics, retailers)
2. Extracts: business name, phone, email, website, Google rating, review count
3. Filtered by low-rating / no-website criteria
4. GPT-4o drafts personalized WhatsApp/email referencing their specific business
5. Added to CRM → outreach sequence → Stage 3 capture if they respond

**Tools:** Apify · GPT-4o · n8n · WhatsApp API · HubSpot · Google Sheets

---

## AUTO-08 — Comment Keyword Detection → Auto-DM

**Stage:** TOFU → MOFU (Engine 1 + 2)

**What it does:** Detects when someone comments a buying-intent keyword on your Instagram/Facebook posts and automatically sends them a personalized DM within 60 seconds.

**Keywords that trigger DM:**

- `interested` · `how` · `price` · `cost` · `DM me` · `send me` · `details`

**Flow:**

1. Real-time webhook from Instagram/Facebook Graph API detects new comments
2. n8n checks if comment contains trigger keywords
3. GPT-4o generates warm, personalized DM based on comment context
4. DM auto-sent via Instagram Graph API within 60 seconds
5. Commenter's profile → HubSpot contact created with tag `stage1-comment-lead`

**Tools:** n8n · GPT-4o · Instagram Graph API · Facebook API · HubSpot

---

## AUTO-09 — WhatsApp Broadcast Outreach

**Stage:** TOFU — Engine 1 (Outbound)

**What it does:** Sends segmented value-based broadcast messages to 20–50 contacts/day via WhatsApp, classifies replies with AI, and routes interested contacts into the pipeline.

**Flow:**

1. WATI broadcast list segmented by industry, country, business type
2. n8n triggers weekly broadcast (value tip or case study) to `20–50 contacts/day`
3. Reply received → WATI webhook → n8n classifies intent via GPT-4o
4. Interested → CRM contact + lead capture form link sent → Stage 3 pipeline

**Tools:** n8n · WATI / WhatsApp Business API · GPT-4o · HubSpot

---

## AUTO-10 — Referral & Viral Loop

**Stage:** POST-SALE → feeds back to TOFU

**What it does:** Automatically requests referrals from happy clients at Day 60, gives them a tracked link, and when someone clicks it — they enter the pipeline automatically.

**Flow:**

1. Day 60 of client relationship → n8n triggers referral request on WhatsApp
2. Client gets unique referral link (ReferralCandy) → tracked per referrer
3. Someone clicks referral link → Tally form pre-filled with referrer name → Lead captured
4. New lead enters Stage 3 pipeline → referrer gets reward notification automatically

**Tools:** n8n · WhatsApp · ReferralCandy · Tally · HubSpot