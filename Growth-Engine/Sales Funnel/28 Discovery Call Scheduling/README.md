# 28 Discovery Call Scheduling

> **Stage 28 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 8).

---

## Navigation

- ⬅ Previous stage: [27 Qualification BANT MEDDIC](../27 Qualification BANT MEDDIC/README.md)
- ➡ Next stage: [29 Discovery Call Execution](../29 Discovery Call Execution/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Convert an "Interested" reply (Stage 25) into a confirmed, well-prepared discovery call booking — with the right person, at a real time, and with enough pre-call research done that the call starts from context rather than from zero.

**Purpose:** Booking the call is only half the job; a booked-but-unprepared call wastes the opportunity Stages 16-27 worked to create. This stage exists to standardize both the booking mechanics (link, confirmation, reminder — largely automated) and the pre-call research discipline (company review, likely-problem hypotheses, pitch prep) that determines whether the call itself goes well.

**Inputs:**
- Interested reply or qualification signal (Stage 25/27)
- Scheduling tool with the rep's/closer's real availability
- Contact and company data already gathered (Stages 07/08) for pre-call research

**Outputs:**
- A confirmed calendar booking with both parties notified
- Confirmation and reminder SMS/email sent (Stage 20/16 handoff)
- A completed pre-call research brief attached to the CRM opportunity record before the call happens

**Expected Result:** Every discovery call starts on time, with the right person, and with the rep already having reviewed the company and formed 2-3 problem hypotheses — not walking in cold.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **28A** Booking Link Delivery | Sharing the scheduling link in the reply-handling response (Stage 25) |
| **28B** Calendar Confirmation | Automated confirmation email/SMS immediately after booking |
| **28C** Reminder Cadence | 24-hour and 1-hour reminders (Stage 20 handoff) |
| **28D** Pre-Call Company Research | Website, LinkedIn, business listings review before the call |
| **28E** Problem Hypothesis Prep | Drafting 2-3 likely-problem hypotheses to test on the call |
| **28F** Rebooking / No-Show Handling | Process when a booked contact doesn't show or requests to reschedule |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for scheduling tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Summarizing a prospect's website/LinkedIn into a 3-5 line pre-call brief with 2-3 problem hypotheses
- Drafting the confirmation/reminder copy (feeding into Stage 20's templates)

**Prompt examples:**
```
"Here is a prospect's website content and LinkedIn summary: [paste].
Draft a pre-call brief: what they do, likely team size, and 2-3 problem
hypotheses worth exploring on a discovery call."
```

**Agent workflows:** Booking confirmation and reminders (Stage 20) run fully automated off the calendar event. A research agent can pre-fill the company-research and problem-hypothesis fields automatically once a call is booked, but the rep should review this brief before the call rather than relying on it unread.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for research summarization.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Booking fields (mandatory)
`Contact ID` · `Booking ID` · `Scheduled Date/Time` · `Status` (Booked/Confirmed/Completed/No-Show/Rescheduled/Cancelled) · `Pre-Call Brief Attached` (boolean)

### JSON schema
```json
{
  "contact_id": "string",
  "booking_id": "string",
  "scheduled_datetime": "ISO 8601 datetime",
  "status": "booked|confirmed|completed|no_show|rescheduled|cancelled",
  "pre_call_brief_attached": true
}
```

### Validation rules
- No booking is considered `Confirmed` until the confirmation message (Stage 16/20) has been sent
- A pre-call brief must be attached before the scheduled time — a booking without one triggers a reminder to the rep
- `No-Show` bookings trigger a rebooking outreach attempt (Stage 24 follow-up logic), not silent drop

### Naming conventions
- Booking IDs match the scheduling tool's native event ID so CRM and calendar stay in sync without duplicate records

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every booking has a confirmation sent and a pre-call brief attached before the call
- [ ] No-shows trigger a rebooking attempt within 24 hours
- [ ] Rep has reviewed the pre-call brief before joining the call

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Booking-to-show-up rate | Track and trend | Confirmation/reminder discipline (Stage 20) is the primary lever here |
| % of calls with a pre-call brief completed | 100% | Hard QC gate |
| No-show recovery rate | Track and trend | % of no-shows successfully rebooked |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [27 Qualification BANT MEDDIC](../27 Qualification BANT MEDDIC/README.md)
- **Next stage:** [29 Discovery Call Execution](../29 Discovery Call Execution/README.md)
- **Depends on:** [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md), [20 SMS Outreach](../20 SMS Outreach/README.md)

> **Source note:** Built from the internal "Phase 10 — Meeting Preparation" doc in this repo's Growth Engine folder (company research, problem-hypothesis prep, service-pitch structure) combined with the booking/confirmation mechanics already established in Stage 20's methods.md.

[⬅ Back to README](README.md)
