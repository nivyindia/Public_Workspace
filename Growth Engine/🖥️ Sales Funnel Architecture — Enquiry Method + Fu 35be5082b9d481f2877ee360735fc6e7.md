# 🖥️ Sales Funnel Architecture — Enquiry Method + Full Pipeline Map

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **This page maps the complete Nivy sales funnel architecture: how the Enquiry Method, CJE system, inbound channels, and CRM pipeline connect into one end-to-end machine.**
> 

---

## 🗺️ Complete Sales Funnel Architecture

```
ATTENTION LAYER (Stage 1)
│
├─ ORGANIC: Reels, LinkedIn posts, YouTube, SEO blog, Twitter
├─ OUTBOUND: Cold email (Apollo+Instantly), LinkedIn DMs (PhantomBuster)
├─ ENQUIRY METHOD: "Looking for X in Y" posts on LinkedIn, Facebook Groups
├─ PAID: Meta Ads, Google Ads, LinkedIn Ads, Retargeting
└─ COMMUNITY: WhatsApp groups, Telegram, Discord
         ↓
INTEREST & TRUST LAYER (Stage 2)
│
├─ EMAIL SEQUENCES: 7-day trust-building (Mautic)
├─ CONTENT: Case studies, client testimonials, free guides
├─ RETARGETING: Social proof ads to website visitors
└─ COMMUNITY: WhatsApp group for free value delivery
         ↓
LEAD CAPTURE LAYER (Stage 3)
│
├─ FORMS: Audit request, contact, quote, community join (Tally.so)
├─ BOOKING: Discovery call (Cal.com)
├─ WHATSAPP: Inbound message auto-capture
└─ SOCIAL LEADS: Meta Lead Ads, LinkedIn Lead Gen Forms
         ↓
LEAD MANAGEMENT LAYER (Stage 4)
│
├─ CRM: HubSpot pipeline with custom stages
├─ AI SCORING: HOT/WARM/COLD classification
├─ ROUTING: HOT → Sales | WARM → Nurture | COLD → Long-term sequence
└─ ENRICHMENT: Clay + Apollo auto-enrichment
         ↓
NURTURING LAYER (Stage 5)
│
├─ WARM (14-day): Educational emails + case studies + audit offer
├─ COLD (monthly): Newsletter + insight content
├─ PARTNER: Separate partnership sequence
└─ RETARGETING: Ads running in parallel to email
         ↓
CONVERSION LAYER (Stage 6)
│
├─ BOOKING: Call with founder/sales lead (Cal.com)
├─ CONSULTATION: Discovery + audit + proposal
├─ OBJECTION HANDLING: AI-powered + human escalation
└─ CLOSE: Proposal sent (PandaDoc) + payment (Stripe)
         ↓
ONBOARDING (Stage 7) → DELIVERY (Stage 8)
         ↓
RETENTION (Stage 9) → EXPANSION (Stage 10)
         ↓
REFERRAL (Stage 11) → REACTIVATION (Stage 11B) → ECOSYSTEM (Stage 12)
```

---

## 🎯 Enquiry Method — Funnel Integration

The enquiry method feeds directly into Stages 1–3:

| Platform | Enquiry Type | Where Leads Go |
| --- | --- | --- |
| LinkedIn Posts | "Looking for X agency in Y" | DMs → Manual capture → HubSpot |
| Facebook Groups | Opportunity posts in business groups | Comments/DMs → n8n capture |
| Email outreach | Enquiry-style subject lines | Replies → Mautic webhook → HubSpot |
| WhatsApp groups | Broadcast enquiry messages | Replies → WhatsApp API → HubSpot |
| Contact form outreach | Enquiry submitted on target website | Email reply → Gmail API → HubSpot |
| Instagram | Enquiry-style captions with DM CTA | Comment/DM → n8n capture |

---

## 🔄 Lead Flow States

| State | Definition | Action |
| --- | --- | --- |
| NEW | Just captured, not yet qualified | Run AI qualification immediately |
| HOT | Active need, decision maker, urgent | Contact within 1 hour, sales team takes over |
| WARM | Interested, not urgent | Enter 14-day nurture sequence |
| COLD | Researching, long timeline | Enter monthly newsletter sequence |
| PARTNER | Agency/freelancer/consultant | Enter partner pipeline |
| CALL BOOKED | Has scheduled a discovery call | Pre-call prep briefing sent |
| PROPOSAL SENT | Received our proposal | Follow-up every 2-3 days |
| NEGOTIATING | Price/scope discussion | Sales lead handles personally |
| WON | Signed + paid | Move to onboarding (Stage 7) |
| LOST | Did not convert | Tag reason + reactivation in 60 days |
| CLIENT | Active paying client | Deliver + retain (Stages 7-10) |
| CHURNED | Left | Reactivation sequence (Stage 11B) |

---

## ⚡ Automation Flows Summary

| Flow # | Trigger | What Happens |
| --- | --- | --- |
| Flow 1 | Daily 7am | Content generated + scheduled across platforms |
| Flow 2 | Any webhook (form/reply/DM/comment) | Universal lead capture + normalize + deduplicate |
| Flow 3 | New contact created in HubSpot | AI qualification + CRM enrichment + score |
| Flow 4 | Classification = HOT | Sales WhatsApp alert + fast-track sequence |
| Flow 5 | Classification = WARM | 14-day Mautic nurture sequence enrolled |
| Flow 6 | Classification = COLD | Monthly newsletter enrolled |
| Flow 7 | Email reply received | AI classifies reply → objection handling or hot-track |
| Flow 8 | Lead score crosses 80 | HOT alert + case study auto-sent |
| Flow 9 | Call booked ([Cal.com](http://Cal.com)) | Pre-call brief generated + confirmation sent |
| Flow 10 | Deal marked WON | Onboarding flow triggered (Stage 7) |
| Flow 11 | Monday 8am | Weekly KPI report to team |
| Flow 12 | No activity 30 days | Flag for reactivation sequence |
| Flow 13 | Client inactive signal | Churn risk alert to account manager |

---

## 🔗 Connected Pages

- [🤖 Sales Automation via Enquiry Method](https://www.notion.so/ea0e5082b9d4829cb8bb01d3eb56f514)
- [🎣 SD-03 — Lead Generation & Data Hub](https://www.notion.so/359e5082b9d481429921cdc02141c77a)
- [📈 SD-07 — Sales Conversion Hub](https://www.notion.so/359e5082b9d481ce94f8c6e10b79377c)
- [📈 Sales Automation System](https://www.notion.so/35ae5082b9d48134b25cd6b8b50776f0)
- [🔄 Follow-Up Automation System](https://www.notion.so/35ae5082b9d4813fa6b7c701fe9ef72f)