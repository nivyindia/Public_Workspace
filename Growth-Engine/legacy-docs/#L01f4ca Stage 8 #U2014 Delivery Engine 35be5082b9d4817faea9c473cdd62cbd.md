# 📊 Stage 8 — Delivery Engine

> **⚠️ SUPERSEDED — CJE 13-stage system**
> This page is part of the legacy 13-stage CJE (Customer Journey Engineering) documentation system. As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 8 OF 12 — This is where Nivy's reputation is built or broken. World-class delivery creates trust, loyalty, referrals, and upsells. Average delivery creates churn.**
> 

---

## 📊 Core Objective

> **Deliver measurable transformation for every client — on time, with visible proof — so they feel the ROI, trust Nivy completely, and become long-term partners and advocates.**
> 

This stage is engineered to:

- Execute all service deliverables to agreed KPIs and timelines
- Maintain a real-time communication rhythm that keeps clients confident and informed
- Use AI to generate reports, detect performance issues, and recommend optimizations proactively
- Surface upsell opportunities naturally through delivery excellence
- Create the documented proof (results data) that feeds Stage 1 social proof and Stage 2 case studies
- Alert the team immediately when any client's metrics are underperforming

**Inputs:** Fully onboarded client from Stage 7 — questionnaire complete, access received, kickoff call done, project plan live in Notion

**Outputs:** Measurable client results against agreed KPIs, monthly AI-generated reports delivered, satisfied clients ready for Stage 9 (Retention), and flagged upsell opportunities routed to Stage 10

**Trigger to next stage:**

- Month 1 complete with results delivered → Stage 9 (Retention Engine) activated
- Client KPIs consistently exceeded for 2 months → Stage 10 (Expansion Engine) flagged
- Client KPIs underperforming for 2 weeks → immediate review + remediation protocol

---

## 📡 Channels Used

| Channel | Purpose | Priority |
| --- | --- | --- |
| Notion client portal | Live project dashboard — tasks, status, KPIs | 🔴 Critical |
| Email (reports) | Formal bi-weekly / monthly performance reports | 🔴 Critical |
| WhatsApp | Weekly personal update, relationship maintenance | 🔴 Critical |
| Zoom / Google Meet | Monthly strategy review calls | 🔴 Critical |
| Google Analytics / GA4 | Web performance data for reports | 🔴 Critical |
| Meta Ads Manager | Ad performance data | 🔴 Critical |
| Slack (internal) | Daily team coordination | 🟠 High |
| Telegram (internal) | Urgent delivery alerts | 🟠 High |
| Google Data Studio / Looker | Live client dashboards | 🟠 High |
| Loom | Async video updates for clients who prefer it | 🟡 Medium |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| Weekly WhatsApp client update | Maintain relationship and surface concerns early | 🔴 Critical |
| Bi-weekly AI-generated performance report | Professional, data-driven, on-time reporting | 🔴 Critical |
| Monthly strategy review call | Deep dive — what's working, what to optimize | 🔴 Critical |
| Internal weekly KPI check | Catch underperformance before client notices | 🔴 Critical |
| Proactive optimization recommendations | Show clients Nivy is always improving their account | 🔴 Critical |
| KPI alert system | Automated flag when metrics drop below threshold | 🟠 High |
| Case study development (monthly) | Turn results into social proof for Stage 1 | 🟠 High |
| Client satisfaction pulse check (bi-weekly) | CSAT touchpoint before issues escalate | 🟠 High |
| Upsell opportunity flagging | Identify natural expansion points from delivery data | 🟡 Medium |
| Client dashboard (live, self-serve) | Give clients 24/7 visibility into their own results | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Active client tracker | Airtable / Notion database | All clients: status, KPIs, AM, renewal date, CSAT |
| Performance data aggregation | n8n + GA4 API + Meta API | Auto-pull metrics weekly for all clients |
| Report database | Google Drive / Notion | Store all delivered reports by client and month |
| KPI alert thresholds | n8n conditional logic | Define floor for each metric — alert below floor |
| Task management | Notion / ClickUp | All deliverable tasks tracked with owners and deadlines |
| Client CSAT history | HubSpot custom fields | Track satisfaction score evolution per client |
| Results library (for case studies) | Notion | Archive of all measurable client wins |
| Internal delivery QC log | Notion | Quality review checklist per deliverable |

**Delivery Operating Rhythm:**

```jsx
DAILY:
- Team executes tasks (campaigns, content, VA work, etc.)
- Team lead quality checks before delivery
- Any urgent issues escalated in Telegram

WEEKLY:
- AM sends WhatsApp update to each client (key win from the week)
- Internal KPI check: pull metrics, flag any below threshold
- Delivery standup: what's on track, what's at risk

BI-WEEKLY:
- AI-generated performance report delivered to client by email
- AM reviews report before sending (2-minute check)

MONTHLY:
- Strategy review call with client (30–45 mins)
- Deep KPI analysis and optimization recommendations
- CSAT pulse survey
- Case study candidate identified from best performer

QUARTERLY:
- Full performance audit — all KPIs vs. contract promises
- Contract renewal conversation initiated (60 days before expiry)
```

---

## 📤 Outbound Systems

| System | Schedule | Tool | Purpose |
| --- | --- | --- | --- |
| Weekly WhatsApp update to client | Every Friday | WATI + n8n | Relationship maintenance + proactive communication |
| Bi-weekly performance report | Every 2nd Monday | n8n + Gmail | Formal, data-driven accountability |
| KPI underperformance alert to team | When metric drops <threshold | n8n + Telegram | Internal response before client notices |
| Monthly review call scheduling | 25th of each month | [Cal.com](http://Cal.com)  • n8n | Auto-schedule review before month end |
| CSAT survey | 15th of each month | n8n + Tally | Ongoing satisfaction tracking |
| Upsell opportunity alert to AM | When trigger conditions met | n8n | Route to Stage 10 process |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Case study development pipeline | AM asks permission at Month 2 review | Build social proof for Stage 1 and Stage 2 |
| Testimonial capture | After positive CSAT → send testimonial request | Fuel trust content across all channels |
| Client referral seeding | Monthly report includes referral program reminder | Passive referral generation from happy clients |
| Client LinkedIn showcase | Feature client wins on Nivy LinkedIn (with permission) | Strengthen client relationship + get visibility |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Weekly metrics pull | n8n + GA4 + Meta API | Every Monday 7am | Pull performance data for all active clients |
| KPI threshold alert | n8n conditional logic | Metric drops below floor value | Alert AM + team lead before client notices |
| AI report generation | n8n + OpenAI | Every 2nd Monday 8am | Generate report for each active client |
| Report delivery | n8n + Gmail | After AM approves | Send report to client automatically |
| WhatsApp weekly update | n8n + WATI | Every Friday 10am | Personalized update per client |
| Monthly review scheduling | n8n + [Cal.com](http://Cal.com) | 25th of each month | Send booking link to client |
| CSAT survey trigger | n8n + Tally | 15th of each month | Send pulse survey to all active clients |
| Testimonial request | n8n + Gmail | CSAT score ≥9 | Auto-send testimonial request form |
| Upsell flag | n8n | KPIs exceeded 2 months + CSAT ≥8 | Alert AM to initiate Stage 10 conversation |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Weekly report generator | GPT-4o | Client name + service + metrics data + previous context | Professional 400-word performance summary | Consistent, fast, personalized reports |
| Performance commentary | GPT-4o-mini | This week's data vs. last week | Trend commentary: up/down, why, what to do | Deeper insight in reports |
| Optimization recommendation engine | GPT-4o | 30 days of performance data | 3 specific optimization recommendations | Proactive value delivery |
| KPI underperformance diagnosis | GPT-4o | Underperforming metric + context | Root cause hypothesis + recovery steps | Fast internal response |
| Upsell opportunity detector | GPT-4o | Client KPIs + current services + budget | Best additional service to recommend + timing | Natural expansion opportunities |
| Client communication tone analyzer | GPT-4o-mini | Recent WhatsApp/email from client | Sentiment analysis + recommended AM response | Early churn detection |

**AI Prompt — Weekly Client Report Generator:**

```jsx
You are writing a professional performance report for Nivy Digital's client.

Client: {{client_name}}
Company: {{company}}
Service: {{service_package}}
Reporting period: {{period}}
Account manager: {{am_name}}

Performance data this period:
{{metrics_data}}

Previous period comparison:
{{previous_metrics}}

Write a professional bi-weekly performance report with:
1. Executive Summary (2-3 sentences — highlight the week's biggest win)
2. Performance Breakdown (data table + brief commentary per metric)
3. What's Working (2 bullet points)
4. What We're Optimizing (1-2 items — honest but confident)
5. Next 2 Weeks Plan (3 specific actions Nivy will take)
6. A note from your AM (warm, personal, 2 sentences)

Tone: Professional, data-driven, optimistic but honest.
Length: 350-450 words.
Output: formatted report content only. No extra text.
```

---

## 🤖 n8n Automation Code — Weekly Report + KPI Alert System

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 8 Delivery Engine (Reports + Alerts)",
  "nodes": [
    {
      "parameters": {
        "rule": { "interval": [{ "field": "weeks", "weeksInterval": 1, "triggerAtDay": [1] }] },
        "triggerAt": { "hour": 7, "minute": 0 }
      },
      "name": "Every Monday 7am",
      "type": "n8n-nodes-base.scheduleTrigger",
      "position": [100, 300]
    },
    {
      "parameters": {
        "operation": "getAll",
        "base": "YOUR_AIRTABLE_BASE_ID",
        "table": "Active Clients",
        "filterByFormula": "{Status}='Active'"
      },
      "name": "Get All Active Clients",
      "type": "n8n-nodes-base.airtable",
      "position": [320, 300]
    },
    {
      "parameters": {
        "url": "https://analyticsdata.googleapis.com/v1beta/properties/YOUR_GA4_PROPERTY:runReport",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "dateRanges", "value": "[{\"startDate\":\"7daysAgo\",\"endDate\":\"today\"}]" },
            { "name": "metrics", "value": "[{\"name\":\"sessions\"},{\"name\":\"conversions\"},{\"name\":\"totalUsers\"}]" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_GA4_TOKEN" }]
        }
      },
      "name": "Pull GA4 Metrics",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 200]
    },
    {
      "parameters": {
        "url": "https://graph.facebook.com/v18.0/act_YOUR_AD_ACCOUNT_ID/insights",
        "method": "GET",
        "queryParametersUi": {
          "parameter": [
            { "name": "fields", "value": "spend,impressions,clicks,cpc,ctr,actions" },
            { "name": "date_preset", "value": "last_7d" },
            { "name": "access_token", "value": "YOUR_META_ACCESS_TOKEN" }
          ]
        }
      },
      "name": "Pull Meta Ad Metrics",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 400]
    },
    {
      "parameters": {
        "jsCode": "const ga4 = $node['Pull GA4 Metrics'].json;\nconst meta = $node['Pull Meta Ad Metrics'].json.data?.[0] || {};\nconst client = $json;\nconst metricsBelow = [];\nif (parseFloat(meta.ctr) < 0.01) metricsBelow.push('Meta CTR below 1%');\nif (parseFloat(meta.cpc) > 2) metricsBelow.push('Meta CPC above $2');\nreturn [{ json: { ...client, sessions: ga4?.rows?.[0]?.metricValues?.[0]?.value, spend: meta.spend, clicks: meta.clicks, ctr: meta.ctr, cpc: meta.cpc, alerts: metricsBelow } }];"
      },
      "name": "Merge & Check KPIs",
      "type": "n8n-nodes-base.code",
      "position": [760, 300]
    },
    {
      "parameters": {
        "conditions": {
          "number": [{ "value1": "={{$json.alerts.length}}", "operation": "larger", "value2": 0 }]
        }
      },
      "name": "Any KPI Alerts?",
      "type": "n8n-nodes-base.if",
      "position": [980, 300]
    },
    {
      "parameters": {
        "chatId": "YOUR_DELIVERY_TEAM_TELEGRAM",
        "text": "⚠️ KPI ALERT — {{$json.ClientName}}\n\nIssues detected:\n{{$json.alerts}}\n\nMetrics:\nGA4 Sessions: {{$json.sessions}}\nMeta Spend: ${{$json.spend}}\nCTR: {{$json.ctr}}\nCPC: ${{$json.cpc}}\n\nPlease review and take action before the client notices."
      },
      "name": "Send KPI Alert to Team",
      "type": "n8n-nodes-base.telegram",
      "position": [1200, 200]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Write a professional bi-weekly performance report for {{$json.ClientName}} ({{$json.Industry}}). Service: {{$json.Service}}. Metrics: Sessions: {{$json.sessions}}, Meta Spend: ${{$json.spend}}, CTR: {{$json.ctr}}, CPC: ${{$json.cpc}}. Tone: professional, optimistic but honest. 400 words. Include: executive summary, what's working, what we're optimizing, next 2 weeks plan.\"}]" },
            { "name": "max_tokens", "value": "1000" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_OPENAI_KEY" }]
        }
      },
      "name": "AI - Generate Report",
      "type": "n8n-nodes-base.httpRequest",
      "position": [1200, 400]
    },
    {
      "parameters": {
        "fromEmail": "reports@nivy.com",
        "toEmail": "={{$json.ClientEmail}}",
        "subject": "📊 Your Nivy Performance Report — {{$now.format('MMM D, YYYY')}}",
        "text": "={{$node['AI - Generate Report'].json.choices[0].message.content}}\n\nFull live dashboard: {{$json.DashboardLink}}\n\nQuestions? Reply to this email or WhatsApp us anytime.\n\n— {{$json.AccountManager}}, Nivy"
      },
      "name": "Send Report to Client",
      "type": "n8n-nodes-base.emailSend",
      "position": [1420, 400]
    }
  ],
  "connections": {
    "Every Monday 7am": { "main": [[{ "node": "Get All Active Clients", "type": "main", "index": 0 }]] },
    "Get All Active Clients": { "main": [[{ "node": "Pull GA4 Metrics", "type": "main", "index": 0 }, { "node": "Pull Meta Ad Metrics", "type": "main", "index": 0 }]] },
    "Pull Meta Ad Metrics": { "main": [[{ "node": "Merge & Check KPIs", "type": "main", "index": 0 }]] },
    "Merge & Check KPIs": { "main": [[{ "node": "Any KPI Alerts?", "type": "main", "index": 0 }]] },
    "Any KPI Alerts?": { "main": [[{ "node": "Send KPI Alert to Team", "type": "main", "index": 0 }], [{ "node": "AI - Generate Report", "type": "main", "index": 0 }]] },
    "AI - Generate Report": { "main": [[{ "node": "Send Report to Client", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Client retention rate | >85% month-on-month | HubSpot | Monthly |
| Report delivery rate (on time) | 100% | Airtable / Notion | Bi-weekly |
| Client CSAT score | >8.5/10 | Tally monthly survey | Monthly |
| Client KPI improvement (their metrics) | >20% QoQ | Analytics dashboards | Quarterly |
| Contract renewal rate | >75% | HubSpot | Monthly |
| Average delivery quality score (internal QC) | >9/10 | Notion QC checklist | Per deliverable |
| Time to detect underperformance | <48hrs from drop | n8n alert logs | Weekly |
| Upsell opportunities identified | 2+ per 10 active clients/month | HubSpot | Monthly |
| Active clients per account manager | <8 (quality threshold) | HubSpot | Monthly |
| Monthly recurring revenue (MRR) | Track vs. target | Stripe / Razorpay | Monthly |

---

## 👥 Team Responsibilities

| Role | Daily Tasks | Weekly Tasks |
| --- | --- | --- |
| Account Manager | Monitor client communications, flag concerns | Send WhatsApp update, deliver report, schedule review call |
| Team Lead (service) | Quality check all deliverables before submission | Internal KPI review, brief team on optimization focus |
| Delivery Specialist | Execute campaigns, content, VA tasks | Report metrics to AM, flag any execution blockers |
| Automation Dev | Monitor n8n delivery workflows | Build new reporting automations, fix API errors |
| Operations Manager | Oversee all client dashboards, escalate issues | Weekly delivery health check across all accounts |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  Check Telegram for any KPI alerts from overnight n8n runs
- [ ]  Review task board (Notion/ClickUp) — any overdue deliverables?
- [ ]  Quality check any deliverables going out today
- [ ]  Respond to any client WhatsApp or email within 4 hours
- [ ]  Log any client feedback or issues in HubSpot

**Weekly Tasks:**

- [ ]  Monday: Pull all client metrics — any underperformance alerts?
- [ ]  Tuesday: Internal delivery standup — what's on track, what's at risk?
- [ ]  Friday: Send WhatsApp update to every active client (AM responsibility)
- [ ]  Friday: Flag any upsell opportunities for Stage 10 review

**Monthly Tasks:**

- [ ]  10th: Send CSAT survey to all active clients
- [ ]  15th: Review renewal pipeline — who renews in next 60 days?
- [ ]  20th: Send monthly report to all clients
- [ ]  25th: Schedule monthly review calls for all clients

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| Notion | Client portals, task management, QC checklists | Free | [notion.so](http://notion.so) |
| Airtable | Active client tracker + ops dashboard | Free tier | [airtable.com](http://airtable.com) |
| n8n (self-hosted) | Report generation, KPI alerts, scheduling | Free | [n8n.io](http://n8n.io) |
| Google Analytics 4 | Client web performance data | Free | [analytics.google.com](http://analytics.google.com) |
| Meta Ads Manager | Client ad performance data | Free | [facebook.com/ads](http://facebook.com/ads) |
| Google Looker Studio | Live client dashboard creation | Free | [lookerstudio.google.com](http://lookerstudio.google.com) |
| OpenAI API | Report generation + optimization recommendations | Pay per use | [openai.com](http://openai.com) |
| WATI | Client WhatsApp weekly updates | Free tier | [wati.io](http://wati.io) |
| Zoom | Monthly strategy review calls | Free | [zoom.us](http://zoom.us) |
| HubSpot | Client CSAT tracking, renewal tracking | Free | [hubspot.com](http://hubspot.com) |
| ClickUp | Delivery task management (alternative to Notion) | Free tier | [clickup.com](http://clickup.com) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Late report delivery | Medium | High | n8n auto-generates — AM only needs to review, not write |
| Client KPIs underperforming silently | Medium | Critical | Automated KPI threshold alerts catch it in <48hrs |
| Client dissatisfaction building unnoticed | Medium | Critical | Monthly CSAT + weekly WhatsApp catches it early |
| AM capacity overload (>8 clients) | High | High | Hard cap at 8 clients per AM, trigger hire if exceeded |
| Campaign underperformance going unaddressed | Medium | High | Internal KPI review every week + team lead escalation |
| Quality inconsistency between deliverables | Medium | High | QC checklist mandatory before all client-facing work |
| Renewal missed / client lapses | Medium | High | 60-day renewal radar in HubSpot + AM proactive call |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Report quality audit | AM reviews last 5 reports — are they improving client trust? | Monthly |
| KPI alert calibration | Review threshold sensitivity — too many or too few alerts? | Monthly |
| Client satisfaction driver analysis | CSAT + NPS data → what drives high/low scores? | Quarterly |
| Delivery process speed audit | Track time-to-complete per deliverable type → find slowdowns | Monthly |
| Case study harvest | Identify best-performing client results → build into Stage 1 content | Monthly |
| AM performance review | Close rate of upsells, CSAT per AM, renewal rate | Monthly |

---

**⬅️ Previous Stage:** [📦 Stage 7 — Onboarding Engine](https://www.notion.so/35be5082b9d481c6b7adda695cb644e2)

**➡️ Next Stage:** [🔄 Stage 9 — Retention Engine](https://www.notion.so/35be5082b9d4813e9c0de1d8300f198f)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | GA4 + Meta API data pulled here for all client reports |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Report generator, performance analyst, and KPI alert AI |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Client CSAT, retention, and delivery KPIs tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Client complaints during delivery handled here |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Delivery feeds back into referral and ecosystem stages |