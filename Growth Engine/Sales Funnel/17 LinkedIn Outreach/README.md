# 17 LinkedIn Outreach

> **Stage 17 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 4, Session 6).

---

## Navigation

- ⬅ Previous stage: [16 Email Outreach](../16 Email Outreach/README.md)
- ➡ Next stage: [18 Cold Calling](../18 Cold Calling/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Grow and use a LinkedIn profile/company page to connect with target-persona decision-makers and run a structured connection-request + DM sequence that converts to booked discovery calls.

**Purpose:** LinkedIn is the primary channel where B2B decision-makers are professionally active and identifiable by title/company — a fit that email lacks (email can't be filtered by job title before sending) and cold calling lacks (no way to browse for the right person first). This stage exists to make LinkedIn outreach systematic rather than ad-hoc "add and pitch" behavior, which both converts poorly and risks the account being restricted.

**Inputs:**
- Target persona and title filters (Stage 03 Buyer Persona)
- Channel plan confirming LinkedIn as chosen channel (Stage 15)
- An optimized company page and founder/rep profile
- Contact list with LinkedIn URLs (Stage 07 Contact Discovery)

**Outputs:**
- Accepted connections progressed through a DM sequence, tracked in CRM
- Interested replies escalated to Stage 25/28
- Weekly connection-request and DM-send volume held within platform-safe limits

**Expected Result:** A steady, non-flagged growth in qualified connections and a repeatable DM-to-reply-to-booking conversion rate the team can benchmark over time.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **17A** Profile & Company Page Optimization | Headline, About section, banner, Featured section, Creator Mode |
| **17B** Target Profile Filtering | Title/company-size/location filters per market (Stage 03-aligned) |
| **17C** Connection Request Strategy | Note templates, daily connection-request limits |
| **17D** DM Sequence Design | 3-message sequence: intro, value follow-up, breakup |
| **17E** Daily Send Execution | Volume-limited sending within LinkedIn's safe daily thresholds |
| **17F** Reply Triage & Escalation | Routing interested/not-interested replies (feeds Stage 25) |
| **17G** Account Health Monitoring | Watching for restriction warnings, adjusting volume if flagged |
| **17H** CRM Logging | Connection status, DM step, reply status, next action date |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for LinkedIn automation/tracking tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting connection-note and DM copy variants per persona/industry for human review
- Summarizing a prospect's recent LinkedIn activity/posts into one personalization line before the first DM
- Triaging inbound DM replies into Interested / Not Interested / Needs human judgment

**Prompt examples:**
```
"Write a LinkedIn connection note (under 160 characters) for a [persona]
at a [industry] company. Curiosity-based, no pitch, no emoji overload."
```
```
"Here is a prospect's recent LinkedIn post: [paste]. Write one sentence
I could reference naturally in a first DM to show I've actually read it."
```

**Agent workflows:** A scheduled automation (e.g., PhantomBuster + n8n) can export daily search results into a sheet and queue connection requests within safe limits, but message copy should be human/AI-reviewed per segment before the agent sends it unattended, and account-health signals (LinkedIn warnings, restricted actions) should trigger an immediate pause, not be automated through.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for drafting and reply classification.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Contact-outreach fields (mandatory)
`Contact ID` · `LinkedIn URL` · `Connection Status` (Not Sent/Pending/Accepted/Rejected) · `DM Step` (1/2/3) · `Last Sent Date` · `Reply Status` · `Next Action Date`

### JSON schema
```json
{
  "contact_id": "string",
  "linkedin_url": "string",
  "connection_status": "not_sent|pending|accepted|rejected",
  "dm_step": 1,
  "last_sent_date": "ISO 8601 date",
  "reply_status": "no_reply|interested|not_interested|booked",
  "next_action_date": "ISO 8601 date"
}
```

### Validation rules
- DM sequence only begins after connection is `accepted`
- Daily connection requests must not exceed the platform-safe limit in [methods.md](methods.md)
- Any account-restriction warning halts all automated sending until reviewed by a supervisor

### Naming conventions
- Contact IDs match the CRM record created in Stage 07/13 so LinkedIn activity ties back to the same master contact, not a separate silo

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Profile/company page optimization checklist complete before outreach starts
- [ ] Daily connection-request and DM volume within safe limits
- [ ] No DM sent to a non-accepted connection
- [ ] Replies triaged and actioned within 24 hours

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Connection acceptance rate | 20-40% | Depends on note quality and targeting precision |
| DM reply rate | 10-25% | Higher than cold email typically, due to the prior connection |
| Calls booked per 100 connections | Track and trend per segment | Primary downstream success metric |
| Account restriction incidents | 0 | Any warning is a hard stop for volume review, not a metric to minimize |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [16 Email Outreach](../16 Email Outreach/README.md)
- **Next stage:** [18 Cold Calling](../18 Cold Calling/README.md)
- **Also feeds:** [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md), [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md), [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)

> **Source note:** Built from the internal LinkedIn Outreach System (Full SOP), LinkedIn Outreach Script, and SOP-VA-005 LinkedIn DM Outreach docs in this repo's Growth Engine folder. Daily limits are carried over from those SOPs and marked "verify current" since LinkedIn's automated-behavior detection thresholds change without public notice.

[⬅ Back to README](README.md)
