# n8n Workflow 6 — Cold Lead Re-engagement

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `re-engagement` `cold-leads` `email` `SD-08`

---

> 🎯 **Purpose:** Automatically re-engages cold leads at 90 days with a personalised email sequence, reviving pipeline without manual effort.
> 

---

# ⚙️ Workflow Overview

**Trigger:** HubSpot contact status = "Cold" AND last activity date = 90 days ago

**Outcome:** Personalised re-engagement email sequence sent (2 emails over 7 days)

**Tool:** n8n + HubSpot + Gmail

---

# 🗓️ Step-by-Step Build

## HubSpot Setup:

1. Create a HubSpot workflow:
    - Trigger: Contact property "Lead Status" = Cold AND date = 90 days after last contact
    - Action: Send webhook to n8n
2. n8n receives: contact name, email, company, service interest, market

## n8n Workflow Nodes:

1. **Webhook trigger** — receives contact data from HubSpot
2. **Claude AI node** — personalise re-engagement email using contact details
3. **Gmail node** — send Email 1 (Day 90)
4. **Wait node** — 7 days
5. **Check HubSpot** — has contact replied or booked? (check last activity)
6. **If no reply:** Send Email 2 (Day 97)
7. **HubSpot: Update contact** — tag "Re-engaged" or "Permanently Cold"

## AI Personalisation Prompt:

```
Write a short, warm re-engagement email for a cold B2B lead.

Contact: [NAME] at [COMPANY]
Service interest: [SERVICE]
Market: [COUNTRY]

The email should:
- Acknowledge time has passed (casual, not apologetic)
- Reference something relevant to their industry or service
- Offer a specific, low-commitment next step
- Be under 100 words
- Sound human, not automated
```

## Email 2 Template (Day 97 — final):

```
Subject: Last one from me, [Name]

Hi [Name],

I’ll leave it here — I know timing isn’t always right. If you ever need support with [service], we’d love to help.

Wishing [Company] every success!

[Founder name]
Nivy Digital
```

---

# ✅ Testing Checklist

- [ ]  Mark a test contact as Cold in HubSpot
- [ ]  Verify webhook fires at 90 days
- [ ]  Verify Email 1 received and personalised correctly
- [ ]  Verify Email 2 sends only if no reply after 7 days
- [ ]  Verify HubSpot contact updated after sequence completes

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `re-engagement` `cold-leads` `AI` `automation` `SD-08`