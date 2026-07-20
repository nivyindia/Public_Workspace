# n8n Workflow 1 — Website Form → HubSpot CRM

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `website-form` `CRM` `HubSpot` `SD-08`

---

> 🎯 **Purpose:** n8n workflow that automatically pushes every website form submission into HubSpot CRM as a new contact and deal, with instant notification to the founder.
> 

---

# ⚙️ Workflow Overview

**Trigger:** Website form submitted (HubSpot form, Typeform, or custom form)

**Outcome:** Contact created in HubSpot + deal created + founder notified

**Tool:** n8n (self-hosted on [Railway.app](http://Railway.app))

---

# 🗓️ Step-by-Step Build

## Nodes Required:

1. **Trigger:** Webhook node (receives form submission data)
2. **HubSpot: Create/Update Contact** — using email as unique identifier
3. **HubSpot: Create Deal** — linked to the contact, stage = "New Lead"
4. **Send Email/Slack notification** — alert founder with lead details
5. **HubSpot: Enrol in Sequence** (optional) — add to welcome email sequence

## Workflow JSON Summary:

```json
{
  "trigger": "webhook",
  "nodes": [
    "HubSpot.createContact",
    "HubSpot.createDeal",
    "Gmail.sendEmail",
    "HubSpot.enrollSequence"
  ],
  "mapping": {
    "firstName": "form.first_name",
    "email": "form.email",
    "company": "form.company",
    "serviceInterest": "form.service",
    "country": "form.country"
  }
}
```

## Setup Steps:

1. In n8n: create new workflow, add Webhook trigger node — copy webhook URL
2. In HubSpot form: paste webhook URL as form submission action (Settings → Form → Actions → Webhook)
3. Add HubSpot node — authenticate with HubSpot API key
4. Map form fields to HubSpot contact properties
5. Add deal creation node — link to contact via email
6. Add Gmail/SMTP send email node — send founder notification
7. Test with a live form submission
8. Activate workflow

---

# ✅ Testing Checklist

- [ ]  Submit test form on website
- [ ]  Verify contact created in HubSpot with correct fields
- [ ]  Verify deal created and linked to contact
- [ ]  Verify founder notification email received
- [ ]  Verify welcome email sent to test address

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `HubSpot` `form` `automation` `SD-08`