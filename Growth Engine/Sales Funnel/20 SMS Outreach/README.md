# 20 SMS Outreach

> **Stage 20 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 4, Session 6).

---

## Navigation

- ⬅ Previous stage: [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md)
- ➡ Next stage: [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Use short, compliant SMS messages as a lightweight nudge/reminder channel — primarily for confirming or reviving booked meetings and time-sensitive follow-ups rather than as a cold-opener channel.

**Purpose:** SMS has near-universal open rates and works even where a prospect has no data connection, but it is the most restrictive channel for unsolicited cold outreach in most B2B markets (many jurisdictions treat unsolicited commercial SMS more strictly than email or calling). This stage exists to define where SMS is legitimately useful in this funnel — largely meeting confirmations, reminders, and re-engagement of contacts who have already opted into some form of contact — rather than as a cold-first-contact channel.

**Inputs:**
- Contacts who have already engaged via another channel (reply, booked call) or explicitly opted in
- Channel plan confirming SMS as an appropriate channel for the use case (Stage 15)
- Market-specific SMS compliance rules (e.g., TCPA in the US)

**Outputs:**
- Sent confirmation/reminder/re-engagement SMS with delivery/reply status tracked in CRM
- Reduced no-show rate on booked discovery calls (feeds Stage 28)

**Expected Result:** SMS used narrowly and compliantly as a support channel that improves show-up rates and re-engages warm-but-gone-quiet contacts, without being used as a cold-outreach channel where it carries the highest compliance risk of any channel in this batch.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **20A** Use-Case Scoping | Defining what SMS is/isn't used for in this funnel (confirmation/reminder/re-engagement, not cold-open) |
| **20B** Consent & Compliance Check | Confirming a lawful basis to text this contact per market rules |
| **20C** Message Format Rules | Character limits, opt-out language, sender-ID conventions |
| **20D** Meeting Confirmation & Reminder Sequence | Sent after a Stage 28 booking |
| **20E** Re-Engagement Message | For warm contacts who've gone quiet on another channel |
| **20F** Reply/Opt-Out Handling | STOP-keyword handling and reply routing |
| **20G** CRM Logging | Send status, reply status, opt-out flag |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for SMS gateway tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting short, compliant confirmation/reminder/re-engagement copy within character limits
- Classifying inbound SMS replies (Confirm/Reschedule/Opt-out/Other) before human handling

**Prompt examples:**
```
"Write a meeting-confirmation SMS (under 160 characters) for a discovery
call tomorrow at [time], including a reschedule link and opt-out
instruction."
```

**Agent workflows:** Meeting-confirmation and reminder SMS can be fully automated (triggered directly off a Stage 28 booking event) since these are transactional, not cold-outreach, messages. Any SMS intended as new/cold contact should be routed through human review given the compliance sensitivity of this channel.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for short transactional copy drafting.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Message log fields (mandatory)
`Contact ID` · `Phone` · `Message Type` (Confirmation/Reminder/Re-engagement) · `Sent Date` · `Status` (Sent/Delivered/Replied/Opted-Out) · `Related Booking ID`

### JSON schema
```json
{
  "contact_id": "string",
  "phone": "string",
  "message_type": "confirmation|reminder|re_engagement",
  "sent_date": "ISO 8601 date",
  "status": "sent|delivered|replied|opted_out",
  "related_booking_id": "string|null"
}
```

### Validation rules
- No cold/first-contact SMS is sent without a documented lawful basis for that market
- Any `STOP`/opt-out reply immediately and permanently suppresses the contact from all future SMS
- Every message includes opt-out instructions where required by local regulation

### Naming conventions
- `Message Type` is a fixed enum limited to the use cases this stage actually covers, deliberately excluding a "cold_open" value to keep the scope boundary explicit

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Lawful basis confirmed before any SMS to a contact not already opted-in via another channel
- [ ] Opt-out language present where required
- [ ] STOP replies actioned immediately

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Delivery rate | > 95% | Low delivery usually indicates bad number data — feed back to Stage 10 |
| No-show reduction (with vs. without confirmation SMS) | Track and trend | Primary justification for this channel's use |
| Compliance incidents | 0 | Any unsolicited-SMS violation is a hard stop, not a metric to minimize |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md)
- **Next stage:** [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)
- **Also feeds:** [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)

> **Source note:** No dedicated internal SMS-specific SOP was found in this repo's source material (the "SMS + Push + WhatsApp API Modules" doc found relates to a different product area, not this sales funnel). This stage was built from general SMS-compliance best practice and deliberately scoped narrowly (confirmation/reminder/re-engagement, not cold-opening) given SMS's stricter unsolicited-contact regulation in most markets compared to email or calling. Compliance details are a starting point only and must be verified against current local regulation (e.g., TCPA in the US) before operational use.

[⬅ Back to README](README.md)
