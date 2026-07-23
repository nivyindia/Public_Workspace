# 16 Email Outreach

> **Stage 16 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 4, Session 6).

---

## Navigation

- ⬅ Previous stage: [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md)
- ➡ Next stage: [17 LinkedIn Outreach](../17 LinkedIn Outreach/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Execute cold and warm email outreach to verified contacts (Stage 10) using a deliverability-safe sending setup, a structured multi-email sequence, and disciplined daily volume limits, converting opens/replies into booked discovery calls (Stage 28).

**Purpose:** Email is the highest-scale, lowest-cost outreach channel available — it reaches decision-makers with no platform connection limits, unlike LinkedIn. But it is also the easiest channel to ruin permanently: a poorly warmed domain or a spam-triggering template can get a sending domain blacklisted for months. This stage exists to standardize the setup and cadence so volume can scale without destroying deliverability.

**Inputs:**
- Verified contact list with email addresses (Stage 10 Lead Verification)
- Segment and channel plan confirming email is the chosen channel (Stage 15)
- Approved sending domain/mailbox, SPF/DKIM/DMARC configured, warmed
- Messaging/positioning from Buyer Persona and Value Proposition research (Stages 02-03)

**Outputs:**
- Sent, tracked email sequences per contact with open/reply/bounce status logged in CRM
- Interested replies escalated to Stage 25 (Reply Handling) and booked calls handed to Stage 28
- Deliverability metrics (bounce rate, spam complaint rate) monitored per sending domain

**Expected Result:** A predictable, repeatable weekly volume of emails sent within safe limits, with bounce rate held under 3% and a documented reply/booking rate the team can use to judge campaign performance.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **16A** Sending Infrastructure Setup | Dedicated domain/mailbox, SPF/DKIM/DMARC, warm-up schedule |
| **16B** Email Discovery & Verification Handoff | Confirming Stage 10-verified addresses before load into sending tool |
| **16C** Sequence Design | Opener, value follow-up, breakup email — timing and content |
| **16D** Subject Line & Copy Rules | Deliverability-safe subject lines, plain-text formatting, spam-trigger avoidance |
| **16E** Daily Send Execution | Volume-limited daily sending per warm-up stage |
| **16F** Reply Triage & Escalation | Routing interested/unsubscribe/rude replies (feeds Stage 25) |
| **16G** Deliverability Monitoring | Bounce rate, spam complaint rate, domain reputation tracking |
| **16H** CRM Logging | Sequence step, send date, status, next action date per contact |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for the sending, verification, and deliverability-monitoring tool stack.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting first-pass subject lines and opener copy per segment/persona, which a human then edits for tone and factual accuracy before sending
- Personalizing the first line of each email at scale using scraped/enriched data points (Stage 08) rather than sending an identical template to everyone
- Triaging inbound replies into Interested / Not Interested / Unsubscribe / Auto-reply categories before a human reads them

**Prompt examples:**
```
"Write 3 subject-line options (under 50 characters, no spam-trigger words)
for a cold email to a [persona] at a [industry] company about [pain point].
Question-based, not statement-based."
```
```
"Here is a reply to a cold email: [paste]. Classify it as Interested / Not
Interested / Unsubscribe / Auto-reply / Needs human judgment, and give a
one-line reason."
```

**Agent workflows:** A scheduled agent can pull newly Stage-10-verified contacts, apply the segment's email template with light personalization fields filled from Stage 08 enrichment data, and queue them into the sending tool — but the first send in any new segment/template should be human-reviewed before the agent is trusted to run it unattended at volume.

**RAG / vector database considerations:** Not required at this stage's scale; a template library plus a persona/pain-point reference doc (from Stages 02-03) is sufficient context for drafting.

**LLM recommendations:** Standard current-generation models are sufficient for drafting and reply classification. Treat all AI-drafted copy as a first draft requiring human review before it goes out under the company's sending domain.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Contact-sequence fields (mandatory)
`Contact ID` · `Email` · `Sequence Name` · `Current Step` (1/2/3) · `Last Sent Date` · `Status` (Sent/Opened/Replied/Bounced/Interested/Booked/Not Interested/Unsubscribed) · `Next Action Date` · `Sending Mailbox`

### JSON schema
```json
{
  "contact_id": "string",
  "email": "string",
  "sequence_name": "string",
  "current_step": 1,
  "last_sent_date": "ISO 8601 date",
  "status": "sent|opened|replied|bounced|interested|booked|not_interested|unsubscribed",
  "next_action_date": "ISO 8601 date",
  "sending_mailbox": "string"
}
```

### Validation rules
- No contact enters an email sequence unless it carries a Stage 10 "verified" status
- Unsubscribe/opt-out requests must set status to `unsubscribed` immediately and permanently suppress the contact across all future sequences
- Daily send volume per mailbox must not exceed the warm-up-stage limit defined in [methods.md](methods.md)

### Naming conventions
- Sequence names follow `[Segment]-[Persona]-v[N]` (e.g., `SME-CFO-v2`) so performance can be compared across template versions

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Sending domain has SPF, DKIM, DMARC configured and warm-up schedule followed before volume sending
- [ ] Bounce rate checked daily and held under 3%
- [ ] No contact sent to without a Stage 10 "verified" email status
- [ ] Replies triaged and actioned within 24 hours

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Open rate | 30-50% (varies by list quality/subject line) | Plain-text, personalized subject lines outperform |
| Reply rate | 5-15% | Segment/persona-dependent |
| Bounce rate | < 3% | Above this, deliverability degrades; stop sending and re-verify the list |
| Spam complaint rate | < 0.1% | Sustained higher rates risk domain blacklisting |
| Calls booked per 100 sent | Track and trend per segment | Primary downstream success metric feeding Stage 28 |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md)
- **Next stage:** [17 LinkedIn Outreach](../17 LinkedIn Outreach/README.md)
- **Also feeds:** [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md), [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md), [28 Discovery Call Scheduling](../28 Discovery Call Scheduling/README.md)

> **Source note:** Built primarily from the internal Cold Email Outreach SOP, the Cold Email System (Apollo + Instantly Method), and the Email Sequences Library docs in this repo's Growth Engine folder. Daily volume limits and warm-up figures are carried over from those SOPs and marked "verify current" since sender-reputation thresholds change with mailbox provider policy.

[⬅ Back to README](README.md)
