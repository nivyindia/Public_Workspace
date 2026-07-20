# 21 Multi Channel Sequencing

> **Stage 21 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 4, Session 6). Batch 4 complete — Stages 16-21 now at pilot depth.

---

## Navigation

- ⬅ Previous stage: [20 SMS Outreach](../20 SMS Outreach/README.md)
- ➡ Next stage: [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Combine two or more of Stages 16-20's individual channels into a single coordinated cadence per contact — e.g., email → LinkedIn connect → call — so touches reinforce rather than duplicate or contradict each other.

**Purpose:** Stage 15 decides which channels to use; Stages 16-20 each execute one channel well in isolation. Neither addresses timing and coordination when more than one channel is in play for the same contact. Without this stage, a contact might get a cold email on Monday, an unrelated LinkedIn connection request on Tuesday, and a cold call on Wednesday that doesn't reference either — three uncoordinated touches that read as spam rather than one deliberate, escalating outreach effort.

**Inputs:**
- Channel plan specifying a multi-channel approach for this segment (Stage 15)
- Individual channel execution capability (Stages 16-20)
- Contact-level activity history across all channels (CRM, Stage 13)

**Outputs:**
- A documented, timed multi-channel cadence per segment (e.g., "Day 1 email, Day 3 LinkedIn connect, Day 6 call if no reply")
- Contact-level tracking of which sequence step across which channel is next due
- Reduced duplicate/contradictory touches across channels for the same contact

**Expected Result:** Each contact experiences one coherent, escalating outreach effort regardless of how many channels are involved, and reply on any channel correctly pauses/redirects the other channels' remaining steps for that contact.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **21A** Sequence Blueprint Design | Defining the channel order, spacing, and stop conditions per segment |
| **21B** Cross-Channel Reference Continuity | Each touch referencing the prior touch ("following up on my email...") |
| **21C** Reply-Anywhere Stop Logic | A reply on any channel pauses/redirects remaining steps across all channels |
| **21D** Cross-Channel CRM View | Single contact timeline showing all channel touches, not siloed per channel |
| **21E** Sequence Performance Tracking | Which channel combinations/orderings convert best per segment |
| **21F** Escalation Timing Rules | Minimum spacing between touches on different channels to avoid appearing as spam |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for cross-channel sequencing/orchestration tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Recommending a starting multi-channel sequence blueprint for a new segment based on Stage 15's channel plan and historical performance data
- Drafting cross-channel-continuity copy (e.g., a LinkedIn message that naturally references the earlier email) so touches don't read as disconnected

**Prompt examples:**
```
"Given this channel plan [paste Stage 15 output] and this table of past
sequence performance by segment [paste], recommend a channel order and
timing for a new multi-channel sequence, with stop conditions."
```
```
"Write a LinkedIn connection note that naturally references an email sent
3 days ago about [topic], without repeating the same pitch verbatim."
```

**Agent workflows:** An orchestration layer (e.g., n8n) can track each contact's current step across all channels and trigger the next channel's send at the right time, but a reply on any channel must immediately halt/redirect the automation for that contact — this stop-logic should be tested thoroughly before trusting it unattended at volume.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for blueprint recommendations and cross-channel copy drafting.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Sequence blueprint fields (mandatory)
`Segment` · `Sequence Name` · `Steps` (ordered list of channel + day-offset) · `Stop Conditions` · `Owner`

### Contact-sequence-progress fields (mandatory)
`Contact ID` · `Sequence Name` · `Current Step Index` · `Last Touch Channel` · `Last Touch Date` · `Overall Status` (Active/Paused-Replied/Completed-No Reply/Booked)

### JSON schema
```json
{
  "contact_id": "string",
  "sequence_name": "string",
  "current_step_index": 0,
  "last_touch_channel": "email|linkedin|cold_call|whatsapp|sms",
  "last_touch_date": "ISO 8601 date",
  "overall_status": "active|paused_replied|completed_no_reply|booked"
}
```

### Validation rules
- A reply on any channel sets `overall_status` to `paused_replied` and halts all further automated steps across every channel for that contact
- No contact is on two different active multi-channel sequences simultaneously
- Step timing must respect each individual channel stage's own daily volume limits (Stages 16-20)

### Naming conventions
- Channel values match the fixed enum used in Stage 15/16-20 exactly, so cross-referencing stays reliable across the whole funnel

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every multi-channel segment has a documented sequence blueprint with stop conditions before launch
- [ ] Reply-anywhere stop logic tested and confirmed working before scaling a new sequence
- [ ] No contact receiving contradictory or duplicate touches across channels on the same day

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of multi-channel contacts with correctly halted sequences after reply | 100% | Any leakage here directly damages prospect experience |
| Sequence completion-to-booking rate by blueprint | Track and trend per segment | Used to refine which channel orderings work best |
| Cross-channel duplicate-touch incidents | 0 | Two channels touching the same contact same-day without a Stage 21 rationale is a QC failure |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [20 SMS Outreach](../20 SMS Outreach/README.md)
- **Next stage:** [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)
- **Depends on:** [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md), [16 Email Outreach](../16 Email Outreach/README.md), [17 LinkedIn Outreach](../17 LinkedIn Outreach/README.md), [18 Cold Calling](../18 Cold Calling/README.md), [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md), [20 SMS Outreach](../20 SMS Outreach/README.md)
- **Also feeds:** [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md)

> **Source note:** No single internal doc covers cross-channel sequencing directly; this stage synthesizes the individual-channel SOPs mined for Stages 16-20 (Cold Email System, LinkedIn Outreach System, WhatsApp Outreach SOP) into a coordination layer, generalized for this knowledge base. Sequence-blueprint timing examples are illustrative starting points, not benchmarked figures.

[⬅ Back to README](README.md)
