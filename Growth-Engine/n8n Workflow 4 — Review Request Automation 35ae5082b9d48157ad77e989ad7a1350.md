# n8n Workflow 4 — Review Request Automation

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `review` `Google` `reputation` `SD-08`

---

> 🎯 **Purpose:** Automated system to request Google/Trustpilot reviews from satisfied clients at the right moment, boosting online reputation without manual effort.
> 

---

# ⚙️ Workflow Overview

**Trigger:** Client reaches 30-day milestone (HubSpot date field) OR founder manually triggers

**Outcome:** Personalised review request email sent to client

**Tool:** n8n + HubSpot + Gmail

---

# 🗓️ Step-by-Step Build

## Method 1: Date-Based Trigger (HubSpot)

1. HubSpot workflow: 30 days after "Client Start Date" property → trigger n8n webhook
2. n8n receives client name, email, service type
3. n8n → Gmail: send personalised review request email

## Method 2: Manual Trigger (After Positive Feedback)

1. Founder receives positive WhatsApp/email from client
2. Open HubSpot → find contact → manually trigger "Send Review Request" workflow
3. n8n sends email immediately

## Review Request Email Template:

```
Subject: A quick favour, [Name]? ⭐

Hi [Name],

It’s been a pleasure working with you! I hope you’re seeing great results so far.

If you have 2 minutes, a Google review would mean the world to us — it helps other businesses like yours find us:

🔗 [Google Review Link]

Just a sentence or two is perfect. Thank you so much!

Warm regards,
[Founder Name]
Nivy Digital
```

## Platforms to Request Reviews:

- Google Business Profile (most important)
- Trustpilot (UK/international credibility)
- Clutch (B2B services credibility)
- LinkedIn recommendations (social proof)

---

# ✅ Testing Checklist

- [ ]  Test trigger fires at 30-day mark
- [ ]  Email received with correct client name
- [ ]  Review link works and opens Google page
- [ ]  Reply handling: if client replies, notification sent to founder

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `review-request` `Google` `reputation` `SD-08`