# 🤖 AI Chatbot Setup Guide — Chatwoot & Tidio

**Parent:** 🌐 SD-01 — Online Presence Hub | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `chatbot` `chatwoot` `tidio` `lead-capture` `AI` `SD-01`

---

> 🎯 **Purpose:** Complete setup guide for deploying an AI chatbot on the Nivy Digital website — covering tool selection, installation, chatbot flow design, CRM integration, and testing.
> 

---

# 📌 QUICK NAVIGATION

- [Tool Comparison](#tools)
- [Chatwoot Setup (Recommended)](#chatwoot)
- [Tidio Setup (Alternative)](#tidio)
- [Chatbot Flow Scripts](#flows)
- [n8n CRM Integration](#integration)
- [Testing Checklist](#testing)

---

# 🔧 TOOL COMPARISON {#tools}

| Feature | Chatwoot (Self-Hosted) | Tidio (Free Tier) | Botpress |
| --- | --- | --- | --- |
| Cost | Free (hosting ~₹500/month) | Free (50 conversations/month) | Free (self-hosted) |
| AI capabilities | Basic (needs Botpress integration) | Built-in AI replies | Advanced AI flows |
| CRM integration | Via n8n | Native HubSpot integration | Via n8n |
| Setup complexity | Medium | Easy | High |
| Best for | Full control, no conversation limit | Quick start, small volume | Complex flows |

**✅ Recommendation:** Start with **Tidio** (free, 5-minute setup). Migrate to **Chatwoot + Botpress** when volume exceeds 50 chats/month.

---

# 🟢 CHATWOOT SETUP (RECOMMENDED) {#chatwoot}

## Step 1 — Deploy Chatwoot

1. Go to [railway.app](http://railway.app) (free tier available)
2. Click "Deploy" → Search "Chatwoot"
3. Set environment variables:
    - `SECRET_KEY_BASE` = generate random 64-char string
    - `POSTGRES_DATABASE` = chatwoot
4. Deploy → Get your Chatwoot URL (e.g., [chatwoot-production.up.railway.app](http://chatwoot-production.up.railway.app))
5. Complete signup at your Chatwoot URL

## Step 2 — Create Inbox (Website Channel)

1. Settings → Inboxes → Add Inbox
2. Select "Website"
3. Name: "Nivy Digital Website"
4. Website domain: your website URL
5. Copy the embed code

## Step 3 — Add to WordPress

1. Install "WPCode" plugin
2. Add Code Snippet → Paste Chatwoot embed code
3. Location: Body (Footer)
4. Save → Test on your website

## Step 4 — Customize Widget

- Widget color: Match brand color
- Greeting message: "Hi! 👋 Welcome to Nivy Digital. How can we help you today?"
- Away message: "We're offline right now. Leave your details and we'll reply within 4 hours."
- Widget position: Bottom right

---

# 🔵 TIDIO SETUP (ALTERNATIVE) {#tidio}

## Quick Setup (5 minutes)

1. Sign up at [tidio.com](http://tidio.com) (free)
2. Add website URL
3. Install WordPress plugin: "Tidio Live Chat"
4. Activate → Widget appears automatically
5. Go to Tidio dashboard → Customize widget color + greeting

## Enable AI Replies (Tidio AI)

1. Tidio Dashboard → Lyro AI
2. Add FAQ answers (copy from website FAQ page)
3. Set confidence threshold: 70%
4. Enable: "Let Lyro answer questions automatically"

---

# 💬 CHATBOT FLOW SCRIPTS {#flows}

## Flow 1 — Greeting & Interest Capture

```
Bot: "Hi! 👋 Welcome to Nivy Digital. What brings you here today?"

Options:
[ VA Services ]  [ Digital Marketing ]  [ Automation ]  [ Just exploring ]

→ VA Services: "Great! We place dedicated VAs for businesses across US, UK, UAE & India. What's your main need?"
→ Digital Marketing: "Perfect! We handle SEO, social media, paid ads & content. What's your biggest challenge?"
→ Automation: "Excellent! We automate your sales & marketing with n8n, HubSpot & AI. Tell me more about your workflow?"
→ Just exploring: "No problem! Feel free to browse. If you have any questions, I'm right here. 😊"
```

## Flow 2 — Lead Qualification

```
Bot: "What's your company size?"
Options: [ Solo founder ]  [ 2–10 team ]  [ 11–50 team ]  [ 50+ team ]

Bot: "Which country are you based in?"
Options: [ India ]  [ USA ]  [ UK ]  [ UAE ]  [ Australia ]  [ Other ]

Bot: "May I have your email to send you relevant info and pricing?"
[Email input field]

Bot: "Thanks, [Name]! I've noted your details. Our team will reach out within 4 hours. Meanwhile, would you like to book a free 30-min strategy call?"
Buttons: [ Book a Call → Cal.com link ]  [ No thanks ]
```

## Flow 3 — FAQ Auto-Responses

| Keyword Trigger | Bot Response |
| --- | --- |
| "price" / "cost" / "how much" | "Our VA packages start from $500/month. For digital marketing, packages start from $300/month. Want to see full pricing?" → [View Pricing] |
| "how long" / "timeline" | "Most clients are onboarded within 3–5 business days. For marketing projects, we typically deliver the first round in 7–10 days." |
| "contact" / "talk to someone" | "I can connect you with our team! You can book a free call here: [[Cal.com](http://Cal.com) link] or email us at [hello@nivydigital.com](mailto:hello@nivydigital.com)" |
| "refund" / "guarantee" | "We offer a 7-day satisfaction guarantee on all new VA engagements. If you're not happy, we'll reassign or refund." |
| "services" | "We offer: ✅ Virtual Assistant Services ✅ Digital Marketing ✅ AI & Automation ✅ Lead Generation. Which interests you most?" |

## Flow 4 — After-Hours

```
Bot: "Hi! Our team is currently offline (we're back at 9 AM IST). 
I can still help with common questions, or you can leave your details 
and we'll get back to you first thing!"

[Name input]  [Email input]  [Message input]

Bot: "Got it! We'll reply to [email] by [next business day]. 
In the meantime, feel free to book a call at your convenience: [Cal.com link]"
```

## Flow 5 — Booking CTA (trigger after 2+ minutes on site)

```
Bot: "👋 Still exploring? Most of our clients found it helpful to 
just have a quick 30-min call — no pressure, just clarity."
Button: [ Book Free Strategy Call ] → Cal.com
```

---

# 🔗 N8N CRM INTEGRATION {#integration}

## Chatwoot → HubSpot via n8n

**Trigger:** New conversation in Chatwoot with email captured

**n8n Workflow Steps:**

1. Chatwoot Webhook → n8n trigger node
2. Extract: name, email, service interest from conversation
3. HubSpot: Create/update contact
4. HubSpot: Set properties (Lead Source = "chatbot", Service Interest)
5. HubSpot: Assign to pipeline stage "New Lead"
6. Slack: Send notification → "New chatbot lead: [name] — [email] — interested in [service]"

**Tidio → HubSpot (direct):**

- Tidio has native HubSpot integration
- Settings → Integrations → HubSpot → Connect
- Map: Visitor email → HubSpot contact email
- Auto-creates contact on every conversation with email

---

# ✅ TESTING CHECKLIST {#testing}

- [ ]  Widget appears on website (desktop + mobile)
- [ ]  Greeting message shows within 3 seconds
- [ ]  All 5 flows tested end-to-end
- [ ]  Email captured in test conversation → appears in HubSpot CRM
- [ ]  Slack notification received after test lead
- [ ]  After-hours message shows outside 9am–6pm IST
- [ ]  FAQ keyword triggers tested (type "price", "contact", etc.)
- [ ]  Booking CTA links to correct [Cal.com](http://Cal.com) page
- [ ]  Mobile chat widget functions correctly
- [ ]  Widget color matches brand

---

📋 **PAGE METADATA**

- **Section:** SD-01 Online Presence
- **Parent:** 🌐 SD-01 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `chatbot` `chatwoot` `tidio` `AI` `lead-capture` `n8n` `SD-01` `nivy-digital`
- **Related Pages:** Website Build SOP | n8n Workflow Library | SD-08 Automation Systems

---