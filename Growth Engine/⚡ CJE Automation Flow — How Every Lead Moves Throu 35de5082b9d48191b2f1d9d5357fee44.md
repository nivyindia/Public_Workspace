# ⚡ CJE Automation Flow — How Every Lead Moves Through the System

> This page explains how to automate the entire customer journey — from any entry channel, through every stage, to conversion and retention. Audience comes through different channels and different software. This system unifies them all.
> 

---

## The Core Concept

Your audience comes from Instagram, Google Ads, WhatsApp, Cold Email, Referrals — all different places. **Without automation, each channel is a silo.** Someone fills a Google Form and you never follow up. Someone DMs on Instagram and disappears. Someone books a call and nobody knows.

The solution: **Every entry point → one central brain (CRM + n8n) → automated actions push them to the next stage.**

Think of **n8n** as the pipe connecting everything. When something happens on one platform, n8n detects it and instantly triggers actions on another — automatically, 24/7.

---

## Two Types of Automation Running in Parallel

| Type | Purpose | Examples |
| --- | --- | --- |
| **Publishing Automation** | Bring people IN | Scheduling reels, sending cold emails, posting ads |
| **Pipeline Automation** | Move leads FORWARD | Capturing, nurturing, converting, retaining |

Both are separate n8n workflows, but they work together. Publishing automation brings someone in. The moment they respond, pipeline automation takes over.

---

## How It Works — 5 Simple Steps

1. **Person enters from any channel** — They could click a Meta Ad, fill a Google Form, DM on Instagram, reply to a cold email, or join your WhatsApp group. The channel doesn't matter.
2. **n8n catches the event** — n8n is always watching via webhooks & triggers. The moment someone submits a form, books a call, or sends a WhatsApp message — n8n fires immediately. Like a 24/7 receptionist.
3. **Lead gets added to CRM** — n8n automatically creates a contact in HubSpot/GoHighLevel with name, email, phone, source channel, and tags like `cold-lead`, `webinar-signup`, `ad-click`.
4. **Automated messages fire** — Instantly: a WhatsApp message is sent, an email sequence starts, a retargeting ad pixel fires, and the sales team gets a notification to follow up.
5. **Behaviour moves them forward** — If they open the email → next email sends. If they book a call → sales stage moves. If they go silent → reactivation fires after 7 days. Every action (or inaction) is a trigger.

---

## Complete Automated Journey — At a Glance

```
STRANGER (Instagram / Google / LinkedIn / Cold Email / Referral)
  ↓
CAPTURE → Google Form / WhatsApp Opt-in / Calendly / Landing Page / Ad Form
  ↓ [n8n FIRES: contact created in CRM + WhatsApp sent + email triggered + team notified]
MANAGEMENT → Lead scored → Tagged (hot/warm/cold) → Routed
  ↓ [hot → sales directly] [warm/cold → nurture sequence]
NURTURE → Email Day1 → WhatsApp Day2 → Email Day3 → Retargeting Ad → Email Day7
  ↓ [clicked "book call" → n8n moves to Conversion stage in CRM]
CONVERSION → Calendly booked → Zoom call → Audit → Proposal → Close
  ↓ [payment received → n8n fires onboarding workflow]
ONBOARDING → Welcome WhatsApp → Notion folder → ClickUp tasks → Kickoff call
  ↓ [kickoff done → delivery workflow starts]
DELIVERY → Campaign runs → Auto-reports monthly → KPI dashboards live
  ↓ [running for 60 days → referral request sent automatically]
RETENTION → Renewal reminder → Community → VIP consulting → Upsell offer
  ↓ [happy client gets referral program link]
REFERRAL → Client shares → New stranger enters → BACK TO TOP ↑
  ↓ [cold/lost clients go here]
REACTIVATION → Win-back email → Special offer → Community rejoin → Re-enter pipeline
```

---

## The 3 Tools That Glue Everything Together

| Tool | Role |
| --- | --- |
| **n8n / Make** | Automation brain — connects all platforms via webhooks |
| **HubSpot / GoHighLevel** | CRM — tracks every lead's journey and score |
| **WhatsApp Business API (WATI)** | Main communication channel at every stage |

---

## Lead Capture Entry Points

No matter which method brings someone in, they must hit one of these capture points for automation to begin:

- Google Form / Tally form
- WhatsApp opt-in link
- Calendly booking page
- Landing page form
- Instagram/LinkedIn DM reply
- Webinar registration form
- Free audit request form
- Quiz funnel
- Chatbot conversation
- Meta Lead Ad form

All of these trigger the same n8n webhook and create the same CRM contact.

---

## Lead Scoring Formula (Stage 4)

```
Lead Trust Score =
  Email opened ×5
  + Email link clicked ×10
  + Services page visited ×20
  + Lead magnet downloaded ×25
  + Webinar attended ×30
  + Audit requested ×40

Score ≥ 50 → Move to Stage 6 (Conversion)
Score ≥ 80 → HOT LEAD → Alert sales team immediately on WhatsApp
```

---

## Tool Stack Across All Stages

| Tool | Purpose |
| --- | --- |
| n8n (self-hosted) | Automation backbone |
| HubSpot / GoHighLevel | CRM, lead scoring, pipeline tracking |
| WATI / WhatsApp Business API | WhatsApp communication at all stages |
| Brevo / Mautic | Email sequences |
| Tally / Typeform | Lead capture forms |
| Calendly | Call booking |
| PandaDoc | Proposal generation |
| Stripe / Razorpay | Payment → onboarding trigger |
| Notion / ClickUp | Client management |
| [Apollo.io](http://Apollo.io) | B2B lead database |
| Clay + GPT-4o | Lead enrichment + AI personalization |
| Buffer | Social media scheduling |