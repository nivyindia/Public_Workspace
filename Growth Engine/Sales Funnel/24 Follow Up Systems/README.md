# 24 Follow Up Systems

> **Stage 24 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 5, Session 7).

---

## Navigation

- ⬅ Previous stage: [23 Deliverability and Domain Health](../23 Deliverability and Domain Health/README.md)
- ➡ Next stage: [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Ensure every contact who doesn't reply on the first touch still gets a disciplined, value-adding follow-up cadence — and that contacts who go cold after the cadence enter a documented re-engagement sequence rather than disappearing from the funnel entirely.

**Purpose:** Most deals close on the 3rd-5th touchpoint, not the first — but Stages 16-21 each define their own channel-specific follow-up steps in isolation. This stage exists to state the shared follow-up philosophy and rules (max follow-ups per channel, spacing, value-adding requirement, re-engagement after going cold) that those channel-level sequences are built on, so the discipline is explicit and auditable rather than implicit in each channel's template file.

**Inputs:**
- Channel-level sequence definitions (Stages 16-21)
- Contact engagement history (opens, replies, no-response) from CRM
- Case studies / value-add content library to draw follow-up content from (avoiding "just checking in" messages)

**Outputs:**
- A documented follow-up philosophy and rule set applied consistently across every channel
- A 90-day re-engagement sequence for contacts marked cold
- Reduced "fell through the cracks" contacts — every non-replying contact has a defined next action

**Expected Result:** No qualified lead is silently dropped after one unanswered touch; every contact's follow-up and eventual re-engagement status is tracked and actioned on schedule.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **24A** Follow-Up Philosophy & Rules | Max follow-ups per channel, spacing, value-add requirement (feeds Stages 16-21) |
| **24B** Value-Add Content Library | Case studies / stats / examples to reference in follow-ups instead of "just checking in" |
| **24C** Cold-Marking Criteria | When a contact is marked cold after exhausting follow-ups on a channel |
| **24D** 90-Day Re-Engagement Sequence | Cadence for re-approaching cold contacts after a cooling-off period |
| **24E** Cross-Channel Follow-Up Coordination | How this stage's rules interact with Stage 21's multi-channel sequencing |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for follow-up automation tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting value-add follow-up lines that reference a relevant case study/stat rather than a generic "just checking in" bump
- Flagging contacts approaching their re-engagement date so nothing is missed

**Prompt examples:**
```
"Write a Day-4 follow-up email for a [persona] who hasn't replied to my
Day-1 email about [topic]. Include a one-sentence reference to this case
study: [paste]. End with a low-friction question."
```

**Agent workflows:** A scheduled agent can maintain the follow-up and re-engagement calendar automatically — flagging which contacts are due for their next touch and on which channel — but the actual touch content should stay within each channel stage's human/AI-reviewed template process (Stages 16-21).

**RAG / vector database considerations:** A small value-add content library (case studies, stats) is sufficient context; not at a scale requiring a vector database.

**LLM recommendations:** Standard current-generation models are sufficient for drafting follow-up copy variants.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Follow-up tracking fields (mandatory)
`Contact ID` · `Channel` · `Follow-Up Count` · `Last Touch Date` · `Next Follow-Up Date` · `Status` (Active/Cold/Re-engagement/Booked)

### JSON schema
```json
{
  "contact_id": "string",
  "channel": "email|linkedin|cold_call|whatsapp|sms",
  "follow_up_count": 0,
  "last_touch_date": "ISO 8601 date",
  "next_follow_up_date": "ISO 8601 date",
  "status": "active|cold|re_engagement|booked"
}
```

### Validation rules
- No channel exceeds its maximum follow-up count (typically 3) before the contact is marked `cold` on that channel
- A `cold` contact enters the 90-day re-engagement sequence automatically rather than being deleted/forgotten
- Every follow-up message must reference the value-add library, not repeat "just checking in" verbatim across steps

### Naming conventions
- Follow-up counts and statuses are tracked per-channel, not globally, since a contact can be `cold` on email while still `active` on LinkedIn within a multi-channel sequence (Stage 21)

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] No contact silently dropped without a `cold` status and re-engagement entry
- [ ] Every follow-up message adds value, not a bare "checking in" bump
- [ ] Follow-up spacing matches the documented cadence, not sent early/late ad hoc

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of non-repliers with a defined next action | 100% | No contact should be in limbo with no follow-up or re-engagement status |
| Reply rate by follow-up step | Track and trend | Later follow-ups often convert differently than the opener — worth tracking separately |
| Re-engagement sequence conversion rate | Track and trend | Validates whether the 90-day cooling-off approach is working |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [23 Deliverability and Domain Health](../23 Deliverability and Domain Health/README.md)
- **Next stage:** [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md)
- **Depends on / feeds:** [16 Email Outreach](../16 Email Outreach/README.md) through [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)

> **Source note:** Built directly from the internal "Follow-Up Automation System" doc in this repo's Growth Engine folder, which already defines the philosophy, per-channel sequences, and re-engagement cadence this stage documents as the shared standard behind Stages 16-21's follow-up steps.

[⬅ Back to README](README.md)
