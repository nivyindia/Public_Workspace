# 🛠️ CJE Tool Stack — Complete Software Map

> Every tool used across all 12 engines, what it does, which stage it belongs to, and how it connects to the automation system.
> 

---

## The Central Brain

| Tool | Role | Stage |
| --- | --- | --- |
| **n8n (self-hosted)** | Automation backbone — connects everything via webhooks | All stages |
| **HubSpot / GoHighLevel** | CRM — lead tracking, scoring, pipeline management | MOFU → POST-SALE |
| **WhatsApp Business API (WATI)** | Primary communication at every stage | All stages |

---

## TOFU Tools — Attention & Interest

| Tool | Purpose |
| --- | --- |
| **Buffer** | Schedule posts across all social platforms |
| **Instagram Graph API** | Auto-DM from comment keywords, post scheduling |
| **LinkedIn API / PhantomBuster** | Connection requests, DM sequences, Sales Navigator scraping |
| [**Apollo.io**](http://Apollo.io) | B2B lead database — find decision-makers by ICP |
| **Clay** | Lead enrichment — LinkedIn bio, company data, tech stack |
| **Instantly** | Cold email sending — 30–100 emails/day with warmup |
| **Apify** | Web scraping — Google Maps, LinkedIn posts, Facebook Groups |
| **GPT-4o** | Personalized cold email openers, social captions, proposal drafts |
| **Google Trends API** | Trend monitoring for viral content hijacking |
| **Meta Ads Manager API** | Ad campaign management, creative rotation |
| **Google Ads API** | Search campaign management, budget alerts |

---

## MOFU Tools — Capture, Management & Nurture

| Tool | Purpose |
| --- | --- |
| **Tally / Typeform** | Lead capture forms, intake forms, quiz funnels |
| **Calendly** | Call booking with auto Zoom link creation |
| **Brevo / Mautic** | Email sequences, drip campaigns, broadcasts |
| **Meta Pixel + Google Tag** | Retargeting audience building from lead actions |
| **ReferralCandy** | Referral link tracking and reward payouts |

---

## BOFU Tools — Conversion, Onboarding & Delivery

| Tool | Purpose |
| --- | --- |
| **PandaDoc** | Auto-generate and send proposals after sales call |
| **Stripe / Razorpay** | Payment collection — triggers onboarding automation |
| **Zoom** | Sales calls, client kickoff calls |
| **Notion** | Client folder creation, project documentation, SOPs |
| **ClickUp** | Project management — tasks auto-created on onboarding |
| **GA4 API** | Client website analytics for monthly reports |
| **Meta Ads API** | Client ad performance data for reports |
| **Google Ads API** | Client search campaign data for reports |

---

## POST-SALE Tools — Retention, Expansion & Referral

| Tool | Purpose |
| --- | --- |
| **ReferralCandy** | Referral program management and tracking |
| **Airtable** | Ecosystem partner database management |
| **GPT-4o** | AI upsell signal detection, reactivation email generation |

---

## How They All Connect (n8n is the hub)

```
Apify scrapes lead
  → n8n enriches via Clay
  → Instantly sends email
  → Reply detected → n8n fires
  → HubSpot contact created
  → WATI sends WhatsApp welcome
  → Brevo starts email drip
  → Meta Pixel fires retargeting
  → Lead books via Calendly
  → n8n generates PandaDoc proposal
  → Stripe payment received
  → n8n creates Notion folder + ClickUp project
  → WATI sends welcome WhatsApp
  → Monthly: GA4 + Meta API → GPT report → WATI + Brevo
  → Day 60: WATI referral request → ReferralCandy link
  → New lead enters → cycle repeats
```

---

## Cost-Effective Stack for Starting Out

| Priority | Tools to Start With |
| --- | --- |
| Must-have Day 1 | n8n (free, self-host) · HubSpot Free · WATI (WhatsApp) · Tally (free) · Brevo (free tier) |
| Add Week 2 | Calendly · [Apollo.io](http://Apollo.io) (free tier) · Buffer (free tier) · Instantly |
| Add Month 2 | Clay · PhantomBuster · PandaDoc · Apify |
| Scale tools | ReferralCandy · GoHighLevel · Mautic (self-hosted email) |