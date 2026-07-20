# 🎯 Lead Scoring Rules Document

**Parent:** 🎯 SD-09 CRM | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `lead-scoring` `HubSpot` `rules` `hot-leads` `SD-09`

---

> 🎯 **Purpose:** Detailed rules for scoring every lead in HubSpot so the team always knows which leads to prioritize. Score ≥50 = hot lead, action within 24 hours.
> 

---

# 📊 LEAD SCORING MASTER TABLE

## Behavioral Signals (Actions taken)

| Behavior | Score | How to Track |
| --- | --- | --- |
| Submitted contact/quote form | +30 | HubSpot form |
| Booked a discovery call | +50 | [Cal.com](http://Cal.com) → n8n → HubSpot |
| Chatbot conversation with email captured | +20 | Chatwoot → n8n |
| Downloaded a lead magnet | +20 | Tally → n8n |
| Opened 3+ emails | +10 | HubSpot email tracking |
| Clicked a link in email | +15 | HubSpot email tracking |
| Visited pricing page | +20 | HubSpot tracking pixel |
| Visited services page | +10 | HubSpot tracking pixel |
| Replied to cold email | +25 | Instantly → manual entry |
| Replied to LinkedIn DM | +25 | Manual entry in HubSpot |
| Engaged on WhatsApp | +15 | Manual entry |

## Demographic Signals (Who they are)

| Attribute | Score | Reason |
| --- | --- | --- |
| From USA | +15 | Highest budget market |
| From UK / UAE / Australia | +10 | Strong budget markets |
| From India (Tier 1 city) | +5 | Growing market |
| Company size 1–25 | +10 | Primary ICP |
| Title: Founder / CEO / Owner | +15 | Decision maker |
| Industry: Real Estate / SaaS / E-com | +10 | Best-fit niches |
| Budget mentioned: $500+/month | +20 | Qualified buyer |

## Negative Signals (Reduce score)

| Behavior | Score | Reason |
| --- | --- | --- |
| Unsubscribed from email | −30 | No longer interested |
| Marked email as spam | −50 | Disqualify |
| Specifically said "not interested" | −50 | Remove from active pipeline |
| Free email domain (@gmail with no company) | −5 | May be low intent |

---

# 🚨 SCORE THRESHOLDS & ACTIONS

| Score | Label | Action Required |
| --- | --- | --- |
| 0–19 | Cold | In nurture sequence only, no active outreach |
| 20–49 | Warm | VA follows up within 3 business days |
| 50–79 | Hot | Founder or senior VA contacts within 24 hours |
| 80+ | Priority | Founder contacts same day, direct call attempt |

## Slack Alert Rule (via n8n)

```
When HubSpot contact "Lead Score" field reaches 50+:
→ n8n sends Slack message to #sales channel:
"🔥 HOT LEAD: [Name] from [Company] — Score: [X]
   Source: [Lead Source]
   Interest: [Service Interest]
   Action: Follow up within 24 hrs
   🔗 View in HubSpot: [contact link]"
```

---

# 🛠️ HOW TO UPDATE SCORES IN HUBSPOT (FREE TIER)

HubSpot Free doesn’t have automatic lead scoring. Here’s the manual + semi-automated approach:

## Option 1: Manual VA Process

1. VA reviews new contacts every morning
2. Checks actions taken (emails opened, pages visited from HubSpot feed)
3. Manually adds score in "Lead Score" custom property
4. Tags as "hot-lead" if ≥50

## Option 2: n8n Semi-Automation

1. Create n8n workflow triggered by HubSpot webhook events
2. For each event (booking, form submit, email click), n8n:
    - Gets current lead score from HubSpot
    - Adds the relevant points
    - Updates "Lead Score" field in HubSpot
3. Set up Slack alert when score crosses 50

## Option 3: HubSpot Starter ($20/month) — Future

- Full automatic lead scoring built in
- Recommended when revenue justifies the cost

---

# 📅 WEEKLY LEAD SCORE REVIEW SOP

Every Monday, VA runs through:

- [ ]  Filter HubSpot contacts by "Lead Score" ≥ 50 — any not yet contacted?
- [ ]  Check contacts last active 7–14 days ago — update scores based on recent email opens
- [ ]  Review any new [Cal.com](http://Cal.com) bookings — score updated to 50+ automatically?
- [ ]  Flag any contacts that scored 80+ to founder immediately

---

📋 **PAGE METADATA**

- **Section:** SD-09 Targets & CRM
- **Parent:** 🎯 SD-09 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `lead-scoring` `HubSpot` `rules` `hot-leads` `n8n` `SD-09` `nivy-digital`
- **Related Pages:** HubSpot CRM Setup Guide | Weekly KPI Tracker | SD-08 Automation Systems

---