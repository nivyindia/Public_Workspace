# 💌 Stage 5 — Nurturing Engine

> **⚠️ SUPERSEDED — CJE 13-stage system**
> This page is part of the legacy 13-stage CJE (Customer Journey Engineering) documentation system. As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 5 OF 12 — Most leads don't buy on first contact. The Nurturing Engine keeps Nivy top-of-mind across every channel, automatically, until the prospect is ready to convert.**
> 

---

## 💌 Core Objective

> **Move WARM and COLD leads from curiosity to conviction — using automated, multi-channel, personalized sequences that build trust, demonstrate expertise, and create urgency over time.**
> 

This stage is engineered to:

- Prevent leads from going cold between capture and conversion
- Build a consistent relationship through email, WhatsApp, retargeting, and community
- Surface high-intent signals (re-opens, re-clicks, pricing page visits) in real time
- Auto-graduate WARM leads to HOT when their behavior signals readiness
- Deliver value at every touchpoint so Nivy feels like a trusted advisor, not a salesperson

**Inputs:** WARM leads (score 40–69) and COLD leads (score <40) from Stage 4 — segmented by industry, country, and service interest

**Outputs:** Score-upgraded leads ready for Stage 6 (Conversion), booked calls, audit requests, or re-engaged cold leads returning to pipeline

**Trigger to next stage:**

- Lead score crosses 70 → HOT → auto-exit nurture → Stage 6 (Conversion Engine)
- Lead books call directly from email/WhatsApp CTA → Stage 6
- Lead requests free audit → Stage 6
- No engagement after 21-day sequence → Stage 11B (Reactivation Engine)

---

## 📡 Channels Used

| Channel Type | Platform/Tool | Frequency | Priority |
| --- | --- | --- | --- |
| Email sequences | Mautic / Brevo | 3x per week | 🔴 Critical |
| WhatsApp follow-ups | WATI + WhatsApp Business API | 1x per week | 🔴 Critical |
| Retargeting ads | Meta retargeting, Google remarketing | Always-on | 🔴 Critical |
| Community touchpoints | WhatsApp Group, Telegram channel | Daily value posts | 🟠 High |
| LinkedIn engagement | Likes, comments, DM follow-ups | 2–3x per week | 🟠 High |
| YouTube remarketing | YouTube video ad sequences | 3–5 video series | 🟠 High |
| Telegram broadcasts | Value content + CTAs | 2x per week | 🟡 Medium |
| SMS (backup) | For high-urgency follow-ups | Sparingly | 🟡 Medium |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| Educational email sequences (7–21 day) | Systematic trust building without selling | 🔴 Critical |
| AI-personalized email bodies | Higher open and reply rates | 🔴 Critical |
| Multi-channel sequencing (email + WhatsApp) | Reach leads wherever they engage | 🔴 Critical |
| Client case studies by industry | Proof that Nivy works for businesses like theirs | 🔴 Critical |
| Free value content (checklists, guides, audits) | Demonstrate expertise before asking for anything | 🔴 Critical |
| Soft CTA progression (read → download → call) | Gradual commitment ladder | 🟠 High |
| ROI calculator content | Financial logic for hiring Nivy | 🟠 High |
| Re-engagement at day 14 (no opens) | Recover leads who went quiet | 🟠 High |
| Behavioral trigger emails | Send right content based on what they clicked | 🟠 High |
| Urgency/scarcity messaging (limited spots) | Create decision momentum | 🟡 Medium |
| Webinar invites within sequence | High-engagement trust event | 🟡 Medium |
| Community invite after value email | Convert email leads into community members | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Sequence enrollment tracking | Mautic campaign manager | Know which sequence each lead is in |
| Email engagement data | Mautic / Brevo analytics | Track opens, clicks, replies per lead |
| Behavioral trigger logging | HubSpot + n8n | Log every signal → update score |
| Segment-based content library | Google Drive / Notion | Content organized by industry and service |
| Sequence performance database | Google Sheets + n8n | Track which emails drive the most graduations |
| Lead progression tracking | HubSpot lifecycle stage | Know when leads move from Nurture → HOT |
| WhatsApp reply tracking | WATI dashboard | Flag positive replies for sales handoff |
| Unsubscribe + fatigue monitoring | Mautic | Track unsubscribes, reduce frequency if rising |

**21-Day Nurture Sequence Blueprint:**

```jsx
Day 0  — Email: Welcome + lead magnet delivery
Day 1  — WhatsApp: "Did you get the resource?" check-in
Day 3  — Email: Case study (industry-matched) with real numbers
Day 5  — Email: "The #1 mistake [industry] businesses make with [service]"
Day 7  — WhatsApp: Personal check-in — any questions?
Day 10 — Email: ROI breakdown / free calculator
Day 12 — Email: Behind-the-scenes — how Nivy delivers results
Day 14 — Email: "Your free audit is still available" (soft CTA)
Day 16 — LinkedIn: Comment or engage with their post (manual touch)
Day 18 — WhatsApp: Direct invitation — "I'd love 20 mins with you"
Day 21 — Email: Final check-in — "Still thinking it over?"

If no engagement by Day 21 → move to Stage 11B Reactivation
If opens but no reply → extend to 30-day long track
If books call at any point → immediately exit to Stage 6
```

---

## 📤 Outbound Systems

| System | Sequence | Tool | Purpose |
| --- | --- | --- | --- |
| Post-connection LinkedIn DM nurture | Day 1: insight share, Day 5: resource offer, Day 10: audit offer | PhantomBuster / Manual | Warm up new LinkedIn connections |
| Cold responder nurture | Reply detected → case study → webinar invite → call offer | n8n + Mautic | Move interested cold email responders forward |
| WhatsApp multi-day follow-up | Day 1: resource, Day 7: check-in, Day 18: call invite | WATI + n8n | High-touch warm channel |
| Re-engagement for 14-day non-openers | Day 14: resend with new subject + preview | Mautic | Recover leads that went cold |
| Retargeting ad escalation | Increase frequency for leads visiting pricing page | Meta Ads Manager | Re-engage high-intent visitors |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Tool | Purpose |
| --- | --- | --- | --- |
| Post-email community invite | Sequence email #3 invites to free WhatsApp group | Mautic + WATI | Convert email leads into community members |
| Community value → booking | Weekly group insight drives inbound booking requests | WhatsApp Group | Passive conversion from community |
| Webinar share incentive | "Invite a colleague = get bonus resource" | n8n referral link | Grow nurture audience virally |
| Case study sharing CTA | Email includes "Tag a founder who needs this" | Mautic | Organic email forwarding |
| Sequence exit referral | Last email includes referral link for their network | Mautic | Viral loop even from non-converters |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Sequence auto-enrollment | n8n + Mautic | Lead classified WARM or COLD in Stage 4 | Start correct sequence immediately |
| Email send scheduling | Mautic campaign | Pre-set day/time in sequence | Send at optimal time (10am local) |
| WhatsApp follow-up trigger | n8n + WATI | Day 1, 7, 18 of sequence | Multi-channel touchpoint |
| Behavioral trigger: pricing page | n8n + HubSpot | Lead visits pricing page | Send "ready to talk?" email within 1 hour |
| Behavioral trigger: re-open after silence | n8n + Mautic | Lead opens email after 7+ days | Send follow-up within 24hrs |
| Score upgrade on engagement | n8n + HubSpot | Email click / WhatsApp reply / link visit | Update score, check if threshold crossed |
| HOT lead graduation | n8n | Score crosses 70 | Exit nurture → alert sales → Stage 6 |
| 14-day non-opener re-engagement | Mautic rule | No open in 14 days | Resend Day 3 with new subject line |
| 21-day sequence exit | n8n | Sequence completes, no conversion | Flag for Stage 11B Reactivation |
| Webinar registration capture | n8n + Mautic | Webinar signup via email CTA | Add to webinar sequence + update score |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Email body personalization | GPT-4o | Lead name, company, industry, pain point | Personalized 150-200 word email body | Higher engagement rates |
| Subject line optimization | GPT-4o-mini | Email theme + audience segment | 3 subject line variants to A/B test | Improve open rates |
| Case study matching | GPT-4o-mini | Lead industry + service interest | Most relevant case study from library | Right proof at right time |
| Sequence fatigue detection | GPT-4o | Lead engagement history | Risk score + recommendation (reduce/pause/escalate) | Prevent unsubscribes |
| Re-engagement message generator | GPT-4o | Days since last engagement + reason for going cold | Personalized re-engagement message | Recover lost leads |
| Readiness signal detection | GPT-4o | Lead's email reply or WhatsApp message text | HOT/WARM/COLD + urgency + recommended response | Instant sales handoff decision |

**AI Prompt — Email Personalization (runs per lead per email):**

```jsx
You are writing a nurture email for Nivy Digital.

Lead profile:
- Name: {{name}}
- Company: {{company}}
- Industry: {{industry}}
- Country: {{country}}
- Service interest: {{service_interest}}
- Pain point: {{pain_point}}
- Sequence day: Day {{day_number}}
- Email theme: {{email_theme}}

Instructions:
- Open with a pattern-interrupt hook referencing their specific industry or problem
- Deliver genuine value (insight, example, or case study) in 120-150 words
- Soft CTA at end — no hard sell. Options: read article, download resource, reply with a question
- Professional but human tone — write like a trusted advisor, not a marketer
- Never use generic phrases like "I hope this email finds you well"

Output: subject line + email body only. No extra text. No markdown formatting.
```

---

## 🤖 n8n Automation Code — Full Multi-Channel Nurture Sequence

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 5 Multi-Channel Nurture Engine",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "start-nurture" },
      "name": "Webhook - Enter Nurture",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 300]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o-mini" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Write a welcome email for {{$json.name}} from {{$json.company}} in {{$json.industry}} interested in {{$json.service_interest}}. Pain point: {{$json.pain_point}}. Day 0 of nurture. Deliver their free resource. 150 words. Output subject + body only.\"}]" },
            { "name": "max_tokens", "value": "500" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_OPENAI_KEY" }]
        }
      },
      "name": "AI - Generate Welcome Email",
      "type": "n8n-nodes-base.httpRequest",
      "position": [320, 200]
    },
    {
      "parameters": {
        "jsCode": "const content = $json.choices[0].message.content;\nconst lines = content.split('\\n');\nconst subject = lines[0].replace('Subject: ', '').trim();\nconst body = lines.slice(2).join('\\n').trim();\nreturn [{ json: { subject, body, ...($node['Webhook - Enter Nurture'].json) } }];"
      },
      "name": "Parse Email Content",
      "type": "n8n-nodes-base.code",
      "position": [540, 200]
    },
    {
      "parameters": {
        "fromEmail": "growth@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "={{$json.subject}}",
        "text": "={{$json.body}}"
      },
      "name": "Day 0 - Send Welcome Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [760, 200]
    },
    {
      "parameters": { "amount": 1, "unit": "days" },
      "name": "Wait 1 Day",
      "type": "n8n-nodes-base.wait",
      "position": [320, 400]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "={{$json.phone}}" },
            { "name": "message", "value": "Hi {{$json.name}}! 👋 Just checking you received the free resource we sent yesterday. Any questions? Happy to help — Nivy Team" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_WHATSAPP_TOKEN" }]
        }
      },
      "name": "Day 1 - WhatsApp Check-in",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 400]
    },
    {
      "parameters": { "amount": 2, "unit": "days" },
      "name": "Wait 2 More Days",
      "type": "n8n-nodes-base.wait",
      "position": [760, 400]
    },
    {
      "parameters": {
        "fromEmail": "growth@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "📊 How we helped a {{$json.industry}} business grow 3x in 90 days",
        "text": "Hi {{$json.name}},\n\nHere's a quick case study from a business very similar to yours...\n\n[Insert case study content here]\n\nWant to see how we'd approach your business specifically?\n\nBook a free 30-minute strategy call: YOUR_BOOKING_LINK\n\nNivy Team"
      },
      "name": "Day 3 - Case Study Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [980, 400]
    },
    {
      "parameters": { "amount": 7, "unit": "days" },
      "name": "Wait 7 Days",
      "type": "n8n-nodes-base.wait",
      "position": [1200, 400]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "={{$json.phone}}" },
            { "name": "message", "value": "Hi {{$json.name}}, hope things are going well at {{$json.company}}! 🙌 We have a free business audit offer this week — takes 20 minutes and gives you a clear growth roadmap. Interested? Just reply YES." }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_WHATSAPP_TOKEN" }]
        }
      },
      "name": "Day 7 - WhatsApp Personal",
      "type": "n8n-nodes-base.httpRequest",
      "position": [1420, 400]
    },
    {
      "parameters": {
        "httpMethod": "POST",
        "path": "pricing-page-visit"
      },
      "name": "Webhook - Pricing Page Visit",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 600]
    },
    {
      "parameters": {
        "fromEmail": "growth@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "You were just checking our pricing — any questions?",
        "text": "Hi {{$json.name}},\n\nI noticed you were looking at our pricing page — totally makes sense to review numbers before making a decision.\n\nI'd love to walk you through which package makes the most sense for your specific goals at {{$json.company}}.\n\nWould a quick 20-minute call this week work?\n\n[Book here: YOUR_BOOKING_LINK]\n\n— Nivy Team"
      },
      "name": "Behavioral - Pricing Page Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [320, 600]
    }
  ],
  "connections": {
    "Webhook - Enter Nurture": { "main": [[{ "node": "AI - Generate Welcome Email", "type": "main", "index": 0 }, { "node": "Wait 1 Day", "type": "main", "index": 0 }]] },
    "AI - Generate Welcome Email": { "main": [[{ "node": "Parse Email Content", "type": "main", "index": 0 }]] },
    "Parse Email Content": { "main": [[{ "node": "Day 0 - Send Welcome Email", "type": "main", "index": 0 }]] },
    "Wait 1 Day": { "main": [[{ "node": "Day 1 - WhatsApp Check-in", "type": "main", "index": 0 }]] },
    "Day 1 - WhatsApp Check-in": { "main": [[{ "node": "Wait 2 More Days", "type": "main", "index": 0 }]] },
    "Wait 2 More Days": { "main": [[{ "node": "Day 3 - Case Study Email", "type": "main", "index": 0 }]] },
    "Day 3 - Case Study Email": { "main": [[{ "node": "Wait 7 Days", "type": "main", "index": 0 }]] },
    "Wait 7 Days": { "main": [[{ "node": "Day 7 - WhatsApp Personal", "type": "main", "index": 0 }]] },
    "Webhook - Pricing Page Visit": { "main": [[{ "node": "Behavioral - Pricing Page Email", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Email sequence open rate | >40% | Mautic / Brevo | Weekly |
| Email click-through rate | >10% | Mautic / Brevo | Weekly |
| WhatsApp reply rate | >25% | WATI dashboard | Weekly |
| Nurture-to-call conversion rate | >15% of WARM leads | HubSpot | Monthly |
| WARM → HOT graduation rate | >20% within 21 days | HubSpot | Monthly |
| Average nurture cycle length | <21 days for WARM | HubSpot | Monthly |
| Unsubscribe rate | <1% per campaign | Mautic | Weekly |
| Leads completing full sequence | Track % | Mautic | Monthly |
| Behavioral trigger email open rate | >55% | Mautic | Weekly |
| Leads exiting to Stage 11B (no conversion) | <40% of total | HubSpot | Monthly |

---

## 👥 Team Responsibilities

| Role | Daily Tasks | Weekly Tasks |
| --- | --- | --- |
| Email Marketing Specialist | Monitor sequence open rates, flag low-performing emails | Rewrite lowest-click email, A/B test subject lines |
| Content Strategist | Ensure case study library is current (3 per industry) | Pull new case studies from delivery team |
| VA (Nurture) | Review WhatsApp replies, route positive replies to sales | Clean unsubscribes, update segment tags |
| Automation Dev | Monitor n8n sequence for errors, check behavioral triggers | Build new behavioral trigger workflows |
| Sales Lead | Review HOT lead graduations from nurture | Audit WARM leads stuck >14 days |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  Check Mautic dashboard: open rates on active sequences
- [ ]  Review WATI for WhatsApp replies — positive replies → flag for sales handoff
- [ ]  Check n8n for behavioral triggers fired (pricing page, re-opens)
- [ ]  Review HOT lead graduations from overnight scoring → confirm handoff to Stage 6
- [ ]  Flag any leads with 14+ days of zero engagement → trigger re-engagement

**Weekly Tasks:**

- [ ]  Monday: Pull sequence performance report — which email has lowest CTR?
- [ ]  Tuesday: Rewrite underperforming email with new angle
- [ ]  Wednesday: Update case study library if new client results available
- [ ]  Thursday: Review WARM leads stuck >14 days → manual outreach or upgrade sequence
- [ ]  Friday: Report nurture metrics to master KPI dashboard

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| Mautic (self-hosted) | Email sequences, automation, scoring | Free | [mautic.org](http://mautic.org) |
| Brevo | Email delivery backup + SMTP | Free tier | [brevo.com](http://brevo.com) |
| WATI | WhatsApp Business API sequences | Free tier | [wati.io](http://wati.io) |
| HubSpot CRM | Lead stage tracking, behavioral signals | Free | [hubspot.com](http://hubspot.com) |
| n8n (self-hosted) | Behavioral triggers, sequence orchestration | Free | [n8n.io](http://n8n.io) |
| Meta Ads Manager | Retargeting campaigns | Ad spend | [facebook.com/ads](http://facebook.com/ads) |
| OpenAI API | Email personalization | Pay per use | [openai.com](http://openai.com) |
| Canva | Lead magnet design (PDFs, checklists) | Free | [canva.com](http://canva.com) |
| Google Drive | Case study and content library | Free | [drive.google.com](http://drive.google.com) |
| Zoom | Webinar delivery | Free tier | [zoom.us](http://zoom.us) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Leads unsubscribing from sequence | Medium | High | Personalize content, reduce frequency to 3x/week max |
| WhatsApp messages flagged as spam | Medium | High | Space messages 5+ days apart, keep personal tone |
| Sequence fatigue (too many emails) | High | Medium | Cap at 8 emails per 30 days, pause on low engagement |
| Case study library going stale | High | High | Monthly update from delivery team, mandatory SOP |
| No conversion after full 21-day sequence | Medium | High | Auto-move to Stage 11B Reactivation — don't abandon |
| AI email personalization errors | Low | Medium | Human review of first email per new segment |
| Behavioral triggers misfiring | Low | High | Test all trigger workflows in sandbox before live |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Email subject line A/B testing | 2 variants per email, 50/50 split, pick winner at 48hrs | Every 2 weeks |
| Sequence conversion audit | Track which email in sequence drives most call bookings | Monthly |
| Case study performance tracking | Tag which case studies drive most clicks → promote winners | Monthly |
| Behavioral trigger expansion | Add new triggers based on new tracked behaviors | Monthly |
| Unsubscribe root cause analysis | Review why leads unsubscribe → fix content or frequency | Monthly |
| Nurture-to-HOT conversion rate optimization | Test different day-sequence timings | Quarterly |

---

**⬅️ Previous Stage:** [🗂️ Stage 4 — Lead Management Engine](https://www.notion.so/35be5082b9d48137bf97c23f5343c1c4)

**➡️ Next Stage:** [💰 Stage 6 — Conversion Engine](https://www.notion.so/35be5082b9d481069b67caad774de1e5)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Behavioral signals and enrichment data feed sequence logic |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Email personalization, case study matching, re-engagement AI |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Nurture conversion rates tracked in master scorecard |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Email replies with objections route here for AI response |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Nurture layer placement and trigger logic shown here |