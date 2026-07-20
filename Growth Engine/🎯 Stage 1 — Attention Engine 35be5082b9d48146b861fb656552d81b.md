# 🎯 Stage 1 — Attention Engine

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 1 OF 12 — The entry point of the entire system. No attention = no leads = no revenue. This engine runs 24/7 across every channel.**
> 

---

## 🎯 Core Objective

> **Get discovered by businesses, creators, startups, local businesses, and global clients — at scale, across every channel, every day.**
> 

This stage is engineered to:

- Maximize visibility across organic, paid, outbound, and community channels simultaneously
- Attract and pre-qualify the right audience before they even enter the funnel
- Create curiosity that drives profile visits, website traffic, and inbound enquiries
- Establish instant authority perception — so strangers become interested prospects
- Build a content machine that compounds over time (SEO, YouTube, social authority)

**Inputs to this stage:** Cold audiences, strangers, market segments

**Outputs from this stage:** Aware prospects, profile visitors, inbound enquiries, cold email/LinkedIn responders

**Trigger to next stage:** Prospect shows curiosity (clicks, comments, replies, DMs, visits) → enters Stage 2 (Interest & Trust Engine)

---

## 📡 Channels Used

| Channel Type | Platforms | Priority |
| --- | --- | --- |
| Short Form Content | Instagram Reels, YouTube Shorts, TikTok | 🔴 Critical |
| Long Form Content | YouTube, Blogs, Podcasts | 🔴 Critical |
| Professional Platforms | LinkedIn, X/Twitter | 🔴 Critical |
| Search | Google SEO, YouTube SEO | 🔴 Critical |
| Cold Outbound | Cold Email, LinkedIn Outreach, WhatsApp Outreach, Cold Calling | 🔴 Critical |
| Paid Reach | Meta Ads, Google Ads, YouTube Ads, Retargeting | 🟠 High |
| Community | WhatsApp Groups, Telegram, Discord, Facebook Groups | 🟠 High |
| Partnership Reach | Influencers, agencies, creators, freelancers | 🟡 Medium |
| Offline | Networking events, seminars, local business meetups | 🟢 Low |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| Educational Reels & Shorts | Authority + algorithm reach | 🔴 Critical |
| Viral content (memes/trends/hooks) | Mass attention capture | 🔴 Critical |
| Transformation/case-study posts | Trust + desire generation | 🔴 Critical |
| Cold email sequences | Direct B2B acquisition | 🔴 Critical |
| LinkedIn outreach (connect + DM) | B2B relationship acquisition | 🔴 Critical |
| SEO content (blog + YouTube) | Long-term compound traffic | 🔴 Critical |
| Founder personal branding | Human connection + authority | 🟠 High |
| Enquiry method posts | Inbound self-qualified leads | 🟠 High |
| Influencer collaborations | Audience borrowing at scale | 🟡 Medium |
| Contest & giveaway campaigns | Rapid follower + lead growth | 🟡 Medium |
| Share & earn programs | Viral growth loops | 🟡 Medium |
| WhatsApp outreach to groups | Community-based acquisition | 🟡 Medium |
| Local networking events | Offline relationship building | 🟢 Low |
| Reddit/Quora authority posting | Long-tail inbound traffic | 🟢 Low |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| B2B lead scraping | [Apollo.io](http://Apollo.io), PhantomBuster, Clay | Build targeted prospect databases |
| Email finding & validation | [Hunter.io](http://Hunter.io), Reoon, NeverBounce | Clean deliverable email lists |
| LinkedIn profile scraping | PhantomBuster, Sales Navigator | Extract decision-maker data |
| Google Maps scraping | Apify actor | Local business lead extraction |
| Competitor audience scraping | PhantomBuster, Apify | Expand into competitor followers |
| Website contact form scraping | Apify + Browserless/Playwright | Contact form outreach at scale |
| Email enrichment | Clay, Apollo enrichment | Add company size, revenue, tech stack |
| Intent signal tracking | Apollo intent data, LinkedIn signals | Find prospects actively searching |
| Audience segmentation | HubSpot tags, Google Sheets | ICP targeting by industry/location |
| Content performance data | Meta Insights API, GA4 API → n8n | Track what content drives attention |

**Master Data Flow:**

```
ICP defined → Apollo scrape → Email validated (Reoon) → Enriched (Clay) → Segmented → Loaded into outreach tool → n8n captures replies → HubSpot CRM
```

---

## 📤 Outbound Systems

| System | Tool | Daily Volume | Purpose |
| --- | --- | --- | --- |
| Cold email sequences | Instantly, Lemlist, Mautic | 30–100/day | Direct B2B acquisition |
| AI email personalization | Clay + OpenAI | Per batch | Higher reply rates |
| LinkedIn connection requests | PhantomBuster, Expandi | 15–20/day | B2B network building |
| LinkedIn DM sequences | PhantomBuster | 10–15/day | Direct conversation |
| WhatsApp broadcast outreach | WATI, WhatsApp Business API | 20–50/day | Warm market outreach |
| Email domain warmup | Instantly warmup, Lemwarm | Ongoing | Protect deliverability |
| Follow-up automation | n8n + Instantly | Per sequence | Persistence without spam |
| Contact form submissions | Apify + Playwright + n8n | 10–20/day | Website-based outreach |

**Outbound Safety Rules:**

- Never send cold email from primary domain — use secondary warmed domain
- LinkedIn: max 20 connections/day, always with personalized note
- Rotate email templates every 5 sends
- Always include unsubscribe link in cold emails
- Never contact same person twice within 30 days

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Tool | Purpose |
| --- | --- | --- | --- |
| Share & Earn program | Referral link = reward | ReferralCandy, n8n | Viral reach from existing audience |
| Ambassador system | Top engagers get exclusive access | Notion + WhatsApp | Community-powered acquisition |
| Contest engine | Tag 2 friends + share = entry | Instagram, n8n tracker | Rapid follower growth |
| Ranking leaderboard | Monthly top engagers featured | Google Sheets + n8n | Gamified participation |
| Viral hook content | Pattern-interrupt posts + CTAs | Canva + Buffer | Organic shares |
| Community invite funnels | Free group with gated value | WhatsApp/Telegram | Audience ownership |
| Enquiry method posts | "Looking for X in Y" posts | LinkedIn, Facebook Groups | Self-qualifying inbound |
| Freelancer outreach teams | Commission-based prospectors | Nivy VA network | Scalable outbound army |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Daily AI content generation | n8n + OpenAI | 7am daily schedule | Generate 5 posts per platform |
| Multi-platform scheduling | Buffer API + n8n | After content approval | Consistent posting across channels |
| Cross-platform repurposing | n8n workflow | After long-form publish | Auto-clip and reformat |
| Trend monitoring | n8n + RSS + Twitter API | Hourly | Catch viral opportunities |
| Comment keyword detection | n8n + Instagram/FB API | Real-time webhook | Auto-DM interested commenters |
| Cold email sequence trigger | n8n + Apollo API | New lead added | Auto-enroll in sequence |
| Reply detection & routing | n8n + Mautic webhook | Email reply received | Classify and route to CRM |
| Analytics aggregation | n8n + GA4 API + Meta API | Daily 9pm | Auto-report on performance |
| Budget alert system | n8n + Meta API | When spend >80% | Alert ads manager |
| Lead capture from engagement | n8n + Instagram API | Keyword comment | Capture + qualify in CRM |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Content generation | GPT-4o-mini | Target audience + topic + tone | 5 platform-specific posts | Daily content at scale |
| Email personalization | GPT-4o + Clay | Lead name, company, industry, LinkedIn bio | Personalized opening line | Higher reply rates |
| Trend analysis | GPT-4o | RSS feeds + Twitter trending | Top 3 trends to leverage today | Viral content timing |
| Audience intent detection | GPT-4o | Lead's profile + behavior signals | Hot/Warm/Cold + pain points | Outreach prioritization |
| Caption optimization | GPT-4o-mini | Draft caption + platform | Optimized caption with hooks | Algorithm performance |
| Competitor analysis | GPT-4o + Apify | Competitor social data | Content gap analysis | Strategic positioning |

**Master AI Prompt — Daily Content Generation:**

```jsx
You are a B2B content strategist for Nivy Digital — a digital marketing agency 
operating in US, UK, Canada, Australia, UAE, and India.

Generate 5 posts for today across these platforms: {{platforms}}
Target audience: {{icp_description}}
Today's theme: {{content_theme}}
Services to highlight: {{service_focus}}

Each post must:
- Start with a pattern-interrupt hook (first line stops the scroll)
- Be platform-appropriate in length and tone
- Include a soft CTA that drives DMs, comments, or profile visits
- Reference a real pain point of the target audience

Output JSON array with fields: platform, caption, hashtags, cta, content_type
No extra text. JSON only.
```

---

## 🤖 n8n Automation Code — Full Attention Engine Workflow

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 1 Attention Engine (Full)",
  "nodes": [
    {
      "parameters": {
        "rule": { "interval": [{ "field": "hours", "hoursInterval": 24 }] },
        "triggerAt": { "hour": 7, "minute": 0 }
      },
      "name": "Daily 7am Trigger",
      "type": "n8n-nodes-base.scheduleTrigger",
      "position": [100, 300]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "authentication": "genericCredentialType",
        "genericAuthType": "httpHeaderAuth",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o-mini" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Generate 5 B2B posts for Nivy Digital targeting founders in UK, US, UAE. Mix: 2 educational, 1 case study, 1 viral hook, 1 enquiry-style. Output JSON array only.\"}]" },
            { "name": "max_tokens", "value": "2000" }
          ]
        }
      },
      "name": "OpenAI - Generate Content",
      "type": "n8n-nodes-base.httpRequest",
      "position": [320, 300]
    },
    {
      "parameters": {
        "jsCode": "const response = $json.choices[0].message.content;\nconst posts = JSON.parse(response);\nreturn posts.map(p => ({ json: p }));"
      },
      "name": "Parse Posts",
      "type": "n8n-nodes-base.code",
      "position": [540, 300]
    },
    {
      "parameters": {
        "authentication": "oAuth2",
        "operation": "append",
        "documentId": "YOUR_GOOGLE_SHEET_ID",
        "sheetName": "Content Calendar",
        "dataStartRow": 2,
        "keyRow": 1,
        "dataMode": "define",
        "fieldsUi": {
          "values": [
            { "column": "Platform", "fieldValue": "={{$json.platform}}" },
            { "column": "Caption", "fieldValue": "={{$json.caption}}" },
            { "column": "Hashtags", "fieldValue": "={{$json.hashtags}}" },
            { "column": "CTA", "fieldValue": "={{$json.cta}}" },
            { "column": "Status", "fieldValue": "Pending Approval" },
            { "column": "GeneratedDate", "fieldValue": "={{$now}}" }
          ]
        }
      },
      "name": "Save to Content Calendar",
      "type": "n8n-nodes-base.googleSheets",
      "position": [760, 300]
    },
    {
      "parameters": {
        "httpMethod": "POST",
        "path": "comment-webhook"
      },
      "name": "Comment Webhook Trigger",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 600]
    },
    {
      "parameters": {
        "conditions": {
          "string": [
            { "value1": "={{$json.comment_text.toLowerCase()}}", "operation": "contains", "value2": "interested" }
          ]
        }
      },
      "name": "Contains Interest Keyword?",
      "type": "n8n-nodes-base.if",
      "position": [320, 600]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o-mini" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Someone commented: {{$json.comment_text}} on our post. Write a 2-sentence personalized DM reply that opens a conversation. Warm, professional tone. No pitch yet.\"}]" }
          ]
        }
      },
      "name": "OpenAI - Generate DM Reply",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 600]
    },
    {
      "parameters": {
        "url": "https://graph.facebook.com/v18.0/me/messages",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "recipient", "value": "={\"id\": \"{{$json.commenter_id}}\"}" },
            { "name": "message", "value": "={\"text\": \"{{$node['OpenAI - Generate DM Reply'].json.choices[0].message.content}}\"}" },
            { "name": "access_token", "value": "YOUR_PAGE_ACCESS_TOKEN" }
          ]
        }
      },
      "name": "Send Auto DM",
      "type": "n8n-nodes-base.httpRequest",
      "position": [760, 600]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "create",
        "email": "={{$json.commenter_email || ''}}",
        "firstName": "={{$json.commenter_name}}",
        "properties": {
          "source": "Stage1-Comment",
          "platform": "={{$json.platform}}",
          "lead_stage": "Attention",
          "original_comment": "={{$json.comment_text}}"
        }
      },
      "name": "Create HubSpot Lead",
      "type": "n8n-nodes-base.hubspot",
      "position": [980, 600]
    }
  ],
  "connections": {
    "Daily 7am Trigger": { "main": [[{ "node": "OpenAI - Generate Content", "type": "main", "index": 0 }]] },
    "OpenAI - Generate Content": { "main": [[{ "node": "Parse Posts", "type": "main", "index": 0 }]] },
    "Parse Posts": { "main": [[{ "node": "Save to Content Calendar", "type": "main", "index": 0 }]] },
    "Comment Webhook Trigger": { "main": [[{ "node": "Contains Interest Keyword?", "type": "main", "index": 0 }]] },
    "Contains Interest Keyword?": { "main": [[{ "node": "OpenAI - Generate DM Reply", "type": "main", "index": 0 }]] },
    "OpenAI - Generate DM Reply": { "main": [[{ "node": "Send Auto DM", "type": "main", "index": 0 }]] },
    "Send Auto DM": { "main": [[{ "node": "Create HubSpot Lead", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Monthly Reach | 100,000+ | Meta/Instagram Insights | Weekly |
| Profile Visits | 5,000+/month | Platform analytics | Weekly |
| Website Clicks from Social | 1,000+/month | Google Analytics 4 | Weekly |
| Engagement Rate | >3% | Native analytics | Weekly |
| Cold Email Reply Rate | >8% | Instantly dashboard | Daily |
| Cold Email Open Rate | >40% | Instantly / Mautic | Daily |
| LinkedIn Connection Accept Rate | >30% | PhantomBuster / Apollo | Weekly |
| Cost Per Click (Paid Ads) | <$1 | Meta Ads Manager | Daily |
| New Followers/Month | 500+ | Platform analytics | Monthly |
| Leads Generated from Stage 1 | 200+/month | HubSpot CRM | Weekly |
| Content Published per Week | 14+ posts | Content calendar | Weekly |
| Outreach Volume/Month | 2,000+ | Apollo + Instantly | Monthly |

---

## 👥 Team Responsibilities

| Role | Daily Tasks | Weekly Tasks |
| --- | --- | --- |
| Content Manager | Approve AI-generated posts, brief video team | Review analytics, plan next week's themes |
| Video Editor | Produce 3–5 Reels/Shorts per week | Upload and schedule all video content |
| Copywriter | Write cold email variants, captions | A/B test subject lines, update templates |
| Outreach Specialist (VA) | Monitor LinkedIn replies, qualify leads | Launch new Apollo sequences, update CRM |
| Paid Ads Manager | Check daily spend and performance | Optimize ad sets, test new creatives |
| SEO Specialist | Publish 1 blog post/week | Keyword research, backlink building |
| Automation Dev | Monitor n8n workflows for errors | Build new automations from backlog |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  7am — AI generates today's content (n8n auto-runs)
- [ ]  8am — Content manager reviews and approves posts
- [ ]  9am — Approved posts scheduled via Buffer
- [ ]  Check cold email inbox for replies (Instantly dashboard)
- [ ]  Check LinkedIn for new connection accepts + DM replies
- [ ]  Review HubSpot: new leads from overnight engagement
- [ ]  Respond to any hot comments (auto-DM should have fired)
- [ ]  Check paid ad spend vs. daily budget cap
- [ ]  Log outreach numbers in tracker sheet
- [ ]  Flag any content performing >2x average for repurposing

**Weekly Tasks:**

- [ ]  Monday: Pull weekly analytics from all platforms
- [ ]  Tuesday: Brief video team on next week's Reels
- [ ]  Wednesday: Review and refresh cold email templates
- [ ]  Friday: Update content calendar for following week
- [ ]  Friday: Report Stage 1 KPIs to master dashboard

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| n8n (self-hosted) | Automation backbone | Free | [n8n.io](http://n8n.io) |
| [Apollo.io](http://Apollo.io) | Lead scraping + email sequences | Free (50/mo) | [apollo.io](http://apollo.io) |
| Instantly | Cold email sending + warmup | ~$37/mo | [instantly.ai](http://instantly.ai) |
| Clay | Lead enrichment + AI personalization | Free tier | [clay.com](http://clay.com) |
| PhantomBuster | LinkedIn scraping + automation | Free tier | [phantombuster.com](http://phantombuster.com) |
| Buffer | Social scheduling | Free tier | [buffer.com](http://buffer.com) |
| Canva | Creative production | Free | [canva.com](http://canva.com) |
| [Hunter.io](http://Hunter.io) | Email finding | Free (25/mo) | [hunter.io](http://hunter.io) |
| Reoon | Email validation | ~$10/mo | [reoon.com](http://reoon.com) |
| Meta Ads Manager | Paid campaigns | Free (ad spend) | [facebook.com/ads](http://facebook.com/ads) |
| Google Analytics 4 | Web traffic tracking | Free | [analytics.google.com](http://analytics.google.com) |
| HubSpot CRM | Lead management | Free | [hubspot.com](http://hubspot.com) |
| Apify | Web scraping | Free tier | [apify.com](http://apify.com) |
| Browserless | Contact form automation | Free tier | [browserless.io](http://browserless.io) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Cold email landing in spam | High | Critical | Warm domains with Instantly (3 weeks before launch) |
| LinkedIn account restricted | Medium | High | Stay under 20 connections/day, use delays |
| Content consistency failure | High | High | Batch 2 weeks ahead, AI-generated drafts |
| Paid ad budget overspend | Medium | Medium | Daily caps + n8n budget alert workflow |
| Platform algorithm change | Medium | High | Diversify — never rely on one channel |
| Low cold email reply rates | Medium | High | A/B test subject lines weekly, refresh templates |
| Team bandwidth overload | High | Medium | Automate content gen + scheduling, VA handles outreach |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| A/B test cold email subject lines | 2 variants per campaign, track open rate | Every 2 weeks |
| Content performance audit | Pull top 10 posts → identify patterns → replicate | Monthly |
| ICP refinement | Review which leads convert → update Apollo filters | Monthly |
| Channel ROI analysis | Cost per lead per channel → cut losers, double winners | Monthly |
| Outreach template refresh | Replace lowest-performing templates | Every 3 weeks |
| Paid ad creative testing | Test 3 creatives per ad set | Every 2 weeks |

---

**➡️ Next Stage:** [💡 Stage 2 — Interest & Trust Engine](https://www.notion.so/35be5082b9d48193a696ee236609c3be)