# Sales Automation System

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-07 Sales Conversion

**Tags:** `sales` `automation` `HubSpot` `sequences` `SD-07`

---

> 🎯 **Purpose:** End-to-end sales automation system for Nivy Digital — covering every automated touchpoint from first enquiry to signed contract, using HubSpot workflows.
> 

---

# 📌 Quick Navigation

- [Automation Philosophy](#philosophy)
- [Workflow Map](#map)
- [Workflow 1: New Lead Enquiry](#wf1)
- [Workflow 2: Meeting Booked](#wf2)
- [Workflow 3: Proposal Sent](#wf3)
- [Workflow 4: Deal Won](#wf4)
- [Workflow 5: Deal Lost](#wf5)

---

# 💡 Automation Philosophy {#philosophy}

Automation handles the **repetitive**, so humans can focus on the **relational**.

**What we automate:**

- Confirmation emails, reminders, follow-up nudges
- CRM updates and deal stage changes
- Task creation for the sales team
- Notification alerts to the founder

**What we never automate:**

- The actual sales conversation
- Proposal personalisation
- Relationship-building messages

---

# 🗺️ Workflow Map {#map}

```
New Lead Created
      ↓
[WF1] Lead Welcome Email + task created
      ↓
 Meeting Booked (Cal.com → HubSpot)
      ↓
[WF2] Booking confirmation + prep email
      ↓
 Meeting Happens
      ↓
[WF3] Proposal sent → Follow-up sequence starts
      ↓
   [WF4] Won → Onboarding triggered
   [WF5] Lost → Lost reason logged, nurture begins
```

---

# ☑️ Workflow 1: New Lead Enquiry {#wf1}

**Trigger:** New contact created via website form or manual entry

**Actions:**

1. Send automated email to lead:
    
    > Subject: "Thanks for reaching out to Nivy Digital 👋"
    > 
    
    > "Hi [Name], thanks for getting in touch! A member of our team will be in contact within 1 business day. In the meantime, feel free to book a call directly: [[Cal.com](http://Cal.com) link]"
    > 
2. Send Slack/email notification to founder: "New lead: [Name] from [Company]"
3. Create task: "Review and qualify new lead [Name]" — due in 4 hours

---

# ☑️ Workflow 2: Meeting Booked {#wf2}

**Trigger:** [Cal.com](http://Cal.com) booking created (via Zapier/native HubSpot integration)

**Actions:**

1. Send confirmation email to lead:
    
    > "Your call is confirmed for [date/time]. Here’s the Zoom link: [link]. To make the most of our call, please bring: a brief overview of your business, any specific challenges you’re facing."
    > 
2. Send reminder email 24 hours before
3. Send reminder email 1 hour before
4. Move deal to “Meeting Booked” stage in HubSpot
5. Create task for founder: "Prep for call with [Name] — review their profile"

---

# ☑️ Workflow 3: Proposal Sent {#wf3}

**Trigger:** Deal stage moved to "Proposal Sent"

**Actions:**

1. Day 3: Auto email — "Just checking you received the proposal…"
2. Day 7: Auto email — "Happy to answer any questions before you decide…"
3. Create task Day 5: "Call [Name] to discuss proposal"
4. If no response by Day 10: move to "Stalled" stage + task to follow up

---

# ☑️ Workflow 4: Deal Won → Onboarding {#wf4}

**Trigger:** Deal stage moved to "Closed Won"

**Actions:**

1. Send welcome email to new client
2. Notify founder + delivery team: "New client signed: [Name]"
3. Create onboarding task checklist
4. Add contact to "Active Clients" HubSpot list
5. Schedule 90-day referral ask (future workflow trigger)

---

# ☑️ Workflow 5: Deal Lost {#wf5}

**Trigger:** Deal stage moved to "Closed Lost"

**Actions:**

1. Log loss reason (required field before moving stage)
2. Send gracious close email to prospect:
    
    > "Hi [Name], no worries at all — I appreciate your time. If things change or you need support in the future, we’re always here. I wish you and [Company] every success!"
    > 
3. Add to 90-day re-engagement nurture sequence
4. Tag in CRM: "Lost — [reason]"

---

📋 **PAGE METADATA**

- **Section:** SD-07 — Sales Conversion
- **Parent:** 💰 SD-07 Hub
- **Status:** 🟢 Complete | **Last Updated:** May 2026
- **Tags:** `sales-automation` `HubSpot` `workflows` `sequences` `SD-07`