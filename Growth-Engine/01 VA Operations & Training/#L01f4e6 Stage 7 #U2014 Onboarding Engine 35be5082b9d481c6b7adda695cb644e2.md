# 📦 Stage 7 — Onboarding Engine

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 7 OF 12 — The first 7 days of a client relationship determine the next 12 months. This engine makes every new client feel secure, organized, and excited from the moment they sign.**
> 

---

## 📦 Core Objective

> **Execute a flawless, fast, and emotionally reassuring onboarding that eliminates buyer's remorse, sets clear expectations, and activates delivery within 7 days.**
> 

This stage is engineered to:

- Deliver an instant, professional "welcome experience" the moment a contract is signed
- Collect all information, assets, and access needed to begin work — in under 48 hours
- Create a Notion client portal, Google Drive, and communication channel on Day 0 automatically
- Brief the internal team and assign an account manager before the client wakes up
- Schedule and run a high-quality kickoff call within 3 days
- Create the conditions for a 5-star first impression that seeds long-term retention

**Inputs:** Signed contract + confirmed payment from Stage 6 (Conversion Engine)

**Outputs:** Fully onboarded client — questionnaire complete, kickoff call done, first task/campaign launched, client portal live, team briefed and activated

**Trigger to next stage:**

- Kickoff call complete + first deliverable launched → Stage 8 (Delivery Engine)
- Client onboarding form NOT completed within 48hrs → escalate alert to account manager
- Client satisfaction check at Day 7 < 8/10 → immediate account manager intervention

---

## 📡 Channels Used

| Channel | Purpose | Priority |
| --- | --- | --- |
| Email | Welcome sequence, document delivery, confirmation | 🔴 Critical |
| WhatsApp | Personal onboarding touchpoints, relationship start | 🔴 Critical |
| Notion | Client portal setup — timeline, deliverables, dashboard | 🔴 Critical |
| Google Drive | Asset folder creation, shared files | 🔴 Critical |
| Zoom / Google Meet | Kickoff call | 🔴 Critical |
| Tally Form | Client onboarding questionnaire | 🟠 High |
| Slack / Telegram | Internal team coordination channel | 🟠 High |
| [Cal.com](http://Cal.com) | Kickoff call scheduling | 🟠 High |

---

## 🧠 Methods Used

| Method | Purpose | Priority |
| --- | --- | --- |
| Instant welcome email (automated) | First impression within 60 seconds of signing | 🔴 Critical |
| WhatsApp personal welcome from AM | Human connection immediately | 🔴 Critical |
| Onboarding questionnaire (Tally) | Collect everything needed to begin in one step | 🔴 Critical |
| Notion client portal creation | Give client visibility and confidence | 🔴 Critical |
| Internal team briefing (auto-triggered) | Team ready before client's first question | 🔴 Critical |
| Kickoff call (structured agenda) | Align expectations, build relationship, confirm strategy | 🔴 Critical |
| Day 7 CSAT check | Catch any dissatisfaction before it grows | 🟠 High |
| Access credential collection (credentials form) | Securely collect all logins needed for delivery | 🟠 High |
| Project plan shared in Notion | Client sees exactly what happens and when | 🟠 High |
| First quick win delivery (if possible by Day 7) | Validate their decision to hire Nivy | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Client record creation | HubSpot | Convert lead to customer with full history |
| Client portal | Notion (new page from template) | Live project dashboard for client access |
| Asset storage | Google Drive (auto-folder structure) | Organized home for all client files |
| Onboarding data capture | Tally Form → n8n → Notion | Questionnaire answers flow to client portal |
| Access credential vault | 1Password / Bitwarden (shared vault) | Securely store all client logins |
| Team assignment database | HubSpot + Notion | Track AM, PM, team lead per client |
| Onboarding progress tracker | Notion checklist | Day-by-day completion tracking |
| CSAT data | Tally + HubSpot custom field | Day 7 satisfaction score per client |

**Required Onboarding Questionnaire Fields:**

```jsx
Business basics:
✅ Company name + website
✅ Core product/service + target customer
✅ Key competitors
✅ Country/region of focus

Service-specific:
✅ Current marketing setup (what's running, what's not)
✅ Monthly budget (confirm)
✅ Primary KPI they want to improve
✅ Existing brand assets (logo, fonts, brand guide)
✅ Key contacts (decision maker + day-to-day contact)

Access required:
✅ Google Analytics (edit access)
✅ Meta Business Manager access
✅ Website CMS access (if applicable)
✅ Ad account access (if applicable)
✅ Social media page access
```

---

## 📤 Outbound Systems

| System | Sequence | Tool | Purpose |
| --- | --- | --- | --- |
| Welcome email | Instant on contract sign | n8n + Gmail | Professional first impression |
| WhatsApp from AM | Within 2 hours of signing | WATI + n8n | Human relationship kickstart |
| Questionnaire reminder | Day 2 if not submitted | n8n + WhatsApp | Ensure onboarding doesn't stall |
| Kickoff call confirmation | When AM schedules | [Cal.com](http://Cal.com)  • n8n | Reduce no-shows |
| Day 7 CSAT survey | Auto-sent Day 7 | n8n + Tally | Early satisfaction capture |
| Operations team notification | Instant on signing | n8n + Telegram | Team ready before client arrives |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Welcome to client community | New client invited to private client WhatsApp group | Peer connection + retention |
| Referral program introduction | Mentioned in welcome email — "Refer a business, earn rewards" | Seed referral program from Day 0 |
| Client showcase opt-in | Ask permission to feature as case study during kickoff call | Build social proof pipeline |
| AM personal LinkedIn connection | AM sends client LinkedIn request after kickoff | Long-term relationship building |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Welcome email send | n8n + Gmail | Contract signed (PandaDoc webhook) | Instant professional welcome |
| WhatsApp welcome | n8n + WATI | Contract signed | Personal welcome from AM |
| HubSpot lifecycle update | n8n + HubSpot | Contract signed | Mark as Customer |
| Notion portal creation | n8n + Notion API | Contract signed | Instant client dashboard |
| Google Drive folder creation | n8n + Google Drive API | Contract signed | Asset storage ready |
| Ops team Telegram alert | n8n + Telegram | Contract signed | Team briefed immediately |
| Questionnaire reminder | n8n + WATI | Day 2 if form not submitted | Recover stalled onboarding |
| Kickoff call scheduler | [Cal.com](http://Cal.com)  • n8n | After welcome email | Booking link sent automatically |
| Day 7 CSAT survey | n8n + Tally | Day 7 scheduled | Capture early satisfaction |
| CSAT alert if low | n8n | CSAT score <8 | Alert AM + founder immediately |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Kickoff call agenda generator | GPT-4o | Client questionnaire + service package + industry | Personalized kickoff agenda with smart questions | Better kickoff calls |
| Project plan generator | GPT-4o | Service package + client goals + timeline | Week-by-week project plan for Notion portal | Fast, professional plan delivery |
| Welcome email personalizer | GPT-4o-mini | Client name, company, service, country | Personalized welcome email body | Warmer first impression |
| Internal team brief generator | GPT-4o | Questionnaire answers + call notes | 1-page team brief with client context | Team ready from Day 1 |
| Onboarding gap detector | GPT-4o | Questionnaire completeness + missing assets | List of what's missing + recommended follow-up message | Prevent delivery delays |

**AI Prompt — Kickoff Call Agenda:**

```jsx
Generate a kickoff call agenda for a new Nivy Digital client.

Client details:
- Name: {{name}}
- Company: {{company}}
- Industry: {{industry}}
- Service purchased: {{service}}
- Primary goal: {{primary_goal}}
- Current setup: {{current_marketing_setup}}
- Key challenge: {{pain_point}}

Create a 45-minute kickoff agenda with:
1. Welcome + introductions (5 min)
2. Understanding their business deeper (10 min) — 3 smart discovery questions
3. Confirming scope and deliverables (10 min)
4. Setting KPIs and success metrics together (10 min)
5. Communication cadence agreement (5 min)
6. Access and assets needed (5 min)
7. Next steps and timeline confirmation (5 min)

Include specific questions for each section based on their industry and service.
Output in structured format. No filler.
```

---

## 🤖 n8n Automation Code — Full Client Onboarding Workflow

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 7 Client Onboarding Engine",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "client-signed" },
      "name": "Webhook - Contract Signed",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.email}}",
        "properties": {
          "lifecyclestage": "customer",
          "hs_lead_status": "CONVERTED",
          "client_start_date": "={{$now}}"
        }
      },
      "name": "Update HubSpot to Customer",
      "type": "n8n-nodes-base.hubspot",
      "position": [320, 300]
    },
    {
      "parameters": {
        "fromEmail": "welcome@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "🎉 Welcome to Nivy, {{$json.name}}! Here's what happens next.",
        "text": "Hi {{$json.name}}!\n\nWelcome to Nivy — we're genuinely excited to work with you and {{$json.company}}.\n\nHere's your next 3 steps:\n\n1️⃣ Fill your onboarding form (5 mins): YOUR_FORM_LINK\n2️⃣ Your account manager will WhatsApp you shortly\n3️⃣ We'll schedule your kickoff call within 24 hours\n\nYour client portal (live dashboard): YOUR_NOTION_LINK\n\nAny questions — just reply to this email.\n\nLet's build something great together 🚀\nNivy Team"
      },
      "name": "Send Welcome Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [540, 200]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "={{$json.phone}}" },
            { "name": "message", "value": "Hi {{$json.name}}! 🎉 Welcome to Nivy! I'm [AM Name], your dedicated account manager. I'll be your main point of contact for everything. First step — please fill the short onboarding form we just emailed you (5 mins). Any questions, I'm right here!" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_WHATSAPP_TOKEN" }]
        }
      },
      "name": "WhatsApp Welcome from AM",
      "type": "n8n-nodes-base.httpRequest",
      "position": [540, 400]
    },
    {
      "parameters": {
        "chatId": "YOUR_OPS_TELEGRAM_CHAT",
        "text": "🆕 NEW CLIENT ONBOARDING TRIGGERED\n\nClient: {{$json.name}} — {{$json.company}}\nEmail: {{$json.email}}\nPhone: {{$json.phone}}\nService: {{$json.service}}\nPackage value: ${{$json.amount}}\n\n✅ Action checklist:\n[ ] Create Notion client portal\n[ ] Create Google Drive folder\n[ ] Assign account manager\n[ ] Schedule kickoff call\n[ ] Brief full team"
      },
      "name": "Notify Ops Team",
      "type": "n8n-nodes-base.telegram",
      "position": [540, 600]
    },
    {
      "parameters": { "amount": 48, "unit": "hours" },
      "name": "Wait 48 Hours",
      "type": "n8n-nodes-base.wait",
      "position": [760, 300]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API_URL",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "={{$json.phone}}" },
            { "name": "message", "value": "Hi {{$json.name}} — just a quick reminder to fill your onboarding form so we can get started ASAP! Link: YOUR_FORM_LINK — takes about 5 minutes. Let me know if you need any help!" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_WHATSAPP_TOKEN" }]
        }
      },
      "name": "Day 2 Form Reminder",
      "type": "n8n-nodes-base.httpRequest",
      "position": [980, 300]
    },
    {
      "parameters": { "amount": 5, "unit": "days" },
      "name": "Wait 5 More Days",
      "type": "n8n-nodes-base.wait",
      "position": [1200, 300]
    },
    {
      "parameters": {
        "fromEmail": "team@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "Quick check-in — how are we doing so far? ⭐",
        "text": "Hi {{$json.name}},\n\nWe're now 7 days in and want to make sure everything is going exactly as expected.\n\nCould you take 30 seconds to rate your onboarding experience?\n\n[Rate your experience: YOUR_CSAT_FORM_LINK]\n\nYour feedback directly shapes how we serve you.\n\nThank you!\nNivy Team"
      },
      "name": "Day 7 CSAT Survey",
      "type": "n8n-nodes-base.emailSend",
      "position": [1420, 300]
    }
  ],
  "connections": {
    "Webhook - Contract Signed": { "main": [[{ "node": "Update HubSpot to Customer", "type": "main", "index": 0 }]] },
    "Update HubSpot to Customer": { "main": [[{ "node": "Send Welcome Email", "type": "main", "index": 0 }, { "node": "WhatsApp Welcome from AM", "type": "main", "index": 0 }, { "node": "Notify Ops Team", "type": "main", "index": 0 }, { "node": "Wait 48 Hours", "type": "main", "index": 0 }]] },
    "Wait 48 Hours": { "main": [[{ "node": "Day 2 Form Reminder", "type": "main", "index": 0 }]] },
    "Day 2 Form Reminder": { "main": [[{ "node": "Wait 5 More Days", "type": "main", "index": 0 }]] },
    "Wait 5 More Days": { "main": [[{ "node": "Day 7 CSAT Survey", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Onboarding form completion rate | >95% within 48hrs | Tally analytics | Per client |
| Time to kickoff call | <3 days from signing | [Cal.com](http://Cal.com) | Per client |
| Kickoff call attendance rate | 100% | Zoom / [Cal.com](http://Cal.com) | Per client |
| Day 7 CSAT score | >8.5/10 | Tally + HubSpot | Per client |
| Notion portal created within 2hrs | 100% | n8n logs | Per client |
| Welcome email sent within 5 mins | 100% | n8n logs | Per client |
| Time to first deliverable | <7 days | Notion task tracker | Per client |
| Onboarding NPS (end of month 1) | >50 | Monthly survey | Monthly |

---

## 👥 Team Responsibilities

| Role | Day 0–1 Tasks | Week 1 Tasks |
| --- | --- | --- |
| Account Manager | Send WhatsApp welcome, create Notion portal, schedule kickoff | Run kickoff call, log notes, share project plan |
| Project Manager | Set up Google Drive structure, create task list | Confirm all access received, launch first task |
| Operations | Monitor onboarding n8n workflow, flag any failures | Verify Day 7 CSAT received, escalate if low |
| Team Lead (service) | Review questionnaire answers, brief execution team | Supervise first deliverable quality |
| Founder | Review any CSAT <8 alerts | Spot-check onboarding quality for new clients |

---

## 📋 SOP — Day-by-Day Onboarding Checklist

**Day 0 (Contract Signed):**

- [ ]  n8n fires: welcome email sent, WhatsApp sent, ops notified (automated)
- [ ]  AM confirms WhatsApp sent and replies to any client response
- [ ]  Create Notion client portal from template
- [ ]  Create Google Drive folder: Client Name → Campaign → Assets → Reports
- [ ]  Assign account manager + team lead in HubSpot
- [ ]  Brief internal team via Telegram/Slack

**Day 1:**

- [ ]  Check if onboarding questionnaire submitted → if not, remind on Day 2
- [ ]  Schedule kickoff call for Day 3 via [Cal.com](http://Cal.com)

**Day 2:**

- [ ]  n8n fires questionnaire reminder (automated)
- [ ]  AM confirms client received and starts form

**Day 3:**

- [ ]  Run kickoff call (use AI-generated agenda)
- [ ]  Log call notes in Notion + HubSpot
- [ ]  Share project plan in Notion portal with client

**Day 5:**

- [ ]  Confirm all access/credentials received
- [ ]  Begin execution of first deliverable

**Day 7:**

- [ ]  n8n fires CSAT survey (automated)
- [ ]  Launch first campaign/deliverable
- [ ]  AM personal check-in message on WhatsApp

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| n8n (self-hosted) | Full onboarding workflow automation | Free | [n8n.io](http://n8n.io) |
| HubSpot | Customer record, lifecycle tracking | Free | [hubspot.com](http://hubspot.com) |
| Notion | Client portal, project plan | Free | [notion.so](http://notion.so) |
| Google Drive | Asset and file storage | Free | [drive.google.com](http://drive.google.com) |
| [Tally.so](http://Tally.so) | Onboarding questionnaire | Free | [tally.so](http://tally.so) |
| [Cal.com](http://Cal.com) | Kickoff call scheduling | Free | [cal.com](http://cal.com) |
| Zoom | Kickoff call video | Free | [zoom.us](http://zoom.us) |
| WATI | WhatsApp client communication | Free tier | [wati.io](http://wati.io) |
| 1Password / Bitwarden | Secure credential storage | Free tier | [bitwarden.com](http://bitwarden.com) |
| Telegram | Internal ops team alerts | Free | [telegram.org](http://telegram.org) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Client doesn't fill onboarding form | Medium | High | Auto-reminder Day 2 + AM WhatsApp follow-up |
| Account manager assignment delay | Medium | High | Auto-assign in rotation via n8n, not manual |
| Kickoff call cancelled/rescheduled | Low | Medium | Rebook within 24hrs, AM follows up immediately |
| Missing assets stalling delivery | High | High | Credential checklist sent Day 1, AM chases Day 3 |
| Day 7 CSAT low (<8/10) | Low | Critical | Immediate AM + founder alert, client call within 24hrs |
| Client portal not created in time | Low | High | n8n auto-creates from template at contract sign |
| Client feels abandoned after signing | Medium | Critical | WhatsApp from AM within 2hrs prevents this |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Kickoff call quality review | AM reviews own call recording monthly → improves agenda | Monthly |
| Onboarding form response analysis | Review what's commonly missing → add to form | Monthly |
| CSAT trend tracking | Track Day 7 scores over time → identify patterns | Monthly |
| Time-to-first-deliverable reduction | Find bottlenecks in 7-day flow → automate or template | Monthly |
| Client portal template optimization | Update Notion template based on client feedback | Quarterly |

---

**⬅️ Previous Stage:** [💰 Stage 6 — Conversion Engine](https://www.notion.so/35be5082b9d481069b67caad774de1e5)

**➡️ Next Stage:** [📊 Stage 8 — Delivery Engine](https://www.notion.so/35be5082b9d4817faea9c473cdd62cbd)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Client data flows from CRM into Notion portal |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Kickoff agenda and welcome email AI prompts live here |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Onboarding completion rate and CSAT tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Early onboarding friction handled here |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | WON lead → onboarding trigger flow shown here |