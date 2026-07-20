# 🤖 AI Systems Layer — Intelligence Across All Stages

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **The AI layer is what separates a manual agency from a machine. Every touchpoint in the Nivy CJE system has an AI brain behind it — generating content, scoring leads, detecting intent, handling objections, writing reports, and personalizing every message.**
> 

---

## 🤖 AI Systems Map — All Stages

| Stage | AI System | Model | What It Does |
| --- | --- | --- | --- |
| Stage 1 | Content Generator | GPT-4o-mini | Daily post generation for all platforms |
| Stage 1 | Email Personalizer | GPT-4o + Clay | One-liner personalized opening per lead |
| Stage 1 | Trend Spotter | GPT-4o | Identifies viral content opportunities from RSS |
| Stage 1 | Outreach Copywriter | GPT-4o-mini | Generates cold email body variants |
| Stage 2 | Lead Scorer | GPT-4o | Analyzes behavior signals, assigns HOT/WARM/COLD |
| Stage 2 | Case Study Matcher | GPT-4o-mini | Matches right case study to lead’s industry |
| Stage 2 | Retargeting Ad Writer | GPT-4o-mini | Writes retargeting ad copy per segment |
| Stage 3 | Lead Qualifier | GPT-4o | Classifies new leads on capture |
| Stage 3 | First Response Writer | GPT-4o-mini | Personalized first email after form submission |
| Stage 4 | Lead Priority Ranker | GPT-4o | Ranks leads in CRM by close probability |
| Stage 5 | Nurture Email Writer | GPT-4o | Personalized emails per lead segment |
| Stage 5 | Re-engagement Writer | GPT-4o-mini | "Going cold" recovery messages |
| Stage 6 | Objection Handler | GPT-4o | Detects and responds to sales objections |
| Stage 6 | Proposal Summarizer | GPT-4o | One-page proposal summary from template data |
| Stage 6 | Call Prep Brief | GPT-4o | Pre-call research brief for sales person |
| Stage 7 | Onboarding Email Writer | GPT-4o-mini | Personalized welcome + next steps email |
| Stage 8 | Report Summarizer | GPT-4o | Translates raw KPI data into client-friendly report |
| Stage 8 | Performance Analyst | GPT-4o | Identifies what’s working and what to optimize |
| Stage 9 | Churn Risk Detector | GPT-4o | Flags clients showing disengagement signals |
| Stage 9 | Renewal Email Writer | GPT-4o-mini | Personalized contract renewal messages |
| Stage 10 | Upsell Opportunity Detector | GPT-4o | Identifies upsell triggers from client behavior |
| Stage 11 | Referral Request Writer | GPT-4o-mini | Personalized referral ask messages |
| Stage 11B | Reactivation Writer | GPT-4o-mini | Tailored re-engagement for cold/lost leads |
| Stage 12 | Partner Pitch Writer | GPT-4o | Partnership outreach emails |
| All stages | Weekly Insight Reporter | GPT-4o | Turns raw data into actionable weekly summary |

---

## 📝 Master Prompt Library

### ✅ Daily Content Generation

```jsx
System: You are a B2B content strategist for Nivy Digital — an international digital marketing agency serving US, UK, Canada, Australia, UAE, and India.

User: Generate today's content batch.
Target audience: {{icp}}
Platforms needed: {{platforms}}
Theme: {{weekly_theme}}
Content types needed: 2x educational, 1x case study, 1x viral hook, 1x enquiry-style

For each post output:
- platform
- caption (with hook in first line)
- hashtags (platform-appropriate)
- cta
- content_type

Output JSON array only. No extra text.
```

### ✅ Lead Qualification

```jsx
New lead entered the Nivy Digital pipeline.

Data: Name={{name}}, Country={{country}}, Service={{service}}, Message="{{message}}", Company={{company}}, Source={{source}}

Classify:
- classification: HOT | WARM | COLD | PARTNER | SPAM
- pain_point: (1 sentence)
- best_service: (from: VA, Accounting, Digital Marketing, Web Dev, Automation)
- next_step: (specific recommended action)
- urgency: 1-5

HOT = active need + right ICP + decision maker + soon
WARM = interested but timing unclear
COLD = researching, long timeline
PARTNER = agency/freelancer/consultant who could refer
SPAM = job seeker, competitor, irrelevant

Output JSON only.
```

### ✅ Objection Detection & Response

```jsx
A lead in stage {{funnel_stage}} sent this message: "{{message}}"
Service interest: {{service}} | Country: {{country}}

Task:
1. Classify: Objection | Positive | Question | Unsubscribe | Spam
2. If Objection: categorize (price/timing/trust/competitor/authority/need/risk)
3. Urgency: 1-5 (5 = about to lose/win the deal)
4. Write response draft: acknowledge, reframe, move forward. Max 100 words. Conversational.
5. action_required: auto_send | alert_human | do_nothing

Output JSON: {type, objection_category, urgency, response_draft, action_required}
```

### ✅ Client Report Summarizer

```jsx
You are writing a client-facing performance report for Nivy Digital.

Client: {{client_name}} | Service: {{service_type}} | Month: {{month}}

Raw data:
{{raw_kpi_data}}

Write a report that:
- Opens with 2 sentences of context (what we focused on this month)
- Highlights 3 wins with specific numbers
- Notes 1-2 areas being optimized
- Ends with plan for next month
- Tone: professional, confident, client-friendly (not jargon-heavy)
- Length: 250-350 words
```

### ✅ Upsell Opportunity Detection

```jsx
Review this client account data and identify upsell opportunities.

Client: {{client_name}}
Current services: {{current_services}}
Months active: {{months_active}}
Current MRR: ${{current_mrr}}
Recent interactions: {{recent_notes}}
KPI trends: {{kpi_trends}}

Nivy services available to upsell: VA, Bookkeeping, Digital Marketing, Web Dev, SEO, Automation, Strategy Consulting

Output:
- top_upsell_opportunity: (service + reason)
- confidence_score: 1-10
- suggested_approach: (how to bring it up)
- best_timing: (now / at next review / after X milestone)

Output JSON only.
```

### ✅ Churn Risk Detection

```jsx
Review this client’s engagement data and flag churn risk.

Client: {{client_name}}
Months active: {{months_active}}
Last positive interaction: {{last_positive}}
Recent behavior: {{recent_behavior}}
Tickets/complaints last 30 days: {{complaint_count}}
Last report engagement: {{opened_report?}}

Risk classification:
- LOW: Engaged, happy, no signals
- MEDIUM: Slightly disengaged, no major flags
- HIGH: Multiple warning signs, possible churn
- CRITICAL: About to churn, needs immediate intervention

Output: {risk_level, risk_signals, recommended_action, urgency_1_to_5}
```

---

## ⚡ Master AI Orchestration Flow (n8n)

```json
{
  "name": "Nivy - AI Systems Orchestrator",
  "description": "Routes different AI tasks to the right prompt and model",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "ai-task" },
      "name": "AI Task Router Webhook",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 400]
    },
    {
      "parameters": {
        "conditions": {
          "string": [{ "value1": "={{$json.task_type}}", "operation": "equal", "value2": "qualify_lead" }]
        }
      },
      "name": "Task: Qualify Lead?",
      "type": "n8n-nodes-base.if",
      "position": [320, 300]
    },
    {
      "parameters": {
        "conditions": {
          "string": [{ "value1": "={{$json.task_type}}", "operation": "equal", "value2": "handle_objection" }]
        }
      },
      "name": "Task: Handle Objection?",
      "type": "n8n-nodes-base.if",
      "position": [320, 500]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o-mini" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Classify lead: Name={{$json.name}}, Country={{$json.country}}, Message={{$json.message}}. Output JSON: {classification, pain_point, best_service, urgency}\"}]" }
          ]
        }
      },
      "name": "AI: Qualify Lead",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 200]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Handle objection: Stage={{$json.funnel_stage}}, Message={{$json.message}}. Output JSON: {type, objection_category, urgency, response_draft, action_required}\"}]" }
          ]
        }
      },
      "name": "AI: Handle Objection",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 400]
    }
  ],
  "connections": {
    "AI Task Router Webhook": {
      "main": [
        [{ "node": "Task: Qualify Lead?", "type": "main", "index": 0 }],
        [{ "node": "Task: Handle Objection?", "type": "main", "index": 0 }]
      ]
    },
    "Task: Qualify Lead?": { "main": [[{ "node": "AI: Qualify Lead", "type": "main", "index": 0 }]] },
    "Task: Handle Objection?": { "main": [[{ "node": "AI: Handle Objection", "type": "main", "index": 0 }]] }
  }
}
```

---

## 💰 AI Cost Estimates

| Task | Model | Avg Tokens | Cost/run | Monthly (est.) |
| --- | --- | --- | --- | --- |
| Lead qualification | GPT-4o-mini | ~500 | ~$0.001 | ~$0.30 (300 leads) |
| Content generation | GPT-4o-mini | ~1,500 | ~$0.003 | ~$0.90 (30 days) |
| Objection handling | GPT-4o | ~800 | ~$0.012 | ~$1.20 (100 objections) |
| Report summarizer | GPT-4o | ~2,000 | ~$0.03 | ~$1.50 (50 reports) |
| Email personalizer | GPT-4o-mini | ~400 | ~$0.0008 | ~$1.60 (2,000 emails) |
| **Total AI cost** |  |  |  | **~$6–10/month** |

---

## 🔗 Connected Pages

- [🤖 Automated Objection Handling System](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d)
- [🤖 Nivy Digital — Sales Automation via Enquiry Method](https://www.notion.so/ea0e5082b9d4829cb8bb01d3eb56f514)
- [📈 SD-08 — Automation & AI Hub](https://www.notion.so/359e5082b9d48131a297ee79bdee39d9)