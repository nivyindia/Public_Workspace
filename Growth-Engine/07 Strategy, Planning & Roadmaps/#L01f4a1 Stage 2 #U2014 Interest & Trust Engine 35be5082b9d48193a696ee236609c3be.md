# 💡 Stage 2 — Interest & Trust Engine

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 2 OF 12 — Strangers became aware in Stage 1. Now they need to trust you enough to identify themselves as leads. Trust is the currency of conversion.**
> 

---

## 💡 Core Objective

> **Turn audience attention into genuine curiosity, belief, and desire — so prospects think: "This agency understands my business exactly."**
> 

This stage is engineered to:

- Convert cold followers and outreach recipients into warm, engaged prospects
- Build trust through proof, education, and authority — without hard selling
- Make Nivy Digital feel like the obvious, credible choice
- Push prospects to self-qualify by consuming content, downloading resources, or joining communities

**Inputs:** Aware strangers, cold email openers, ad clickers, social followers

**Outputs:** Warm leads, email subscribers, free audit requesters, community members

**Trigger to next stage:** Prospect takes an action (downloads resource, books call, fills form, asks for pricing) → enters Stage 3 (Lead Capture)

---

## 📡 Channels Used

| Channel Type | Platforms | Priority |
| --- | --- | --- |
| Email nurture | Mautic / Brevo sequences | 🔴 Critical |
| Content platform | YouTube (long-form), Blog (SEO) | 🔴 Critical |
| Retargeting ads | Meta retargeting, Google remarketing | 🔴 Critical |
| Social proof | LinkedIn testimonials, Instagram stories | 🔴 Critical |
| Community | WhatsApp group, Telegram channel, Discord | 🟠 High |
| Webinar / live | Zoom webinars, LinkedIn Live | 🟠 High |
| WhatsApp | Follow-up messages, status content | 🟠 High |
| Direct messaging | LinkedIn DM sequences post-connection | 🟡 Medium |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| Client case studies with numbers | Social proof + desire | 🔴 Critical |
| Testimonials & video reviews | Trust validation | 🔴 Critical |
| Educational email sequences (7-day) | Systematic trust building | 🔴 Critical |
| Free business audit offer | Trust accelerator + qualification | 🔴 Critical |
| Lead magnets (PDF/checklist/guide) | Value exchange + email capture | 🔴 Critical |
| Retargeting ads showing results | Persistent awareness | 🔴 Critical |
| "Behind the scenes" content | Transparency + humanity | 🟠 High |
| ROI calculation examples | Financial logic for decisions | 🟠 High |
| FAQ content (objection prevention) | Remove mental resistance | 🟠 High |
| Webinars / free training | Authority positioning | 🟡 Medium |
| Strategy breakdowns (public) | Expertise demonstration | 🟡 Medium |
| Community engagement | Relationship depth | 🟡 Medium |
| Comparison content (Nivy vs. hiring in-house) | Decision facilitation | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Email engagement tracking | Mautic / Brevo | Track opens, clicks, content engagement per lead |
| Lead behavior scoring | HubSpot lead scoring | Assign points per action to identify readiness |
| Retargeting pixel data | Meta Pixel, Google Tag | Track website visitors for retargeting |
| Content consumption tracking | Google Analytics 4 | Know which content moves leads forward |
| Lead enrichment on form submit | n8n + Apollo API | Auto-enrich new leads with company data |
| Segmentation tagging | HubSpot + n8n | Tag by industry, country, service interest |
| Intent signal detection | HubSpot page tracking | Flag leads visiting pricing/services pages |

**Trust Score Formula:**

```
Lead Trust Score = 
  Opened email ×5 
  + Clicked email link ×10 
  + Visited services page ×20 
  + Downloaded lead magnet ×25 
  + Attended webinar ×30 
  + Requested audit ×40

Score ≥ 50 → Move to Stage 3 (Lead Capture) 
Score ≥ 80 → Flag as HOT → Alert sales team immediately
```

---

## 📤 Outbound Systems (Post-Connection Follow-Up)

| System | Sequence | Tool | Purpose |
| --- | --- | --- | --- |
| LinkedIn DM nurture | Day 1: thanks for connecting, Day 3: share insight, Day 7: offer free resource | PhantomBuster / Manual | Warm up new connections |
| Cold email responders | Reply → qualify → send case study → invite to call | n8n + Mautic | Move warm responders to conversion |
| WhatsApp follow-up | Day 1: welcome + resource, Day 4: case study, Day 10: offer audit | WATI + n8n | High-touch nurture |
| Re-engagement for non-openers | Day 14: resend with new subject line | Mautic | Recover cold leads |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Free WhatsApp community | Gated value content → invite prospects | Audience ownership + trust |
| Weekly insight newsletter | Educational email → share-worthy content → forwards | Organic list growth |
| Webinar share incentive | Share webinar link = get bonus resource | Viral attendance growth |
| Community testimonial wall | Active members share results → others see proof | Social proof flywheel |
| Case study sharing | "Tag a founder who needs this" CTAs | Organic reach + trust |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Welcome email sequence (7-day) | Mautic campaign | New subscriber added | Systematic trust building |
| Lead magnet delivery | n8n + Gmail API | Form submission received | Instant value delivery |
| Retargeting pixel trigger | Meta Pixel → Ad Manager | Visitor hits site but doesn't convert | Re-engage with social proof ads |
| Lead score update | HubSpot + n8n | Any tracked action | Real-time qualification |
| Hot lead alert | n8n + WhatsApp API | Score crosses 80 | Immediate sales team notification |
| Webinar reminder sequence | Mautic | Webinar registered | 3 reminders (48hr, 1hr, 5min before) |
| Case study auto-send | n8n + Gmail | Lead visits services page | Send relevant case study |
| Community welcome bot | Telegram/WhatsApp bot | New member joins | Automated onboarding message |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Email sequence personalization | GPT-4o | Lead name, company, industry, pain | Personalized email body | Higher engagement rates |
| Lead readiness scoring | GPT-4o | Lead behavior data + messages | Hot/Warm/Cold + recommended next step | Prioritization |
| Case study matching | GPT-4o-mini | Lead's industry + pain points | Most relevant case study to send | Better conversion |
| Objection pattern detection | GPT-4o | Email reply or DM text | Identified objection + recommended response | Faster handling |
| Retargeting ad copy | GPT-4o-mini | Lead segment + stage | Ad copy variants for retargeting | Better ROAS |

**AI Prompt — Email Personalization:**

```jsx
You are writing a nurture email for Nivy Digital.

Lead data:
- Name: {{lead_name}}
- Company: {{company}}
- Industry: {{industry}}
- Country: {{country}}
- Pain point detected: {{pain_point}}

Write Email #2 in a 7-day trust-building sequence.
Theme: Show them one specific result we achieved for a similar business.
Length: 150-200 words.
Tone: Helpful consultant, not salesperson.
End with: soft CTA to read a free resource (no ask for a call yet).
Output: subject line + email body only. No extra text.
```

---

## 🤖 n8n Automation Code — Trust Engine (Lead Score + Alert)

```json
{
  "name": "Nivy - Stage 2 Trust Engine (Lead Scoring + Alert)",
  "nodes": [
    {
      "parameters": {
        "httpMethod": "POST",
        "path": "lead-activity-webhook"
      },
      "name": "Activity Webhook",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 300]
    },
    {
      "parameters": {
        "jsCode": "const action = $json.activity_type;\nconst scores = {\n  'email_opened': 5,\n  'email_clicked': 10,\n  'page_visit_services': 20,\n  'lead_magnet_downloaded': 25,\n  'webinar_attended': 30,\n  'audit_requested': 40\n};\nconst points = scores[action] || 0;\nreturn [{ json: { ...$json, points_to_add: points } }];"
      },
      "name": "Calculate Score Points",
      "type": "n8n-nodes-base.code",
      "position": [320, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.hubspot_contact_id}}",
        "properties": {
          "lead_score": "={{$json.current_score + $json.points_to_add}}",
          "last_activity": "={{$json.activity_type}}",
          "last_activity_date": "={{$now}}"
        }
      },
      "name": "Update HubSpot Score",
      "type": "n8n-nodes-base.hubspot",
      "position": [540, 300]
    },
    {
      "parameters": {
        "conditions": {
          "number": [{ "value1": "={{$json.current_score + $json.points_to_add}}", "operation": "largerEqual", "value2": 80 }]
        }
      },
      "name": "Score ≥ 80? (HOT)",
      "type": "n8n-nodes-base.if",
      "position": [760, 300]
    },
    {
      "parameters": {
        "url": "https://api.whatsapp.com/send",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "phone", "value": "YOUR_SALES_WHATSAPP_NUMBER" },
            { "name": "text", "value": "🔥 HOT LEAD ALERT\nName: {{$json.lead_name}}\nCompany: {{$json.company}}\nCountry: {{$json.country}}\nTrigger: {{$json.activity_type}}\nScore: {{$json.new_score}}\nHubSpot: {{$json.hubspot_link}}" }
          ]
        }
      },
      "name": "Alert Sales Team - WhatsApp",
      "type": "n8n-nodes-base.httpRequest",
      "position": [980, 200]
    },
    {
      "parameters": {
        "url": "https://api.mautic.com/api/contacts/{{$json.mautic_id}}/campaigns/add",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "ids", "value": "[YOUR_HOT_LEAD_CAMPAIGN_ID]" }
          ]
        }
      },
      "name": "Move to HOT Sequence",
      "type": "n8n-nodes-base.httpRequest",
      "position": [980, 400]
    }
  ],
  "connections": {
    "Activity Webhook": { "main": [[{ "node": "Calculate Score Points", "type": "main", "index": 0 }]] },
    "Calculate Score Points": { "main": [[{ "node": "Update HubSpot Score", "type": "main", "index": 0 }]] },
    "Update HubSpot Score": { "main": [[{ "node": "Score ≥ 80? (HOT)", "type": "main", "index": 0 }]] },
    "Score ≥ 80? (HOT)": { 
      "main": [
        [{ "node": "Alert Sales Team - WhatsApp", "type": "main", "index": 0 }],
        [{ "node": "Move to HOT Sequence", "type": "main", "index": 0 }]
      ]
    }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Email open rate | >35% | Mautic / Brevo | Weekly |
| Email click-through rate | >8% | Mautic / Brevo | Weekly |
| Lead magnet download rate | >20% of visitors | Google Analytics | Weekly |
| Webinar attendance rate | >40% of registrants | Zoom analytics | Per webinar |
| Average lead score progression | +20 pts/week per warm lead | HubSpot | Weekly |
| Leads hitting score 50+ per month | 100+ | HubSpot | Monthly |
| HOT leads generated (score 80+) | 20+/month | HubSpot | Monthly |
| Retargeting ad CTR | >2% | Meta Ads Manager | Weekly |
| Free audit requests per month | 30+ | HubSpot / Tally | Monthly |
| Community growth rate | +50 members/month | WhatsApp/Telegram | Monthly |

---

## 👥 Team Responsibilities

| Role | Responsibility |
| --- | --- |
| Email Marketing Specialist | Write and test nurture sequences, monitor open/click rates |
| Content Strategist | Plan trust-building content: case studies, guides, FAQs |
| VA (Outreach) | Monitor LinkedIn DM replies, send follow-up messages |
| Automation Dev | Maintain lead scoring flows, fix webhook errors |
| Sales Lead | Review HOT lead alerts, prepare for Stage 3 handoff |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  Check email sequence performance in Mautic (open rates, reply flags)
- [ ]  Review HOT lead alerts from n8n (score 80+) → flag for Stage 3
- [ ]  Monitor LinkedIn DM replies → personalized follow-up within 24hrs
- [ ]  Check retargeting ad performance vs. benchmark
- [ ]  Review new community members → send welcome message
- [ ]  Update lead scores manually for any offline interactions

**Weekly:**

- [ ]  Review which email in the sequence has lowest open rate → rewrite
- [ ]  Pull new case study or testimonial from delivery team
- [ ]  A/B test lead magnet landing page headline
- [ ]  Check leads stuck in Stage 2 >14 days → trigger re-engagement

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost |
| --- | --- | --- |
| Mautic (self-hosted) | Email sequences, lead scoring | Free |
| Brevo | Email delivery backup | Free tier |
| HubSpot | CRM, lead scoring, tracking | Free |
| n8n | Automation flows | Free (self-hosted) |
| Meta Ads Manager | Retargeting campaigns | Ad spend |
| Zoom | Webinars | Free tier |
| [Tally.so](http://Tally.so) | Lead magnet capture forms | Free |
| Canva | Lead magnet design (PDF) | Free |
| Google Analytics 4 | Behavior tracking | Free |
| WATI / WhatsApp Business API | WhatsApp nurture | Free tier |

---

## ⚠️ Risks & Bottlenecks

| Risk | Mitigation |
| --- | --- |
| Leads not opening emails | Test subject lines, warm sending domain, reduce frequency |
| Weak case studies | Collect results from delivery team monthly, build library |
| Leads stuck at Stage 2 too long | Auto-trigger re-engagement at day 14 of no activity |
| Retargeting audience too small | Lower page visit threshold, expand to video view audiences |
| Sales team missing HOT alerts | WhatsApp + email notification + HubSpot task creation |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Email sequence audit | Replace lowest-click email every 30 days | Monthly |
| Lead magnet conversion test | A/B test landing page headline + CTA | Every 2 weeks |
| Case study rotation | Always have 3 fresh case studies by industry | Monthly |
| Retargeting audience refresh | Expand to new audience segments | Monthly |
| Trust score calibration | Review which scores actually convert → adjust weights | Quarterly |

---

**⬅️ Previous Stage:** [🎯 Stage 1 — Attention Engine](https://www.notion.so/35be5082b9d48146b861fb656552d81b)

**➡️ Next Stage:** [📥 Stage 3 — Lead Capture Engine](https://www.notion.so/35be5082b9d4814282a4e74c4b617ff6)