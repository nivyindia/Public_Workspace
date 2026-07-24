# AI Chatbot Setup Guide (Chatwoot & Tidio)

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-01 Online Presence

**Tags:** `chatbot` `Chatwoot` `Tidio` `live-chat` `automation` `SD-01`

---

> 🎯 **Purpose:** Step-by-step guide to setting up an AI-powered chatbot on the Nivy Digital website. Covers both Chatwoot (self-hosted, free) and Tidio (SaaS, freemium) options.
> 

---

# 📌 Quick Navigation

- [Which Tool to Choose](#choose)
- [Chatwoot Setup](#chatwoot)
- [Tidio Setup](#tidio)
- [Chatbot Script & Flows](#flows)
- [CRM Integration](#crm)

---

# 🤔 Which Tool to Choose? {#choose}

| Factor | Chatwoot | Tidio |
| --- | --- | --- |
| Cost | Free (self-hosted) | Free tier / paid from $19/mo |
| Setup complexity | Medium (needs hosting) | Easy (plugin/embed) |
| AI capability | Basic (with n8n integration) | Built-in AI (Tidio AI) |
| WhatsApp integration | Yes (via API) | Yes (paid plan) |
| Best for | Tech-savvy teams, cost-conscious | Fast setup, AI-first |

**Recommendation:** Start with **Tidio** for speed. Move to **Chatwoot** when scaling and want full control.

---

# ⚙️ Chatwoot Setup {#chatwoot}

## Step 1: Deploy Chatwoot

- Deploy on [Railway.app](http://Railway.app) (free tier) or [Render.com](http://Render.com)
- Use the official Chatwoot Docker image
- Set environment variables: `POSTGRES_DATABASE`, `REDIS_URL`, `SECRET_KEY_BASE`
- Point subdomain: `chat.nivydigital.com` → your deployment

## Step 2: Create Inbox

- Go to Settings → Inboxes → Add Inbox
- Select "Website" as the channel type
- Copy the embed code
- Paste before `</body>` on your website

## Step 3: Connect WhatsApp

- Settings → Inboxes → Add Inbox → WhatsApp
- Requires WhatsApp Business API via 360Dialog or Meta directly
- Follow Meta Business Manager verification steps

## Step 4: Connect to n8n

- Use Chatwoot webhook to trigger n8n workflows
- On new conversation: push contact to HubSpot CRM
- On specific keyword: trigger automated reply sequence

---

# ⚙️ Tidio Setup {#tidio}

## Step 1: Create Account

- Sign up at [tidio.com](http://tidio.com)
- Select website type and business category

## Step 2: Install on Website

- WordPress: install Tidio plugin → activate → connect account
- Other: copy JavaScript snippet → paste before `</body>`

## Step 3: Configure Chat Widget

- Set brand colour, logo, and greeting message
- Set operating hours (show offline message outside hours)
- Enable Tidio AI for automatic FAQ responses

## Step 4: Connect HubSpot

- Integrations → HubSpot → Connect
- Every new chat contact auto-creates a HubSpot contact

---

# 💬 Chatbot Script & Flows {#flows}

## Welcome Message (immediate)

> "Hi! 👋 Welcome to Nivy Digital. We help businesses with accounting, IT, and digital marketing. How can I help you today?"
> 

## Quick Reply Buttons

- 📊 Accounting & Tax Services
- 💻 IT & Tech Services
- 📣 Digital Marketing
- 📅 Book a Free Call
- ❓ Something Else

## If "Book a Free Call" selected:

> "Great! You can book a 30-minute call with our team here: [[Cal.com](http://Cal.com) link]. We'll discuss your needs and how we can help."
> 

## After Hours Message:

> "We're offline right now, but leave your name and email and we'll get back to you within 1 business day!"
> 

---

# 🔗 CRM Integration {#crm}

- Every chatbot contact captured → pushed to HubSpot
- Contact tagged: `Source: Website Chat`
- If email captured → added to HubSpot email sequence
- If call booked → CRM deal created automatically (via [Cal.com](http://Cal.com) + n8n workflow)

---

📋 **PAGE METADATA**

- **Section:** SD-01 — Online Presence
- **Parent:** 🌐 SD-01 Hub
- **Status:** 🟢 Complete | **Last Updated:** May 2026
- **Tags:** `chatbot` `Chatwoot` `Tidio` `live-chat` `SD-01`