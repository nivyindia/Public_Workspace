# 🔁 Stage 11 — Referral & Viral Engine

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

## 🔁 Core Objective

> **Turn every satisfied client into a referral machine and brand ambassador.**
> 

Referral clients close 4x faster and have higher LTV. This is the growth multiplier.

---

## 🧠 Referral System Design

| Program | How It Works | Reward |
| --- | --- | --- |
| Client Referral | Client refers another business | 10-15% commission or service credit |
| Ambassador Program | Ongoing brand ambassador | Monthly revenue share |
| Share & Earn | Share content/link, earn per signup | Cash or gift |
| Freelancer Network | Freelancers refer clients | 10% per deal |
| Partner Agencies | White-label or co-referral | 20% deal share |

---

## 🤖 n8n Automation Code — Referral Tracking & Reward

```json
{
  "name": "Nivy - Referral Tracking System",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "referral-signup" },
      "name": "Webhook - Referral Lead Submitted",
      "type": "n8n-nodes-base.webhook",
      "position": [240, 300]
    },
    {
      "parameters": {
        "operation": "create",
        "base": "YOUR_AIRTABLE_BASE",
        "table": "Referrals",
        "fields": {
          "ReferredName": "={{$json.referred_name}}",
          "ReferredEmail": "={{$json.referred_email}}",
          "ReferrerID": "={{$json.referrer_id}}",
          "Status": "Pending",
          "DateReferred": "={{$now}}"
        }
      },
      "name": "Log Referral in Airtable",
      "type": "n8n-nodes-base.airtable",
      "position": [460, 300]
    },
    {
      "parameters": {
        "fromEmail": "referrals@nivy.com",
        "toEmail": "={{$json.referrer_email}}",
        "subject": "🎉 Your referral has been received!",
        "html": "<h2>Thank you, {{$json.referrer_name}}!</h2><p>We've received your referral for <strong>{{$json.referred_name}}</strong>.</p><p>Once they sign up as a paying client, you'll receive your reward of <strong>{{$json.reward}}</strong> automatically.</p><p>Track your referrals: <a href='YOUR_REFERRAL_DASHBOARD'>Dashboard</a></p>"
      },
      "name": "Confirm to Referrer",
      "type": "n8n-nodes-base.emailSend",
      "position": [680, 200]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "create",
        "email": "={{$json.referred_email}}",
        "firstName": "={{$json.referred_name}}",
        "properties": { "source": "Referral", "referrer_id": "={{$json.referrer_id}}", "lead_score": 75 }
      },
      "name": "Create Referred Lead in HubSpot (High Score)",
      "type": "n8n-nodes-base.hubspot",
      "position": [680, 400]
    },
    {
      "parameters": {
        "chatId": "YOUR_SALES_TELEGRAM",
        "text": "🔥 HIGH-VALUE REFERRAL LEAD!\n\nReferred by: {{$json.referrer_name}}\nNew Lead: {{$json.referred_name}} | {{$json.referred_email}}\nPre-Score: 75/100\n\nContact immediately — referral leads close 4x faster!"
      },
      "name": "Alert Sales Team",
      "type": "n8n-nodes-base.telegram",
      "position": [900, 300]
    }
  ],
  "connections": {
    "Webhook - Referral Lead Submitted": { "main": [[{ "node": "Log Referral in Airtable", "type": "main", "index": 0 }]] },
    "Log Referral in Airtable": {
      "main": [
        [{ "node": "Confirm to Referrer", "type": "main", "index": 0 }],
        [{ "node": "Create Referred Lead in HubSpot (High Score)", "type": "main", "index": 0 }],
        [{ "node": "Alert Sales Team", "type": "main", "index": 0 }]
      ]
    }
  }
}
```

---

## 📊 KPI System

| KPI | Target | Tool |
| --- | --- | --- |
| Referral rate (% of clients who refer) | >20% | Airtable |
| Referral-to-close rate | >50% | HubSpot |
| Cost per referral acquisition | <$50 | Airtable |
| Ambassador active count | 5+ ambassadors | Airtable |
| Monthly referral revenue | Growing 10%+ | HubSpot |

---

## ⚠️ Risks & Bottlenecks

| Risk | Mitigation |
| --- | --- |
| Clients forget to refer | Referral reminder at Month 2 |
| Reward not paid on time | Automate reward via Stripe |
| Referral quality low | Pre-qualify via referral form |
| No ambassador momentum | Highlight top ambassadors monthly |

---

---

## 🗃️ Data Systems

| System | Tool | Purpose |
| --- | --- | --- |
| Referral tracking database | Airtable | Log every referral: referrer, referred lead, status, reward |
| Ambassador registry | Airtable | Active ambassadors, tier, referrals given, commissions earned |
| Referral source attribution | HubSpot + UTM tracking | Track which channel and referrer drives each lead |
| Freelancer / partner network log | Airtable | Freelancers, agency partners, their referral history |
| Referral reward ledger | Notion / Stripe | Track all rewards owed and paid |
| Referral revenue dashboard | HubSpot | Total revenue from referral channel vs. other sources |
| Ambassador performance tracker | Airtable | Monthly referrals per ambassador, conversion rate, LTV of their referrals |

---

## 📤 Outbound Systems

| System | Schedule | Tool | Purpose |
| --- | --- | --- | --- |
| Month 2 referral program introduction | Day 60 | n8n + Email + WhatsApp | Introduce referral program at peak satisfaction moment |
| Monthly referral reminder in performance report | Every report | n8n | Passive referral nudge in every client report |
| Reward confirmation email (auto) | When referral converts | n8n + Gmail | Confirm reward and keep referrer motivated |
| Ambassador monthly performance digest | Monthly | n8n + Email | Show ambassadors their stats + commissions |
| Freelancer network activation email | Monthly | n8n + Gmail | Keep freelancer network warm with updates + incentives |
| Top referrer spotlight | Monthly | Manual + LinkedIn | Feature best referrer — drives competitive referral behavior |
| Partner co-marketing email | Quarterly | Manual | Activate agency and freelancer partners for joint campaigns |

---

## 🔁 Community & Viral Loops

| Loop | Mechanism | Purpose |
| --- | --- | --- |
| Referral leaderboard in VIP community | Monthly top referrer announced in WhatsApp/Discord group | Creates competition, social proof, and motivation |
| Ambassador case study | Feature ambassador success story on LinkedIn | Shows other clients the reward potential |
| Referred lead welcome sequence | Referred leads get white-glove onboarding note from referrer’s AM | Builds trust and closes faster |
| Freelancer success showcase | Highlight freelancer partners who close big deals | Keeps network active and recruiting |
| Viral referral link | Each client/partner gets unique link — tracked automatically | Frictionless referral submission |
| Agency white-label network | Partner agencies resell Nivy services under their brand | Zero-cost lead generation from B2B partners |

---

## ⚙️ Automation Systems

| Automation | Tool | Trigger | Purpose |
| --- | --- | --- | --- |
| Day 60 referral program email | n8n + Gmail | Day 60 of client lifecycle | Introduce referral offer at peak satisfaction |
| Referral form submission webhook | n8n webhook | When referral form submitted | Log lead, alert sales, confirm to referrer |
| Referred lead HubSpot creation | n8n + HubSpot | Referral form submitted | Create contact with high lead score + referral source tag |
| Reward trigger on deal close | n8n + HubSpot webhook | Deal marked Closed Won in HubSpot | Calculate and dispatch reward to referrer |
| Monthly ambassador digest | n8n + Gmail | 1st of each month | Send each ambassador their monthly stats |
| Freelancer re-engagement | n8n + Email | If no referral in 60 days | Send reactivation email with updated incentive |
| Referral reminder in report | n8n | Every bi-weekly report | Append referral program blurb to each report |

---

## 🤖 AI Systems

| AI System | Model | Input | Output | Purpose |
| --- | --- | --- | --- | --- |
| Referral moment detector | GPT-4o | Client CSAT + tenure + engagement | Best time to ask this specific client for a referral | Maximize referral ask conversion |
| Referral email personalizer | GPT-4o-mini | Client name + results + referral program details | Personalized referral ask email (not generic) | Increase referral program opt-in |
| Ambassador match finder | GPT-4o | Client profile + network + industry | Which clients are most likely to refer — and to whom | Prioritize referral outreach |
| Reward optimizer | GPT-4o | Client type + deal size + margin | Best reward structure to offer (cash vs. credit vs. gift) | Maximize referral ROI |

**AI Prompt — Referral Ask Personalizer:**

```
You are writing a referral program introduction email for a digital marketing agency called Nivy.

Client: {{client_name}}
Business type: {{industry}}
Key results achieved: {{results_summary}}
Months with Nivy: {{tenure}}
Account manager: {{am_name}}

Write a warm, personal referral introduction email that:
1. Opens with a genuine acknowledgment of their results
2. Explains the referral program simply (10-15% commission or service credit per converted referral)
3. Makes it feel easy and natural — not salesy
4. Includes a clear CTA (click link to get their referral link)
5. Signs off personally from their AM

Tone: Warm, genuine, conversational — like a message from a trusted business partner.
Length: 150-200 words.
Output: email body only.
```

---

## 👥 Team Responsibilities

| Role | Responsibility |
| --- | --- |
| Account Manager | Introduce referral program at Month 2, nurture top referrers, celebrate referral wins |
| Partnerships Manager | Recruit and activate freelancer + agency partner network |
| Automation Dev | Maintain referral tracking webhook, reward triggers, ambassador digest |
| Operations Manager | Audit referral conversion rate monthly, review reward ledger accuracy |
| CEO / Founder | Approve ambassador program terms, co-sign high-value partnership agreements |

---

## 📋 SOP — Referral Engine Checklist

**Monthly:**

- [ ]  Review referral tracker — new referrals this month?
- [ ]  Confirm all pending rewards have been paid / credited
- [ ]  Identify top referrer — spotlight them in VIP community
- [ ]  Send ambassador performance digest (auto via n8n)
- [ ]  Check freelancer network — anyone dormant >60 days? Re-engage
- [ ]  Review referral conversion rate — are referred leads closing?

**Per New Referral:**

- [ ]  Referral form submitted — n8n logs, alerts sales, confirms to referrer (automated)
- [ ]  Sales team contacts referred lead within 2 hours (high-priority)
- [ ]  Referred lead enters Stage 2 (Nurture) with referral tag in HubSpot
- [ ]  When deal closes: reward dispatched automatically (or manually confirmed within 48hrs)
- [ ]  AM sends personal thank-you to referrer

**Quarterly:**

- [ ]  Review referral program structure — is the incentive still competitive?
- [ ]  Recruit 3-5 new freelancers / agency partners into network
- [ ]  Run co-marketing campaign with top agency partners

---

## 🛠️ Tools Stack

| Tool | Purpose | Cost | Link |
| --- | --- | --- | --- |
| Airtable | Referral log, ambassador tracker, reward ledger | Free tier | [airtable.com](http://airtable.com) |
| HubSpot | Referred lead tracking, deal attribution, referral source reporting | Free | [hubspot.com](http://hubspot.com) |
| n8n (self-hosted) | Referral webhook, reward triggers, ambassador digest | Free | [n8n.io](http://n8n.io) |
| Tally / Typeform | Referral submission form | Free | [tally.so](http://tally.so) |
| Gmail | Referral intro emails, reward confirmation, ambassador digests | Free | [gmail.com](http://gmail.com) |
| WATI | WhatsApp referral nudges | Free tier | [wati.io](http://wati.io) |
| Stripe | Automated commission payouts | Transaction fee | [stripe.com](http://stripe.com) |
| OpenAI API | Referral email personalization, ambassador matching | Pay per use | [openai.com](http://openai.com) |
| Notion | Partner agreements, referral SOP, program docs | Free | [notion.so](http://notion.so) |

---

## 🔧 Optimization Systems

| System | Method | Frequency |
| --- | --- | --- |
| Referral rate audit | What % of clients refer? Which client profiles refer most? | Monthly |
| Referral-to-close rate | Are referred leads actually converting? What’s their close rate vs. cold leads? | Monthly |
| Reward effectiveness test | Cash vs. service credit vs. gift — which drives most referrals? | Quarterly |
| Ask timing optimization | Month 2 vs. Month 3 — when does the referral ask convert best? | Quarterly |
| Partner network audit | Which freelancers / agencies are actually sending referrals? Prune inactive ones | Monthly |
| Referral channel attribution | Which channel produces most referral leads? (WhatsApp, email, community?) | Monthly |

---

**➡️ Next Stage:** [🌐 Stage 12 — Ecosystem Engine](https://www.notion.so/35be5082b9d48143a08ddf48d9eb8e77)

---

## 🔗 Infrastructure Links

| System | Link | Why Relevant |
| --- | --- | --- |
| 🗃️ Data Infrastructure OS | [View →](https://www.notion.so/35be5082b9d48172be4aed7a86110ca3) | Referral tracking and attribution in CRM |
| 🤖 AI Systems Layer | [View →](https://www.notion.so/35be5082b9d481b8b9adc5e2a2aff592) | Referral moment detector, email personalizer, ambassador matcher |
| 📊 KPI Dashboard Master | [View →](https://www.notion.so/35be5082b9d48124ab53ca2ae7b3ffd9) | Referral rate and referral-to-close rate tracked here |
| 🤖 Objection Handling System | [View →](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) | Referred leads who object at Stage 6 route here |
| 🖥️ Sales Funnel Architecture | [View →](https://www.notion.so/35be5082b9d481f2877ee360735fc6e7) | Referred leads enter funnel at Stage 3 with HOT pre-score |