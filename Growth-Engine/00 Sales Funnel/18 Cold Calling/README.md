# 18 Cold Calling

> **Stage 18 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 4, Session 6).

---

## Navigation

- ⬅ Previous stage: [17 LinkedIn Outreach](../17 LinkedIn Outreach/README.md)
- ➡ Next stage: [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Reach target-persona contacts by phone using a structured opening script and objection-handling flow, converting live conversations directly into booked discovery calls or clearly logged disqualifications.

**Purpose:** Cold calling is the only outreach channel that gets a real-time answer instead of an asynchronous open/reply. It converts faster per-contact-reached than email or LinkedIn but reaches far fewer people per hour, and is the most heavily regulated channel (Do-Not-Call registries, calling-hours restrictions vary sharply by country). This stage exists to standardize the call flow and compliance checks so calling stays both effective and legal across the markets this funnel targets.

**Inputs:**
- Verified phone numbers on qualified contacts (Stage 07/10)
- Channel plan confirming cold calling as chosen channel for this segment/market (Stage 15)
- Market-specific calling-hours and Do-Not-Call compliance rules
- Objection-handling reference material (feeds from/into Stage 26)

**Outputs:**
- Logged call outcomes (connected/voicemail/no-answer/booked/not interested/DNC request) in CRM
- Booked discovery calls handed to Stage 28
- Voicemail/no-answer contacts queued for a follow-up cadence or handoff to another channel (Stage 21)

**Expected Result:** A disciplined daily calling block with an accurate log of every attempt and outcome, a rising connect-to-booking rate as scripts are refined, and zero compliance incidents.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **18A** Call List Preparation | Pulling verified numbers + context notes for the day's calling block |
| **18B** Compliance Check by Market | Do-Not-Call registry status, permitted calling hours per country/state |
| **18C** Opening Script | First 10-15 seconds — the highest-drop-off point of any cold call |
| **18D** Discovery Questions | Short qualifying questions to confirm fit before pitching |
| **18E** Objection Handling on the Call | Live responses to common pushback (feeds Stage 26 library) |
| **18F** Voicemail Script | What to leave when the call isn't answered |
| **18G** Call Outcome Logging | Structured outcome codes in CRM after every attempt |
| **18H** Follow-Up Cadence | When/how to re-attempt a no-answer or voicemail contact |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for dialer/compliance-check tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting opening-script and voicemail-script variants per persona for human review and live practice
- Summarizing available contact/company context into a 2-3 line pre-call brief so the rep isn't calling cold on information they already have
- Post-call: transcribing and summarizing call notes (where recording/transcription is legally permitted in that market) to speed up CRM logging

**Prompt examples:**
```
"Write a 10-second cold-call opening line for a [persona] at a [industry]
company, referencing [one specific detail]. No pitch in the opener."
```
```
"Here is a call transcript: [paste]. Summarize the outcome in 2 sentences
and suggest the correct CRM outcome code from this list: [paste list]."
```

**Agent workflows:** Not typically automated end-to-end — live calling requires a human on the line. An agent can prepare the day's call list with pre-call briefs and log outcomes from post-call notes, but the call itself is a manual activity.

**RAG / vector database considerations:** Not required at this stage's scale; the objection-handling library (Stage 26) and persona reference docs (Stage 03) are sufficient context.

**LLM recommendations:** Standard current-generation models are sufficient. Any call recording/transcription must first be confirmed legal in that market — two-party consent laws apply in some US states and other countries.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Call log fields (mandatory)
`Contact ID` · `Phone` · `Call Date/Time` · `Outcome` (Connected/Voicemail/No Answer/Wrong Number/Booked/Not Interested/DNC Request) · `Notes` · `Next Action Date`

### JSON schema
```json
{
  "contact_id": "string",
  "phone": "string",
  "call_datetime": "ISO 8601 datetime",
  "outcome": "connected|voicemail|no_answer|wrong_number|booked|not_interested|dnc_request",
  "notes": "string",
  "next_action_date": "ISO 8601 date"
}
```

### Validation rules
- No call is placed to a number flagged Do-Not-Call/DNC in CRM
- Calling only occurs within the target market's permitted calling-hours window
- A `dnc_request` outcome immediately and permanently suppresses that contact across all channels, not just calling

### Naming conventions
- Outcome codes are a fixed enum matching this stage's list exactly, so reporting stays consistent across reps

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Call list checked against DNC/compliance status before the calling block starts
- [ ] Calling hours match the target market's legal window
- [ ] Every attempt logged with an outcome code same-day
- [ ] Booked calls handed to Stage 28 within the same day

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Connect rate (live answer) | 5-15% | Varies heavily by list quality and time of day |
| Connect-to-booking rate | 10-25% | Of calls that connect, how many result in a booked discovery call |
| Compliance incidents | 0 | Any DNC violation is a hard stop, not a metric to minimize |
| Calls attempted per rep per day | Track and trend | Set per team capacity, not a fixed external benchmark |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [17 LinkedIn Outreach](../17 LinkedIn Outreach/README.md)
- **Next stage:** [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md)
- **Also feeds:** [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md), [26 Objection Handling](../26 Objection Handling/README.md), [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)

> **Source note:** Unlike most other stages in this batch, no dedicated internal cold-calling SOP existed in the repo's source material at time of writing (the "Discovery Call Script" and "Meeting Preparation" docs found relate to Stage 29, post-booking calls, not cold outbound calling). This stage was built from general B2B cold-calling best practice and generalized from the compliance/cadence patterns used in the email and LinkedIn SOPs. Calling-hours and Do-Not-Call compliance details are a starting point only and must be verified against current local regulation per market before operational use.

[⬅ Back to README](README.md)
