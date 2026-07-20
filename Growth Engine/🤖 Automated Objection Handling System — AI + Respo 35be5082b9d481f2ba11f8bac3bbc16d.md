# 🤖 Automated Objection Handling System — AI + Response Library

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **Objections are not rejections — they are requests for more information. This system intercepts every objection at every stage of the funnel, responds intelligently with AI, and routes appropriately to close the loop.**
> 

---

## 🧠 What This System Does

This is a three-layer objection system:

1. **Prevention Layer** — Content and nurture that eliminates objections *before* they arise
2. **Real-Time AI Layer** — AI detects objections in emails, DMs, and WhatsApp and suggests instant responses
3. **Human Escalation Layer** — When AI isn’t enough, routes to the right team member with full context

---

## 📊 Stage-by-Stage Objection Map

| CJE Stage | Most Common Objections | Prevention Method |
| --- | --- | --- |
| Stage 1 (Attention) | “Who are you?”, “Is this spam?” | Clear brand identity, no hard pitch outreach |
| Stage 2 (Interest) | “I don’t have time”, “I’m not sure this is for me” | Case studies, FAQ content, social proof |
| Stage 3 (Lead Capture) | “I’ll just look around”, “I’m not ready to share my email” | Low-friction forms, strong lead magnet value |
| Stage 4 (Lead Management) | “I’m already talking to someone else” | Unique positioning + speed of response |
| Stage 5 (Nurturing) | “Too many emails”, “You’re too expensive” | Value-first sequences, ROI framing |
| Stage 6 (Conversion) | “Not now”, “Let me think about it”, “Pricing too high” | Consultation call + proposal + urgency |
| Stage 7 (Onboarding) | “This is taking too long”, “I don’t know what’s happening” | Clear timeline + welcome system |
| Stage 9 (Retention) | “We might reduce scope”, “We’re not seeing results” | Monthly reviews + proactive results reporting |

---

## 🤖 AI Objection Detection + Response System

### How It Works:

```
Lead sends email/DM/WhatsApp message
        ↓
n8n receives message via webhook
        ↓
OpenAI classifies message:
  - Type: Objection / Positive / Question / Unsubscribe / Spam
  - Objection category (if applicable)
  - Urgency level
        ↓
If Objection detected:
  OpenAI generates response draft
        ↓
  IF urgency = 5 (HOT objection / near-close)
    → Send to sales team WhatsApp with draft response
    → Human reviews + sends
  IF urgency < 5 (early stage objection)
    → Auto-send AI response from email sequence
    → Log in HubSpot notes
```

---

### AI Objection Classifier Prompt:

```jsx
A prospect sent this message: "{{message}}"
Context: They are in stage {{funnel_stage}}, service interest: {{service}}, country: {{country}}

Classify this message:
1. Message type: Objection | Positive | Question | Unsubscribe | Spam
2. If Objection, category:
   - Price objection
   - Timing objection (not now / too busy)
   - Trust objection (not sure about you)
   - Competitor objection (using someone else)
   - Authority objection (need to check with boss)
   - Need objection (don't think I need this)
   - Risk objection (what if it doesn’t work?)
   - Ghosting recovery (went cold, re-engaging)
3. Urgency: 1 (early stage) to 5 (about to close or lose this deal)
4. Draft response: Write a response that acknowledges their concern, reframes it, and moves them forward. Max 100 words. Conversational. Not salesy.

Output JSON: { type, objection_category, urgency, response_draft }
```

---

## 💬 The 40 Objections — Full Response Library

### 💰 PRICING OBJECTIONS

**1. “You’re too expensive.”**

> **Frame:** Compare to cost of in-house hire or lost revenue.
> 

> **Response:** “I completely understand. Let me show you why clients who said the same thing now consider us the cheapest decision they made. The average UK-based VA hire costs ££2,500+/month with NI and benefits. Our packages start at a fraction of that with no HR headache. What specific service were you looking at pricing for?”
> 

**2. “I can find someone cheaper on Fiverr/Upwork.”**

> **Frame:** Total cost of ownership + quality + consistency.
> 

> **Response:** “Absolutely, and many of our clients tried that first. The issue they kept hitting was inconsistency, retraining costs, and no-shows. We’re not a gig — we’re a managed team with SOPs, QC, and accountability built in. Would a quick comparison breakdown help?”
> 

**3. “Can you do a discount?”**

> **Frame:** Anchor on value, offer alternatives, not discounts.
> 

> **Response:** “We don’t discount because we’d have to reduce quality somewhere to make it work. What I can do is suggest a starter package that fits your budget now, with a clear upgrade path as you see results. What’s the budget range you’re working with?”
> 

**4. “I didn’t budget for this.”**

> **Frame:** Reframe as cost-saving, not cost-adding.
> 

> **Response:** “Most of our clients say the same thing before starting. Then they realise their current setup is costing them more in lost hours and missed opportunities than our fee. Let’s look at what you’re currently spending to handle what we’d take over. 10 minutes?”
> 

**5. “I’d rather hire locally.”**

> **Frame:** UK/US/AU local hires cost 3-5x more.
> 

> **Response:** “That makes total sense. Here’s the honest comparison: a local marketing executive in the UK costs £30-40k/year. Our full digital marketing service is a fraction of that, and you keep full control. Would it help to see a side-by-side breakdown?”
> 

---

### ⏰ TIMING OBJECTIONS

**6. “Not right now / bad timing.”**

> **Response:** “Perfectly fine. When’s a better time — next month? Next quarter? I’ll set a reminder and reach out then. In the meantime, here’s one resource that may be useful when you’re ready: [link]. No follow-up until you say.”
> 

**7. “We’re too busy right now.”**

> **Response:** “That’s actually the most common reason people come to us — they’re too busy because they’re doing everything themselves. We remove the things eating your time. What’s taking up most of your hours right now?”
> 

**8. “We’re waiting until after [event/season/funding].”**

> **Response:** “That makes complete sense. I’ll follow up on [date]. One thought: the companies who come out of funding rounds or busy seasons strongest are the ones who had their operations and marketing already set up. Would you like a ‘ready to scale’ checklist in the meantime?”
> 

**9. “Let me think about it.”**

> **Response:** “Of course. To help you think: what’s the one thing you’re most unsure about? I’d rather address that directly than leave you guessing.”
> 

**10. “I need to check with my business partner.”**

> **Response:** “Absolutely. Would it be helpful if I joined a quick call with both of you so I can answer any questions they might have directly? Often that saves a lot of back-and-forth.”
> 

---

### 🤔 TRUST OBJECTIONS

**11. “I’ve never heard of Nivy Digital.”**

> **Response:** “Fair — we’re not a household name (yet). But we’re happy to let our results do the talking. Here are 3 client case studies from businesses similar to yours: [link]. If you’d like to speak to an existing client, we can arrange that too.”
> 

**12. “How do I know you’ll deliver?”**

> **Response:** “You don’t — until you see it for yourself. That’s why we offer a clear onboarding process, monthly KPI reviews, and the ability to scale down if results don’t match expectations. We’re not locked-contract people.”
> 

**13. “I’ve been burned by agencies before.”**

> **Response:** “I hear this a lot, and I’m sorry you went through that. Tell me what happened and what you’d need to see to trust an agency again — I want to know if we can actually meet that bar before we go further.”
> 

**14. “How do I know your VAs are good?”**

> **Response:** “Each VA goes through a 4-week training program, is tested on actual tasks, and is supervised with QC checks. You also get a supervisor assigned to your account. We’d rather under-promise and over-deliver than the opposite.”
> 

**15. “Can I see your previous work?”**

> **Response:** “Absolutely. Here are [3 relevant case studies/portfolio links]. We can also do a live demo call where you give us a sample task and see how we handle it before committing.”
> 

---

### 📊 NEED OBJECTIONS

**16. “I don’t think I need this.”**

> **Response:** “Fair enough. Quick question: how many hours a week do you personally spend on [specific task]? If the answer is more than 5, there’s likely a ROI conversation worth having. What does your typical week look like?”
> 

**17. “We’re doing fine on our own.”**

> **Response:** “That’s great to hear. The businesses who benefit most from us are the ones doing ‘fine’ who want to go from fine to great — usually by reclaiming the founder’s time for higher-leverage work. What would you do with 20 extra hours a month?”
> 

**18. “We already have someone in-house.”**

> **Response:** “Perfect — we often work alongside in-house teams as an extension, not a replacement. Your in-house person focuses on what they do best; we handle the overflow or the specialist tasks. Would that model be interesting to explore?”
> 

**19. “Our business is too niche / complex.”**

> **Response:** “We hear this often. We operate across 12+ industries and our onboarding process includes a deep-dive into your specific context. The first two weeks are always a learning phase. Would you like to see an example from a niche vertical we’ve worked with?”
> 

**20. “We’re too small to need this.”**

> **Response:** “Actually, our most successful clients started working with us when they were exactly your size — that’s when having support matters most. Small teams that leverage VAs and automation scale 3-5x faster. Should I send you a quick case study?”
> 

---

### 🎯 COMPETITOR OBJECTIONS

**21. “We’re already using [other agency].”**

> **Response:** “That’s great you have support. Many of our clients have us running alongside their existing setup — we fill gaps or take over specific functions they’re less happy with. What’s the one thing your current setup doesn’t do well?”
> 

**22. “We talked to [competitor] and they’re cheaper.”**

> **Response:** “Cheaper is great if the output is equal. The honest question is: what are they actually including, and who is doing the work? We’re happy to do a proper comparison if you share what they offered. Apples to apples.”
> 

**23. “We use freelancers from [platform].”**

> **Response:** “Freelancers are great for one-off tasks. Where businesses hit walls is when they need reliability, consistency, and systems — not just task completion. What does your current freelancer setup look like on a bad week?”
> 

---

### ❓ MISC & GHOSTING OBJECTIONS

**24. “I’ll get back to you.”**

> **Response:** Auto-follow-up sequence: Day 3: resource, Day 7: case study, Day 14: “Should I close your file?” breakup email.
> 

**25. Lead goes completely silent (ghosted)**

> **Response:** Day 7: "Still relevant?" email. Day 14: "Closing your file" email with easy re-open option. Day 30: Reactivation sequence trigger.
> 

---

## ⚡ Automated Objection Handling — n8n Code

```json
{
  "name": "Nivy - Automated Objection Handling Engine",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "objection-handler" },
      "name": "Message Received Webhook",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 400]
    },
    {
      "parameters": {
        "url": "https://api.openai.com/v1/chat/completions",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "model", "value": "gpt-4o" },
            { "name": "messages", "value": "[{\"role\":\"system\",\"content\":\"You are a sales intelligence system for Nivy Digital. Classify incoming messages and generate responses.\"},{\"role\":\"user\",\"content\":\"Message: {{$json.message}}\\nStage: {{$json.funnel_stage}}\\nService: {{$json.service_interest}}\\nCountry: {{$json.country}}\\n\\nOutput JSON: {type, objection_category, urgency_1_to_5, response_draft, action_required}\"}]" }
          ]
        }
      },
      "name": "AI Classify + Generate Response",
      "type": "n8n-nodes-base.httpRequest",
      "position": [320, 400]
    },
    {
      "parameters": {
        "jsCode": "const ai = JSON.parse($json.choices[0].message.content);\nreturn [{ json: { ...$node['Message Received Webhook'].json, ...ai } }];"
      },
      "name": "Parse AI Response",
      "type": "n8n-nodes-base.code",
      "position": [540, 400]
    },
    {
      "parameters": {
        "conditions": {
          "number": [{ "value1": "={{$json.urgency_1_to_5}}", "operation": "largerEqual", "value2": 4 }]
        }
      },
      "name": "High Urgency? (4+)",
      "type": "n8n-nodes-base.if",
      "position": [760, 400]
    },
    {
      "parameters": {
        "url": "YOUR_WHATSAPP_API",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "to", "value": "YOUR_SALES_NUMBER" },
            { "name": "message", "value": "🚨 OBJECTION ALERT (Urgency {{$json.urgency_1_to_5}}/5)\nLead: {{$json.lead_name}} | {{$json.country}}\nObjection: {{$json.objection_category}}\nMessage: {{$json.message}}\n\nSuggested Response:\n{{$json.response_draft}}\n\nHubSpot: {{$json.hubspot_link}}" }
          ]
        }
      },
      "name": "Alert Sales Team",
      "type": "n8n-nodes-base.httpRequest",
      "position": [980, 300]
    },
    {
      "parameters": {
        "from": "YOUR_EMAIL",
        "to": "={{$json.lead_email}}",
        "subject": "Re: Your question",
        "text": "={{$json.response_draft}}"
      },
      "name": "Auto-Send Response Email",
      "type": "n8n-nodes-base.emailSend",
      "position": [980, 500]
    },
    {
      "parameters": {
        "resource": "note",
        "operation": "create",
        "noteBody": "Objection detected: {{$json.objection_category}}\nUrgency: {{$json.urgency_1_to_5}}/5\nAI Response sent: {{$json.response_draft}}",
        "associations": [{ "type": "contact", "id": "={{$json.hubspot_contact_id}}" }]
      },
      "name": "Log in HubSpot",
      "type": "n8n-nodes-base.hubspot",
      "position": [1200, 400]
    }
  ],
  "connections": {
    "Message Received Webhook": { "main": [[{ "node": "AI Classify + Generate Response", "type": "main", "index": 0 }]] },
    "AI Classify + Generate Response": { "main": [[{ "node": "Parse AI Response", "type": "main", "index": 0 }]] },
    "Parse AI Response": { "main": [[{ "node": "High Urgency? (4+)", "type": "main", "index": 0 }]] },
    "High Urgency? (4+)": {
      "main": [
        [{ "node": "Alert Sales Team", "type": "main", "index": 0 }],
        [{ "node": "Auto-Send Response Email", "type": "main", "index": 0 }]
      ]
    },
    "Auto-Send Response Email": { "main": [[{ "node": "Log in HubSpot", "type": "main", "index": 0 }]] }
  }
}
```

---

## 📊 Objection Handling KPIs

| KPI | Target | Tool |
| --- | --- | --- |
| Objection resolution rate | >70% of objections converted | HubSpot pipeline tracking |
| AI response accuracy | >85% appropriate responses | Manual review sampling |
| Average time to respond to objection | <30 minutes | n8n timestamp logs |
| Deals lost to pricing objection | <20% of all lost deals | HubSpot loss reason |
| Ghosting recovery rate | >15% of silent leads re-engaged | Mautic reactivation tracking |

---

## 🔗 Connected Pages

- [💬 Objection Handling Library — 50+ Objections](https://www.notion.so/35ae5082b9d481599c13dc0344352f0e)
- [💬 Objection Handling Library (Sales Reference)](https://www.notion.so/359e5082b9d481bea6cfcef03caab24d)
- [💰 Stage 6 — Conversion Engine](https://www.notion.so/35be5082b9d481069b67caad774de1e5)
- [📧 Stage 5 — Nurturing Engine](https://www.notion.so/35be5082b9d4813fa004e1de927f2042)