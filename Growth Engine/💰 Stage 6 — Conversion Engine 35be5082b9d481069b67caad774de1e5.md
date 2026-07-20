# 💰 Stage 6 — Conversion Engine

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 6 OF 12 — Every lead has been warmed, scored, and is ready. This engine converts qualified prospects into paying clients through a structured, consultative, AI-assisted sales process.**
> 

---

## 💰 Core Objective

> **Turn HOT leads into signed, paid clients — through a structured discovery → audit → proposal → close process that is personalized, value-anchored, and backed by automation.**
> 

This stage is engineered to:

- Create a frictionless path from "interested" to "signed contract"
- Give sales reps a repeatable, high-confidence process for every call
- Use AI to prepare reps before every discovery call with prospect research
- Generate proposals in <2 hours using AI + pre-built templates
- Handle objections with a proven response library
- Follow up persistently without being pushy — automation handles timing

**Inputs:** HOT leads (score 70+) from Stage 4, or leads who booked a call directly from Stage 5 nurture, or inbound audit requests from Stage 3

**Outputs:** Signed contracts in PandaDoc, first payment collected via Stripe/Razorpay, client file created in HubSpot and Notion, handoff triggered to Stage 7 (Onboarding Engine)

**Trigger to next stage:**

- Contract signed + payment received → auto-trigger Stage 7 (Onboarding Engine)
- No decision after 3 follow-ups → re-enter Stage 5 long-track nurture
- Decision declined → tag reason + enter Stage 11B Reactivation at 60-day interval

---

## 📡 Channels Used

| Channel | Purpose | Priority |
| --- | --- | --- |
| Zoom / Google Meet | Discovery calls and proposal presentations | 🔴 Critical |
| WhatsApp | Personal follow-ups, quick answers, relationship building | 🔴 Critical |
| Email | Proposal delivery, confirmation, follow-up sequences | 🔴 Critical |
| PandaDoc | Proposal creation, e-signature, contract | 🔴 Critical |
| Stripe / Razorpay | Payment collection post-signature | 🔴 Critical |
| LinkedIn DM | B2B warm approach for HOT LinkedIn leads | 🟠 High |
| Phone calls | Urgent follow-ups, time-sensitive deals | 🟠 High |
| [Cal.com](http://Cal.com) / Calendly | Call booking and rescheduling | 🟠 High |
| Loom video | Personalized video follow-ups for warm prospects | 🟡 Medium |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| AI-powered pre-call research | Arm sales rep with company intel before every call | 🔴 Critical |
| Structured discovery framework (SPIN/BANT) | Qualify and understand prospect deeply before proposing | 🔴 Critical |
| Free business audit offer | Earn trust + demonstrate expertise before asking for money | 🔴 Critical |
| Consultative proposal (problem → solution → ROI) | Value-anchored selling, not feature-listing | 🔴 Critical |
| AI proposal generation | Produce personalized, polished proposals in <2 hours | 🔴 Critical |
| Objection handling playbook | Prepared responses to every common objection | 🔴 Critical |
| Triple reminder sequence (no-shows) | Email + WhatsApp + SMS before every call | 🟠 High |
| Urgency/scarcity framing | Limited spots, time-bound offer | 🟠 High |
| Payment plan options | Reduce friction for budget-sensitive prospects | 🟠 High |
| Automated post-call follow-up | Persistent follow-up without manual effort | 🟠 High |
| Loom video proposal walkthrough | Personal touch for large deals | 🟡 Medium |
| Social proof at point of proposal | Include case study + testimonial in proposal doc | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Sales pipeline | HubSpot deal stages | Track every deal from SQL → Closed Won/Lost |
| Pre-call research database | n8n + Apollo + OpenAI | Auto-pull company info before every discovery call |
| Proposal library | PandaDoc templates | Pre-built, customizable by service |
| Objection library | Notion page (linked) | All objections + proven responses by category |
| Call recording + notes | Zoom + Notion | Archive every discovery call with AI summary |
| Contract storage | PandaDoc / Google Drive | All signed contracts with version history |
| Payment records | Stripe / Razorpay | Invoice, payment, receipt per client |
| Win/loss database | HubSpot + Google Sheets | Track why deals close or fall through |
| Sales rep performance tracker | HubSpot reports | Close rate, avg deal size, cycle length per rep |
| Competitor objection log | Notion | Track objections mentioning competitors → update playbook |

**Sales Pipeline Stages (HubSpot):**

```jsx
1. SQL (Sales Qualified Lead) — Call booked
2. Discovery Call Completed — Call done, notes logged
3. Audit In Progress — Free audit being prepared (if applicable)
4. Proposal Sent — PandaDoc opened
5. Negotiation — Price/terms discussion
6. Contract Sent — E-signature pending
7. Closed Won — Payment received
8. Closed Lost — Deal declined (tag reason)
```

---

## 📤 Outbound Systems

| System | Sequence | Tool | Purpose |
| --- | --- | --- | --- |
| Call booking confirmation | Instant email + WhatsApp on booking | n8n + [Cal.com](http://Cal.com) webhook | Reduce no-shows |
| 24hr reminder | Email + WhatsApp day before call | n8n | Confirm attendance |
| 1hr reminder | WhatsApp 60 mins before | n8n + WATI | Last-touch reminder |
| Post-call: no decision follow-up | Day 2, Day 5, Day 10 emails + Day 7 WhatsApp | n8n + Mautic | Persistent but respectful follow-up |
| Post-call: proposal follow-up | Email day after proposal sent, WhatsApp Day 3 | n8n | Ensure proposal was reviewed |
| Contract not signed after 48hrs | WhatsApp check-in + revised offer | n8n + WATI | Close last-mile hesitation |
| Closed lost re-engagement | Move to 60-day dormant → reactivation | n8n + Mautic | Recover declined deals later |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Post-proposal referral ask | "Know anyone else who'd benefit?" in proposal email | Generate referrals from warm prospects even pre-close |
| Closed Won → Ambassador pipeline | New client invited to referral program at signature | Start referral relationship from Day 1 |
| Case study permission at close | Ask client at signing to be featured as case study | Build social proof pipeline proactively |
| Lost deal community invite | Prospects who declined → invite to free WhatsApp group | Keep them in ecosystem, capture later |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Call booking webhook | n8n + [Cal.com](http://Cal.com) | Call booked | Update HubSpot to SQL, send confirmation |
| Pre-call research generator | n8n + OpenAI + Apollo | 2 hours before call | Send rep AI brief on prospect |
| Confirmation email | n8n + Gmail | Booking confirmed | Branded confirmation + prep questions |
| 24hr WhatsApp reminder | n8n + WATI | 24hrs before call | Reduce no-show rate |
| 1hr WhatsApp reminder | n8n + WATI | 60 mins before call | Final confirmation |
| HubSpot deal creation | n8n + HubSpot | Call booked | Create deal record automatically |
| Proposal generation trigger | n8n + OpenAI + PandaDoc | Call marked "completed" | Draft proposal in HubSpot + notify rep |
| Post-call no-decision sequence | n8n + Mautic | Outcome = no_decision | 3-email + 1-WhatsApp follow-up over 10 days |
| Contract signed → onboarding trigger | n8n + PandaDoc webhook | Signature event received | Trigger Stage 7 workflow + notify ops team |
| Payment received → client created | n8n + Stripe/Razorpay | Payment confirmed | Create client record + send welcome package |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Pre-call prospect brief | GPT-4o | Company name, website, LinkedIn, industry | 1-page brief: company overview, likely pain points, recommended service, objection predictions | Arm sales rep before every call |
| Proposal generator | GPT-4o | Discovery call notes + service selected + budget | Full proposal draft: problem, solution, deliverables, timeline, pricing, ROI projection | Proposals in <2 hours |
| Objection handler | GPT-4o | Prospect's objection text | Best response from playbook + custom version for this prospect | Real-time objection coaching |
| Call summary generator | GPT-4o | Call transcript / notes | Key points, agreed next steps, objections raised, recommended follow-up message | Post-call logging |
| Follow-up email writer | GPT-4o-mini | Call outcome + prospect profile | Personalized follow-up email body | Higher response rates on follow-up |
| Win/loss pattern analysis | GPT-4o | Closed won vs. closed lost data | Patterns in what closes deals → recommendations | Improve close rate over time |

**AI Prompt — Pre-Call Prospect Brief:**

```jsx
You are preparing a sales rep at Nivy Digital for a discovery call.

Prospect details:
- Name: {{prospect_name}}
- Company: {{company}}
- Website: {{website}}
- Industry: {{industry}}
- Country: {{country}}
- Service interest: {{service_interest}}
- Lead source: {{source}}
- Message/context: {{message}}

Nivy Digital services: VA, bookkeeping/accounting, digital marketing, web development, automation.

Generate a pre-call brief with:
1. Company overview (3 sentences — who they are, what they do, market position)
2. Likely pain points (3 bullet points based on industry + service interest)
3. Recommended service package (with rationale)
4. Anticipated objections (top 3 with suggested responses)
5. Discovery questions to ask (5 questions to uncover need + budget)
6. Competitor awareness (who else they might be evaluating)
7. Recommended deal structure (package tier + price range)

Output in clean bullet format. No fluff.
```

**AI Prompt — Proposal Generator:**

```jsx
You are generating a sales proposal for Nivy Digital.

Client profile:
- Name: {{name}}
- Company: {{company}}
- Industry: {{industry}}
- Country: {{country}}
- Problem identified: {{pain_point}}
- Budget discussed: {{budget}}
- Timeline: {{timeline}}
- Service recommended: {{service}}

Generate a professional proposal with these sections:
1. Executive Summary — Their problem in their words
2. Our Understanding of Your Challenge — Empathetic restatement
3. Proposed Solution — Service package with specifics
4. Deliverables — Bullet list of exactly what they get
5. Timeline — Week-by-week for first 30 days
6. Investment — Pricing with clear ROI framing
7. Why Nivy — 3 differentiators + 1 relevant case study reference
8. Next Step — Single clear CTA (sign + pay)

Tone: Confident, consultative, human. Not corporate.
Length: 400-500 words.
Output: structured sections only. No extra text.
```

---

## 🤖 n8n Automation Code — Full Conversion Engine Workflow

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 6 Conversion Engine",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "call-booked" },
      "name": "Webhook - Call Booked",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.email}}",
        "properties": {
          "hs_lead_status": "IN_PROGRESS",
          "lifecyclestage": "salesqualifiedlead"
        }
      },
      "name": "Update HubSpot to SQL",
      "type": "n8n-nodes-base.hubspot",
      "position": [320, 300]
    },
    {
      "parameters": {
        "resource": "deal",
        "operation": "create",
        "properties": {
          "dealname": "={{$json.name}} — {{$json.company}} — {{$json.service_interest}}",
          "pipeline": "default",
          "dealstage": "appointmentscheduled",
          "hubspot_owner_id": "YOUR_SALES_REP_ID"
        }
      },
      "name": "Create HubSpot Deal",
      "type": "n8n-nodes-base.hubspot",
      "position": [540, 300]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Generate a pre-call brief for a discovery call with {{$json.name}} from {{$json.company}} in {{$json.industry}} ({{$json.country}}). Interested in: {{$json.service_interest}}. Message: {{$json.message}}. Include: company overview, likely pain points, 5 discovery questions, top 3 objections + responses, recommended package. Output in clean bullet format.\"}]" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_OPENAI_KEY" }]
        }
      },
      "name": "AI - Pre-Call Brief",
      "type": "n8n-nodes-base.httpRequest",
      "position": [760, 200]
    },
    {
      "parameters": {
        "fromEmail": "team@nivy.com",
        "toEmail": "sales@nivy.com",
        "subject": "📞 CALL PREP — {{$json.name}} | {{$json.company}} | {{$json.callDate}}",
        "text": "Pre-call brief for your upcoming discovery call:\n\n{{$node['AI - Pre-Call Brief'].json.choices[0].message.content}}\n\nProspect email: {{$json.email}}\nCall time: {{$json.callDate}} {{$json.callTime}}\nMeet link: {{$json.meetLink}}\n\nGood luck!"
      },
      "name": "Send Pre-Call Brief to Rep",
      "type": "n8n-nodes-base.emailSend",
      "position": [980, 200]
    },
    {
      "parameters": {
        "fromEmail": "team@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "✅ Your strategy call with Nivy is confirmed — {{$json.callDate}}",
        "text": "Hi {{$json.name}}!\n\nYour strategy call is confirmed:\n📅 Date: {{$json.callDate}}\n⏰ Time: {{$json.callTime}}\n🔗 Join: {{$json.meetLink}}\n\nTo make the most of our 30 minutes, please have ready:\n- Your current monthly marketing budget\n- Your #1 growth challenge right now\n- Who else needs to be on the decision\n\nSee you soon!\nNivy Team"
      },
      "name": "Send Confirmation to Prospect",
      "type": "n8n-nodes-base.emailSend",
      "position": [760, 400]
    },
    {
      "parameters": { "amount": 23, "unit": "hours" },
      "name": "Wait 23 Hours",
      "type": "n8n-nodes-base.wait",
      "position": [980, 400]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "={{$json.phone}}" },
            { "name": "message", "value": "Hi {{$json.name}}! 👋 Your strategy call with Nivy is TOMORROW at {{$json.callTime}}. Join here: {{$json.meetLink}} — looking forward to it!" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_WHATSAPP_TOKEN" }]
        }
      },
      "name": "24hr WhatsApp Reminder",
      "type": "n8n-nodes-base.httpRequest",
      "position": [1200, 400]
    },
    {
      "parameters": { "httpMethod": "POST", "path": "call-completed" },
      "name": "Webhook - Call Completed",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 600]
    },
    {
      "parameters": {
        "conditions": {
          "string": [{ "value1": "={{$json.outcome}}", "operation": "equal", "value2": "no_decision" }]
        }
      },
      "name": "No Decision?",
      "type": "n8n-nodes-base.if",
      "position": [320, 600]
    },
    {
      "parameters": { "amount": 48, "unit": "hours" },
      "name": "Wait 48 Hours",
      "type": "n8n-nodes-base.wait",
      "position": [540, 550]
    },
    {
      "parameters": {
        "fromEmail": "team@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "Following up from our call, {{$json.name}}",
        "text": "Hi {{$json.name}},\n\nGreat speaking with you! I wanted to follow up and see if you had any questions about what we discussed.\n\nWe have a couple of spots opening up this month for new clients. Would you like to get started?\n\n[Book a quick follow-up: YOUR_BOOKING_LINK]\n\nNivy Team"
      },
      "name": "Follow-Up Email Day 2",
      "type": "n8n-nodes-base.emailSend",
      "position": [760, 550]
    },
    {
      "parameters": { "httpMethod": "POST", "path": "contract-signed" },
      "name": "Webhook - Contract Signed",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 800]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.email}}",
        "properties": {
          "lifecyclestage": "customer",
          "hs_lead_status": "CLOSED_WON",
          "close_date": "={{$now}}"
        }
      },
      "name": "Update HubSpot - Closed Won",
      "type": "n8n-nodes-base.hubspot",
      "position": [320, 800]
    },
    {
      "parameters": {
        "chatId": "YOUR_TEAM_TELEGRAM_CHAT",
        "text": "🎉 NEW CLIENT SIGNED!\n\nClient: {{$json.name}} — {{$json.company}}\nCountry: {{$json.country}}\nService: {{$json.service}}\nDeal value: ${{$json.amount}}\n\nTrigger onboarding now! 🚀"
      },
      "name": "Notify Team - Closed Won",
      "type": "n8n-nodes-base.telegram",
      "position": [540, 800]
    }
  ],
  "connections": {
    "Webhook - Call Booked": { "main": [[{ "node": "Update HubSpot to SQL", "type": "main", "index": 0 }]] },
    "Update HubSpot to SQL": { "main": [[{ "node": "Create HubSpot Deal", "type": "main", "index": 0 }]] },
    "Create HubSpot Deal": { "main": [[{ "node": "AI - Pre-Call Brief", "type": "main", "index": 0 }, { "node": "Send Confirmation to Prospect", "type": "main", "index": 0 }]] },
    "AI - Pre-Call Brief": { "main": [[{ "node": "Send Pre-Call Brief to Rep", "type": "main", "index": 0 }]] },
    "Send Confirmation to Prospect": { "main": [[{ "node": "Wait 23 Hours", "type": "main", "index": 0 }]] },
    "Wait 23 Hours": { "main": [[{ "node": "24hr WhatsApp Reminder", "type": "main", "index": 0 }]] },
    "Webhook - Call Completed": { "main": [[{ "node": "No Decision?", "type": "main", "index": 0 }]] },
    "No Decision?": { "main": [[{ "node": "Wait 48 Hours", "type": "main", "index": 0 }]] },
    "Wait 48 Hours": { "main": [[{ "node": "Follow-Up Email Day 2", "type": "main", "index": 0 }]] },
    "Webhook - Contract Signed": { "main": [[{ "node": "Update HubSpot - Closed Won", "type": "main", "index": 0 }]] },
    "Update HubSpot - Closed Won": { "main": [[{ "node": "Notify Team - Closed Won", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Call booking rate (HOT leads) | >50% of HOT leads book a call | HubSpot | Weekly |
| Call show-up rate | >75% | [Cal.com](http://Cal.com) / Calendly | Weekly |
| Discovery-to-proposal rate | >70% of calls → proposal sent | HubSpot | Monthly |
| Proposal acceptance rate | >40% | PandaDoc analytics | Monthly |
| Overall closing rate (calls → close) | >25% | HubSpot | Monthly |
| Average deal value | $2,000+ | HubSpot | Monthly |
| Sales cycle length | <14 days from call to close | HubSpot | Monthly |
| Follow-up response rate | >30% reply to follow-ups | Mautic | Monthly |
| Closed Lost reason tracking | 100% tagged with loss reason | HubSpot | Monthly |
| Revenue from Stage 6 per month | Track vs. target | HubSpot + Stripe | Monthly |

---

## 👥 Team Responsibilities

| Role | Daily Tasks | Weekly Tasks |
| --- | --- | --- |
| Sales Rep | Call HOT leads, run discovery calls, send proposals | Review close rate, update objection playbook |
| Sales Manager | Review deal pipeline, coach reps on stalled deals | Weekly pipeline review, win/loss analysis |
| Automation Dev | Monitor n8n booking + follow-up workflows | Build new automation from sales team requests |
| VA (Sales Support) | Prepare PandaDoc proposals post-call, log call notes | Archive closed deals, update contract library |
| Founder | Handle VIP deals personally | Weekly revenue review with sales manager |

---

## 📋 SOP — Daily Execution Checklist

- [ ]  Check HubSpot "Today's Calls" — prep pre-call briefs for all scheduled calls
- [ ]  Run discovery calls — log notes in HubSpot within 1 hour of call ending
- [ ]  Send proposals within 24 hours of completed discovery call
- [ ]  Check PandaDoc — any proposals opened but not signed >48hrs? → follow up
- [ ]  Check "No Decision" follow-up queue — emails sent? WhatsApp sent?
- [ ]  Update HubSpot deal stage for every deal touched today
- [ ]  Review any new contract signatures → trigger onboarding notification

**Weekly Tasks:**

- [ ]  Monday: Review all open deals in pipeline — what's stuck?
- [ ]  Tuesday: Win/loss review — why did last week's closed lost deals decline?
- [ ]  Wednesday: Update objection playbook with new objections from calls
- [ ]  Thursday: Review proposal conversion rate — which proposal format converts best?
- [ ]  Friday: Pull weekly revenue report → report to master KPI dashboard

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| [Cal.com](http://Cal.com) | Call booking + scheduling | Free | [cal.com](http://cal.com) |
| Zoom / Google Meet | Discovery and closing calls | Free | [zoom.us](http://zoom.us) |
| PandaDoc | Proposal creation + e-signature | Free tier | [pandadoc.com](http://pandadoc.com) |
| Stripe | International payment collection | 2.9% + 30¢ | [stripe.com](http://stripe.com) |
| Razorpay | India payment collection | 2% | [razorpay.com](http://razorpay.com) |
| HubSpot | Deal pipeline, close tracking | Free | [hubspot.com](http://hubspot.com) |
| n8n | Booking + follow-up automation | Free (self-hosted) | [n8n.io](http://n8n.io) |
| OpenAI API | Pre-call brief + proposal generation | Pay per use | [openai.com](http://openai.com) |
| WATI / WhatsApp API | Call reminders + follow-ups | Free tier | [wati.io](http://wati.io) |
| Loom | Personalized video follow-ups | Free tier | [loom.com](http://loom.com) |
| Notion | Objection library, call notes | Free | [notion.so](http://notion.so) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| High no-show rate | Medium | High | Triple reminder (email + WhatsApp + SMS), rebook immediately |
| Slow proposal delivery (>48hrs) | High | High | AI proposal generator + PandaDoc template — target <2hrs |
| Proposal rejected on price | High | High | Always have L1 entry package option + payment plan |
| Long decision time | Medium | Medium | Introduce scarcity (limited spots), time-bound pricing |
| Sales rep not logging call notes | High | Medium | n8n auto-creates HubSpot task post-call reminder |
| No follow-up after no-decision | High | Critical | Automated 3-touch sequence in n8n — no manual required |
| Lost deals never reactivated | Medium | High | Auto-tag Closed Lost → enter 60-day reactivation pipeline |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Call recording review | Review 2 calls/week with sales manager → coaching notes | Weekly |
| Proposal A/B testing | Test different pricing structures and framing | Monthly |
| Objection playbook update | Add new objections + winning responses after each week | Weekly |
| Close rate by source tracking | Which lead sources close fastest? → prioritize in Stage 1 | Monthly |
| Sales cycle compression | Track bottleneck stage → add automation to speed up | Monthly |
| Win/loss pattern analysis | GPT-4o analysis of closed deals → strategic recommendations | Monthly |

---

**⬅️ Previous Stage:** [💌 Stage 5 — Nurturing Engine](https://www.notion.so/35be5082b9d4813fa004e1de927f2042)

**➡️ Next Stage:** [📦 Stage 7 — Onboarding Engine](https://www.notion.so/35be5082b9d481c6b7adda695cb644e2)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Pre-call brief pulls from enriched lead data |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Pre-call brief, proposal generator, objection handler prompts |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Close rate, deal value, and cycle length tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Stage 6 is the primary consumer of this system |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Full conversion funnel flow and pipeline stages mapped here |