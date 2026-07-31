# n8n Workflow 2 — Chatbot → CRM

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `chatbot` `CRM` `SD-08`

---

> 🎯 **Purpose:** Automates the capture of chatbot conversations (Tidio/Chatwoot) into HubSpot CRM so no chat lead is lost.
> 

---

# ⚙️ Workflow Overview

**Trigger:** New chat conversation started / email captured in chatbot

**Outcome:** Contact created in HubSpot + tagged "Source: Chatbot" + deal created

**Tool:** n8n + Tidio/Chatwoot webhook

---

# 🗓️ Step-by-Step Build

## For Tidio:

1. Tidio Settings → Integrations → Webhooks — add n8n webhook URL
2. Trigger event: "New visitor email captured"
3. n8n receives payload: name, email, conversation snippet
4. n8n → HubSpot: Create/update contact
5. Set property: Lead Source = "Website Chat"
6. Create deal in "New Lead" stage
7. Send notification to founder

## For Chatwoot:

1. Chatwoot → Settings → Integrations → Webhooks — add n8n webhook URL
2. Enable: conversation_created event
3. n8n receives contact details from payload
4. Same HubSpot contact + deal creation as above

## Field Mapping:

```
chatbot.contact.email → HubSpot.email
chatbot.contact.name → HubSpot.firstName
chatbot.conversation.summary → HubSpot.notes
"Website Chat" → HubSpot.lead_source
```

---

# ✅ Testing Checklist

- [ ]  Start a test chat session and provide email
- [ ]  Verify contact created in HubSpot
- [ ]  Verify "Source: Website Chat" tag applied
- [ ]  Verify deal created in pipeline
- [ ]  Verify founder notification received

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `chatbot` `Tidio` `Chatwoot` `CRM` `SD-08`