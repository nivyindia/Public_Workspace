# 25 Reply Handling and Triage

> **Stage 25 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 5, Session 7).

---

## Navigation

- ⬅ Previous stage: [24 Follow Up Systems](../24 Follow Up Systems/README.md)
- ➡ Next stage: [26 Objection Handling](../26 Objection Handling/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Classify every inbound reply across every channel (Stages 16-20) into a clear category and respond fast enough, and correctly enough, to move interested replies to a booked call before interest cools.

**Purpose:** Every prior stage in this funnel exists to generate a reply — this is the stage where that reply either converts into a booked opportunity or gets lost to a slow/generic/wrong response. Speed and correctness both matter: a same-day reply to an "interested" message converts far better than a next-week reply, and misclassifying a genuine objection as disinterest (or vice versa) sends the contact down the wrong path.

**Inputs:**
- Inbound replies from every active channel (Stages 16-20)
- The reply-classification categories and response scripts defined in this stage
- Objection library (Stage 26) for replies that raise a specific objection rather than clear interest/disinterest

**Outputs:**
- Every reply classified (Interested / Question / Objection / Not Interested / Unsubscribe-DNC / Wrong Person) within a defined SLA
- Interested replies moved to a booked discovery call (Stage 28) same-day
- Objection-carrying replies routed to Stage 26's response library

**Expected Result:** No reply sits unanswered past the SLA; interested contacts convert to booked calls quickly, and every other reply type gets a correct, documented next action rather than an ad hoc one.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **25A** Reply Classification Categories | Interested / Tell Me More / Question / Objection / Not Interested / Unsubscribe-DNC / Wrong Person |
| **25B** Response SLA | Maximum time-to-first-response per category |
| **25C** Interested-Reply Response Scripts | Fast-path scripts moving straight to a booking ask |
| **25D** Question-Reply Response Scripts | Handling price/service questions without over-explaining in chat |
| **25E** Objection-Reply Routing | Handoff to Stage 26's objection library |
| **25F** Disqualification Handling | Not Interested / Unsubscribe / Wrong Person — correct CRM suppression |
| **25G** CRM Logging | Classification, response time, outcome logged per reply |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for reply-monitoring and triage tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- First-pass classification of inbound replies into the defined categories, with confidence flagged so ambiguous cases route to a human
- Drafting the response for clear-cut categories (Interested, straightforward Question) for human approval before sending

**Prompt examples:**
```
"Classify this reply into one of: Interested / Tell Me More / Question /
Objection / Not Interested / Unsubscribe-DNC / Wrong Person. Reply:
[paste]. Give your confidence level and reasoning."
```
```
"Draft a response to this 'Interested' reply, moving toward booking a
15-minute call, in a short, non-salesy tone: [paste reply]."
```

**Agent workflows:** A triage agent can classify and pre-draft responses for every inbound reply continuously, but only auto-send for the clearest, lowest-risk categories (e.g., unsubscribe confirmations) — Interested and Objection replies should get a human send, even if AI-drafted, since these are the highest-value/highest-risk moments in the funnel.

**RAG / vector database considerations:** The objection library (Stage 26) functions as a lightweight retrieval reference for AI-drafted objection-adjacent responses; not at a scale requiring a vector database.

**LLM recommendations:** Standard current-generation models are sufficient for classification and drafting; human review remains the gate for anything going out under the company's name in a live conversation.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Reply log fields (mandatory)
`Contact ID` · `Channel` · `Reply Text` · `Classification` · `Received Date/Time` · `Response Date/Time` · `Outcome` (Booked/Escalated/Suppressed/Pending)

### JSON schema
```json
{
  "contact_id": "string",
  "channel": "email|linkedin|cold_call|whatsapp|sms",
  "reply_text": "string",
  "classification": "interested|tell_me_more|question|objection|not_interested|unsubscribe_dnc|wrong_person",
  "received_datetime": "ISO 8601 datetime",
  "response_datetime": "ISO 8601 datetime",
  "outcome": "booked|escalated|suppressed|pending"
}
```

### Validation rules
- Every reply must be classified within the defined SLA (see [checklists.md](checklists.md)) — no reply sits unclassified past that window
- `unsubscribe_dnc` classification immediately and permanently suppresses the contact across all channels
- `objection` classification routes to Stage 26 before a final response is sent, not answered ad hoc

### Naming conventions
- Classification values are a fixed enum so reply-outcome reporting stays consistent across reps and channels

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every reply classified and actioned within SLA
- [ ] Interested replies escalated to booking within the same business day
- [ ] Unsubscribe/DNC requests suppressed same-day across all channels

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Time-to-first-response (Interested replies) | < few hours | Speed materially affects booking conversion |
| Reply-to-booking conversion rate | Track and trend | Primary success metric for this stage |
| Misclassification rate (caught on review) | Track and trend toward 0 | Feeds AI-classification prompt refinement |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [24 Follow Up Systems](../24 Follow Up Systems/README.md)
- **Next stage:** [26 Objection Handling](../26 Objection Handling/README.md)
- **Depends on:** [16 Email Outreach](../16 Email Outreach/README.md) through [20 SMS Outreach](../20 SMS Outreach/README.md)
- **Feeds:** [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)

> **Source note:** Built directly from the internal "7. Conversion System (Reply → Call)" doc in this repo's Growth Engine folder, which defines the reply-handling scripts, lead-magnet delivery flow, and "move toward call, don't over-explain in chat" conversion rules this stage documents as the funnel-wide standard.

[⬅ Back to README](README.md)
