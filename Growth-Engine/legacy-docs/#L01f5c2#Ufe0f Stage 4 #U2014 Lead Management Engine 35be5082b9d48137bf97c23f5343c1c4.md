# 🗂️ Stage 4 — Lead Management Engine

> **⚠️ SUPERSEDED — CJE 13-stage system**
> This page is part of the legacy 13-stage CJE (Customer Journey Engineering) documentation system. As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 4 OF 12 — Captured leads mean nothing without a system to organize, score, and route them. This engine ensures every lead lands in the right place at the right time — nothing falls through the cracks.**
> 

---

## 🗂️ Core Objective

> **Organize, score, segment, and route every lead to the right salesperson or sequence at the right time — with zero manual guesswork.**
> 

This stage is engineered to:

- Create a single source of truth for every lead across all channels
- Assign AI-powered scores to every contact based on intent, ICP fit, and behavior
- Route HOT leads to sales within minutes, WARM to nurture, COLD to re-engagement
- Give the sales team a clean, prioritized pipeline — not a messy inbox
- Track every lead's journey so nothing gets lost, forgotten, or duplicated

**Inputs:** All captured leads from Stage 3 — form submissions, WhatsApp inbounds, cold email replies, comment captures, booking completions

**Outputs:** Scored, segmented, tagged contacts in HubSpot — enrolled in correct sequence, assigned to correct owner, with AI-generated priority tier

**Trigger to next stage:**

- HOT (score 70+) → Stage 6 (Conversion Engine) — sales contact within 2 hours
- WARM (score 40–69) → Stage 5 (Nurturing Engine) — auto-enrolled in sequence
- COLD (score <40) → Stage 5 long-track nurture → re-evaluate at 30 days
- VIP → Founder direct call, skip all sequences

---

## 📡 Channels Used

| Channel | Purpose | Priority |
| --- | --- | --- |
| HubSpot CRM | Master lead database, pipeline, deal tracking | 🔴 Critical |
| n8n Automation | Scoring engine, routing logic, daily reports | 🔴 Critical |
| Slack / Telegram | HOT lead alerts, team notifications | 🔴 Critical |
| Airtable | Secondary tracking dashboard for ops team | 🟠 High |
| WhatsApp Business | HOT lead alerts to sales reps | 🟠 High |
| Email (internal) | Daily lead digest to sales team | 🟡 Medium |
| Google Sheets | Backup lead log, weekly reporting | 🟡 Medium |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| AI lead scoring (multi-factor) | Accurate HOT/WARM/COLD classification | 🔴 Critical |
| Segment tagging (industry/country/service) | Personalized routing and follow-up | 🔴 Critical |
| Pipeline stage automation | Auto-move leads as they take actions | 🔴 Critical |
| HOT lead instant alert system | Zero delay on high-intent prospects | 🔴 Critical |
| Dead lead archiving (90-day rule) | Keep pipeline clean and accurate | 🟠 High |
| ICP match scoring | Identify highest-value prospects | 🟠 High |
| Daily lead digest to sales team | Team always knows priority for the day | 🟠 High |
| Weekly pipeline review | Catch stuck leads, review accuracy | 🟡 Medium |
| VIP lead manual routing | High-touch for referrals and big-budget leads | 🟡 Medium |
| Re-engagement triggers | Auto-flag leads idle >30 days | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Master CRM | HubSpot (free tier) | Single source of truth for all contacts and deals |
| Lead scoring model | n8n + custom score formula | Multi-factor score: budget + timeline + source + engagement |
| Pipeline stage tracking | HubSpot deal pipelines | Visual progress of every lead from capture to close |
| Segment tags | HubSpot contact properties | Tag by: industry, country, service interest, temperature |
| Behavior event tracking | HubSpot + n8n webhooks | Log every email open, page visit, reply as a score event |
| Duplicate prevention | n8n dedup check on every entry | No double contacts, merged automatically |
| Data quality scoring | Weekly n8n audit | Flag contacts with missing required fields |
| Lead source attribution | HubSpot UTM + source field | Track ROI per acquisition channel |
| Activity timeline | HubSpot contact timeline | Full history of every interaction per lead |
| Backup log | Google Sheets | Weekly export of all active leads for ops team |

**Lead Scoring Formula:**

```jsx
Lead Score =
  Budget signal:    >$5k = 30pts | $1-5k = 15pts | Unknown = 5pts
  Timeline:         This month = 25pts | Next quarter = 15pts | Exploring = 5pts
  Company size:     >20 employees = 20pts | 5-20 = 12pts | Solo = 5pts
  Source quality:   Referral = 20pts | Inbound = 12pts | Cold outreach = 5pts
  Engagement:       Opened email = 5pts | Clicked = 10pts | Visited pricing = 20pts
  ICP match:        Perfect fit = 15pts | Partial = 8pts | Poor = 0pts

Score ≥ 70 → 🔥 HOT → Sales within 2 hours
Score 40–69 → 🟡 WARM → Nurture sequence
Score < 40 → 🟢 COLD → Long-track nurture
Score = VIP flag → ⭐ VIP → Founder direct outreach
```

---

## 📤 Outbound Systems

| System | Purpose | Tool | Trigger |
| --- | --- | --- | --- |
| HOT lead WhatsApp alert | Sales rep instant notification | n8n + WATI | Score ≥ 70 |
| HOT lead Telegram alert | Backup notification to team | n8n + Telegram Bot | Score ≥ 70 |
| HubSpot task auto-creation | Assign follow-up task to sales rep | HubSpot + n8n | HOT classification |
| Daily priority digest | Email to sales team with today's HOT/WARM list | n8n + Gmail | 8am daily |
| Stuck lead escalation | Alert manager if HOT lead not contacted in 2 hrs | n8n + Telegram | Time-based check |
| Dead lead notification | Notify manager of leads archived >90 days | n8n | Weekly |
| VIP alert | Direct WhatsApp to founder | n8n | VIP tag applied |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Referral source tracking | Tag leads who came via referral → reward referrer | Build referral incentive |
| Partner lead routing | Leads from partner agencies → special pipeline | Protect partner relationships |
| Community member upgrading | WhatsApp community member books call → auto-tag as WARM | Capture community conversions |
| Lead-to-ambassador pipeline | Leads who engage heavily → invited to ambassador program | Build brand advocates early |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Lead scoring engine | n8n + score formula | Every new lead + every behavior event | Assign and update score continuously |
| HOT lead routing | n8n + HubSpot | Score crosses 70 | Create deal + assign to sales rep |
| WARM lead enrollment | n8n + Mautic | Score 40–69 | Auto-start nurture sequence |
| COLD lead enrollment | n8n + Mautic | Score <40 | Long-track sequence + 30-day recheck |
| Daily HOT lead digest | n8n + Gmail | 8am every day | Send prioritized list to sales team |
| Pipeline stage auto-move | HubSpot workflows | Contact action triggers | Keep pipeline accurate without manual updates |
| Dead lead archiving | n8n | 90 days no activity | Move to archived list, notify manager |
| Re-engagement trigger | n8n | 30 days no score change | Move to Stage 11B Reactivation |
| Duplicate merge | n8n + HubSpot API | New contact created | Check and merge if duplicate found |
| Weekly data quality audit | n8n | Every Monday 9am | Flag missing fields, stale stages |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Multi-factor lead scoring | GPT-4o | Full lead data + behavior log | Score (0–100) + priority tier + reasoning | Accurate classification |
| ICP match analysis | GPT-4o | Lead data vs. Nivy ICP definition | Match % + fit notes + recommended service | Prioritize best-fit leads |
| Next best action recommendation | GPT-4o-mini | Lead score + stage + last interaction | Recommended next step for sales rep | Remove decision fatigue |
| Stuck lead analysis | GPT-4o | Leads stagnant >7 days | Root cause + recommended re-engagement tactic | Unblock pipeline |
| Pipeline health summary | GPT-4o-mini | Daily HubSpot pipeline data | Natural language digest for sales team | Quick decision-making |

**AI Prompt — Lead Scoring & Classification:**

```jsx
You are Nivy's lead intelligence system.

Score this lead from 0-100 and classify them.

Lead data:
- Name: {{name}}
- Company: {{company}}
- Country: {{country}}
- Service interest: {{service_interest}}
- Message: {{message}}
- Lead source: {{source}}
- Budget indicated: {{budget}}
- Timeline: {{timeline}}
- Behavior: {{behavior_log}}

Nivy's ICP: SMBs, startups, e-commerce businesses, and professional service firms in US, UK, Canada, Australia, UAE, and India. Budget $500–$10,000+/month. Decision-maker is founder or marketing director.

Score formula weight:
- Budget fit: 30%
- Timeline urgency: 25%
- ICP match: 25%
- Source quality: 20%

Output JSON only:
{
  "score": 0-100,
  "tier": "HOT|WARM|COLD|VIP|SPAM",
  "icp_match_percent": 0-100,
  "primary_pain_point": "string",
  "recommended_service": "string",
  "next_best_action": "string",
  "reasoning": "string (2 sentences)"
}
```

---

## 🤖 n8n Automation Code — Lead Scoring & Routing Engine

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 4 Lead Scoring & Routing Engine",
  "nodes": [
    {
      "parameters": {
        "rule": { "interval": [{ "field": "hours", "hoursInterval": 24 }] },
        "triggerAt": { "hour": 8, "minute": 0 }
      },
      "name": "Daily 8am Trigger",
      "type": "n8n-nodes-base.scheduleTrigger",
      "position": [100, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "getAll",
        "filters": { "hs_lead_status": "NEW" },
        "limit": 100
      },
      "name": "Get New Leads from HubSpot",
      "type": "n8n-nodes-base.hubspot",
      "position": [320, 300]
    },
    {
      "parameters": {
        "jsCode": "return $input.all().map(item => {\n  const lead = item.json;\n  const budget = parseInt(lead.budget) || 0;\n  const score =\n    (budget > 5000 ? 30 : budget > 1000 ? 15 : 5) +\n    (lead.timeline === 'this_month' ? 25 : lead.timeline === 'next_quarter' ? 15 : 5) +\n    (parseInt(lead.company_size) > 20 ? 20 : parseInt(lead.company_size) > 5 ? 12 : 5) +\n    (lead.source === 'referral' ? 20 : lead.source === 'inbound' ? 12 : 5) +\n    (parseInt(lead.email_opens) * 5 || 0) +\n    (lead.visited_pricing ? 20 : 0);\n  const tier = score >= 70 ? 'HOT' : score >= 40 ? 'WARM' : 'COLD';\n  return { json: { ...lead, score: Math.min(score, 100), tier } };\n})"
      },
      "name": "Score All Leads",
      "type": "n8n-nodes-base.code",
      "position": [540, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.id}}",
        "properties": {
          "lead_score": "={{$json.score}}",
          "hs_lead_status": "={{$json.tier}}",
          "last_scored_date": "={{$now}}"
        }
      },
      "name": "Update HubSpot Score",
      "type": "n8n-nodes-base.hubspot",
      "position": [760, 300]
    },
    {
      "parameters": {
        "conditions": {
          "string": [{ "value1": "={{$json.tier}}", "operation": "equal", "value2": "HOT" }]
        }
      },
      "name": "Is HOT?",
      "type": "n8n-nodes-base.if",
      "position": [980, 300]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "YOUR_SALES_WHATSAPP" },
            { "name": "message", "value": "🔥 HOT LEAD — ACTION NOW\nName: {{$json.firstname}} {{$json.lastname}}\nCompany: {{$json.company}}\nCountry: {{$json.country}}\nScore: {{$json.score}}/100\nService: {{$json.service_interest}}\nSource: {{$json.source}}\nHubSpot: https://app.hubspot.com/contacts/YOUR_PORTAL/contact/{{$json.id}}" }
          ]
        }
      },
      "name": "Alert Sales - HOT Lead",
      "type": "n8n-nodes-base.httpRequest",
      "position": [1200, 200]
    },
    {
      "parameters": {
        "resource": "deal",
        "operation": "create",
        "properties": {
          "dealname": "={{$json.firstname}} - {{$json.company}} - {{$json.service_interest}}",
          "pipeline": "default",
          "dealstage": "appointmentscheduled",
          "amount": "={{$json.budget || 0}}",
          "hubspot_owner_id": "YOUR_SALES_REP_OWNER_ID"
        }
      },
      "name": "Create HubSpot Deal",
      "type": "n8n-nodes-base.hubspot",
      "position": [1200, 400]
    },
    {
      "parameters": {
        "jsCode": "const hotLeads = $input.all().filter(i => i.json.tier === 'HOT');\nconst warmLeads = $input.all().filter(i => i.json.tier === 'WARM');\nconst coldLeads = $input.all().filter(i => i.json.tier === 'COLD');\nconst hotList = hotLeads.map(l => `🔥 ${l.json.firstname} | ${l.json.company} | Score: ${l.json.score}`).join('\\n');\nreturn [{ json: { hotCount: hotLeads.length, warmCount: warmLeads.length, coldCount: coldLeads.length, hotList } }];"
      },
      "name": "Build Daily Digest",
      "type": "n8n-nodes-base.code",
      "position": [1200, 600]
    },
    {
      "parameters": {
        "fromEmail": "system@nivy.com",
        "toEmail": "sales@nivy.com",
        "subject": "📊 Daily Lead Priority Digest — {{$now.format('DD MMM YYYY')}}",
        "text": "Good morning team!\n\nToday's lead breakdown:\n🔥 HOT (act now): {{$json.hotCount}}\n🟡 WARM (in nurture): {{$json.warmCount}}\n🟢 COLD (long-track): {{$json.coldCount}}\n\nHOT leads to contact today:\n{{$json.hotList}}\n\nLogin to HubSpot to start calls: https://app.hubspot.com\n\n— Nivy CRM"
      },
      "name": "Send Daily Digest Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [1420, 600]
    }
  ],
  "connections": {
    "Daily 8am Trigger": { "main": [[{ "node": "Get New Leads from HubSpot", "type": "main", "index": 0 }]] },
    "Get New Leads from HubSpot": { "main": [[{ "node": "Score All Leads", "type": "main", "index": 0 }]] },
    "Score All Leads": { "main": [[{ "node": "Update HubSpot Score", "type": "main", "index": 0 }]] },
    "Update HubSpot Score": { "main": [[{ "node": "Is HOT?", "type": "main", "index": 0 }, { "node": "Build Daily Digest", "type": "main", "index": 0 }]] },
    "Is HOT?": { "main": [[{ "node": "Alert Sales - HOT Lead", "type": "main", "index": 0 }, { "node": "Create HubSpot Deal", "type": "main", "index": 0 }]] },
    "Build Daily Digest": { "main": [[{ "node": "Send Daily Digest Email", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Lead-to-qualified rate | >40% of all captured leads | HubSpot reports | Weekly |
| HOT lead response time | <2 hours | HubSpot activity log | Daily |
| Pipeline data accuracy | >95% fields complete | Weekly audit n8n | Weekly |
| Dead lead rate | <20% of total pipeline | HubSpot | Monthly |
| Score accuracy (HOT close rate) | >50% of HOT leads close | HubSpot deal reports | Monthly |
| Leads scored per day | 100% same-day scoring | n8n logs | Daily |
| Duplicate contact rate | <3% | HubSpot | Monthly |
| Avg lead score progression | +15 pts/week for WARM | HubSpot | Weekly |
| VIP leads identified | Track all | HubSpot VIP tag | Weekly |
| Stage 4 → Stage 6 conversion | >20% of HOT leads book call | HubSpot | Monthly |

---

## 👥 Team Responsibilities

| Role | Daily Tasks | Weekly Tasks |
| --- | --- | --- |
| Sales Lead | Review HOT lead queue, contact within 2 hrs | Review pipeline accuracy, close stuck deals |
| VA (CRM) | Check for missing data fields, enrich manually | Run weekly data quality audit |
| Automation Dev | Monitor n8n scoring workflow for errors | Refine scoring formula based on close rate data |
| Sales Manager | Review daily digest, escalate uncontacted HOT leads | Pipeline review meeting with sales team |
| Founder | Review VIP leads | Approve routing changes, review weekly pipeline report |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  8am — Review daily HOT lead digest from n8n (email or Telegram)
- [ ]  Contact ALL HOT leads from last 24 hours within 2 hours
- [ ]  Check HubSpot "HOT Leads" smart list — any missed from yesterday?
- [ ]  Verify all new leads have been scored (check n8n workflow logs)
- [ ]  Check for any WARM leads hitting score 70 overnight → upgrade to HOT
- [ ]  Review HubSpot deal pipeline — any deals stuck >5 days?
- [ ]  Log all outreach attempts in HubSpot contact timeline
- [ ]  Flag any VIP leads for founder review

**Weekly Tasks:**

- [ ]  Monday: Pull full pipeline report — HOT/WARM/COLD breakdown
- [ ]  Tuesday: Review leads with no activity >7 days → reassign or re-engage
- [ ]  Wednesday: Audit data quality — missing fields, incomplete profiles
- [ ]  Thursday: Review AI scoring accuracy — are HOT leads actually closing?
- [ ]  Friday: Archive dead leads (>90 days no activity), update score formula if needed

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| HubSpot CRM | Lead database, pipeline, deal tracking | Free | [hubspot.com](http://hubspot.com) |
| n8n (self-hosted) | Scoring engine, routing, daily digest | Free | [n8n.io](http://n8n.io) |
| Airtable | Ops-level lead tracking dashboard | Free tier | [airtable.com](http://airtable.com) |
| Telegram Bot | HOT lead alerts to sales team | Free | [telegram.org](http://telegram.org) |
| WATI / WhatsApp API | HOT lead WhatsApp alert to reps | Free tier | [wati.io](http://wati.io) |
| Google Sheets | Backup lead export, reporting | Free | [sheets.google.com](http://sheets.google.com) |
| OpenAI API | AI lead scoring and ICP match | Pay per use | [openai.com](http://openai.com) |
| [Apollo.io](http://Apollo.io) | Enrichment on lead entry | Free (50/mo) | [apollo.io](http://apollo.io) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| HOT leads not contacted in time | High | Critical | Auto-escalation Telegram alert after 2 hrs |
| Incorrect lead scoring | Medium | High | Review formula monthly against actual close rate |
| CRM data quality degradation | High | High | Mandatory fields + weekly automated audit |
| Leads falling between stages | Medium | High | Weekly "no stage" HubSpot report |
| Sales team ignoring digest | Medium | High | One-click HubSpot link in digest + Telegram backup |
| Duplicate contacts corrupting scores | Low | Medium | n8n dedup on every capture event |
| Score model going stale | Medium | Medium | Quarterly recalibration against closed deal data |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Score formula calibration | Compare HOT lead score vs. actual close rate → adjust weights | Monthly |
| Pipeline velocity analysis | Track avg days per stage → find bottleneck | Monthly |
| Response time audit | Measure HOT lead contact time → tighten SLA | Weekly |
| ICP definition review | Update ideal customer criteria based on best-performing clients | Quarterly |
| AI prompt refinement | Review misclassified leads → update scoring prompt | Monthly |
| Dead lead reactivation batch | Export 90-day dead leads → run reactivation campaign | Monthly |

---

**⬅️ Previous Stage:** [📥 Stage 3 — Lead Capture Engine](https://www.notion.so/35be5082b9d4814282a4e74c4b617ff6)

**➡️ Next Stage:** [💌 Stage 5 — Nurturing Engine](https://www.notion.so/35be5082b9d4813fa004e1de927f2042)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Scoring uses enriched CRM data from this layer |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Lead scoring, ICP match, and daily digest AI prompts |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Stage 4 KPIs feed the master scorecard |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Objections flagged in pipeline route here |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Full HOT/WARM/COLD routing logic mapped here |