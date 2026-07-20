# 🌊 Nivy Digital — Inbound Marketing & Relationship Automation System

> **Purpose:** A complete, phased system to automate inbound lead generation, authority building, multi-channel nurturing, and business relationship management across USA, UK, Canada, Australia, UAE & India — using free/open-source tools.
> 

> **Philosophy:** Visibility + Authority + Conversations + Systems. Not ads and hard selling.
> 

---

## 📋 Quick Navigation

| Section | What's Inside |
| --- | --- |
| Phase 0 | Foundation & Infrastructure |
| Phase 1 | Authority & Content Engine |
| Phase 2 | Enquiry-Driven Inbound Funnels |
| Phase 3 | WhatsApp Nurture System |
| Phase 4 | Relationship & Contact Capture |
| Phase 5 | Community & Hidden Channels |
| Phase 6 | Free Audit Lead Magnet System |
| Phase 7 | Automation Layer (n8n) |
| Phase 8 | CRM & Contact Management |
| Phase 9 | Tracking & Optimization |
| Risk Register | Risks + Mitigations |
| Country Playbooks | UAE, UK, USA, India, Canada |

---

## 🧰 MASTER TECH STACK (Free / Open Source First)

| Function | Tool | Cost |
| --- | --- | --- |
| Automation Engine | n8n (self-hosted) | Free |
| Email Marketing | Mautic (self-hosted) | Free |
| CRM & Contacts | Twenty CRM / Google Sheets | Free |
| WhatsApp Automation | WhatsApp Business API (Meta) | Free tier |
| Social Scheduling | Buffer free / Publer free tier | Free |
| Lead Forms | [Tally.so](http://Tally.so) / Google Forms | Free |
| Landing Pages | Carrd / Notion public pages | Free |
| Content Storage | Notion | Free |
| SEO Tracking | Google Search Console + Ubersuggest | Free |
| Analytics | Google Analytics 4 | Free |
| Link Tracking | [Dub.co](http://Dub.co) (short links) | Free tier |
| AI Content | Groq API / OpenAI API | Free/cheap |
| Community Monitoring | n8n RSS + keyword alerts | Free |
| Calendar / Booking | [Cal.com](http://Cal.com) | Free |
| Video Hosting | YouTube | Free |

---

## 📅 PHASE 0 — FOUNDATION SETUP (Week 1)

### 🎯 Goal

Build the infrastructure before publishing anything.

**Step 1: Brand & Profile Setup**

- Optimize LinkedIn company page + personal profiles of founders/VAs
- Headline formula: "Helping [ICP] achieve [result] using [method]"
- About section: Who you help → What results → Industries → CTA (WhatsApp/[Cal.com](http://Cal.com) link)
- LinkedIn banner: Clear positioning + services
- Instagram Business: Same positioning, link in bio → WhatsApp
- Twitter/X: Same, bio with CTA

**Step 2: Content Hub Setup**

- Create a Notion public page as your content library (free landing page)
- Set up Google Search Console + GA4 on your website
- Create a Buffer/Publer account for social scheduling
- Set up [Tally.so](http://Tally.so) for all lead capture forms (audit requests, enquiries, newsletter)

**Step 3: WhatsApp Business Setup**

- Create WhatsApp Business account with business profile
- Set up auto-reply: greeting message + quick replies
- Create WhatsApp catalogue (services)
- Save all existing contacts tagged by type: Client / Vendor / Partner / Prospect

**Step 4: Contact Tagging System (Google Sheets)**

Create a master Contact CRM sheet with columns:

- Full Name, Company, Role, Country, Phone, Email
- Platform (LinkedIn / WhatsApp / Instagram / Email)
- Type (Client / Partner / Vendor / Prospect / Referral)
- Industry, Date Added, Source, Last Interaction, Notes
- Status (Cold / Warm / Hot / Active Partner)

**Step 5: Email Newsletter Setup (Mautic)**

- Create newsletter segment in Mautic
- Design simple plain-text newsletter template per market
- Set up welcome sequence (3 emails over 7 days for new subscribers)

---

## 📅 PHASE 1 — AUTHORITY & CONTENT ENGINE (Week 2–3)

### 🎯 Goal

Become the visible expert that people find, follow, and trust before you ever reach out.

### Content Pillars (Post Categories)

| Pillar | Topics | Platform |
| --- | --- | --- |
| Business Growth | Scaling, systems, operations | LinkedIn, Blog |
| Digital Marketing | SEO, ads, automation | LinkedIn, Instagram |
| Financial Insights | Tax, compliance, accounting tips | LinkedIn, Newsletter |
| Proof & Results | Client wins, case studies | All platforms |
| Behind the Scenes | Team, work, culture | Instagram, WhatsApp Status |
| Enquiry Posts | Looking for partners/vendors | LinkedIn, Facebook Groups |
| Education | Guides, tips, tools | YouTube, Blog, Newsletter |

### 📆 Weekly Content Schedule

| Day | Content Type | Platform |
| --- | --- | --- |
| Monday | Insight post (problem + solution) | LinkedIn + Instagram |
| Tuesday | Enquiry / Looking For post | LinkedIn Groups + Facebook |
| Wednesday | Educational carousel / guide | Instagram + LinkedIn |
| Thursday | Client result / proof | LinkedIn + WhatsApp Status |
| Friday | Behind the scenes | Instagram + WhatsApp Status |
| Daily | WhatsApp Status update | WhatsApp |
| Weekly | Newsletter | Email (Mautic) |

### n8n Content Automation

```
[Google Sheet: Content Calendar]
        ↓
[n8n reads upcoming posts]
        ↓
[Send reminder to VA: "Post due today"]
        ↓
[After posting: log date in sheet]
        ↓
[Weekly: compile engagement stats]
```

### Blog & SEO Setup

- Publish 2 blog posts per week on target keywords
- Categories: Business Growth, Digital Marketing, Financial Management, Startup Guidance
- Each blog ends with: Free audit CTA + WhatsApp / newsletter link
- n8n: When blog published → auto-share to LinkedIn + Twitter + email newsletter

---

## 📅 PHASE 2 — ENQUIRY-DRIVEN INBOUND FUNNELS (Week 3–4)

### 🎯 Goal

Use enquiry posts as magnets — attract decision-makers without pitching.

### The Enquiry Post Formula

Instead of "We offer services", post:

- "Looking for FMCG brands expanding internationally"
- "Looking for CPA firms open to outsourcing overflow work"
- "Looking for digital agencies needing white-label IT support"
- "Distributor search: connecting brands with UAE retail networks"

**Why it works:** Curiosity-driven. Decision-makers self-identify. No spam feeling.

### Enquiry Post Templates

**LinkedIn Enquiry Post:**

```
🔍 [LOOKING FOR / VENDOR SEARCH / PARTNERSHIP ENQUIRY]

We're currently [researching / connecting with / building a network of]:
→ [Type of business]
→ [Location]
→ [Specific need or goal]

If you're a [role] in [industry] and [pain point or goal], 
we'd love to connect.

DM or comment below 👇
[Your name] | Nivy Digital
```

**Facebook Group Post:**

```
Quick requirement post:

Looking for [X type of business] in [country/city].
We work with [industry] companies on [service area].

If relevant, feel free to reach out or tag someone who fits.
```

### Enquiry Post Schedule

- 3–5 enquiry posts per week across LinkedIn + Facebook groups
- Vary the industry and geography each week
- Rotate: US CPA firms → UK agencies → UAE retail → Canada startups

### n8n Enquiry Tracking Flow

```
[VA posts enquiry → logs in Google Sheet]
        ↓
[n8n monitors sheet for new "Comment/DM" entries]
        ↓
[Classify: Partner / Vendor / Client / Referral]
        ↓
[Add to Contact CRM with source = "Enquiry Post"]
        ↓
[Trigger WhatsApp or email follow-up sequence]
```

---

## 📅 PHASE 3 — WHATSAPP NURTURE SYSTEM (Week 4 → Ongoing)

### 🎯 Goal

Build silent trust with hundreds of contacts through daily WhatsApp Status content. Turn viewers into inbound conversations.

### 🔥 5-Day Content Loop (Repeat Weekly)

| Day | Status Type | Example |
| --- | --- | --- |
| Day 1 | Problem | "Most businesses fail at international outreach because of this one mistake..." |
| Day 2 | Insight | "What actually works for B2B lead gen in UK market in 2026" |
| Day 3 | Proof | "Client went from 0 to 3 international meetings in 30 days — here's how" |
| Day 4 | Behind the Scenes | "Setting up our client's automation system today" |
| Day 5 | Soft CTA | "If you're struggling with [problem], just DM 'HELP' and I'll share what works" |

### Contact Saving System (The Key Advantage)

Every person you interact with professionally gets saved with tags.

**Saving Rules:**

- Anyone who replies to a post → save as Prospect
- Anyone who DMs you → save as Warm Lead
- Anyone who books a call → save as Hot Lead
- Anyone from a group who comments → save as Contact
- Vendors / partners → save as Partner/Vendor
- Referral sources → save as Referral Partner

**Tagging Format in WhatsApp & CRM:**

```
[Name] | [Company] | [Country] | [Type] | [Date]
Example: John Smith | ABC CPA | USA | Prospect | May 2026
```

### Micro Engagement System

After a contact has seen your status 2–3 times:

1. React to their status
2. Reply to their story with a genuine comment
3. After 2–3 interactions, send:
    
    > "Hey [Name], noticed you're in [industry]. Are you also working on [topic]?"
    > 

This starts natural conversations without cold outreach.

### n8n WhatsApp Status Reminder Flow

```
[Daily 7am trigger]
        ↓
[Read today's status content from Google Sheet]
        ↓
[Send reminder to team WhatsApp: "Today's status: [content]"]
        ↓
[VA posts manually / WhatsApp Business auto-status]
        ↓
[Log posted in sheet]
```

### WhatsApp Auto-Reply Setup (WhatsApp Business API)

Keyword triggers:

- "HELP" → Send free resource PDF
- "AUDIT" → Send audit request form link
- "PRICING" → Send service overview PDF
- "CALL" → Send [Cal.com](http://Cal.com) booking link
- First message → Send welcome + quick menu

n8n integration:

```
[WhatsApp webhook: new message]
        ↓
[Detect keyword]
        ↓
[If AUDIT → send Tally form link + add to CRM]
[If CALL → send Cal.com link + add to CRM]
[If general → flag for VA reply within 2 hours]
        ↓
[Add contact to Google Sheets CRM with source + tag]
```

---

## 📅 PHASE 4 — RELATIONSHIP & CONTACT CAPTURE SYSTEM (Week 4 → Ongoing)

### 🎯 Goal

Every interaction becomes a saved relationship. Build a contact network of 1,000+ tagged business contacts over 6 months.

### Contact Sources to Capture

| Source | How to Capture | Tag |
| --- | --- | --- |
| LinkedIn connections | Export monthly via LinkedIn → import to CRM | LinkedIn Contact |
| WhatsApp group members | Save all numbers with business name | WA Group |
| Enquiry post commenters | VA saves every commenter | Inbound Enquiry |
| Webinar attendees | Tally form registration | Webinar Lead |
| Newsletter subscribers | Mautic list | Newsletter |
| Contact form submissions | Website form → n8n → CRM | Website Lead |
| Facebook group members | VA manually saves active members | FB Group |
| Event / expo contacts | WhatsApp QR code at events | Event Contact |
| Referrals | Referrer name tagged | Referral |
| Cold outreach replies | Automated via outreach system | Replied Lead |

### Contact Lifecycle Stages

```
STRANGER
   ↓ (discovers content / sees enquiry post)
CONTACT SAVED
   ↓ (enters WhatsApp / email nurture)
WARM FOLLOWER
   ↓ (engages with content, replies to status)
CONVERSATION STARTED
   ↓ (micro engagement → natural DM)
INTERESTED PROSPECT
   ↓ (requests audit / calls / pricing)
QUALIFIED LEAD
   ↓ (call booked)
ACTIVE PROPOSAL
   ↓ (closed)
CLIENT / PARTNER / VENDOR
```

### n8n Contact Management Flow

```
[New contact added to Google Sheets]
        ↓
[Auto-tag: Type + Source + Country + Date]
        ↓
[Route to correct Mautic segment]
  ├── Client → Client nurture sequence
  ├── Partner → Partner nurture sequence
  ├── Vendor → Vendor welcome email
  └── Prospect → Lead nurture sequence
        ↓
[Add to WhatsApp status viewer list (manual note)]
        ↓
[Monthly: n8n generates contact growth report]
```

---

## 📅 PHASE 5 — COMMUNITY & HIDDEN CHANNEL STRATEGY (Week 5+)

### 🎯 Goal

Generate inbound leads from platforms most competitors ignore.

### LinkedIn Groups Strategy

**Best group types to join:**

- Startup founder groups (USA, UK, UAE)
- B2B networking groups
- Export/import communities
- Industry-specific groups (accounting, marketing, IT)
- Entrepreneur communities per country

**Engagement method (not selling):**

1. Answer questions with valuable insights
2. Post enquiry/looking-for content
3. Share mini-guides and resources
4. React and comment on active discussions

**n8n Group Monitoring:**

```
[Daily: monitor target LinkedIn groups via PhantomBuster]
        ↓
[Extract: new posts with keywords (outsource / looking for / need help)]
        ↓
[Alert VA: "New opportunity post in [group]"]
        ↓
[VA engages within 2 hours → logs in sheet]
```

### Facebook Groups Strategy

Best for: UAE businesses, local UK/Australia SMEs, healthcare, real estate, logistics

- Join 10–15 relevant Facebook groups per market
- Post: answers, mini-guides, partnership enquiries
- Never pitch directly in posts
- Collect contacts who engage → move to WhatsApp

### Reddit + Quora Authority System

**How to use:**

1. Find questions related to your services (accounting, marketing, automation, IT)
2. Write detailed, genuinely helpful answers
3. Link to relevant blog post or free resource
4. People visit profile → website → newsletter → CRM

**n8n Reddit/Quora Monitoring:**

```
[Daily: n8n HTTP Request → Reddit API]
Search keywords: "outsource accounting", "find marketing agency", "automate outreach"
        ↓
[Alert VA: new relevant post to answer]
        ↓
[VA answers → logs in sheet → link tracked via Dub.co]
```

### Slack / Discord / Telegram Communities

- Slack: Startup communities, SaaS founders, remote work groups
- Discord: Web3, creator economy, agency owners
- Telegram: Trading groups, startup channels, UAE business groups
- Indie Hackers: SaaS and bootstrapped founder discussions

**Strategy:** Add value consistently. When someone has a problem you solve → offer to help privately. Never mass-pitch in groups.

### Comment-to-Lead Strategy (LinkedIn + Twitter)

This is the highest ROI organic method.

**Process:**

1. Find posts by founders, CEOs, agency owners (your ICP)
2. Leave strategic comments: insights, data points, mini-solutions (never generic)
3. Commenter profile gets noticed → they visit your profile → follow → DM
4. n8n: VA logs every strategic comment in sheet
5. After 3 comments on same person's posts → send connection request with reference

**Comment Formula:**

```
[Specific insight from their post]
+ [Your experience or data point]
+ [One question or add-on idea]

Example: "This is exactly what we see with UK agencies too.
In our experience, the issue is usually [X], not [Y].
Have you tried [Z] approach?"
```

---

## 📅 PHASE 6 — FREE AUDIT LEAD MAGNET SYSTEM (Week 5–6)

### 🎯 Goal

Convert cold traffic and warm contacts into qualified leads via free value.

### Audit Types to Offer

| Audit | Target ICP | Delivery |
| --- | --- | --- |
| SEO Audit | Agencies, SMEs with website | Automated report + manual insights |
| Social Media Audit | Marketing agencies, brands | PDF report |
| Website Audit | Any business | Loom video + PDF |
| Ad Performance Audit | E-commerce, agencies | Google Sheet report |
| Financial Health Check | CPA clients, startups | Confidential PDF |
| CRM / Funnel Audit | B2B companies | Notion page share |
| LinkedIn Profile Audit | Founders, consultants | PDF with recommendations |

### Audit Funnel Flow

```
[Post: "Free SEO Audit — comment AUDIT or DM"]
        ↓
[Lead fills Tally.so form: name, email, website, WhatsApp]
        ↓
[n8n webhook: new Tally submission]
        ↓
[Add to Google Sheets CRM + tag: "Audit Lead"]
        ↓
[Add to Mautic: start 3-email audit follow-up sequence]
        ↓
[n8n: trigger SEO audit via Ubersuggest API or similar]
        ↓
[Generate PDF report → store in Google Drive]
        ↓
[Email + WhatsApp: "Your audit is ready" + PDF link]
        ↓
[Day 3: follow-up: "Any questions on the audit?"]
        ↓
[Day 7: CTA: "Book a free 20-min call to go through it"]
        ↓
[Cal.com booking → team notified]
```

### Lead Magnet Library (Download Resources)

Create these as downloadable PDFs or Notion pages:

- Business Growth Checklist (USA market)
- International Expansion Guide
- Marketing Automation Starter Kit
- Startup Launch Checklist
- SEO Audit Template
- Financial Planning Spreadsheet

**How to distribute:**

- LinkedIn posts: "DM 'GUIDE' to get this free"
- WhatsApp status: "Tap to get free [resource]"
- Website: Tally form → email delivery via Mautic
- Twitter: "Reply SEND and I'll DM you this"

---

## 📅 PHASE 7 — AUTOMATION LAYER (n8n Master Flows)

### 🎯 Goal

Automate the repetitive parts. Keep humans for real conversations.

### Flow 1: Content Distribution Automation

```
[Google Sheet: weekly content calendar updated]
        ↓
[n8n reads: blog post published (RSS trigger)]
        ↓
[Auto-share to LinkedIn via LinkedIn API]
[Auto-share to Twitter via Twitter API]
[Add to Mautic newsletter queue]
        ↓
[Log: shared on all platforms + timestamp]
```

### Flow 2: Lead Capture Unification

```
[Multiple sources: Tally form / Website / WhatsApp / Cal.com]
        ↓
[n8n webhook listeners for each source]
        ↓
[Normalize data: name, email, phone, source, type]
        ↓
[Deduplication: check if email exists in CRM]
        ↓
[Write to Google Sheets Master CRM]
        ↓
[Add to correct Mautic segment]
        ↓
[Send WhatsApp acknowledgment (if phone provided)]
```

### Flow 3: Newsletter Automation (Mautic)

```
[Every Monday 7am: n8n reads newsletter content from sheet]
        ↓
[Build newsletter via Mautic template]
        ↓
[Send to segment: Newsletter Subscribers]
        ↓
[Track: opens, clicks → log in analytics sheet]
        ↓
[Unsubscribers → auto-remove from all sequences]
```

### Flow 4: Community Monitoring

```
[Daily: n8n scans Reddit, Quora, LinkedIn (via keywords)]
Keywords: "looking for accountant", "outsource marketing", "need IT support"
        ↓
[Filter: relevant posts from last 24 hours]
        ↓
[Send digest to VA WhatsApp: "5 opportunities to engage today"]
        ↓
[VA engages → logs in sheet with link]
```

### Flow 5: Relationship Warm-Up Reminders

```
[Every Friday: n8n reads CRM]
        ↓
[Filter: contacts with no interaction in 21+ days]
        ↓
[Alert VA: "These contacts need a touch this week"]
        ↓
[VA sends personal message / reacts to their post]
        ↓
[Log interaction date in CRM]
```

### Flow 6: Webinar / Event Automation

```
[Webinar announced → Tally registration form live]
        ↓
[n8n webhook: new registration]
        ↓
[Add to Mautic: webinar reminder sequence]
  - Day 0: Confirmation email
  - Day -1: Reminder + agenda
  - Day 0: Link + "see you soon"
  - Day +1: Recording + next step CTA
        ↓
[Add to CRM: tag = Webinar Attendee]
        ↓
[Post-webinar: qualify → move to hot lead sequence if engaged]
```

---

## 📅 PHASE 8 — CRM & CONTACT MANAGEMENT SYSTEM

### 🎯 Goal

Never lose a contact. Every relationship is an asset.

### Google Sheets Master CRM Structure

**Tab 1: All Contacts**

Name | Company | Role | Country | Email | Phone | Platform | Type | Industry | Source | Date Added | Last Interaction | Status | Notes | Score

**Tab 2: Partners & Vendors**

Name | Company | Service They Offer | Country | Contact | Commission % | Status | Last Deal | Notes

**Tab 3: Active Leads**

Name | Company | Service Interest | Country | Stage | Last Touch | Next Action | Assigned VA | Score

**Tab 4: Clients**

Name | Company | Services | Start Date | MRR | Renewal Date | Satisfaction | Upsell Opportunity

**Tab 5: Referral Network**

Name | Company | Referrals Sent | Deals Closed | Commission Owed | Last Referral Date

### Contact Scoring System

| Criteria | Points |
| --- | --- |
| Decision maker (CEO/Founder/CFO) | +3 |
| Has valid email | +2 |
| Has WhatsApp number | +2 |
| Engaged with content (liked/commented) | +2 |
| Requested audit or resource | +3 |
| Booked a call | +5 |
| Referred someone | +4 |
| Active in target industry | +2 |
| Located in target country | +1 |

**Score 15+:** Hot — personal outreach within 24h

**Score 8–14:** Warm — in nurture sequence

**Below 8:** Cold — long-term content nurture only

### Partner & Vendor Relationship Rules

- Every vendor gets saved with: services offered, pricing tier, country, WhatsApp
- Every partner gets saved with: referral terms, last deal, next check-in date
- n8n sends monthly reminder to check in with top 10 partners
- Referral commissions tracked in Tab 5

---

## 📅 PHASE 9 — TRACKING & OPTIMIZATION

### Weekly KPI Dashboard (Google Sheets)

| Metric | Target |
| --- | --- |
| New contacts saved/week | 50+ |
| Enquiry posts published/week | 3–5 |
| WhatsApp status views/week | 200+ |
| Newsletter open rate | 35%+ |
| Community comments posted/week | 20+ |
| Audit requests/week | 5+ |
| Calls booked/week | 2–3 |
| New partners/vendors saved/week | 3–5 |

### Monthly Review Checklist

- Top performing content type this month
- Which community channel sent most leads
- Newsletter unsubscribe rate (keep below 0.5%)
- Contacts moved from Cold → Warm this month
- Partners who sent referrals this month
- Which country sent most inbound enquiries
- A/B test winner: which CTA got most responses

### n8n Monthly Report Flow

```
[1st of every month, 8am]
        ↓
[Read all CRM data from Google Sheets]
        ↓
[Calculate: new contacts, stage movements, partner activity]
        ↓
[Build summary report]
        ↓
[Send to team WhatsApp + email]
```

---

## ⚠️ RISK REGISTER

| Risk | Mitigation |
| --- | --- |
| WhatsApp account banned | Use WhatsApp Business. Never broadcast to non-opted contacts. Max 50 messages/day. |
| LinkedIn profile restricted | Never use automation on main profile. Human-first approach. Max 20 actions/day. |
| Low content engagement | Test 3 formats per week. Double down on what works. Review weekly. |
| Contact data lost | Google Sheets backed up daily via n8n to Google Drive. |
| Team inconsistency | Daily VA checklist in Notion. Content calendar in Sheets. Weekly review meeting. |
| Community banning | Never pitch in groups. Always add value first. 80/20 rule: 80% value, 20% promotion. |
| Newsletter spam complaints | Double opt-in via Mautic. Easy unsubscribe. Max 1 email/week. |
| GDPR / privacy issues | Only contact opted-in leads. Store data in private Sheets. Clear consent for UK/Canada/Australia. |
| Partner going inactive | Monthly touchpoint. Referral incentive program active. |
| Scaling chaos | Hire VA #2 before reaching 500 active contacts. SOP for every process. |

---

## 🌍 COUNTRY-SPECIFIC PLAYBOOKS

### 🇦🇪 UAE Playbook

- Primary channels: WhatsApp, Instagram, referrals, trade communities
- Business culture: relationship-first, trust before business
- Contact saving: every WhatsApp number is gold — save with business context
- Best content: business growth, expansion, partnerships, success stories
- Groups: UAE Business Network, Dubai SME groups, construction/trade directories
- CTA style: informal, WhatsApp-first, video message works well

### 🇬🇧 UK Playbook

- Primary channels: LinkedIn, email, authority content, webinars
- Business culture: professional, evidence-based, credentials matter
- Contact saving: LinkedIn connections → export monthly
- Best content: compliance, accounting, data-driven marketing insights
- Groups: UK Entrepreneurs, ICAEW communities, digital marketing groups
- CTA style: formal, email-first, clear value proposition

### 🇺🇸 USA Playbook

- Primary channels: Cold email, LinkedIn, YouTube, SEO
- Business culture: ROI-focused, efficiency-driven, fast decisions
- Contact saving: LinkedIn + email list building
- Best content: case studies with numbers, productivity tips, automation
- Groups: CPA society groups, startup Slack communities, Indie Hackers
- CTA style: direct, data-backed, short and punchy

### 🇨🇦 Canada Playbook

- Primary channels: LinkedIn, email, community groups
- Business culture: similar to UK — professional, trust-based
- Contact saving: LinkedIn + newsletter opt-in
- Best content: compliance, business scaling, CPA/accounting tips
- CTA style: consultative, educational-first

### 🇮🇳 India Playbook

- Primary channels: WhatsApp, Instagram, Facebook, referrals
- Business culture: relationship-driven, community trust
- Contact saving: WhatsApp is primary — every number gets saved
- Best content: WhatsApp Status, Instagram reels, real results
- Groups: startup WhatsApp groups, industry Facebook groups
- CTA style: friendly, referral-based, value-first

---

## 🔥 COMPLETE SYSTEM FLOW

```
[AUTHORITY LAYER]
Blog + SEO + Social Content + YouTube + Newsletter
                ↓
[DISCOVERY]
Enquiry Posts + Community Engagement + Comment Strategy
                ↓
[CONTACT CAPTURE]
WhatsApp Save + LinkedIn Connect + Form + Email Subscribe
                ↓
[NURTURE ENGINE]
WhatsApp Status Loop + Email Sequences (Mautic) + Micro Engagement
                ↓
[CONVERSATION]
Natural DM → Audit Request → Call Booking (Cal.com)
                ↓
[QUALIFICATION]
Lead Scoring in CRM → Assign to VA → Proposal
                ↓
[CONVERSION]
Client / Partner / Vendor → Tagged in CRM
                ↓
[RELATIONSHIP MAINTENANCE]
Monthly touchpoints + Referral tracking + Partner nurture
                ↓
[n8n AUTOMATION LAYER — runs throughout every stage]
```

---

## 🗓️ MASTER EXECUTION TIMELINE

| Week | Phase | Key Output |
| --- | --- | --- |
| Week 1 | Foundation | Profiles optimized, CRM built, WhatsApp Business live |
| Week 2 | Content Engine | Content calendar live, Buffer scheduled, blog live |
| Week 3 | Enquiry Funnels | 10+ groups joined, enquiry posts running 4x/week |
| Week 4 | WhatsApp Nurture | Daily status loop running, 100+ contacts saved and tagged |
| Week 5 | Audit System | Free audit funnels live, Tally forms → n8n → CRM |
| Week 6 | Communities | Reddit/Quora/Slack active, 20+ comments/week system |
| Week 7 | Full Automation | All n8n flows live, Mautic sequences running |
| Week 8+ | Scale & Optimize | Weekly KPIs tracked, A/B testing, partner network growing |

---

*Last updated: May 2026 | Owner: Nivy Digital | System: n8n + Mautic + Google Sheets + WhatsApp Business + [Cal.com](http://Cal.com)*