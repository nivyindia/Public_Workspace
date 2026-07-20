# 🔵 Pipeline Automations — How Leads Move Forward

> These automations move every lead from capture to conversion to retention. They run the moment someone enters any entry point, and continue running until they become a client — and beyond.
> 

---

## PIPE-01 — Universal Lead Capture Gateway (Stage 3)

**Stage:** MOFU — Engine 3 (Lead Capture)

**What it does:** Catches every lead from every channel and creates a CRM contact within 60 seconds — no matter where they came from.

**Entry points that trigger this automation:**

- Tally / Typeform submission
- Calendly booking
- WhatsApp opt-in message
- Meta Lead Ad form
- LinkedIn Lead Gen form
- Instagram/LinkedIn DM reply
- Webinar registration
- Free audit request

**Flow:**

1. ANY of the above events fires n8n webhook
2. n8n deduplicates → creates CRM contact with: name, email, phone, source, country, service interest
3. Within 60 seconds: WhatsApp welcome sent + confirmation email fired + team Slack/WA alert
4. Meta Pixel + Google Tag fires → lead added to retargeting audience automatically
5. Lead moves to Stage 4 (Lead Management) — scoring begins

**Tools:** n8n · Tally · Calendly · WhatsApp API · HubSpot · Brevo · Meta Pixel

---

## PIPE-02 — Lead Scoring & Routing (Stage 4)

**Stage:** MOFU — Engine 4 (Lead Management)

**What it does:** Automatically scores every lead based on their behaviour and routes them to the right next step — hot leads go straight to sales, cold leads go to nurture.

**Scoring formula:**

```
Email opened          +5 pts
Email link clicked   +10 pts
Services page visit  +20 pts
Lead magnet download +25 pts
Webinar attended     +30 pts
Audit requested      +40 pts
```

**Routing rules:**

- Score ≥ 80 → HOT → Sales team WhatsApp alert → Stage 6 (Conversion)
- Score 40–79 → WARM → Stage 5 (Nurture sequence)
- Score < 40 → COLD → Long nurture (30-day drip)
- Unqualified → 30-day reactivation list

**Flow:**

1. Every lead action triggers score update in HubSpot
2. n8n monitors score continuously
3. Score ≥ 80 → WhatsApp alert to sales with: name, company, country, score, HubSpot link
4. Lead routed to correct next stage automatically

**Tools:** n8n · HubSpot Scoring · GPT-4o · WhatsApp Alert

---

## PIPE-03 — 7-Day Email + WhatsApp Nurture Sequence (Stage 5)

**Stage:** MOFU — Engine 5 (Nurturing)

**What it does:** Automatically warms up cold and warm leads over 7 days through a combination of emails and WhatsApp messages. Every message is personalized to their industry.

**Sequence:**

- **Day 0:** Welcome email (value-first, no pitch) + WhatsApp welcome
- **Day 1:** Case study email matched to their industry (AI-selected)
- **Day 2:** WhatsApp follow-up: "Did you get a chance to read the case study?"
- **Day 3:** Email: ROI calculation example for their business type
- **Day 4:** WhatsApp: quick tip relevant to their industry
- **Day 7:** Email: "Book a free 30-min business audit" CTA + limited slots

**If no open by Day 7+14:**

- Different subject line resent (AI-generated new angle)
- Still cold → moved to Reactivation (Stage 11B)

**Tools:** Brevo / Mautic · WATI / WhatsApp API · n8n · GPT-4o · HubSpot

---

## PIPE-04 — Sales Call Booking & Follow-up (Stage 6)

**Stage:** BOFU — Engine 6 (Conversion)

**What it does:** Automates everything around the sales call — booking, reminders, pre-call briefing, post-call follow-up, and proposal generation.

**Flow:**

1. Lead clicks booking link → Calendly auto-creates Zoom meeting + confirmation email
2. n8n fetches lead's CRM profile → AI generates briefing doc for sales rep (pain points, score, source, company info)
3. Reminders: 24hr email + 1hr WhatsApp to lead. Briefing doc to sales rep via WhatsApp
4. Post-call: sales rep marks outcome in CRM → n8n branches:
    - **Won** → PandaDoc proposal auto-generated + sent via email
    - **No show** → Reschedule message sent
    - **Not now** → 30-day nurture restart
5. No reply to proposal 48hrs → follow-up WhatsApp + email fires automatically

**Tools:** Calendly · Zoom · n8n · GPT-4o · WhatsApp · Brevo · HubSpot · PandaDoc

---

## PIPE-05 — Client Onboarding Automation (Stage 7)

**Stage:** BOFU — Engine 7 (Onboarding)

**What it does:** The moment payment is received, the entire onboarding sequence fires automatically — Notion folder, ClickUp project, WhatsApp welcome, intake form, and kickoff booking.

**Trigger:** Stripe / Razorpay payment webhook → n8n fires

**Simultaneous actions (all happen within 2 minutes of payment):**

- Welcome WhatsApp from founder sent
- Welcome email with onboarding checklist sent
- Notion client folder auto-created
- ClickUp project + all tasks auto-created
- Intake form (Tally) sent: brand assets, goals, target audience, competitors, logins
- Kickoff call Calendly link sent
- CRM moved to "Client — Active"
- Team assigned + notified on WhatsApp

**After kickoff call:** Delivery Engine activates automatically

**Tools:** Stripe / Razorpay · n8n · WhatsApp · Brevo · Notion · ClickUp · Tally · Calendly · HubSpot

---

## PIPE-06 — Auto Monthly Performance Report (Stage 8)

**Stage:** BOFU — Engine 8 (Delivery)

**What it does:** On the 1st of every month, automatically pulls performance data from all ad platforms, writes a human-readable summary with AI, and sends it to the client.

**Flow:**

1. 1st of every month → n8n schedule trigger fires
2. Fetches data from: GA4 API, Meta Ads API, Google Ads API for each client
3. GPT-4o writes human-readable summary: wins, areas to improve, next month plan
4. Report compiled into Google Slides / PDF → sent via email + WhatsApp to client
5. Internal copy logged in Notion client folder + KPI dashboard updated

**Tools:** n8n · GPT-4o · GA4 API · Meta Ads API · Google Ads API · Brevo · WhatsApp · Notion

---

## PIPE-07 — Retention & Renewal Reminder (Stage 9)

**Stage:** POST-SALE — Engine 9 (Retention)

**What it does:** Automatically sends a multi-step renewal reminder sequence starting 30 days before a client's contract ends.

**Sequence:**

- **30 days before:** Email with "Here’s what we achieved together" + renewal offer
- **7 days before:** WhatsApp from account manager + call scheduling link
- **1 day before:** WhatsApp reminder + last-chance upgrade offer

**Outcomes:**

- **Renewed:** New contract date set in CRM → cycle repeats
- **Not renewed:** Reactivation Stage 11B activates automatically

**Tools:** n8n · HubSpot · WhatsApp · Brevo · Calendly

---

## PIPE-08 — AI Upsell Opportunity Detection (Stage 10)

**Stage:** POST-SALE — Engine 10 (Expansion)

**What it does:** Monitors client performance data weekly and uses AI to detect when a client is ready for an upsell. Alerts the account manager with suggested offer and talking points.

**Upsell signals AI watches for:**

- Campaign ROI is 4x+ → suggest increasing budget
- Client only has SEO → suggest paid ads
- Engagement is high → suggest content retainer
- Business milestone achieved → suggest next service

**Flow:**

1. n8n monitors client performance data weekly
2. GPT-4o analyzes metrics → detects upsell signal
3. Account manager alerted on WhatsApp with: suggested offer + talking points + client context
4. Account manager reaches out → if accepted → new service onboarded

**Tools:** n8n · GPT-4o · HubSpot · WhatsApp Alert · GA4 API · Meta Ads API

---

## PIPE-09 — Cold Lead & Lost Client Reactivation (Stage 11B)

**Stage:** POST-SALE — Engine 11 (Reactivation)

**What it does:** Every day, checks for leads that went cold and clients that churned, then automatically fires a fresh win-back sequence with a new angle.

**Triggers:**

- Lead with no activity for 14+ days
- Client who did not renew
- Proposal sent but no response for 7+ days

**Flow:**

1. n8n checks CRM daily for inactive leads and churned clients
2. GPT-4o generates new angle email (different subject, fresh hook, seasonal relevance)
3. Sequence fires: Win-back email → 3 days → WhatsApp → 7 days → special offer email
4. Re-engaged → moves back to Stage 5 Nurture
5. Still cold after 30 days → moved to 90-day passive list

**Tools:** n8n · HubSpot · GPT-4o · Brevo · WhatsApp