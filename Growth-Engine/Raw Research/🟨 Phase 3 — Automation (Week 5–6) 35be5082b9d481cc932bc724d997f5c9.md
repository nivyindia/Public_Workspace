# 🟨 Phase 3 — Automation (Week 5–6)

← [Back to Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)

---

> **Week 5–6. You have paying clients and a working manual sales process. Now you systematise it. Goal: Zero manual lead capture. HOT lead alerts in <5 minutes. Weekly KPI report automated. Every handoff happens without you.**
> 

---

## 🎯 Phase 3 Objectives

| Objective | Target | Measure |
| --- | --- | --- |
| Zero manual lead capture | Day 42 | All sources feeding HubSpot via webhook |
| HOT lead alert speed | <5 mins | n8n workflow log |
| Lead scoring automated | Day 32 | HubSpot score property auto-updating |
| Nurture auto-enrollment | Day 33 | Mautic/Brevo auto-trigger live |
| Onboarding automated | Day 37 | Contract signed → Welcome email in <10 mins |
| Weekly KPI report | Day 38 | Monday 8am auto-report in WhatsApp/email |
| AI layer connected | Day 35 | Pre-call brief fires 2hrs before every call |

---

## 🗓️ Day-by-Day Execution

### DAY 29 — Universal Lead Capture Webhook

- [ ]  Create n8n account (cloud) or self-host on a VPS
- [ ]  Build the **Universal Lead Intake Webhook** — the single most important automation in the entire OS:
    - Trigger: Webhook receives POST request
    - Input fields: `name`, `email`, `phone`, `company`, `country`, `service_interest`, `source`, `message`
    - Step 1: Create/update contact in HubSpot
    - Step 2: Tag contact with source + timestamp
    - Step 3: Route to scoring node (built Day 32)
    - Step 4: Send internal Slack/WhatsApp notification: *"New lead: [Name] from [Company] — [Source]"*
- [ ]  Connect all Tally forms to this webhook (update form webhook URLs in Tally settings)
- [ ]  Test with a live form submission — verify HubSpot contact created correctly
- [ ]  Connect [Cal.com](http://Cal.com) booking webhook to same intake flow

**Deliverable:** All leads from Tally + [Cal.com](http://Cal.com) now auto-enter HubSpot in real time.

---

### DAY 30 — AI Lead Qualification

- [ ]  Add AI qualification node to the Universal Lead Intake Webhook:
    - After lead is created in HubSpot, send lead data to OpenAI API (GPT-4o-mini)
    - Prompt: *"You are a lead qualification expert for a digital services agency. Analyse this lead and return a JSON with: pain_point_summary (string), service_recommendation (string), qualification_score (1–10), next_action (book_call/send_nurture/watch_and_wait). Lead data: [INSERT LEAD FIELDS]"*
    - Write AI output back to HubSpot custom properties: `ai_qualification_score`, `ai_pain_point`, `ai_service_recommendation`
- [ ]  Test with 5 existing leads — review AI outputs for accuracy
- [ ]  Set threshold: ai_qualification_score ≥8 → flag as HOT_AI in HubSpot

**Deliverable:** Every new lead gets an instant AI qualification score written to HubSpot.

---

### DAY 31 — HOT Lead WhatsApp Alert

- [ ]  Add HOT lead alert node to the webhook:
    - Condition: lead_score ≥70 OR ai_qualification_score ≥8
    - Action: Send WhatsApp message via WhatsApp Business API (or use n8n's Twilio/MessageBird node)
    - Message template: *"🔥 HOT LEAD ALERTnnName: {{name}}nCompany: {{company}}nCountry: {{country}}nService Interest: {{service_interest}}nAI Score: {{ai_score}}/10nPain Point: {{ai_pain_point}}nnContact within 2 hours. → [HubSpot link]"*
- [ ]  Test alert: submit a high-scoring test lead, confirm WhatsApp arrives within 60 seconds
- [ ]  Set up VIP lead route: if source = referral OR company_size >50 → tag VIP, alert goes to founder directly

**Deliverable:** HOT leads trigger real-time WhatsApp alerts. VIP track live.

---

### DAY 32 — Lead Scoring Formula in n8n

- [ ]  Build the **Lead Scoring Node** (insert between intake and routing):

```jsx
// Lead Scoring Formula
let score = 0;

// Budget signal (max 30pts)
if (budget >= 2000) score += 30;
else if (budget >= 1000) score += 20;
else if (budget >= 500) score += 10;

// Timeline (max 25pts)
if (timeline === 'immediately') score += 25;
else if (timeline === 'this_month') score += 15;
else if (timeline === 'next_quarter') score += 5;

// Company size (max 20pts)
if (employees >= 50) score += 20;
else if (employees >= 10) score += 12;
else if (employees >= 1) score += 5;

// Source quality (max 20pts)
if (source === 'referral') score += 20;
else if (source === 'enquiry_method') score += 15;
else if (source === 'cold_email_reply') score += 10;
else if (source === 'organic_form') score += 8;
else score += 5;

// ICP match (max 15pts)
if (icp_match === true) score += 15;
else if (icp_partial === true) score += 8;

// Route by score
if (score >= 70) route = 'HOT';
else if (score >= 40) route = 'WARM';
else route = 'COLD';
```

- [ ]  Write score to HubSpot: `lead_score` property
- [ ]  Write route to HubSpot: `lead_route` property
- [ ]  Test scoring with 10 existing leads — manually verify each route is correct

**Deliverable:** Every lead automatically scored and routed in HubSpot.

---

### DAY 33 — Nurture Auto-Enrollment

- [ ]  Build **WARM Lead Auto-Enrollment** workflow:
    - Trigger: HubSpot contact property `lead_route` changes to `WARM`
    - Action: Add contact to WARM_LEADS list in Mautic/Brevo
    - Action: Set HubSpot property `nurture_enrolled_date` = today
    - Action: Send internal note: *"Lead [Name] enrolled in 21-day nurture — Day 0"*
- [ ]  Build **COLD Lead Newsletter Enrollment**:
    - Trigger: `lead_route` = COLD
    - Action: Add to COLD_LEADS list (monthly newsletter only)
- [ ]  Build **30-Day No Score Change** flag:
    - Trigger: lead_score has not changed in 30 days AND lead_route = COLD
    - Action: Tag `reactivation_candidate` = true
    - Action: Add to Stage 11B reactivation list
- [ ]  Build **90-Day Dead Lead Archive**:
    - Trigger: last_activity_date is 90+ days ago AND no open deals
    - Action: Set contact status = ARCHIVED in HubSpot

**Deliverable:** All routing logic automated. Dead leads archived. Reactivation candidates flagged.

---

### DAY 34 — Booking Flow Automation

- [ ]  Build [**Cal.com](http://Cal.com) → n8n → HubSpot** booking flow:
    - Trigger: [Cal.com](http://Cal.com) webhook fires on new booking
    - Action: Find existing HubSpot contact by email
    - Action: Create HubSpot deal (if none exists): stage = Call Booked, amount = estimated package value
    - Action: Update contact: `call_booked_date` = booking date, `call_type` = discovery
    - Action: Set deal stage = Discovery Call Scheduled
    - Action: Send confirmation WhatsApp to lead: *"Hi [Name], your discovery call with Nivy Digital is confirmed for [Date/Time]. You'll receive a calendar invite shortly. See you then!"*
- [ ]  Build **No-Show Recovery** flow:
    - Trigger: 30 mins after scheduled call time + no [Cal.com](http://Cal.com) "completed" event
    - Action: Send WhatsApp: *"Hi [Name], we missed you on today's call. Want to reschedule? Here's the link: [[Cal.com](http://Cal.com) link]"*
    - Action: Create follow-up task in HubSpot

**Deliverable:** Every booking auto-creates a HubSpot deal. No-shows trigger recovery flow.

---

### DAY 35 — Pre-Call AI Brief Generator

- [ ]  Build **Pre-Call Brief** automation:
    - Trigger: 2 hours before any [cal.com](http://cal.com) event (use n8n's Schedule node checking upcoming bookings)
    - Data pull: Get contact details from HubSpot (company, industry, pain points from form, previous notes)
    - OpenAI call: Send 7-section brief prompt (company overview, pain points, recommended package, 3 objections + responses, 5 discovery questions, competitor awareness, deal structure)
    - Output: Format as clean brief message
    - Delivery: Send to founder via WhatsApp AND save to HubSpot contact notes
- [ ]  Test: create a test booking 2.5 hours from now — verify brief arrives at 2hr mark
- [ ]  Refine prompt if brief quality is poor — add more context fields

**Deliverable:** Every call preceded by an AI-generated 7-section brief. Never go in cold again.

---

### DAY 36 — Post-Call Follow-Up Automation

- [ ]  Build **Post-Call Follow-Up** sequence:
    - Trigger: HubSpot deal stage moves to Discovery Call Completed
    - Branch A (Interested — Proposal stage):
        - Immediately: Send email: *"Great speaking with you [Name]. As promised, I'm preparing your personalised proposal — you'll receive it within 24 hours."*
        - Day +2: If proposal not yet opened in PandaDoc → send WhatsApp nudge
        - Day +5: If no response → send case study email
        - Day +8: Final follow-up email with urgency
    - Branch B (Not Now — Nurture stage):
        - Enroll in 21-day WARM nurture sequence
    - Branch C (Lost):
        - Send WhatsApp invite to free community
        - Tag: `lost_reason` must be filled manually
- [ ]  Test Branch A with a dummy deal — verify email timing and HubSpot update

**Deliverable:** Every call outcome triggers the right automated follow-up. Nothing falls through the cracks.

---

### DAY 37 — Stage 7 Onboarding Automation

- [ ]  Build **Contract Signed → Onboarding Trigger** flow:
    - Trigger: PandaDoc webhook fires when contract is signed
    - Step 1: Update HubSpot deal stage → Closed Won
    - Step 2: Send welcome email within 10 minutes: subject *"Welcome to Nivy Digital — Here's what happens next"*
    - Step 3: Send alert to operations team via WhatsApp/Slack: *"New client signed: [Name] — [Package]. Kickoff due by [Date+3 days]."*
    - Step 4: Auto-create Notion client portal page (duplicate template via Notion API)
    - Step 5: Auto-create Google Drive folder structure: Client Name → Campaign → Assets → Reports → Contracts
    - Step 6: Set HubSpot reminder for Day 7 CSAT survey
- [ ]  Build **Day 7 CSAT** trigger:
    - Trigger: 7 days after contract signed date
    - Action: Send CSAT survey link (Tally form) via email + WhatsApp
- [ ]  Test full flow with a test contract sign

**Deliverable:** Client signing triggers automated welcome + portal creation + ops alert. Zero manual onboarding steps.

---

### DAY 38 — Weekly KPI Report Automation

- [ ]  Build **Monday Morning KPI Report** (fires every Monday at 8am):
    - Pull from HubSpot API:
        - New leads this week
        - HOT leads count
        - Calls booked this week
        - Proposals sent
        - Deals won this week
        - Current MRR
        - Pipeline value (all open deals)
    - Pull from Instantly API:
        - Emails sent this week
        - Open rate
        - Reply rate
    - Format as clean report message
    - Send to founder WhatsApp + log in Notion KPI tracker page
- [ ]  Test: trigger manually, verify all data pulls correctly
- [ ]  See full KPI definitions → [KPI Master Tracker](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc) (linked once built)

**Deliverable:** Weekly KPI report arrives every Monday at 8am without any manual work.

---

### DAY 39 — Client Report Generator

- [ ]  Build **Bi-Weekly Client Report** automation (fires every 2nd Friday per client):
    - Pull client KPI data from HubSpot (or connected ad accounts/analytics)
    - OpenAI call: *"Summarise this client's performance data in 3 sections: (1) What went well, (2) What needs attention, (3) Recommended actions next 2 weeks. Keep it under 300 words. Tone: professional and direct. Data: [INSERT DATA]"*
    - Format into Notion client portal update
    - Send notification to client: *"Your Nivy Digital performance update is ready — [Portal link]"*
- [ ]  Test with one active client

**Deliverable:** Clients receive automated bi-weekly reports. Reduces account management time by 80%.

---

### DAY 40 — Stage 11B Reactivation Engine

- [ ]  Build **Weekly Cold Lead Scan**:
    - Trigger: Every Sunday at 6pm
    - Query HubSpot: all contacts where `lead_route` = COLD AND `last_activity_date` > 30 days AND `reactivation_candidate` = true
    - For each: generate personalised reactivation message using OpenAI (reference their original pain point)
    - Queue messages for manual review + send (don't auto-send — review first in Phase 3, automate in Phase 4)
    - Deliver as a WhatsApp summary list to founder: *"5 cold leads ready to reactivate — review and approve"*
- [ ]  Build **Re-Open Trigger** (behavioral):
    - Trigger: Contact re-opens an email after 7+ days of no activity
    - Action: Within 24 hours, send follow-up email: *"Noticed you revisited our email — happy to answer any questions. Want to book a quick call?"*
    - Action: Update trust score +15 in HubSpot

**Deliverable:** Cold leads are automatically surfaced for reactivation. Behavioural signals trigger real-time follow-up.

---

### DAY 41 — Renewal Radar

- [ ]  Build **Client Renewal Alert** system:
    - Trigger: Client contract end date is 60 days away
    - Action: Create HubSpot task: *"Start renewal conversation with [Client Name]"*
    - Action: Send WhatsApp to account manager: *"⚠️ Renewal Alert: [Client] contract ends in 60 days. Begin upsell conversation."*
- [ ]  Build 30-day renewal reminder (same structure)
- [ ]  Build **Churn Risk Scan** (weekly):
    - Query clients: CSAT score <7 OR last check-in >21 days OR no report viewed in 14 days
    - Alert account manager with churn risk flag
- [ ]  Add contract end dates to all active clients in HubSpot

**Deliverable:** Renewals never sneak up on you. Churn signals flagged before clients leave.

---

### DAY 42 — Phase 3 Review

**Test every automation end-to-end:**

- [ ]  Submit test lead via Tally → confirm HubSpot contact + score + route + WhatsApp alert all fire
- [ ]  Book test call → confirm HubSpot deal created + brief fires 2hrs before
- [ ]  Move test deal to Discovery Call Completed → confirm follow-up sequence triggers
- [ ]  "Sign" test PandaDoc → confirm welcome email + ops alert + Notion portal created
- [ ]  Trigger weekly KPI report manually → confirm all data accurate

**Numbers to check:**

- [ ]  Lead capture: 0 manual entries (all via webhook)
- [ ]  HOT alert speed: <5 minutes from form submit to WhatsApp
- [ ]  Onboarding trigger: <10 minutes from contract sign to welcome email
- [ ]  Scoring accuracy: manually review 10 recent leads — is the routing correct?

---

## 🔗 n8n Workflow Registry

| Workflow | Trigger | Built Day | Status |
| --- | --- | --- | --- |
| Universal Lead Intake | Tally/Cal webhook | Day 29 | [ ] Live |
| AI Lead Qualification | New lead created | Day 30 | [ ] Live |
| HOT Lead WhatsApp Alert | Score ≥70 | Day 31 | [ ] Live |
| Lead Scoring Formula | Every new lead | Day 32 | [ ] Live |
| WARM Nurture Enrollment | Route = WARM | Day 33 | [ ] Live |
| 30-Day Reactivation Flag | No score change 30d | Day 33 | [ ] Live |
| 90-Day Archive | Inactive 90 days | Day 33 | [ ] Live |
| Booking → HubSpot Deal | [Cal.com](http://Cal.com) webhook | Day 34 | [ ] Live |
| No-Show Recovery | 30 mins post-call | Day 34 | [ ] Live |
| Pre-Call AI Brief | 2hrs before call | Day 35 | [ ] Live |
| Post-Call Follow-Up | Stage = Call Completed | Day 36 | [ ] Live |
| Contract Signed Onboarding | PandaDoc webhook | Day 37 | [ ] Live |
| Day 7 CSAT Survey | 7 days post-sign | Day 37 | [ ] Live |
| Weekly KPI Report | Monday 8am | Day 38 | [ ] Live |
| Bi-Weekly Client Report | Every 2nd Friday | Day 39 | [ ] Live |
| Cold Lead Reactivation Scan | Sunday 6pm | Day 40 | [ ] Live |
| Re-Open Behavioural Trigger | Email re-opened 7d+ | Day 40 | [ ] Live |
| 60-Day Renewal Alert | Contract end -60d | Day 41 | [ ] Live |
| Churn Risk Scan | Weekly | Day 41 | [ ] Live |

---

## 🔗 Navigation

**⬅️ [Phase 2 — Conversion](https://www.notion.so/35be5082b9d4814aaec5d47d97d879a8)** | **⚡ [Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)** | **➡️ Phase 4 — Scale**