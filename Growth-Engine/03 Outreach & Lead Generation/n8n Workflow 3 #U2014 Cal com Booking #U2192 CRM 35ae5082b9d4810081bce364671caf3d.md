# n8n Workflow 3 — Cal.com Booking → CRM

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `Cal.com` `booking` `CRM` `SD-08`

---

> 🎯 **Purpose:** When a prospect books a call on [Cal.com](http://Cal.com), this workflow automatically creates/updates their HubSpot contact, moves the deal to “Meeting Booked” stage, and sends a prep email.
> 

---

# ⚙️ Workflow Overview

**Trigger:** New [Cal.com](http://Cal.com) booking created

**Outcome:** HubSpot contact updated + deal moved to Meeting Booked + prep email sent

**Tool:** n8n + [Cal.com](http://Cal.com) webhook

---

# 🗓️ Step-by-Step Build

## Setup:

1. [Cal.com](http://Cal.com) → Settings → Developer → Webhooks — add n8n webhook URL
2. Trigger: BOOKING_CREATED event
3. n8n receives: attendee name, email, booking time, intake form answers

## Workflow Nodes:

1. **Webhook trigger** — receives [Cal.com](http://Cal.com) payload
2. **HubSpot: Search contact by email** — check if they already exist
3. **If exists:** Update contact, move deal to "Meeting Booked"
4. **If new:** Create contact + create deal in "Meeting Booked" stage
5. **Gmail: Send prep email** to prospect with:
    - Meeting confirmation
    - Zoom link
    - 3 questions to think about before the call
6. **HubSpot: Create task** — "Prep for call with [Name]" due 30 mins before meeting

## Prep Email Template:

```
Subject: Your Nivy Digital Call is Confirmed 💼

Hi [Name],

Excited to speak with you on [Date] at [Time].

Zoom link: [link]

To make the most of our time, it would help to know:
1. What’s your biggest business challenge right now?
2. Which services are you most interested in?
3. What does success look like for you in 6 months?

See you soon!
Nivy Digital Team
```

---

# ✅ Testing Checklist

- [ ]  Make a test booking on [Cal.com](http://Cal.com)
- [ ]  Verify contact created/updated in HubSpot
- [ ]  Verify deal stage = Meeting Booked
- [ ]  Verify prep email received
- [ ]  Verify HubSpot task created

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `Cal.com` `booking` `CRM` `meeting` `SD-08`