# 🔄 Stage 9 — Retention Engine

> **⚠️ SUPERSEDED — CJE 13-stage system**
> This page is part of the legacy 13-stage CJE (Customer Journey Engineering) documentation system. As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

## 🔄 Core Objective

> **Convert satisfied clients into long-term ecosystem members and recurring revenue.**
> 

Retention is 5x cheaper than acquisition. This stage builds the flywheel.

---

## 📡 Channels Used

| Channel | Purpose |
| --- | --- |
| WhatsApp | VIP personal touch |
| Private community (Discord/Telegram) | Ecosystem belonging |
| Email | Renewal campaigns + value updates |
| Events & webinars | Exclusive client access |
| Slack | Ongoing support |

---

## 🧠 Retention Methods

| Method | Frequency | Purpose |
| --- | --- | --- |
| VIP WhatsApp group | Ongoing | Exclusivity + relationship |
| Monthly strategy consulting | Monthly | Extra value |
| Client spotlight features | Quarterly | Recognition + referral trigger |
| Exclusive webinars | Monthly | Education + loyalty |
| Appreciation gifts/messages | Quarterly | Emotional loyalty |
| Renewal incentives | 30 days before expiry | Reduce churn |
| Community networking opportunities | Monthly | Added value |

---

## 🤖 n8n Automation Code — Renewal Reminder System

```json
{
  "name": "Nivy - Client Renewal Reminder",
  "nodes": [
    {
      "parameters": {
        "rule": { "interval": [{ "field": "hours", "hoursInterval": 24 }] }
      },
      "name": "Daily Check",
      "type": "n8n-nodes-base.scheduleTrigger",
      "position": [240, 300]
    },
    {
      "parameters": {
        "operation": "getAll",
        "base": "YOUR_AIRTABLE_BASE",
        "table": "Clients",
        "filterByFormula": "AND({Status}='Active', DATETIME_DIFF({ContractEndDate}, TODAY(), 'days') = 30)"
      },
      "name": "Clients Expiring in 30 Days",
      "type": "n8n-nodes-base.airtable",
      "position": [460, 300]
    },
    {
      "parameters": {
        "fromEmail": "growth@nivy.com",
        "toEmail": "={{$json.ClientEmail}}",
        "subject": "🔔 Your Nivy contract renews soon — let's keep your growth going!",
        "html": "<h2>Hi {{$json.ClientName}}!</h2><p>Your current plan with Nivy renews in <strong>30 days</strong>.</p><p>Here's what we've achieved together:</p><ul><li>✅ {{$json.LeadsGenerated}} leads generated</li><li>✅ {{$json.ROI}}% ROI improvement</li><li>✅ {{$json.CampaignsRun}} campaigns delivered</li></ul><p>Renew now and lock in your current rate. We're also offering <strong>a free strategy upgrade</strong> for early renewals!</p><a href='YOUR_RENEWAL_LINK'>Renew My Plan</a>"
      },
      "name": "Send Renewal Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [680, 200]
    },
    {
      "parameters": {
        "chatId": "YOUR_ACCOUNT_MGMT_TELEGRAM",
        "text": "🔔 RENEWAL ALERT: {{$json.ClientName}} contract expires in 30 days.\n\nEmail: {{$json.ClientEmail}}\nPackage: {{$json.Package}}\nValue: ${{$json.ContractValue}}\n\nSchedule a retention call NOW!"
      },
      "name": "Alert Account Manager",
      "type": "n8n-nodes-base.telegram",
      "position": [680, 400]
    }
  ],
  "connections": {
    "Daily Check": { "main": [[{ "node": "Clients Expiring in 30 Days", "type": "main", "index": 0 }]] },
    "Clients Expiring in 30 Days": {
      "main": [
        [{ "node": "Send Renewal Email", "type": "main", "index": 0 }],
        [{ "node": "Alert Account Manager", "type": "main", "index": 0 }]
      ]
    }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Tool |
| --- | --- | --- |
| Monthly churn rate | <5% | HubSpot |
| Renewal rate | >75% | Airtable |
| Client LTV (lifetime value) | Growing QoQ | HubSpot |
| Community participation rate | >60% of clients | Discord/Telegram |
| CSAT score | >9/10 | Monthly survey |

---

## ⚠️ Risks & Bottlenecks

| Risk | Mitigation |
| --- | --- |
| Silent churn (no warning) | Monthly CSAT surveys |
| Renewal price resistance | Show ROI clearly before renewal |
| Client relationship going cold | Quarterly appreciation touchpoints |
| Community low engagement | Post weekly value content in group |

---

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Client retention tracker | Airtable / Notion | Status, renewal date, CSAT history, LTV per client |
| CSAT score history | HubSpot custom fields | Track satisfaction trends over full client lifespan |
| Community engagement log | Discord / Telegram + Notion | Track which clients are active, dormant, or disengaged |
| Renewal pipeline | HubSpot deals | 90-day rolling view of all upcoming contract renewals |
| Churn risk register | Notion | Flag clients with declining CSAT or reduced engagement |
| LTV and MRR tracking | Stripe / Razorpay + HubSpot | Revenue per client, growth rate, churn impact |
| Webinar + event attendance | Notion | Track which clients attend exclusive events |
| Appreciation gift log | Notion | Who received what, when, and their response |

---

## 📤 Outbound Systems

| System | Schedule | Tool | Purpose |
| --- | --- | --- | --- |
| Monthly strategy consulting call | Monthly | [Cal.com](http://Cal.com)  • n8n | Scheduled before 20th of each month |
| VIP WhatsApp group update | Weekly | WATI | Exclusive content, tips, Nivy news |
| Renewal conversation email + call | 60 days + 30 days before expiry | n8n + Gmail | Multi-touch renewal sequence |
| Quarterly appreciation message | Every 3 months | n8n + Gmail/WhatsApp | Gratitude + relationship maintenance |
| Monthly exclusive webinar invite | Monthly | n8n + Email | Invite active clients to exclusive sessions |
| CSAT survey | Monthly (15th) | n8n + Tally | Ongoing satisfaction pulse |
| Client spotlight feature | Quarterly | Manual + LinkedIn | Recognition that deepens loyalty |
| Community digest / newsletter | Weekly | Notion + Email | VIP client-only content drops |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| VIP private community (WhatsApp/Discord) | Invite all active clients at Month 1 | Belonging, exclusivity, peer networking |
| Client spotlight on LinkedIn | Feature a client's success every month | Recognition + referral trigger + Nivy visibility |
| Exclusive expert webinars | Monthly for clients only | Additional perceived value beyond the retainer |
| Client referral nudge in monthly report | Include referral program reminder every report | Passive referral generation from happy clients |
| Peer introduction (client ↔ client) | AM facilitates intros for compatible clients | Creates ecosystem loyalty, hard to leave |
| Anniversary milestone celebration | 6-month and 12-month Nivy anniversary message | Emotional retention touchpoint |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Renewal radar — 60 day flag | n8n + HubSpot | 60 days before contract end | Alert AM to begin retention conversation |
| Renewal radar — 30 day email + WA | n8n + Gmail + WATI | 30 days before expiry | Send automated renewal incentive message |
| Monthly CSAT survey dispatch | n8n + Tally | 15th of each month | Pulse check all active clients |
| Low CSAT alert to AM | n8n conditional | CSAT ≤7 | Immediate flag for personal intervention |
| Quarterly appreciation trigger | n8n scheduler | Every 3 months per client join date | Send appreciation message |
| Webinar invite dispatch | n8n + Gmail | 7 days before each webinar | Auto-invite all active clients |
| Community engagement health check | n8n + Telegram/Discord API | Weekly | Flag dormant clients for AM re-engagement |
| LTV milestone celebration | n8n | Client crosses £5k / £10k / £25k LTV | Trigger personal AM message |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Churn risk predictor | GPT-4o | CSAT trend + engagement + delivery data | Churn risk score (Low/Medium/High) + recommended action | Catch at-risk clients early |
| Retention conversation coach | GPT-4o | Client profile + renewal objection type | Tailored talking points for AM to use in renewal call | Improve renewal conversation quality |
| Appreciation message generator | GPT-4o-mini | Client name + tenure + key wins | Warm, personal appreciation message | Scale personal touch |
| Renewal incentive optimizer | GPT-4o | Client LTV + package + history | Best renewal offer to make (discount vs. bonus service vs. upgrade) | Maximize renewal rate |
| Community content generator | GPT-4o | Trending topics + client industries | Weekly VIP community content post | Keep community engaged |

**AI Prompt — Churn Risk Analysis:**

```
You are a client success analyst for Nivy Digital, a digital marketing agency.

Client: {{client_name}}
Tenure: {{months}} months
Current CSAT: {{csat_score}}/10 (last 3 months: {{csat_trend}})
Last WhatsApp response time: {{last_response}}
Community activity: {{community_status}}
KPI performance: {{kpi_status}}
Last delivery issue: {{last_issue}}

Analyze the churn risk for this client and return:
1. Churn Risk Level: LOW / MEDIUM / HIGH
2. Primary risk factor (1 sentence)
3. Recommended action for the Account Manager (2-3 sentences)
4. Suggested message to send this client in the next 48 hours (WhatsApp tone, warm and personal)

Output only the 4 items above. No extra text.
```

---

## 👥 Team Responsibilities

| Role | Weekly Tasks | Monthly Tasks |
| --- | --- | --- |
| Account Manager | Send VIP WhatsApp update, monitor CSAT responses, flag at-risk clients | Lead renewal conversations, conduct strategy consulting call, initiate spotlight |
| Operations Manager | Audit renewal pipeline, ensure no renewals missed | Review churn rate, LTV trends, CSAT averages across all accounts |
| Community Manager | Post weekly content in VIP group, engage client questions | Plan and host monthly exclusive webinar |
| Automation Dev | Monitor renewal and CSAT n8n workflows | Refine churn risk model, add new retention triggers |
| CEO / Founder | Attend key client renewal calls (high-value accounts) | Review retention metrics, approve renewal incentive offers |

---

## 📋 SOP — Retention Execution Checklist

**Weekly:**

- [ ]  Send VIP WhatsApp group content update (Community Manager)
- [ ]  AM reviews all client CSAT scores — any below 7 this week?
- [ ]  Check community engagement — any dormant clients to re-engage?
- [ ]  Scan renewal radar — any contracts expiring in next 60 days?

**Monthly (by date):**

- [ ]  10th: Identify this month's client spotlight candidate
- [ ]  12th: Send spotlight feature (LinkedIn + personal message to client)
- [ ]  15th: Dispatch CSAT survey to all active clients
- [ ]  18th: Review CSAT results — flag any scores ≤7 for AM action
- [ ]  20th: Send exclusive webinar invite to all clients
- [ ]  25th: Run churn risk AI analysis on all active clients
- [ ]  28th: Brief AM team on any high-risk accounts for next month

**Renewal Sequence:**

- [ ]  60 days before expiry: AM books retention call, review client LTV and wins
- [ ]  45 days: Send ROI summary email (automated + AM personalizes)
- [ ]  30 days: Automated renewal email with incentive offer
- [ ]  30 days: AM sends personal WhatsApp renewal message
- [ ]  14 days: AM calls client directly if not renewed
- [ ]  7 days: Final retention offer / escalation to founder if high-value

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| HubSpot | Renewal pipeline, CSAT tracking, LTV history | Free | [hubspot.com](http://hubspot.com) |
| Airtable | Active client tracker + retention ops | Free tier | [airtable.com](http://airtable.com) |
| n8n (self-hosted) | Renewal automation, CSAT dispatch, churn alerts | Free | [n8n.io](http://n8n.io) |
| WATI | VIP WhatsApp client group updates | Free tier | [wati.io](http://wati.io) |
| Tally | Monthly CSAT surveys | Free | [tally.so](http://tally.so) |
| Discord / Telegram | VIP private client community | Free | [discord.com](http://discord.com) |
| [Cal.com](http://Cal.com) | Strategy consulting call scheduling | Free | [cal.com](http://cal.com) |
| OpenAI API | Churn prediction, appreciation messages, retention coaching | Pay per use | [openai.com](http://openai.com) |
| Zoom | Exclusive monthly webinars + strategy calls | Free | [zoom.us](http://zoom.us) |
| Notion | Churn risk register, event log, gift tracker | Free | [notion.so](http://notion.so) |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Renewal rate analysis | Track won vs. lost renewals — what did churned clients have in common? | Monthly |
| CSAT driver audit | What correlates with high vs. low CSAT? (speed, reporting, results?) | Quarterly |
| Community engagement audit | Which content drives most client responses? | Monthly |
| Retention offer A/B test | Test discount vs. bonus service vs. upgrade as renewal incentive | Quarterly |
| Churn post-mortem | Interview every lost client — what could have prevented it? | Per churn event |
| LTV growth tracking | Is average client tenure increasing? Which AM retains best? | Monthly |

---

**➡️ Next Stage:** [📈 Stage 10 — Expansion Engine](https://www.notion.so/35be5082b9d4817a8fb6fa9301e6064a)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Client LTV and renewal data tracked in CRM |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Churn risk detector, renewal writer, appreciation generator |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Churn rate, renewal rate, and CSAT tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Renewal objections handled with this library |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Client lifecycle post-close mapped in full funnel here |