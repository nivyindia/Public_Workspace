# n8n Workflow 7 — WhatsApp → CRM

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `WhatsApp` `CRM` `SD-08`

---

> 🎯 **Purpose:** Captures WhatsApp conversations and leads into HubSpot CRM automatically, so no WhatsApp enquiry is lost and all follow-ups are tracked.
> 

---

# ⚙️ Workflow Overview

**Trigger:** New WhatsApp message received (via Chatwoot inbox or WhatsApp Business API)

**Outcome:** Contact created in HubSpot + conversation logged + task created

**Tool:** n8n + Chatwoot + HubSpot

---

# 🗓️ Step-by-Step Build

## Prerequisites:

- Chatwoot set up with WhatsApp Business API inbox
- WhatsApp Business API approved (via 360Dialog or Meta directly)
- n8n connected to Chatwoot via webhook

## Workflow Nodes:

1. **Chatwoot Webhook trigger** — fires on conversation_created
2. **Extract contact data** — phone number, name (if provided), initial message
3. **HubSpot: Search by phone** — check if contact exists
4. **If new:** Create HubSpot contact with phone + "Source: WhatsApp" tag
5. **HubSpot: Create note** — log the WhatsApp message as a note on the contact
6. **HubSpot: Create task** — "Reply to WhatsApp from [phone/name]" — due 2 hours
7. **Notify founder** — SMS or email alert with message preview

## Field Mapping:

```
chatwoot.contact.phone → HubSpot.phone
chatwoot.contact.name → HubSpot.firstName
chatwoot.conversation.messages[0].content → HubSpot.note
"WhatsApp" → HubSpot.lead_source
```

## Note on Privacy:

- WhatsApp numbers are personal data — only use for the purpose they messaged you
- Do not add to marketing lists without explicit consent
- Log in CRM for follow-up purposes only

---

# ✅ Testing Checklist

- [ ]  Send a test WhatsApp message to the business number
- [ ]  Verify Chatwoot receives message and fires webhook
- [ ]  Verify HubSpot contact created with phone + source tag
- [ ]  Verify conversation note logged
- [ ]  Verify task created for follow-up
- [ ]  Verify founder notification received

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `WhatsApp` `Chatwoot` `CRM` `SD-08`