# 📥 Stage 3 — Lead Capture Engine

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 3 OF 12 — A prospect without contact info is an invisible opportunity. This engine converts anonymous interest into owned, trackable leads in your CRM.**
> 

---

## 📥 Core Objective

> **Convert interested visitors, followers, and outreach responders into identified, contactable leads — captured in your CRM with enough data to qualify and route them.**
> 

This stage is engineered to:

- Create multiple low-friction entry points for prospects to identify themselves
- Capture name, email, WhatsApp, and context (service interest, country, problem)
- Auto-qualify and score leads the moment they enter
- Route leads instantly to the right sequence or team member
- Never lose a lead — deduplication and CRM sync on every capture point

**Inputs:** Warm prospects from Stage 2 (email clickers, ad engagers, community members, outreach responders)

**Outputs:** Identified leads with contact info, source tracking, initial qualification score

**Trigger to next stage:** Lead captured → AI qualifies → HOT → Stage 6 (Conversion), WARM → Stage 4 (Lead Management), COLD → Stage 5 (Nurturing)

---

## 📡 Channels Used

| Channel Type | Capture Method | Priority |
| --- | --- | --- |
| Website | Contact form, audit form, chatbot, booking widget | 🔴 Critical |
| Landing pages | Service-specific or lead magnet squeeze pages | 🔴 Critical |
| WhatsApp | Business API auto-reply capture | 🔴 Critical |
| Booking systems | [Cal.com](http://Cal.com) / Calendly scheduling links | 🔴 Critical |
| Social media | Lead ads (Meta/LinkedIn), link-in-bio | 🟠 High |
| Email replies | Reply detection → auto-capture | 🟠 High |
| Community | WhatsApp/Telegram join forms | 🟠 High |
| Chatbots | Website chatbot + WhatsApp bot flow | 🟠 High |
| Events & webinars | Registration forms | 🟡 Medium |
| Offline | QR code forms at networking events | 🟢 Low |

---

## 🧠 Methods Used

| Method | Lead Quality | Purpose |
| --- | --- | --- |
| Free business audit request | Very High | Pre-qualified — already knows they have a problem |
| "Book a free strategy call" CTA | Very High | Ready-to-talk prospects |
| Lead magnet download (PDF/checklist) | High | Email capture with value exchange |
| Webinar registration | High | Engaged, education-seeking prospects |
| Quiz funnel ("Find your growth gap") | High | Interactive self-qualification |
| WhatsApp opt-in CTA | High | Direct communication channel |
| Application form ("Work with us") | Very High | Filtered, serious prospects only |
| Community join form | Medium | Top-of-funnel audience building |
| "Get a quote" form | Very High | Purchase-intent leads |
| Contact form (general) | Medium | Inbound enquiries |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Lead deduplication | n8n IF node + HubSpot lookup | Never create duplicate contacts |
| Auto-enrichment on capture | n8n + Apollo API | Add company size, industry, LinkedIn on signup |
| UTM tracking | Google Analytics + HubSpot | Know exactly which source/campaign generated lead |
| Lead source attribution | HubSpot source field + UTM | Track ROI per channel |
| Form field mapping | Tally → n8n → HubSpot | Standardize all data formats |
| Lead scoring on entry | n8n scoring logic | Instant HOT/WARM/COLD on capture |
| Capture event logging | Google Sheets + HubSpot | Full audit trail of every lead |

**Universal Lead Data Model:**

```
Every captured lead must have:
✅ First name
✅ Email (validated)
✅ Country
✅ Service interest
✅ Lead source (which channel/campaign)
✅ Capture date
✅ Initial AI qualification score
✅ Assigned sequence

Nice to have:
- Company name
- Company size
- LinkedIn URL
- WhatsApp number
- Pain point (free text)
```

---

## 📤 Outbound-Triggered Capture

| Trigger | Capture Method | Tool |
| --- | --- | --- |
| Cold email reply: "Interested" | n8n detects keyword → creates HubSpot contact | n8n + Mautic webhook |
| LinkedIn DM reply | VA manually adds to CRM via HubSpot | HubSpot manual entry |
| Comment on post with keyword | n8n auto-captures commenter data | n8n + Instagram/FB API |
| WhatsApp inbound message | WhatsApp API → n8n → HubSpot | WhatsApp Business API + n8n |
| Website chatbot completion | Chatbot data → n8n → HubSpot | [Tawk.to](http://Tawk.to) / Tidio + n8n |

---

## 🔁 Community & Viral Loops

| Loop | Method | Purpose |
| --- | --- | --- |
| "Refer a founder" CTA in lead magnet | Embedded referral link in PDF | Viral list growth |
| Community invite after form submit | Auto-invite to WhatsApp group post-capture | Turn leads into community members |
| Quiz result sharing | "Share your result" CTA with branded card | Organic viral loop |
| Webinar invite chain | Registrant gets shareable invite link | Multiplier on webinar attendance |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Universal lead capture webhook | n8n | Any form submit / reply / DM | Normalize and push to HubSpot |
| Lead deduplication check | n8n + HubSpot API | Every capture event | No duplicate records |
| Auto-enrichment | n8n + Apollo API | New contact created | Add company/role data instantly |
| AI qualification | n8n + OpenAI | Contact created | Score and classify HOT/WARM/COLD |
| Sequence auto-enrollment | n8n + Mautic | After classification | Right sequence for right lead |
| HOT lead instant alert | n8n + WhatsApp API | HOT classification | Sales team notified in seconds |
| PARTNER lead routing | n8n + HubSpot | PARTNER classification | Move to partner pipeline |
| Lead magnet delivery | n8n + Gmail | Form submission | Instant resource delivery |
| Booking confirmation | [Cal.com](http://Cal.com)  • n8n | Call booked | Confirmation + prep email |
| Weekly new lead report | n8n + Google Sheets | Every Monday 8am | Summary to team |

---

## 🤖 AI Systems

| AI System | Input | Output | Purpose |
| --- | --- | --- | --- |
| Lead qualification | Lead's message + form answers + profile | HOT/WARM/COLD + main pain + best service + next step | Route correctly from moment of capture |
| First response personalization | Lead data + capture context | Personalized welcome message | Better first impression |
| ICP match scoring | Lead data vs. ideal customer profile | Match % + recommended service | Prioritize high-value leads |
| Spam/irrelevant detection | Message content | SPAM flag | Clean pipeline automatically |

**AI Qualification Prompt (runs on every new lead):**

```jsx
A new lead just entered our pipeline.

Lead data:
- Name: {{name}}
- Country: {{country}}
- Service interest: {{service_interest}}
- Message: {{message}}
- Company: {{company}} (if provided)
- Source: {{lead_source}}

Nivy Digital serves: SMBs, founders, startups, agencies in US/UK/Canada/Australia/UAE/India.
Services: VA, bookkeeping/accounting, digital marketing, web dev, automation.

Classify this lead:
- HOT: Active need, decision-maker, right ICP, wants to start soon
- WARM: Interested but researching, timeline unclear
- COLD: Early stage, just curious, long timeline
- PARTNER: Could refer clients or collaborate (agency/freelancer/consultant)
- SPAM: Irrelevant, job seeker, competitor

Also extract:
- Primary pain point (1 sentence)
- Best service to offer
- Recommended next step for sales team
- Urgency level (1–5)

Output JSON only. No extra text.
```

---

## 🤖 n8n Automation Code — Universal Lead Capture Pipeline

```json
{
  "name": "Nivy - Stage 3 Universal Lead Capture Pipeline",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "universal-lead-capture" },
      "name": "Universal Webhook",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 400]
    },
    {
      "parameters": {
        "jsCode": "return [{ json: {\n  name: $json.name || $json.first_name || 'Unknown',\n  email: ($json.email || '').toLowerCase().trim(),\n  country: $json.country || $json.location || 'Unknown',\n  service_interest: $json.service || $json.service_interest || 'General',\n  message: $json.message || $json.body || '',\n  company: $json.company || '',\n  phone: $json.phone || $json.whatsapp || '',\n  source: $json.source || $json.utm_source || 'Website',\n  captured_at: new Date().toISOString()\n}}];"
      },
      "name": "Normalize Lead Data",
      "type": "n8n-nodes-base.code",
      "position": [320, 400]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "search",
        "filterGroups": [{ "filters": [{ "propertyName": "email", "operator": "EQ", "value": "={{$json.email}}" }] }]
      },
      "name": "Check HubSpot Duplicate",
      "type": "n8n-nodes-base.hubspot",
      "position": [540, 400]
    },
    {
      "parameters": {
        "conditions": {
          "number": [{ "value1": "={{$json.total}}", "operation": "equal", "value2": 0 }]
        }
      },
      "name": "Is New Lead?",
      "type": "n8n-nodes-base.if",
      "position": [760, 400]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o-mini" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Classify this lead for Nivy Digital. Name: {{$json.name}}, Country: {{$json.country}}, Service: {{$json.service_interest}}, Message: {{$json.message}}. Output JSON: {classification, pain_point, best_service, next_step, urgency_1_to_5}\"}]" }
          ]
        }
      },
      "name": "AI Qualify Lead",
      "type": "n8n-nodes-base.httpRequest",
      "position": [980, 300]
    },
    {
      "parameters": {
        "jsCode": "const aiResponse = JSON.parse($json.choices[0].message.content);\nconst leadData = $node['Normalize Lead Data'].json;\nreturn [{ json: { ...leadData, ...aiResponse } }];"
      },
      "name": "Parse AI Classification",
      "type": "n8n-nodes-base.code",
      "position": [1200, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "create",
        "email": "={{$json.email}}",
        "firstName": "={{$json.name}}",
        "properties": {
          "company": "={{$json.company}}",
          "phone": "={{$json.phone}}",
          "country": "={{$json.country}}",
          "lead_source": "={{$json.source}}",
          "hs_lead_status": "={{$json.classification}}",
          "pain_point__c": "={{$json.pain_point}}",
          "service_interest__c": "={{$json.service_interest}}",
          "ai_urgency_score__c": "={{$json.urgency_1_to_5}}"
        }
      },
      "name": "Create HubSpot Contact",
      "type": "n8n-nodes-base.hubspot",
      "position": [1420, 300]
    },
    {
      "parameters": {
        "conditions": {
          "string": [{ "value1": "={{$json.classification}}", "operation": "equal", "value2": "HOT" }]
        }
      },
      "name": "Is HOT Lead?",
      "type": "n8n-nodes-base.if",
      "position": [1640, 300]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "YOUR_SALES_NUMBER" },
            { "name": "message", "value": "🔥 HOT LEAD CAPTURED\\nName: {{$json.name}}\\nCountry: {{$json.country}}\\nService: {{$json.service_interest}}\\nUrgency: {{$json.urgency_1_to_5}}/5\\nPain: {{$json.pain_point}}\\nNext Step: {{$json.next_step}}\\nMessage: {{$json.message}}" }
          ]
        }
      },
      "name": "Alert Sales - HOT Lead",
      "type": "n8n-nodes-base.httpRequest",
      "position": [1860, 200]
    }
  ],
  "connections": {
    "Universal Webhook": { "main": [[{ "node": "Normalize Lead Data", "type": "main", "index": 0 }]] },
    "Normalize Lead Data": { "main": [[{ "node": "Check HubSpot Duplicate", "type": "main", "index": 0 }]] },
    "Check HubSpot Duplicate": { "main": [[{ "node": "Is New Lead?", "type": "main", "index": 0 }]] },
    "Is New Lead?": { "main": [[{ "node": "AI Qualify Lead", "type": "main", "index": 0 }]] },
    "AI Qualify Lead": { "main": [[{ "node": "Parse AI Classification", "type": "main", "index": 0 }]] },
    "Parse AI Classification": { "main": [[{ "node": "Create HubSpot Contact", "type": "main", "index": 0 }]] },
    "Create HubSpot Contact": { "main": [[{ "node": "Is HOT Lead?", "type": "main", "index": 0 }]] },
    "Is HOT Lead?": { "main": [[{ "node": "Alert Sales - HOT Lead", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Tool | Frequency |
| --- | --- | --- | --- |
| Lead capture rate (visitors → leads) | >5% of traffic | Google Analytics | Weekly |
| Cost per lead (paid channels) | <$15 | Meta/Google Ads | Weekly |
| Form completion rate | >60% of form starters | Tally analytics | Weekly |
| HOT lead % of total captured | >15% | HubSpot | Weekly |
| Lead enrichment success rate | >80% | Apollo API logs | Monthly |
| Duplicate lead rate | <5% | HubSpot | Monthly |
| Time from capture to first contact | <5 minutes | n8n logs | Daily |
| Monthly leads captured (total) | 200+ | HubSpot | Monthly |
| Leads from each source | Track all channels | HubSpot source report | Monthly |
| Audit requests per month | 30+ | Tally / HubSpot | Monthly |

---

## 👥 Team Responsibilities

| Role | Responsibility |
| --- | --- |
| Automation Dev | Maintain universal webhook, fix capture errors |
| VA (Inbound) | Monitor HubSpot for manually entered leads, ensure data quality |
| Sales Lead | Review HOT lead queue daily, initiate contact within 1 hour |
| Marketing | Optimize lead magnet landing page conversion rates |
| Data Manager | Weekly data quality audit — missing fields, duplicates |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  Check HubSpot "Today's Leads" view every morning
- [ ]  Verify all HOT leads from last 24hrs were contacted
- [ ]  Check n8n for any webhook errors (capture failures)
- [ ]  Review new leads with missing data → manual enrichment
- [ ]  Confirm all form submissions went through to HubSpot
- [ ]  Ensure booking confirmations were sent for any calls booked

**Weekly:**

- [ ]  Audit lead sources: which channel driving most leads?
- [ ]  Review form abandonment rate → improve UX
- [ ]  Check AI qualification accuracy → retrain prompts if needed
- [ ]  Ensure all COLD leads enrolled in Stage 5 Nurturing sequence

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost |
| --- | --- | --- |
| [Tally.so](http://Tally.so) | Lead capture forms | Free |
| [Cal.com](http://Cal.com) | Booking / call scheduling | Free |
| HubSpot | CRM, contact storage | Free |
| n8n | Universal capture pipeline | Free (self-hosted) |
| [Apollo.io](http://Apollo.io) API | Lead enrichment on capture | Free tier |
| WhatsApp Business API | Inbound capture | Free |
| Tidio / [Tawk.to](http://Tawk.to) | Website chatbot | Free tier |
| Mautic | Auto-sequence enrollment | Free (self-hosted) |
| Meta Lead Ads | Social capture forms | Ad spend |
| Google Analytics 4 | Conversion tracking | Free |

---

## ⚠️ Risks & Bottlenecks

| Risk | Mitigation |
| --- | --- |
| Webhook failures losing leads | n8n error monitoring + email alert on failure |
| Low form completion rate | Reduce fields to minimum (name + email + service + country) |
| AI misclassification | Review classification weekly, refine prompt monthly |
| Slow response to HOT leads | WhatsApp alert + HubSpot task auto-created |
| Missing UTM tracking | Enforce UTM on all campaigns, audit monthly |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Form conversion test | A/B test form headline and field count | Every 3 weeks |
| Lead magnet CTR test | Test different lead magnet offers | Monthly |
| AI prompt refinement | Review misclassified leads → improve prompt | Monthly |
| Booking link placement | Test CTA position on landing pages | Monthly |

---

**⬅️ Previous Stage:** [💡 Stage 2 — Interest & Trust Engine](https://www.notion.so/35be5082b9d48193a696ee236609c3be)

**➡️ Next Stage:** [🗂️ Stage 4 — Lead Management Engine](https://www.notion.so/35be5082b9d48137bf97c23f5343c1c4)