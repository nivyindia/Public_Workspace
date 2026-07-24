# ♻️ Stage 11B — Reactivation Engine

> **⚠️ SUPERSEDED — CJE 13-stage system**
> This page is part of the legacy 13-stage CJE (Customer Journey Engineering) documentation system. As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **STAGE 11B OF 12 — Every cold lead and lost deal is a warm asset. They already know Nivy. Reactivating them costs 10x less than cold outreach and converts at 3x the rate.**
> 

---

## ♻️ Core Objective

> **Systematically re-engage cold leads, lost proposals, and churned clients through AI-personalized, multi-channel campaigns — converting dormant assets back into active pipeline.**
> 

This stage is engineered to:

- Never permanently discard any lead who engaged at any stage of the journey
- Segment dormant contacts by type and reason for going cold — and reactivate with the right message for each
- Use AI to generate hyper-personalized re-engagement that doesn't feel like a mass campaign
- Measure re-engagement signal quality and route re-warmed leads back into Stage 4 (management) or Stage 5 (nurture)
- Keep the pipeline full even during slow acquisition periods

**Inputs:** Cold leads (no activity >60 days) from Stage 4, failed nurtures (no conversion after 21-day Stage 5 sequence), lost proposals from Stage 6, churned clients from Stage 9, event no-shows from Stage 12

**Outputs:** Re-engaged leads re-entering Stage 4 (scored and re-routed), re-signed past clients re-entering Stage 7 (Onboarding), or permanently archived after 3 failed reactivation attempts

**Trigger to next stage:**

- Reactivated lead books call → Stage 6 (Conversion Engine)
- Reactivated lead engages but not ready → re-enter Stage 5 (Nurture, long track)
- Past client re-signs → Stage 7 (Onboarding Engine)
- No response after 3 reactivation cycles (90 days) → permanently archive in HubSpot

---

## 📡 Channels Used

| Channel | Purpose | Priority |
| --- | --- | --- |
| Email | Primary reactivation channel — AI-personalized | 🔴 Critical |
| WhatsApp | High-touch reactivation for warm leads | 🔴 Critical |
| LinkedIn DM | Re-engage B2B leads who went quiet on LinkedIn | 🟠 High |
| Retargeting ads | Show re-engagement ads to cold website visitors | 🟠 High |
| Phone call | Past clients and high-value lost proposals | 🟠 High |
| Community invite | Invite cold leads into WhatsApp community as a "no-pressure" re-entry | 🟡 Medium |
| Seasonal campaigns | New Year, Diwali, financial year start — natural re-engagement hooks | 🟡 Medium |

---

## 🧠 Methods Used

| Method | Segment | Priority |
| --- | --- | --- |
| AI-personalized reactivation email (new angle) | All cold leads | 🔴 Critical |
| WhatsApp personal check-in | Leads who previously engaged on WhatsApp | 🔴 Critical |
| "What changed?" call | Past clients + lost proposals >30 days | 🔴 Critical |
| New offer or updated service announcement | All segments | 🔴 Critical |
| Seasonal / event-based re-engagement | Cold leads >90 days | 🟠 High |
| Free audit re-offer (new angle) | Leads who declined previously | 🟠 High |
| Case study re-engagement (new, relevant result) | Industry-matched cold leads | 🟠 High |
| Webinar or live event invite | Cold leads who previously showed interest in content | 🟠 High |
| Community invite (no-pressure re-entry) | Leads who didn't respond to offers | 🟡 Medium |
| LinkedIn engagement (like/comment before DM) | Cold LinkedIn-sourced leads | 🟡 Medium |
| Retargeting ads — "We've evolved" message | Website visitors who didn't convert | 🟡 Medium |

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Cold lead segment | HubSpot smart list | All contacts: status COLD + last activity >60 days |
| Lost proposal segment | HubSpot deal stage filter | Proposals sent, no response >30 days |
| Churned client list | HubSpot lifecycle: ex-customer | Clients who didn't renew, tagged with churn reason |
| Reactivation attempt log | HubSpot contact field | Date + channel of last reactivation attempt |
| Re-engagement response tracker | HubSpot activity + n8n | Log any engagement signal (open, click, reply) |
| Permanently archived list | HubSpot status: DEAD | Contacts with 3+ failed reactivation attempts |
| Reactivation campaign performance | Google Sheets + n8n | Open rate, reply rate, conversion rate per campaign batch |
| Seasonal campaign calendar | Notion | Pre-planned reactivation hooks tied to calendar events |

**Reactivation Segment Definitions:**

```jsx
SEGMENT 1 — Cold Leads (Stage 4/5 exits):
- Lead status: COLD in HubSpot
- Last activity: >60 days ago
- No booking, no reply in nurture
- Approach: New angle email → WhatsApp → community invite

SEGMENT 2 — Lost Proposals (Stage 6 exits):
- Deal stage: Closed Lost
- Reason: Budget / timing / went with competitor
- Last contact: >30 days ago
- Approach: "What changed?" email → follow-up call → new offer

SEGMENT 3 — Churned Clients (Stage 9 exits):
- Lifecycle: Ex-customer
- Contract ended, not renewed
- Last active: >60 days
- Approach: Personal AM call → results reminder → re-engagement offer

SEGMENT 4 — Event No-Shows (Stage 12):
- Registered for event/webinar but didn't attend
- No follow-up engaged
- Approach: Replay offer → new webinar invite → community invite

SEGMENT 5 — Email Unsubscribers:
- Unsubscribed from email list
- Still on WhatsApp or LinkedIn
- Approach: WhatsApp-only soft touch → community invite (no email)
```

---

## 📤 Outbound Systems

| System | Sequence | Tool | Trigger |
| --- | --- | --- | --- |
| Reactivation email (Attempt 1) | Week 1: AI-personalized "checking in" | n8n + Gmail | 60 days since last activity |
| WhatsApp follow-up (Attempt 1) | Week 2: Personal check-in | n8n + WATI | 7 days after email, no reply |
| Reactivation email (Attempt 2) | Week 5: New angle / new offer / case study | n8n + Gmail | 30 days after Attempt 1 |
| LinkedIn DM (Attempt 2) | Week 6: Engage their content first, then DM | Manual / PhantomBuster | After Attempt 2 email |
| Final reactivation (Attempt 3) | Week 9: "Last message" — breakup email | n8n + Gmail | 30 days after Attempt 2 |
| Community invite (soft re-entry) | Any time after Attempt 1 fails | n8n + WATI | No reply after Attempt 1 |
| Archive notification | After 3 failed attempts | n8n + HubSpot | Automatic |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Cold lead → community member | Community invite as a "low pressure" re-entry point | Keep them in the ecosystem without needing a commitment |
| Community → warm lead | Cold leads who join community see active results → naturally re-warm | Passive reactivation through social proof |
| Past client → referral source | Even churned clients can refer if the relationship ends well | Recover value from non-renewing clients |
| Seasonal campaign reach | Holiday/quarter-end campaigns reach the entire cold list simultaneously | Mass reactivation with minimal effort |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Cold lead detection | n8n + HubSpot | Weekly scan: no activity >60 days | Auto-segment into reactivation list |
| Attempt 1 email | n8n + OpenAI + Gmail | Lead enters reactivation list | AI-personalized reactivation email |
| Attempt 1 WhatsApp | n8n + WATI | 7 days after email, no open/reply | Personal WhatsApp check-in |
| Score update on engagement | n8n + HubSpot | Any open, click, or reply | Update score + re-evaluate routing |
| Attempt 2 trigger | n8n scheduler | 30 days after Attempt 1 | New angle email (new case study or offer) |
| Attempt 3 "breakup" email | n8n | 30 days after Attempt 2 | Final touch before archive |
| Archive rule | n8n + HubSpot | 3 failed attempts + no response | Set status DEAD, move to archived |
| Re-engaged lead routing | n8n | Any positive engagement signal | Move to Stage 4 (Lead Management) or Stage 5 (Nurture) |
| Lost proposal reactivation | n8n + Gmail | 30 days since proposal, deal still open | "Are you still considering this?" follow-up |
| Churned client "what changed?" | n8n + Gmail | 60 days after contract end | Personal outreach from AM |
| Seasonal campaign batch | n8n scheduler | Pre-set campaign dates | Send all cold leads a seasonal offer |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Reactivation email generator | GPT-4o | Lead name, company, industry, last interaction, reason for going cold | Hyper-personalized 100-word re-engagement email | Don't sound like a mass campaign |
| Re-engagement angle selector | GPT-4o | Lead profile + days cold + last interaction type | Best re-engagement angle (new offer / case study / check-in / seasonal) | Right hook for each segment |
| "Breakup email" generator | GPT-4o-mini | Lead name + company + history | Final email that creates FOMO without pressure | Maximum response rate on Attempt 3 |
| Re-engagement signal classifier | GPT-4o | Email open + click + reply text | HOT / WARM / COLD signal + recommended next step | Instant routing on re-engagement |
| Lost proposal revival coach | GPT-4o | Original proposal details + reason lost + time elapsed | Best revised offer or new angle for the "what changed?" call | Recover lost deals with new positioning |
| Churned client win-back coach | GPT-4o | Client history + churn reason + results achieved | Personalized re-engagement talking points for AM call | Recover high-LTV clients |

**AI Prompt — Reactivation Email Generator:**

```jsx
You are writing a re-engagement email for Nivy Digital.

Lead/client details:
- Name: {{name}}
- Company: {{company}}
- Industry: {{industry}}
- Country: {{country}}
- Last interaction: {{last_interaction_description}}
- Days since last activity: {{days_cold}}
- Reason for going cold (if known): {{cold_reason}}
- Reactivation attempt number: {{attempt_number}} of 3

Instructions:
Attempt 1: Warm, human check-in. Don't mention they went quiet. Lead with a relevant insight or quick win for their industry. Soft CTA (reply if curious).
Attempt 2: New angle. Share a new case study or recent result from their industry. Make it feel fresh. CTA: book a 15-min call.
Attempt 3: "Breakup email" — honest, no pressure, creates FOMO. Something like: "I don't want to keep messaging if the timing isn't right — but I'd hate for you to miss X." CTA: one last link to book.

NEVER:
- Mention how long they've been quiet
- Sound like a generic marketing email
- Use "just checking in" or "I hope this finds you well"
- Write more than 120 words

Output: subject line + email body only. No extra text.
```

---

## 🤖 n8n Automation Code — Full Cold Lead Reactivation Engine

> Copy → paste into n8n → Import Workflow → replace all YOUR_ values
> 

```json
{
  "name": "Nivy - Stage 11B Reactivation Engine",
  "nodes": [
    {
      "parameters": {
        "rule": { "interval": [{ "field": "weeks", "weeksInterval": 1 }] },
        "triggerAt": { "hour": 9, "minute": 0, "weekday": 1 }
      },
      "name": "Weekly Monday 9am",
      "type": "n8n-nodes-base.scheduleTrigger",
      "position": [100, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "getAll",
        "filters": { "hs_lead_status": "COLD" },
        "limit": 50
      },
      "name": "Get Cold Leads (HubSpot)",
      "type": "n8n-nodes-base.hubspot",
      "position": [320, 300]
    },
    {
      "parameters": {
        "jsCode": "return $input.all().filter(item => {\n  const lastActivity = new Date(item.json.notes_last_updated || item.json.createdate);\n  const daysSince = (Date.now() - lastActivity.getTime()) / (1000 * 60 * 60 * 24);\n  const attempts = parseInt(item.json.reactivation_attempts || 0);\n  return daysSince >= 60 && attempts < 3;\n}).map(item => ({ json: { ...item.json, days_cold: Math.floor((Date.now() - new Date(item.json.notes_last_updated || item.json.createdate).getTime()) / (1000 * 60 * 60 * 24)) } }));"
      },
      "name": "Filter: 60+ Days Cold, <3 Attempts",
      "type": "n8n-nodes-base.code",
      "position": [540, 300]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o-mini" },
            { "name": "messages", "value": "[{\"role\":\"user\",\"content\":\"Write a re-engagement email for Nivy Digital. Lead: {{$json.firstname}} {{$json.lastname}}, Company: {{$json.company}}, Industry: {{$json.industry}}, Country: {{$json.country}}, Days cold: {{$json.days_cold}}, Attempt: {{$json.reactivation_attempts}}. Keep it under 120 words. Output: subject line on line 1, blank line, email body. No fluff.\"}]" },
            { "name": "max_tokens", "value": "300" }
          ]
        },
        "headerParametersUi": {
          "parameter": [{ "name": "Authorization", "value": "Bearer YOUR_OPENAI_KEY" }]
        }
      },
      "name": "AI - Generate Reactivation Email",
      "type": "n8n-nodes-base.httpRequest",
      "position": [760, 200]
    },
    {
      "parameters": {
        "jsCode": "const content = $json.choices[0].message.content;\nconst lines = content.split('\\n');\nconst subject = lines[0].trim();\nconst body = lines.slice(2).join('\\n').trim();\nreturn [{ json: { subject, body, ...($node['Filter: 60+ Days Cold, <3 Attempts'].json) } }];"
      },
      "name": "Parse Email",
      "type": "n8n-nodes-base.code",
      "position": [980, 200]
    },
    {
      "parameters": {
        "fromEmail": "growth@nivy.com",
        "toEmail": "={{$json.email}}",
        "subject": "={{$json.subject}}",
        "text": "={{$json.body}}"
      },
      "name": "Send Reactivation Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [1200, 200]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.id}}",
        "properties": {
          "reactivation_attempts": "={{parseInt($json.reactivation_attempts || 0) + 1}}",
          "last_reactivation_attempt": "={{$now}}",
          "last_reactivation_channel": "email"
        }
      },
      "name": "Log Attempt in HubSpot",
      "type": "n8n-nodes-base.hubspot",
      "position": [1420, 200]
    },
    {
      "parameters": {
        "jsCode": "const attempts = parseInt($json.reactivation_attempts || 0);\nconst archiveList = $input.all().filter(i => parseInt(i.json.reactivation_attempts || 0) >= 3);\nreturn archiveList;"
      },
      "name": "Find Leads to Archive (3+ Attempts)",
      "type": "n8n-nodes-base.code",
      "position": [760, 400]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.id}}",
        "properties": {
          "hs_lead_status": "DEAD",
          "archived_date": "={{$now}}",
          "archive_reason": "3 reactivation attempts with no response"
        }
      },
      "name": "Archive in HubSpot",
      "type": "n8n-nodes-base.hubspot",
      "position": [980, 400]
    },
    {
      "parameters": {
        "chatId": "YOUR_OPS_TELEGRAM_CHAT",
        "text": "♻️ Weekly Reactivation Report\n\nEmails sent this week: {{$node['Send Reactivation Email'].runData?.length || 0}}\nLeads archived (3 attempts): {{$node['Archive in HubSpot'].runData?.length || 0}}\n\nCheck HubSpot for any re-engagement signals."
      },
      "name": "Weekly Reactivation Report",
      "type": "n8n-nodes-base.telegram",
      "position": [1200, 400]
    }
  ],
  "connections": {
    "Weekly Monday 9am": { "main": [[{ "node": "Get Cold Leads (HubSpot)", "type": "main", "index": 0 }]] },
    "Get Cold Leads (HubSpot)": { "main": [[{ "node": "Filter: 60+ Days Cold, <3 Attempts", "type": "main", "index": 0 }]] },
    "Filter: 60+ Days Cold, <3 Attempts": { "main": [[{ "node": "AI - Generate Reactivation Email", "type": "main", "index": 0 }, { "node": "Find Leads to Archive (3+ Attempts)", "type": "main", "index": 0 }]] },
    "AI - Generate Reactivation Email": { "main": [[{ "node": "Parse Email", "type": "main", "index": 0 }]] },
    "Parse Email": { "main": [[{ "node": "Send Reactivation Email", "type": "main", "index": 0 }]] },
    "Send Reactivation Email": { "main": [[{ "node": "Log Attempt in HubSpot", "type": "main", "index": 0 }]] },
    "Find Leads to Archive (3+ Attempts)": { "main": [[{ "node": "Archive in HubSpot", "type": "main", "index": 0 }]] },
    "Archive in HubSpot": { "main": [[{ "node": "Weekly Reactivation Report", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Measurement Tool | Frequency |
| --- | --- | --- | --- |
| Reactivation email open rate | >25% | Mautic / Brevo | Weekly |
| Reactivation reply rate | >5% | Gmail / Mautic | Weekly |
| Cold-to-warm conversion rate | >10% per quarter | HubSpot | Monthly |
| Reactivation-to-call rate | >5% of contacts | HubSpot | Monthly |
| Past client re-sign rate | >20% of approached | HubSpot | Monthly |
| Leads archived (3 attempts) | Track % | HubSpot | Monthly |
| Reactivation → Stage 6 conversion | >3% of total cold list | HubSpot | Monthly |
| Cost per reactivated client | <$20 (email + AI cost) | n8n logs | Monthly |
| WhatsApp reactivation reply rate | >15% | WATI | Weekly |
| Total dormant pipeline value recovered | Track MRR from reactivated | HubSpot | Monthly |

---

## 👥 Team Responsibilities

| Role | Weekly Tasks | Monthly Tasks |
| --- | --- | --- |
| Automation Dev | Monitor n8n reactivation workflow, check for email send errors | Add new reactivation segments, refine AI prompt |
| VA (Reactivation) | Review WhatsApp reactivation replies, route positive signals to sales | Manual outreach to top 5 lost proposals by value |
| Sales Lead | Contact any reactivated HOT lead within 2 hours of signal | Review reactivation conversion rate — which segment responds best? |
| Account Manager | Personally reach out to churned clients at 60-day mark | Run "what changed?" call with any churned client willing to talk |
| Operations Manager | Review weekly reactivation report | Audit archive list — any high-value leads archived prematurely? |

---

## 📋 SOP — Reactivation Execution Checklist

**Weekly (automated + manual):**

- [ ]  n8n runs Monday 9am: cold lead scan + AI reactivation emails sent (automated)
- [ ]  Review WATI for any WhatsApp reactivation replies → route to sales if positive
- [ ]  Check HubSpot "Reactivation Signals" view — any opens or clicks this week?
- [ ]  Any positive reply from reactivation email? → Move to Stage 4, assign to sales rep

**Monthly:**

- [ ]  Manually review top 10 lost proposals by deal value → personal AM outreach
- [ ]  AM contacts all churned clients from 60 days ago with personal "what changed?" email or call
- [ ]  Review reactivation campaign performance: open rate, reply rate, conversion
- [ ]  Identify best-performing reactivation angle this month → make it the default Attempt 1
- [ ]  Review archive list — any contacts wrongly archived? Restore if appropriate

**Seasonal Campaigns (quarterly):**

- [ ]  Build seasonal reactivation campaign for entire cold list (New Year, Diwali, financial year start)
- [ ]  Test a new subject line / angle on the seasonal batch
- [ ]  Measure seasonal campaign performance vs. standard reactivation sequence

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| HubSpot | Cold lead segmentation, status tracking, deal recovery | Free | [hubspot.com](http://hubspot.com) |
| n8n (self-hosted) | Full reactivation automation pipeline | Free | [n8n.io](http://n8n.io) |
| OpenAI API | AI email personalization per lead | Pay per use | [openai.com](http://openai.com) |
| Mautic / Brevo | Email delivery + open tracking | Free | [brevo.com](http://brevo.com) |
| WATI | WhatsApp reactivation messages | Free tier | [wati.io](http://wati.io) |
| Gmail | Manual outreach for high-value lost proposals | Free | [gmail.com](http://gmail.com) |
| Meta Ads Manager | Retargeting ads for cold website visitors | Ad spend | [facebook.com/ads](http://facebook.com/ads) |
| Notion | Seasonal campaign calendar, reactivation SOP | Free | [notion.so](http://notion.so) |
| Airtable | Reactivation campaign performance log | Free tier | [airtable.com](http://airtable.com) |
| Google Sheets | Weekly reactivation batch report | Free | [sheets.google.com](http://sheets.google.com) |

---

## ⚠️ Risks & Bottlenecks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Marked as spam | Medium | High | Personalize every email (AI), limit to 1 email/week per contact |
| Same message as last outreach | High | High | AI generates new angle each attempt — never repeat same approach |
| Emailing unsubscribers | Medium | High | Filter unsubscribers from email list before each batch |
| Over-contacting lost deals too soon | Medium | Medium | 30-day gap enforced between attempts via n8n |
| Archiving valuable contacts too early | Low | High | AM manual review of all archived contacts monthly |
| WhatsApp blocks from bulk messages | Medium | Medium | Space messages 5+ days, keep personal and non-promotional tone |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Reactivation email angle testing | Which approach (check-in / case study / breakup email) gets most replies? | Monthly |
| Segment performance comparison | Which segment reactivates best? Cold leads vs. lost proposals vs. churned? | Monthly |
| AI prompt refinement | Review email quality monthly → update prompt with what's working | Monthly |
| Seasonal campaign optimization | Which seasonal hook drives most engagement? | Per campaign |
| Archive quality audit | Review archived contacts — are they truly dead or misclassified? | Monthly |
| Re-engagement timing analysis | Is 60-day trigger right, or should it be 45 days or 90 days? | Quarterly |

---

**⬅️ Back to:** [🔗 Stage 11 — Referral & Viral Engine](https://www.notion.so/35be5082b9d481d1b0b6ffbf1042b467)

**➡️ Next Stage:** [🌐 Stage 12 — Ecosystem Engine](https://www.notion.so/35be5082b9d48143a08ddf48d9eb8e77)

**🏠 Back to Hub:** [🚀 NIVY — Customer Journey Engineering OS](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Cold lead segments pulled directly from HubSpot CRM |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Reactivation email generator and re-engagement angle selector |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Reactivation rate and cold-to-warm conversion tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Re-engaged leads who raise objections route here |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Reactivated leads re-enter Stage 4 or 5 routing here |