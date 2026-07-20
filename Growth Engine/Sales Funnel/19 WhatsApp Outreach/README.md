# 19 WhatsApp Outreach

> **Stage 19 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 4, Session 6).

---

## Navigation

- ⬅ Previous stage: [18 Cold Calling](../18 Cold Calling/README.md)
- ➡ Next stage: [20 SMS Outreach](../20 SMS Outreach/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Reach target-persona contacts on WhatsApp with short, professional first-contact messages and a short follow-up cadence, in markets where WhatsApp is a primary business communication channel.

**Purpose:** In markets like India, UAE, and much of Southeast Asia, WhatsApp is where business actually happens — far more than email or LinkedIn DMs. In markets like the US or UK, unsolicited WhatsApp outreach reads as intrusive and can be counterproductive. This stage exists so WhatsApp is used deliberately where it fits (per Stage 15's channel plan) and never as a default habit applied everywhere.

**Inputs:**
- Verified phone numbers with WhatsApp presence (Stage 07/10)
- Channel plan confirming WhatsApp as chosen channel for this segment/market (Stage 15)
- WhatsApp Business account/number, ideally API-connected for tracking at volume

**Outputs:**
- Sent first-contact and follow-up messages with status tracked in CRM
- Interested replies escalated to Stage 25/28
- Number health monitored to avoid flagging/banning

**Expected Result:** A disciplined, low-volume-but-high-response-rate channel used only where market norms make it appropriate, with no numbers flagged or banned from overuse.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **19A** Market Fit Confirmation | Confirming WhatsApp is culturally/commercially appropriate for this market before using it (ties to Stage 15) |
| **19B** WhatsApp Business Setup | Business profile, WhatsApp Business API vs. standard app decision |
| **19C** Message Format Rules | Length, tone, no-links-in-first-message conventions |
| **19D** First-Contact & Follow-Up Sequence | 3-message cadence: intro, Day 3 follow-up, Day 7 follow-up |
| **19E** Daily Volume Limits | Conservative send limits to avoid number flagging |
| **19F** Reply Handling | Positive / "who is this" / not-interested response patterns |
| **19G** Number Health Monitoring | Watching for ban/restriction signals |
| **19H** CRM Logging | Message step, send date, status, next action date |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for WhatsApp Business/API and tracking tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting first-contact and follow-up message variants per persona/market for human review
- Triaging inbound replies into Interested / Not Interested / "Who is this" / Dead

**Prompt examples:**
```
"Write a first-contact WhatsApp message (max 4 lines, no links) for a
[persona] at a [industry] company in [market]. Professional but
conversational tone, end with a soft question."
```
```
"Classify this WhatsApp reply as Interested / Not Interested / Confused-
who-is-this / No response needed: [paste reply]."
```

**Agent workflows:** A scheduled agent can queue the day's approved first-contact and follow-up sends within safe volume limits via the WhatsApp Business API, but should never auto-send to a market not already confirmed appropriate in Stage 15, and any "who is this"/complaint-style reply should route to a human rather than an automated response.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for drafting and reply classification.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Contact-message fields (mandatory)
`Contact ID` · `Phone (WhatsApp)` · `Message Step` (1/2/3) · `Last Sent Date` · `Status` (Sent/Delivered/Read/Replied/Interested/Dead) · `Next Action Date`

### JSON schema
```json
{
  "contact_id": "string",
  "phone_whatsapp": "string",
  "message_step": 1,
  "last_sent_date": "ISO 8601 date",
  "status": "sent|delivered|read|replied|interested|dead",
  "next_action_date": "ISO 8601 date"
}
```

### Validation rules
- WhatsApp outreach only used in markets confirmed appropriate by Stage 15's channel plan
- No contact receives more than 3 first-contact-sequence messages without a reply before being marked `dead`
- Daily send volume per number must not exceed the safe limit in [methods.md](methods.md)

### Naming conventions
- Status values are a fixed enum shared conceptually with Stage 16/17 status fields so cross-channel reporting (Stage 21) stays consistent

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Market confirmed appropriate for WhatsApp outreach before any sending (Stage 15)
- [ ] Daily volume within safe limit per number
- [ ] No links/attachments in the first message
- [ ] Replies triaged and actioned within 24 hours

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Read rate | High (WhatsApp read receipts are generally strong where the channel fits the market) | Track, don't over-index — reply rate matters more |
| Reply rate | 15-30% in fit markets | Falls sharply in markets where WhatsApp outreach is a poor cultural fit |
| Number flag/ban incidents | 0 | Any flag is a hard stop for volume review |
| Calls booked per 100 sent | Track and trend per segment | Primary downstream success metric |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [18 Cold Calling](../18 Cold Calling/README.md)
- **Next stage:** [20 SMS Outreach](../20 SMS Outreach/README.md)
- **Also feeds:** [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md), [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md)

> **Source note:** Built from the internal SOP-VA-006 WhatsApp Outreach, WhatsApp Outreach SOP, and WhatsApp & LinkedIn Message Templates docs in this repo's Growth Engine folder. Daily volume limits are carried over from those SOPs and marked "verify current" since WhatsApp's automated-behavior detection and Business API policy both change over time.

[⬅ Back to README](README.md)
