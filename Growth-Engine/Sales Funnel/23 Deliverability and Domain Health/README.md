# 23 Deliverability and Domain Health

> **Stage 23 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 5, Session 7).

---

## Navigation

- ⬅ Previous stage: [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)
- ➡ Next stage: [24 Follow Up Systems](../24 Follow Up Systems/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Maintain the technical health of every sending domain/mailbox and phone number used across Stages 16-20, so outreach volume can scale without triggering spam filters, provider blacklists, or platform restrictions.

**Purpose:** Stage 16 covers setting up a single mailbox correctly; this stage covers the ongoing, cross-channel discipline of monitoring and protecting deliverability once multiple mailboxes/numbers are running simultaneously across a growing team. A single burned domain doesn't just stop that campaign — it can affect every future campaign sent from that domain, which is why this is treated as its own stage rather than a subsection of Stage 16.

**Inputs:**
- All active sending domains/mailboxes (Stage 16) and phone numbers/WhatsApp numbers (Stages 18-19)
- Bounce, spam-complaint, and open-rate data from each channel tool
- Domain/IP reputation data from monitoring tools

**Outputs:**
- A monitored health dashboard per sending identity (domain/mailbox/number)
- Documented incident-response steps when a domain/number shows degraded health
- Rotation/retirement decisions for damaged sending identities

**Expected Result:** No sending identity is used past the point its health data indicates a problem; damaged identities are retired or rehabilitated before they affect overall campaign performance, and new identities are properly warmed before being added to volume rotation.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **23A** Technical Setup Verification | SPF/DKIM/DMARC for email; number-registration status for calling/WhatsApp/SMS |
| **23B** Warm-Up Schedule Enforcement | Confirming new identities follow the ramp-up volume curve (Stage 16 methods.md) |
| **23C** Health Monitoring Dashboard | Centralized view of bounce rate, spam complaints, blacklist status per identity |
| **23D** Incident Response | Steps to take when a domain/number shows a health warning |
| **23E** Identity Rotation Strategy | Spreading volume across multiple mailboxes/numbers to protect any single identity |
| **23F** Retirement & Rehabilitation | When to permanently retire vs. attempt to rehabilitate a damaged identity |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for domain/reputation monitoring tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Summarizing daily health-monitoring data across many identities into a short flagged-issues report a human can act on quickly
- Drafting incident-response checklists tailored to the specific warning type detected

**Prompt examples:**
```
"Here is today's bounce/spam-complaint/blacklist data across our 8 sending
mailboxes: [paste]. Flag any mailbox that needs attention and why."
```

**Agent workflows:** A scheduled agent can pull health metrics from each channel tool's API daily and flag any identity crossing a warning threshold, but the decision to pause, rotate, or retire an identity should remain a human call given the downstream campaign impact.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for summarization and flagging.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Sending identity health fields (mandatory)
`Identity ID` · `Type` (email_domain/mailbox/phone_number/whatsapp_number) · `Status` (Warming/Healthy/Warning/Suspended/Retired) · `Bounce Rate` · `Spam Complaint Rate` · `Last Checked Date`

### JSON schema
```json
{
  "identity_id": "string",
  "type": "email_domain|mailbox|phone_number|whatsapp_number",
  "status": "warming|healthy|warning|suspended|retired",
  "bounce_rate": 0.0,
  "spam_complaint_rate": 0.0,
  "last_checked_date": "ISO 8601 date"
}
```

### Validation rules
- Any identity with bounce rate above 3% or spam complaint rate above 0.1% is set to `warning` and paused from new sends pending review
- New identities cannot exceed their warm-up-stage volume limit (inherited from Stage 16/17/19 methods.md) regardless of overall team sending capacity

### Naming conventions
- Identity IDs are unique per mailbox/number, not per campaign, so health history persists across campaigns using the same identity

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every active sending identity checked against health thresholds at least weekly
- [ ] No identity in `warning` or `suspended` status used for new sends
- [ ] Warm-up schedule enforced for every new identity before volume use

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of sending identities in `healthy` status | > 90% | Team-wide health snapshot |
| Domain/IP blacklist incidents | 0 | Any blacklisting is a hard stop requiring immediate investigation |
| Time-to-detection for a degrading identity | < 24 hours | Faster detection limits campaign damage |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md)
- **Next stage:** [24 Follow Up Systems](../24 Follow Up Systems/README.md)
- **Depends on:** [16 Email Outreach](../16 Email Outreach/README.md), [18 Cold Calling](../18 Cold Calling/README.md), [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md)

> **Source note:** Built primarily from the "Business Email Setup Starter Package" doc in this repo's Growth Engine folder, extended with the SPF/DKIM/DMARC and warm-up guidance already established in Stage 16's methods.md, generalized into an ongoing cross-channel monitoring discipline. Health-threshold figures are carried over from the Stage 16 source SOP and marked "verify current."

[⬅ Back to README](README.md)
