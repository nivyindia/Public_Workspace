# 🌐 SD-02 — Brand & Online Presence Hub

**Owner:** Nivy | **Status:** ✅ Active

---

> This is the command center for everything related to Nivy Digital's online presence — website, social media, AI chatbot, directories, brand, and SEO. Every platform, every channel, every automation SOP lives here.
> 

---

# 📌 QUICK LINKS

- [Website Content Plan & SOP](#website-sop)
- [AI Chatbot Setup (Chatwoot/Botpress)](#chatbot-setup)
- [Social Media Playbook — All Platforms](#social-playbook)
- [Directory Listing Tracker](#directories)
- [Content Calendar & Scheduling](#content-calendar)
- [Brand Guidelines](#brand-guidelines)
- [SEO Keyword Master List](#seo-keywords)

---

## 📂 Recently Consolidated Pages

- 🖼️ Marketing Assets Library — moved in from old hub
- 🎨 Brand & Positioning Assets — moved in from old hub

---

# 🖥️ WEBSITE SOP {#website-sop}

## Platform Decision

| Option | Pros | Cons | Verdict |
| --- | --- | --- | --- |
| **WordPress + Astra** | Unlimited flexibility, free, huge plugin ecosystem, SEO-ready | Requires hosting setup | ✅ **RECOMMENDED** for Nivy Digital |
| Webflow (Free Tier) | Beautiful UI builder, fast | 2 pages limit on free, no CMS | Use only for landing page |
| Framer | Modern, fast | Limited free tier | Optional |

**Decision: WordPress on Cloudflare Pages / Hostinger ($2.99/mo) with Astra theme (free)**

## Website Build Checklist

### Phase 1 — Core Setup (Week 1)

- [ ]  Purchase hosting: Hostinger Business ($2.99/mo) or Cloudways
- [ ]  Install WordPress + Astra theme (free)
- [ ]  Install plugins: RankMath SEO, HubSpot forms, Elementor (free), WP Rocket (cache), Wordfence (security)
- [ ]  Set up SSL certificate (free via Let's Encrypt)
- [ ]  Connect domain to hosting
- [ ]  Install Google Analytics 4 + Microsoft Clarity
- [ ]  Set up Google Search Console

### Phase 2 — Page Build (Week 2-3)

- [ ]  Home Page
- [ ]  Services: VA Services
- [ ]  Services: Digital Marketing
- [ ]  Services: AI & Automation
- [ ]  Services: Lead Generation
- [ ]  About Us (story, team, mission, values)
- [ ]  Portfolio / Case Studies (3 minimum)
- [ ]  Blog (with category structure)
- [ ]  Contact Page (form + [Cal.com](http://Cal.com) booking embed)
- [ ]  FAQ Page (accordion style)
- [ ]  Privacy Policy + Terms (auto-generate)

### Phase 3 — Optimization (Week 3-4)

- [ ]  Mobile responsiveness tested on 5 device sizes
- [ ]  Page speed: target 90+ on PageSpeed Insights
- [ ]  Schema markup on Home, Services, FAQ pages
- [ ]  Open Graph tags for social sharing
- [ ]  XML sitemap submitted to Google
- [ ]  All forms tested end-to-end (form → CRM confirmed)
- [ ]  Chatbot widget live and tested

## Home Page Copywriting Guide

**Hero Headline Formula (AIDA):**

> "We Handle Your Business Operations — So You Can Focus On Growth"
> 

**Sub-headline:**

> "Virtual Assistants, Digital Marketing & AI Automation for Entrepreneurs Worldwide"
> 

**Primary CTA:** Book a Free Strategy Call → [Cal.com](http://Cal.com)

**Secondary CTA:** See Our Services → /services

**Trust Bar (below hero):**

- "Trusted by 50+ businesses across 8 countries"
- Review stars (Google ⭐⭐⭐⭐⭐)
- Logos: Clutch, Google Reviews, Trustpilot badges

---

# 🤖 AI CHATBOT SETUP GUIDE {#chatbot-setup}

## Recommended Tool: **Chatwoot** (Open Source, Self-Hosted)

### Why Chatwoot?

- 100% free (self-hosted on Railway/Render free tier)
- Full omnichannel: website chat, WhatsApp, Facebook, Instagram, Email
- AI integration possible via n8n
- No per-conversation limits
- Production-ready (used by 10,000+ businesses)

### Setup Steps

1. **Deploy Chatwoot on [Railway.app](http://Railway.app)** (free)
    - Go to [railway.app](http://railway.app) → Deploy → Search "Chatwoot"
    - Set environment variables (DB URL, SMTP, etc.)
    - Get your Chatwoot URL (e.g., [nivy-chat.railway.app](http://nivy-chat.railway.app))
2. **Create your Inbox**
    - Settings → Inboxes → Add Inbox → Website
    - Copy the embed code → paste in WordPress (before </body>)
3. **Build Chatbot Flows**
    - Use Chatwoot's built-in "Agent Bots" API OR
    - Connect via n8n: New conversation → n8n → reply with structured flow

### 5 Core Chatbot Flows to Build

**Flow 1: Welcome + Service Router**

```
Bot: "Hi! 👋 Welcome to Nivy Digital. What are you looking for today?"
→ [Virtual Assistant Services]
→ [Digital Marketing]
→ [AI & Automation]
→ [Pricing Info]
→ [Just Browsing]
```

**Flow 2: Lead Qualification**

```
Bot: "Great! To find the best solution for you, quick question:"
→ "What's your biggest challenge right now?"
→ "How many team members do you have?"
→ "What's your monthly budget range?"
→ Capture: Name + Email
→ "Thank you! Our team will reach out within 4 hours."
→ n8n → HubSpot CRM entry
```

**Flow 3: FAQ Auto-Responder**

- Common triggers: "pricing", "how much", "cost", "free trial", "how it works"
- Bot answers instantly from knowledge base
- If unanswered → "Let me connect you with our team!"

**Flow 4: Booking Trigger**

```
Bot: "Want to skip the back-and-forth? Book a free 30-min strategy call:"
→ [Book Now] → Cal.com link
```

**Flow 5: After-Hours Handler**

```
Bot: "Our team is offline (9 AM – 6 PM IST), but I'm here!"
→ "Leave your email and we'll respond by tomorrow morning."
→ Capture email → n8n → Slack alert
```

### Alternative: **Tidio** (Easier, Free Tier)

- 50 conversations/month free
- No server setup needed
- Built-in bot flows
- Upgrade: $19/mo for unlimited

### Alternative: **Botpress** (Advanced AI)

- Open source, Claude/GPT integration
- Build full conversational AI agent
- Requires more setup time
- Best for Phase 4+ when you want GPT-powered FAQ

---

# 📱 SOCIAL MEDIA PLAYBOOK {#social-playbook}

## Platform Priority Matrix

| Platform | Priority | Goal | Post Frequency | Best Content |
| --- | --- | --- | --- | --- |
| **LinkedIn** | 🔴 #1 | B2B leads | 5x/week | Case studies, insights, founder posts |
| **Instagram** | 🔴 #2 | Brand + trust | 4x/week | Reels, carousels, testimonials |
| **Facebook** | 🟠 #3 | Community + SEO | 3x/week | Blog shares, group posts |
| **YouTube** | 🟠 #4 | SEO + authority | 1x/week | Tutorials, case studies |
| **Twitter/X** | 🟡 #5 | Thought leadership | 3x/week | Short tips, commentary |
| **WhatsApp** | 🟡 #6 | Direct leads | As needed | Broadcasts, follow-ups |
| **Pinterest** | 🟢 #7 | Passive SEO | 5x/week | Infographics, tips |
| **Threads** | 🟢 #8 | Growth platform | 2x/week | Repurposed LinkedIn content |

## LinkedIn Strategy (World-Class Model — Reference: Justin Welsh, Alex Hormozi)

### Founder Personal Brand Posts (3x/week)

**Format 1: Hook + Value + CTA**

```
[Scroll-stopping hook — 1 line]

[3-7 insight lines with line breaks]

[CTA: "DM me X" or "Follow for more"]
```

**Format 2: Case Study Mini-Post**

```
Client came to us with [problem].

We did [solution].

Result: [specific number].

Here's exactly how:
[5-step breakdown]

Want the same? Link in bio.
```

**Format 3: Contrarian Take**

```
Unpopular opinion: [statement]

[Explanation in 3-5 points]

[Ask question to drive comments]
```

### LinkedIn Automation Setup

- **Scheduling:** Buffer (free, 3 posts queue) OR LinkedIn native scheduler
- **Connection Outreach:** PhantomBuster (free: 20 actions/day) — auto-connect with ICPs
- **DM Sequence (n8n):** New connection → 24h wait → personalized DM → 5-day wait → follow-up

## Instagram Strategy

### Content Pillars (Rotate Weekly)

1. **Education** — Tips carousels ("5 tasks to delegate to a VA today")
2. **Proof** — Client results, testimonials (screenshot carousels)
3. **Behind-the-Scenes** — Team, office, process (builds trust)
4. **Reels** — 15-30 sec tips, mini case studies, day-in-the-life
5. **Engagement** — Polls, Q&As in Stories

### Canva Template System

- Create 5 master templates in Canva (carousel, single post, Reel cover, Story)
- Brand colors: [Add your colors here]
- Brand fonts: [Add your fonts here]
- Always include logo watermark

## YouTube Channel Strategy

### Channel Setup Checklist

- [ ]  Channel art (2560x1440px banner)
- [ ]  Channel description with keywords
- [ ]  5 playlists: VA Services, Digital Marketing, Automation Tutorials, Client Stories, Tools & Tech
- [ ]  Channel trailer (2-min intro video)
- [ ]  Links: website, [Cal.com](http://Cal.com) booking, WhatsApp

### First 10 Video Ideas (High Search Volume)

1. "How to Hire a Virtual Assistant in 2026 (Complete Guide)"
2. "5 Tasks Every Business Owner Should Delegate TODAY"
3. "We Generated 150 Leads in 30 Days — Here's Exactly How"
4. "Best FREE CRM for Small Business (HubSpot Setup Tutorial)"
5. "How to Automate Your Business with n8n (Beginner Guide)"
6. "Virtual Assistant vs Full-Time Employee: The Real Cost"
7. "How We Manage 20+ Clients with These Free Tools"
8. "LinkedIn Outreach That Actually Works in 2026"
9. "Our Complete Digital Marketing Stack (All Free Tools)"
10. "Day in the Life of a Nivy Digital VA"

## Content Repurposing System (World-Class: Gary Vee Model)

```
1 Pillar Piece (Blog Post / YouTube Video)
         ↓
    ┌────────────────────────────────────┐
    │ LinkedIn article (1x)              │
    │ LinkedIn posts — 5 angles (5x)     │
    │ Instagram carousel (1x)            │
    │ Instagram Reel script (1x)         │
    │ Twitter/X thread (1x)              │
    │ Facebook post (1x)                 │
    │ Newsletter section (1x)            │
    │ Pinterest infographic (2x)         │
    └────────────────────────────────────┘
         ↓
  1 piece → 13+ pieces of content
  Time: 2 hours total vs 13 hours if done separately
```

**AI Workflow:**

- Write pillar blog post (with Claude)
- Prompt Claude: "Repurpose this blog post into: 5 LinkedIn posts, 1 carousel outline, 1 Twitter thread, 1 newsletter section"
- Edit lightly, schedule via Buffer

---

# 🌍 DIRECTORY LISTING TRACKER {#directories}

## Master Tracker

| Platform | Category | Status | Profile URL | Reviews | Notes |
| --- | --- | --- | --- | --- | --- |
| Google Business Profile | Local/Global | ⬜ Todo | — | 0 | #1 priority |
| [Clutch.co](http://Clutch.co) | B2B Agency | ⬜ Todo | — | 0 | Best for international B2B |
| GoodFirms | B2B Agency | ⬜ Todo | — | 0 | — |
| DesignRush | Agency Dir | ⬜ Todo | — | 0 | — |
| Upwork | Freelance | ⬜ Todo | — | 0 | Direct leads |
| Fiverr Business | Freelance | ⬜ Todo | — | 0 | — |
| Trustpilot | Reviews | ⬜ Todo | — | 0 | — |
| Crunchbase | Startup | ⬜ Todo | — | 0 | — |
| G2 | Reviews | ⬜ Todo | — | 0 | — |
| Capterra | Reviews | ⬜ Todo | — | 0 | — |
| PeoplePerHour | Freelance | ⬜ Todo | — | 0 | UK/Europe |
| [Bark.com](http://Bark.com) | Marketplace | ⬜ Todo | — | 0 | UK/AU/US |
| AngelList/Wellfound | Startup | ⬜ Todo | — | 0 | — |
| SortList | Agency | ⬜ Todo | — | 0 | Europe |
| Agency Spotter | Agency | ⬜ Todo | — | 0 | US market |
| The Manifest | B2B | ⬜ Todo | — | 0 | — |
| IndiaMART | India B2B | ⬜ Todo | — | 0 | Huge lead source |
| JustDial | India Local | ⬜ Todo | — | 0 | — |
| Sulekha | India Svcs | ⬜ Todo | — | 0 | — |
| TradeIndia | India B2B | ⬜ Todo | — | 0 | — |
| Yellow Pages India | India Dir | ⬜ Todo | — | 0 | SEO signal |
| Behance | Portfolio | ⬜ Todo | — | 0 | Creative work |
| LinkedIn Company | Professional | ⬜ Todo | — | 0 | — |
| NASSCOM | India Tech | ⬜ Todo | — | 0 | Phase 6 |
| IAMAI | India Digital | ⬜ Todo | — | 0 | Phase 6 |
| Product Hunt | Startup | ⬜ Todo | — | 0 | For tool launches |

**Review Collection Automation (n8n Flow):**

- Trigger: HubSpot deal moved to "Closed Won"
- Wait: 3 days after project delivery
- Send email: "How was your experience? Leave us a review:"
- Links: Google ⭐ | Clutch ⭐ | Trustpilot ⭐
- Follow-up if no review: 5 days later, 1 reminder

---

# 📅 CONTENT CALENDAR {#content-calendar}

## Weekly Posting Schedule

| Day | LinkedIn (Founder) | LinkedIn (Company) | Instagram | Twitter/X | YouTube |
| --- | --- | --- | --- | --- | --- |
| Mon | Insight/lesson post | Service spotlight | Tips carousel | Quick tip | — |
| Tue | — | Case study snippet | Behind-the-scenes Reel | Industry stat | — |
| Wed | Client win story | Company milestone | Client testimonial | Commentary | New video |
| Thu | Industry take | Blog post share | Infographic | Thread | — |
| Fri | Weekly reflection | Team/culture post | Story Q&A | Engage community | — |
| Sat | — | — | Reel (entertainment) | — | — |
| Sun | — | — | — | — | — |

## AI Content Creation Workflow

**Step 1: Weekly Content Planning (30 min on Sunday)**

- Choose 1 theme for the week (e.g., "Why VAs Save Money")
- Prompt Claude: "Give me 5 LinkedIn post angles, 2 carousel ideas, 1 Reel concept, and 1 blog outline on [theme]"

**Step 2: Batch Creation (2 hours on Monday)**

- Write all posts using Claude
- Create visuals in Canva using saved templates
- Edit Reel in CapCut

**Step 3: Schedule Everything (30 min)**

- Upload to Buffer (LinkedIn, Instagram, Facebook, Twitter)
- Schedule YouTube video
- Done — whole week automated

**Monthly Pillar Content (1 per month):**

- Write long-form blog post (2,000+ words) with Claude
- Record 1 YouTube video on same topic
- Repurpose into 15+ pieces of social content

---

# 🎨 BRAND GUIDELINES {#brand-guidelines}

## Visual Identity

| Element | Specification |
| --- | --- |
| **Primary Color** | [Add your hex code] |
| **Secondary Color** | [Add your hex code] |
| **Accent Color** | [Add your hex code] |
| **Background** | White / Light Gray |
| **Logo** | [Upload logo file here] |
| **Primary Font** | [e.g., Inter, Poppins, DM Sans] |
| **Heading Font** | [e.g., same or different] |
| **Font Sizes** | H1: 48px, H2: 36px, Body: 16px |

## Brand Voice

| Tone Attribute | Description | Example |
| --- | --- | --- |
| **Professional** | Authoritative, credible | "We've delivered X results for Y clients" |
| **Warm** | Approachable, human | "We get it — running a business is hard" |
| **Direct** | No fluff, outcome-focused | "Here's exactly what you get" |
| **Ambitious** | Growth-oriented | "Built to scale with you" |

## Content Do's and Don'ts

**Do:**

- Use specific numbers and results
- Write in second person ("you", "your business")
- Always lead with client benefit, not features
- Use short sentences and paragraphs
- Include CTAs in every post

**Don't:**

- Use jargon without explaining it
- Make claims without proof
- Post generic stock photos without branding
- Ignore comments or DMs

---

# 🔍 SEO KEYWORD MASTER LIST {#seo-keywords}

## Tier 1 — Priority Keywords (High Intent, Target First)

| Keyword | Monthly Searches | Difficulty | Type |
| --- | --- | --- | --- |
| virtual assistant agency India | 1,200 | Medium | Service |
| hire virtual assistant for small business | 3,400 | Medium | Intent |
| VA services for real estate agents | 880 | Low | Niche |
| digital marketing agency for startups | 2,900 | High | Service |
| affordable virtual assistant services | 1,600 | Medium | Price |
| virtual assistant services USA | 4,400 | High | Geographic |
| AI automation for small business | 2,100 | Medium | Emerging |
| outsource digital marketing India | 1,400 | Medium | B2B |

## Tier 2 — Blog/Content Keywords

| Keyword | Type | Suggested Post Title |
| --- | --- | --- |
| what does a virtual assistant do | Informational | "The Complete Guide: What a VA Can Do for Your Business" |
| how to hire a virtual assistant | How-to | "How to Hire a VA in 2026: Step-by-Step Guide" |
| virtual assistant vs full time employee | Comparison | "VA vs Full-Time Employee: The Real Cost Breakdown" |
| best tools for virtual assistants | Tools | "Top 15 Free Tools Every VA Uses in 2026" |
| how to manage a remote team | How-to | "Managing Remote VAs: The System That Works" |
| lead generation for small business | How-to | "5 Lead Generation Strategies That Cost $0" |

## SEO Action Items

- [ ]  Submit sitemap to Google Search Console (Day 1 of site launch)
- [ ]  Install RankMath SEO plugin (WordPress)
- [ ]  Write meta title + description for every page (include primary keyword)
- [ ]  Add FAQ schema to FAQ page and service pages
- [ ]  Add Review schema once you have Google reviews
- [ ]  Build 1 backlink/week from directories (free)
- [ ]  Publish 2 blog posts/week targeting Tier 2 keywords
- [ ]  Internal linking: every new blog post links to 2 service pages

---

*Last updated: May 8, 2026 | Owner: Nivy Digital Founder*

*Part of: MASTER BUILD PLAN — World-Class Sales & Marketing Department*

---

📋 **PAGE METADATA**

- **Section:** SD-01 — Online Presence, Website & Social Media
- **Parent:** [🗺️ MASTER BUILD PLAN](https://www.notion.so/359e5082b9d481799fd3d2dcad10d822)
- **Owner:** Nivy Digital Founder
- **Status:** ✅ Complete — Phase 4 Metadata Updated May 8, 2026
- **Last Updated:** May 8, 2026
- **Version:** 1.1
- **Tags:** `SD-01` `online-presence` `website` `social-media` `SEO` `chatbot` `brand` `directories` `nivy-digital`
- **Related Pages:** [Department Home](https://www.notion.so/359e5082b9d4812b9c4acce87f46229b) | [SD-02 Strategy](https://www.notion.so/359e5082b9d4819db90dda0d16e4650f) | [SD-05 Inbound](https://www.notion.so/359e5082b9d4811b9ac5c6ba5f2be2ef) | [SD-08 Automation](https://www.notion.so/359e5082b9d48131a297ee79bdee39d9)

---

[🖥️ Website Build Checklist & SOP](%F0%9F%96%A5%EF%B8%8F%20Website%20Build%20Checklist%20&%20SOP%20359e5082b9d481889e73f703de03d5c2.md)

[🤖 AI Chatbot Setup Guide — Chatwoot & Tidio](%F0%9F%A4%96%20AI%20Chatbot%20Setup%20Guide%20%E2%80%94%20Chatwoot%20&%20Tidio%20359e5082b9d481198171f0a8f6b95b1a.md)

[📱 Social Media Platform Playbooks — All 8 Platforms](%F0%9F%93%B1%20Social%20Media%20Platform%20Playbooks%20%E2%80%94%20All%208%20Platform%20359e5082b9d481368af4e00ae6c191e3.md)

[🎨 Brand Guidelines — Logo, Colors, Fonts & Voice](%F0%9F%8E%A8%20Brand%20Guidelines%20%E2%80%94%20Logo,%20Colors,%20Fonts%20&%20Voice%20359e5082b9d481c0bcbdc4be6275f984.md)

[🔍 SEO Keyword Master List & Action Plan](%F0%9F%94%8D%20SEO%20Keyword%20Master%20List%20&%20Action%20Plan%20359e5082b9d481628ca3cde0e45e0c08.md)

[Website Build Checklist & SOP](Website%20Build%20Checklist%20&%20SOP%2035ae5082b9d48190b7edc7970215aba9.md)

[AI Chatbot Setup Guide (Chatwoot & Tidio)](AI%20Chatbot%20Setup%20Guide%20(Chatwoot%20&%20Tidio)%2035ae5082b9d48173a707e5dbab19f368.md)

[Social Media Platform Playbooks](Social%20Media%20Platform%20Playbooks%2035ae5082b9d481ce8292d0ee87c6436d.md)

[Brand Guidelines — Nivy Digital](Brand%20Guidelines%20%E2%80%94%20Nivy%20Digital%2035ae5082b9d481e8aafae47afd410e44.md)

[🖼️ Marketing Assets Library](%F0%9F%96%BC%EF%B8%8F%20Marketing%20Assets%20Library%20af1e5082b9d48273a527814d39795404.md)

[🎨 Brand & Positioning Assets](%F0%9F%8E%A8%20Brand%20&%20Positioning%20Assets%204a4e5082b9d482f9ba00011cb93a09cf.md)