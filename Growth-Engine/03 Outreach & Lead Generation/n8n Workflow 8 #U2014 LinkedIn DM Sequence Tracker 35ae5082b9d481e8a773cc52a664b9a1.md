# n8n Workflow 8 — LinkedIn DM Sequence Tracker

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `LinkedIn` `DM` `sequence` `SD-08`

---

> 🎯 **Purpose:** Semi-automated LinkedIn DM follow-up system using n8n to track outreach, schedule tasks, and send personalised follow-ups via Phantombuster or manual triggers.
> 

---

# ⚙️ Workflow Overview

**Important note:** LinkedIn does not have a public API for DMs. This workflow uses a semi-automated approach — human-sent DMs tracked by n8n with auto task scheduling.

**Trigger:** VA or founder logs a LinkedIn DM sent (via HubSpot activity or Google Sheet entry)

**Outcome:** Automatic follow-up task scheduled at Day 5 + Day 12 with personalised template

**Tool:** n8n + HubSpot + Google Sheets (optional)

---

# 🗓️ Step-by-Step Build

## Approach A: HubSpot Activity Trigger

1. VA sends LinkedIn DM → logs activity in HubSpot: "LinkedIn DM Sent — [date]"
2. HubSpot workflow detects activity → sends webhook to n8n
3. n8n schedules:
    - Day 5: Create HubSpot task — "Send LinkedIn Follow-Up 1 to [Name]"
    - Day 12: Create HubSpot task — "Send LinkedIn Follow-Up 2 to [Name]"
4. VA sees task → sends follow-up manually from LinkedIn

## Approach B: Google Sheet Trigger (Simpler)

1. VA logs outreach in Google Sheet: Name, LinkedIn URL, DM Date, Status
2. n8n Google Sheets trigger: runs daily, checks for rows where DM Date = 5 days ago + Status = "Sent"
3. n8n sends VA a notification/email: "Follow up with [Name] today — [LinkedIn URL]"
4. VA follows up, updates Sheet status to "Follow-up 1 Done"
5. n8n checks again at Day 12 for "Follow-up 2" trigger

## LinkedIn Follow-Up Templates:

**Day 5:**

> "Hey [Name], just following up on my message from earlier this week. Happy to share more about what we do if useful. Let me know!"
> 

**Day 12:**

> "[Name], I’ll leave it here — just wanted to say the offer still stands if you ever need support with [service]. Have a brilliant week!"
> 

---

# 📊 Outreach Tracking Sheet Structure

| Name | Company | LinkedIn URL | DM Date | Status | FU1 Date | FU1 Done | FU2 Date | FU2 Done | Outcome |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| John Smith | Acme Ltd | [linkedin.com/in/](http://linkedin.com/in/)... | 01/05/26 | Sent | 06/05/26 | ✔️ | 13/05/26 |  |  |

---

# ✅ Testing Checklist

- [ ]  Log a test LinkedIn DM in the Sheet/HubSpot
- [ ]  Verify n8n detects it at Day 5
- [ ]  Verify follow-up notification sent to VA
- [ ]  Verify Day 12 task/notification also triggers
- [ ]  Verify status updates correctly after each step

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `LinkedIn` `DM` `outreach-tracking` `semi-automated` `SD-08`