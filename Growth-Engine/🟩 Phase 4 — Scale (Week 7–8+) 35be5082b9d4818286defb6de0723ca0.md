# 🟩 Phase 4 — Scale (Week 7–8+)

← [Back to Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)

---

> **Week 7–8+. Automations are live, clients are paying, pipeline is flowing. Now you protect MRR, grow accounts, build a referral engine, and create an ecosystem that generates leads without paid spend.**
> 

---

## 🎯 Phase 4 Objectives

| Objective | Target | Measure |
| --- | --- | --- |
| Client churn rate | <5% | Monthly churned ÷ total clients |
| Upsell revenue | 20% of MRR | Expansion deals won |
| First referral received | Month 2 | HubSpot source = referral |
| Ecosystem partners active | 3+ by Month 3 | Signed partner agreements |
| NPS score | >50 | Monthly NPS survey |
| Client community active | 5+ members | WhatsApp/Slack group |

---

## 🗓️ Week-by-Week Execution

---

## 🔄 STAGE 9 — RETENTION ENGINE (Week 7)

### Week 7, Day 1 — CSAT + NPS System

- [ ]  Review all Day 7 CSAT responses already collected (automated from Phase 3)
- [ ]  Build monthly NPS survey in Tally:
    - Question 1: "On a scale of 0–10, how likely are you to recommend Nivy Digital to a colleague?"
    - Question 2: "What's the one thing we could do better?"
    - Question 3: "What result are you most proud of since working with us?"
- [ ]  Set up monthly NPS trigger in n8n: every 30 days after kickoff date → send survey
- [ ]  Build NPS response routing:
    - Score 9–10 (Promoters): tag as `referral_candidate`, trigger referral ask workflow (Stage 11)
    - Score 7–8 (Passives): send personalised email to understand what's missing
    - Score 0–6 (Detractors): flag as `churn_risk`, escalate to founder immediately

**Churn signals to monitor weekly:**

- CSAT <7 at Day 7 check-in
- Client hasn't opened last 2 reports
- No response to last 2 messages
- Missed payment or late payment
- Negative sentiment in any communication

### Week 7, Day 2 — Client VIP Community

- [ ]  Create private WhatsApp group for all active clients: "Nivy Digital Clients — Private"
- [ ]  Pinned welcome message: what the group is for, what you'll share
- [ ]  Weekly value drops into community:
    - Monday: Industry insight or trend relevant to clients
    - Wednesday: Quick win tip (tool, tactic, shortcut)
    - Friday: A result or win from the week (anonymised if needed)
- [ ]  Monthly client spotlight: feature one client's win in the group
- [ ]  Invite all active clients this week

### Week 7, Day 3 — Churn Risk Response Playbook

- [ ]  Build churn risk intervention SOP:
    1. **Day 1 of flag**: Founder personal WhatsApp message — casual check-in, no agenda
    2. **Day 3**: Schedule a "mid-engagement review" call — frame as standard process
    3. **On call**: Listen first. Ask: "What would make this feel like a clear win for you?"
    4. **After call**: Adjust deliverables or add a bonus service at no charge if needed
    5. **Day 14**: Follow-up survey — did the situation improve?
- [ ]  Add churn risk playbook as a saved SOP in Notion (link from Stage 9 OS page)

### Week 7, Day 4–5 — Renewal Conversations Begin

- [ ]  Review all active client contract end dates (set in Phase 3 renewal radar)
- [ ]  For any client <60 days to renewal: start renewal conversation this week
- [ ]  Renewal conversation framework:
    1. Start by reviewing results achieved
    2. Present a "Year 2 Growth Plan" — what's possible with another 6–12 months
    3. Offer early renewal discount (5–10%) if they commit before contract end
    4. Option to upgrade package at renewal
- [ ]  Log renewal conversation outcome in HubSpot

---

## 📈 STAGE 10 — EXPANSION ENGINE (Week 7)

### Week 7, Day 3 — Upsell Opportunity Scan

- [ ]  For each active client, review their current package vs. all available Nivy Digital services
- [ ]  AI upsell scan: paste client profile + current service into Claude/GPT-4 with prompt: *"This client is currently using [SERVICE]. Based on their business (industry: [X], size: [Y], goal: [Z]), what Nivy Digital services would have the highest ROI for them next? Rank top 3 with reasoning."*
- [ ]  Log upsell opportunities in HubSpot as new deals in Expansion pipeline
- [ ]  Schedule bi-weekly AI upsell scans as recurring task

**Upsell conversation scripts by service:**

**Accounting client → IT/Automation upsell:**

*"We’ve been handling your books and noticed you’re still doing [X] manually. Our tech team has automated this for 3 similar clients and saved them an average of 8 hours per week. Want me to show you how it would work for you?"*

**IT client → Digital Marketing upsell:**

*"Your systems are solid now. The next lever is visibility. We’re running campaigns for similar companies in your space and getting [result]. It’d take 2 weeks to get something live for you."*

**VA client → Full outsourcing upsell:**

*"Your VA is handling outreach really well. The next step a lot of our clients take is adding a second VA for admin/ops. It doubles output without doubling your time. Want to explore?"*

### Week 7, Day 4 — Expansion Pipeline in HubSpot

- [ ]  Create Expansion pipeline in HubSpot (separate from new business pipeline):
    - Stages: Opportunity Identified → Conversation Started → Proposal Sent → Upsell Won → Upsell Lost
- [ ]  Move all AI-identified opportunities into this pipeline
- [ ]  Set deal rotation rule: review expansion pipeline every 2 weeks

---

## 🔁 STAGE 11 — REFERRAL ENGINE (Week 8)

### Week 8, Day 1 — Referral Program Launch

- [ ]  Build Referral Program landing page (Carrd or Notion public page):
    - Headline: "Refer a business. Earn [X]." (decide on reward: cash, credit, gift card)
    - How it works: 3 steps
    - Reward structure: per signed client OR per introduction
    - Form: Name + Referred contact's name + email + phone
- [ ]  Create referral tracking in HubSpot:
    - Custom property: `referral_source` on every contact
    - Custom property: `referral_reward_status` (Pending / Paid / Declined)
- [ ]  Email all active clients with program launch announcement:
    - Subject: *"A thank you — and something for you"*
    - Body: Genuine thank you for the relationship + referral program details + personal ask
- [ ]  WhatsApp all active clients with short version + landing page link

### Week 8, Day 2 — Ambassador Invitations

- [ ]  Identify top 3–5 clients who are Promoters (NPS 9–10) — these are your ambassadors
- [ ]  Ambassador ask script (WhatsApp or personal call):
    
    *"I wanted to reach out personally. You’ve been one of our best clients and we’ve genuinely enjoyed the work. I’m building a small group of business owner ambassadors who’d be open to doing a quick testimonial or intro when relevant. In return, [reward]. Is that something you’d be interested in?"*
    
- [ ]  For each ambassador who says yes:
    - [ ]  Record a video testimonial (Loom or WhatsApp video)
    - [ ]  Add testimonial to website, proposals, and case study library
    - [ ]  Create a co-branded LinkedIn post: tag the client, share the result

### Week 8, Day 3 — Referral Tracking Automation

- [ ]  Build n8n referral tracking flow:
    - Trigger: New contact created with `referral_source` field filled
    - Action: Create HubSpot task: *"Follow up with referral contact [Name] within 24 hours"*
    - Action: Send thank you WhatsApp to referrer: *"Just saw the intro! Thank you — I’ll reach out to them today. You’ll hear from me once we’ve connected."*
    - Action: When referral signs: trigger reward payment task + send reward to referrer

---

## ♻️ STAGE 11B — REACTIVATION (Week 8, ongoing)

### Week 8, Day 4 — First Reactivation Campaign

- [ ]  Pull first batch from the Stage 11B reactivation list (built in Phase 3)
- [ ]  Review AI-generated reactivation messages (from Day 40 automation)
- [ ]  Personalise top 10 messages before sending — add a specific detail about their business
- [ ]  Send via WhatsApp (not email — higher open rate for reactivation)
- [ ]  Reactivation message template:
    
    *"Hi [Name], it’s been a while since we spoke about [PAIN POINT they mentioned]. I was thinking about you because we just helped a [INDUSTRY] business [SPECIFIC RESULT]. Wondering if this is still something on your radar? No pressure — just wanted to reconnect."*
    
- [ ]  Log responses in HubSpot. Any HOT response? Route to Stage 6 immediately.
- [ ]  Run reactivation campaign monthly going forward

---

## 🌐 STAGE 12 — ECOSYSTEM (Week 8+)

### Week 8, Day 5 — Partner Application + Onboarding

- [ ]  Build Partner Application form (Tally):
    - Fields: Name, Company, Industry, What services they offer, How many clients they work with, Why partner with Nivy Digital
- [ ]  Post partner opportunity on:
    - LinkedIn post: *"We’re building our partner network. If you’re an accountant, lawyer, web developer, or business consultant who works with growth-stage businesses, let’s talk."*
    - Facebook Groups: relevant professional groups
    - WhatsApp community
- [ ]  Partner onboarding process (once application approved):
    - Step 1: 30-min partner intro call
    - Step 2: Send Partner Agreement (PandaDoc template)
    - Step 3: Add to Partner WhatsApp group
    - Step 4: Send Partner Kit: our services PDF, referral program details, intro email template they can use
    - Step 5: Introduce them to any of your clients who might need their services (reciprocal)

### Week 9+ — Ongoing Optimisation Cycles

- [ ]  Monthly review cadence for each stage:
    - Stage 1: Is the enquiry method still getting responses? Test new post formats.
    - Stage 2: Trust score — which content is driving the most +points?
    - Stage 3: Which capture form has the lowest conversion? Redesign it.
    - Stage 4: Lead scoring accuracy — are HOT leads converting? Recalibrate if not.
    - Stage 5: Open rates declining? Refresh email subjects across the sequence.
    - Stage 6: Close rate — which objection is killing most deals? Drill into it.
    - Stage 7: CSAT scores — any pattern in low scores? Fix onboarding step.
    - Stage 8: Client report engagement — are clients opening them? Shorten if needed.
    - Stage 9: NPS trend — going up or down? Identify root cause.
    - Stage 10: Expansion — any upsells pending >30 days? Accelerate or close.
    - Stage 11: Referral program — how many referrals received this month?
    - Stage 12: Ecosystem — which partner has sent the most leads?

---

## 📊 Phase 4 Success Milestones

| Milestone | Target | By When |
| --- | --- | --- |
| Churn rate | <5%/month | Month 2 onwards |
| First upsell closed | 1 expansion deal | Week 8 |
| First referral received | 1 referral | Month 2 |
| NPS score | >50 | Month 3 |
| Ecosystem partners | 3+ | Month 3 |
| Revenue from referrals | 20% of new MRR | Month 4 |
| 10 active clients | MRR $10k+ | Month 3 |

---

## 🔗 Navigation

**⬅️ [Phase 3 — Automation](https://www.notion.so/35be5082b9d481cc932bc724d997f5c9)** | **⚡ [Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)**