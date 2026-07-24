# 📈 Stage 10 — Expansion Engine

> **⚠️ SUPERSEDED — CJE 13-stage system**
> This page is part of the legacy 13-stage CJE (Customer Journey Engineering) documentation system. As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

## 📈 Core Objective

> **Increase revenue per client by identifying and offering perfectly timed upsells and cross-sells.**
> 

It costs 0 to upsell an existing client. This is your highest-margin growth lever.

---

## 🧠 Expansion Offer Framework

| Trigger | Upsell Offer | Timing |
| --- | --- | --- |
| Client hitting KPI targets | Premium package upgrade | Month 2-3 |
| Growing social following | Paid ads add-on | Month 1 |
| Good results on 1 channel | Multi-channel expansion | Month 3 |
| Business growing fast | Retainer upgrade | Any time |
| No website | Web design add-on | Month 1 |
| No email marketing | Email marketing add-on | Month 2 |
| Referral activity | Ambassador program | Month 3+ |

---

## 🤖 n8n Automation Code — AI Upsell Detection

```json
{
  "name": "Nivy - Upsell Opportunity Detector",
  "nodes": [
    {
      "parameters": {
        "rule": { "interval": [{ "field": "weeks", "weeksInterval": 2 }] }
      },
      "name": "Bi-Weekly Trigger",
      "type": "n8n-nodes-base.scheduleTrigger",
      "position": [240, 300]
    },
    {
      "parameters": {
        "operation": "getAll",
        "base": "YOUR_AIRTABLE_BASE",
        "table": "Clients",
        "filterByFormula": "AND({Status}='Active', {ContractMonths} >= 2)"
      },
      "name": "Get Eligible Clients",
      "type": "n8n-nodes-base.airtable",
      "position": [460, 300]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "authentication": "genericCredentialType",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4" },
            { "name": "messages", "value": "=[{\"role\": \"system\", \"content\": \"You are a business growth advisor for a digital marketing agency. Identify the most relevant upsell opportunity.\"}, {\"role\": \"user\", \"content\": \"Client: {{$json.ClientName}}. Current package: {{$json.Package}}. Results so far: Leads={{$json.Leads}}, Revenue={{$json.Revenue}}. Business type: {{$json.Industry}}. What is the single best upsell to offer this client right now? Return: opportunity name, reasoning, suggested price.\"}]" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_OPENAI_KEY" }]
        }
      },
      "name": "AI Upsell Analysis",
      "type": "n8n-nodes-base.httpRequest",
      "position": [680, 300]
    },
    {
      "parameters": {
        "chatId": "YOUR_SALES_TEAM_TELEGRAM",
        "text": "📈 UPSELL OPPORTUNITY\n\nClient: {{$json.ClientName}}\nCurrent Package: {{$json.Package}}\n\nAI Recommendation: {{$json.aiRecommendation}}\n\nReach out this week!"
      },
      "name": "Alert Sales Team",
      "type": "n8n-nodes-base.telegram",
      "position": [900, 300]
    }
  ],
  "connections": {
    "Bi-Weekly Trigger": { "main": [[{ "node": "Get Eligible Clients", "type": "main", "index": 0 }]] },
    "Get Eligible Clients": { "main": [[{ "node": "AI Upsell Analysis", "type": "main", "index": 0 }]] },
    "AI Upsell Analysis": { "main": [[{ "node": "Alert Sales Team", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Tool |
| --- | --- | --- |
| Upsell conversion rate | >30% of clients | HubSpot |
| Average revenue per client growth | +20% after 3 months | HubSpot |
| Cross-sell penetration | >40% have 2+ services | Airtable |
| Expansion MRR | Growing 10%+ monthly | HubSpot |

---

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Upsell opportunity log | HubSpot deals (Expansion stage) | Track all flagged upsell opportunities per client |
| Client package & services tracker | Airtable | Current services, upsell history, revenue per client |
| Upsell conversion rate tracker | HubSpot reports | Track how many flagged opportunities convert to revenue |
| Revenue per client growth | Stripe / Razorpay + HubSpot | MRR growth per client after expansion |
| AI upsell recommendation log | Notion | Archive of all AI-generated upsell recommendations |
| Multi-service penetration tracker | Airtable | % of clients with 2+ Nivy services |
| Expansion pipeline (CRM) | HubSpot | Active upsell deals in progress with status |

---

## 📤 Outbound Systems

| System | Schedule | Tool | Purpose |
| --- | --- | --- | --- |
| AI upsell alert to AM | When trigger met | n8n + Telegram | Alert AM with specific recommendation and talking points |
| Expansion offer email to client | When AM approves | n8n + Gmail | Personalized upgrade proposal |
| Upsell pitch in monthly review call | Monthly | Manual (AM-led) | Natural conversation during strategy call |
| Expansion case study share | When upsell opportunity detected | n8n + Email | Send relevant case study showing ROI of the add-on service |
| Multi-service bundle proposal | Month 3 trigger | AM manual | Custom proposal if client is strong performer |
| Ambassador program invitation | Month 3+ with referral activity | n8n + Email | Invite top clients into formal ambassador track |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Ambassador program | Top clients get exclusive benefits + revenue share for referrals | Creates advocates who actively sell Nivy |
| Multi-service success showcase | Client LinkedIn feature after successful expansion | Demonstrates ROI of full Nivy ecosystem |
| Expansion client case study | Build case study after upsell succeeds + client gets results | Powers Stage 1 & Stage 2 acquisition content |
| Peer recommendation in VIP community | Clients share results with each other — drives FOMO for services they don’t have | Organic upsell pressure from peers |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Bi-weekly AI upsell scan | n8n + Airtable + OpenAI | Every 2 weeks | Analyze all active clients for expansion opportunities |
| Upsell alert to AM | n8n + Telegram | When AI scores opportunity above threshold | Route to right AM with recommendation |
| Case study share — upsell relevant | n8n + Gmail | When upsell opportunity detected | Auto-send relevant success story to client |
| Post-upsell onboarding trigger | n8n | When deal marked Won in HubSpot | Trigger Stage 7 mini-onboarding for new service |
| Ambassador program invitation | n8n + Email | When client crosses £10k LTV + referral given | Invite to ambassador program automatically |
| Expansion revenue tracking | n8n + HubSpot | Monthly | Update expansion MRR field per client |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Upsell opportunity detector | GPT-4o | Client profile + current services + KPI data + industry | Best expansion offer + rationale + suggested price point | Identify right offer at right moment |
| Upsell pitch generator | GPT-4o | Client name + service + AI recommendation | Personalized 150-word upsell email + 3 AM talking points | Scale high-quality expansion conversations |
| Bundle proposal builder | GPT-4o | Client goals + business type + gap analysis | Custom multi-service proposal with ROI projections | Create premium proposals fast |
| Expansion timing optimizer | GPT-4o | Client tenure + KPI trend + CSAT + engagement | Best week to initiate expansion conversation | Maximize conversion by timing perfectly |

**AI Prompt — Upsell Opportunity Detector:**

```
You are a growth advisor for Nivy Digital, a full-service digital marketing agency.

Client: {{client_name}}
Business type: {{industry}}
Current services: {{current_package}}
Months with Nivy: {{tenure}}
Key results so far: {{results_summary}}
Current KPI performance: {{kpi_status}}
CSAT score: {{csat_score}}/10
Budget signal: {{budget_indicator}}

Nivy’s available services not yet purchased:
- Meta / Google paid ads
- SEO & content marketing
- Email marketing automation
- Web design & CRO
- LinkedIn outbound
- WhatsApp marketing
- Brand strategy
- Video content production

Identify the single best expansion opportunity for this client right now. Return:
1. Recommended service (name only)
2. Why this is the right fit right now (2 sentences)
3. Suggested monthly investment range (in INR or USD)
4. Best conversation opener for the AM to use in their next call (1-2 sentences, warm and consultative)
5. Urgency level: LOW / MEDIUM / HIGH

Output only the 5 items above.
```

---

## 👥 Team Responsibilities

| Role | Responsibility |
| --- | --- |
| Account Manager | Run upsell conversations in monthly review calls, send expansion proposals, close deals |
| Sales Lead | Oversee expansion pipeline in HubSpot, coach AM on pitch strategy |
| Automation Dev | Maintain AI upsell workflow, fix triggers, add new detection logic |
| Operations Manager | Monitor expansion MRR, flag if upsell rate drops below 30% |
| CEO / Founder | Approve new service bundle pricing, close high-value expansion deals personally |

---

## 📋 SOP — Expansion Execution Checklist

**Bi-Weekly:**

- [ ]  n8n runs AI upsell scan on all active clients
- [ ]  AM reviews flagged opportunities — which are worth pursuing this month?
- [ ]  AM logs selected opportunities into HubSpot expansion pipeline

**Monthly:**

- [ ]  Upsell conversation built into every monthly review call (AM prepares 1 expansion idea per client)
- [ ]  Send relevant case study to top 3 expansion candidates before their review call
- [ ]  Review expansion MRR — is revenue per client growing?
- [ ]  Log won/lost upsells — what objections came up?

**Per Upsell Opportunity:**

- [ ]  AI recommendation received — AM reviews and personalizes
- [ ]  AM prepares talking points + case study before call
- [ ]  Expansion conversation in monthly review call
- [ ]  If interested: Send written proposal within 24 hours
- [ ]  If won: Trigger mini-onboarding for new service (Stage 7 flow)
- [ ]  If lost: Log objection, schedule follow-up in 60 days

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| HubSpot | Expansion pipeline, deal tracking, revenue per client | Free | [hubspot.com](http://hubspot.com) |
| Airtable | Client service tracker, multi-service penetration | Free tier | [airtable.com](http://airtable.com) |
| n8n (self-hosted) | AI upsell detection, alert routing, post-win triggers | Free | [n8n.io](http://n8n.io) |
| OpenAI API | Upsell detection, pitch generation, bundle proposals | Pay per use | [openai.com](http://openai.com) |
| Gmail | Expansion proposal emails | Free | [gmail.com](http://gmail.com) |
| Notion | Upsell recommendation archive, proposal templates | Free | [notion.so](http://notion.so) |
| Telegram | AM upsell opportunity alerts | Free | [telegram.org](http://telegram.org) |
| Stripe / Razorpay | Expansion invoice + payment | Transaction fee | [stripe.com](http://stripe.com) |

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Revenue per client and expansion MRR tracked in CRM |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Upsell detector, pitch generator, bundle proposal AI |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Upsell conversion rate and expansion MRR tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Upsell objections (price, need, timing) handled here |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Expansion revenue tracked as part of full pipeline view |

| System | Method | Frequency |
| --- | --- | --- |
| Upsell conversion rate audit | Won vs. lost — which services convert best? Which AMs close most? | Monthly |
| Objection analysis | Log all expansion objections — build AM responses for each | Monthly |
| AI recommendation accuracy | Are AI-flagged upsells actually converting? Refine prompt if <30% | Monthly |
| Timing optimization | Which month of tenure has highest upsell conversion rate? | Quarterly |
| Bundle pricing test | Test 2-service bundles vs. individual add-ons — which gets more yeses? | Quarterly |
| Expansion MRR growth rate | Is revenue per client growing? What’s the average expansion per client? | Monthly |

---

**➡️ Next Stage:** [🔗 Stage 11 — Referral & Viral Engine](https://www.notion.so/35be5082b9d481799fd3d2dcad10d822)