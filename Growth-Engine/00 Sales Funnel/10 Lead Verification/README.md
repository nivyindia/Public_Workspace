# 10 Lead Verification

> **Stage 10 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 2, Session 4). Batch 2 complete — Stages 07–10 now at pilot depth.

---

## Navigation

- ⬅ Previous stage: [09 Data Cleaning](../09 Data Cleaning/README.md)
- ➡ Next stage: [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Confirm, before any lead enters an outreach sequence, that its contact channel is actually deliverable (email won't hard-bounce, phone is in service) and that the underlying company/role still exists and is current.

**Purpose:** Contact Discovery (Stage 07) finds a plausible channel; Verification confirms it's real and current. Sending to unverified addresses at volume is the single fastest way to damage sender domain reputation (hurting every future campaign, not just the current one), and cold-calling disconnected numbers wastes execution capacity that should go to reachable leads.

**Inputs:**
- Cleaned leads from Stage 09 with a resolved contact channel from Stage 07
- Access to email/phone verification tools (Reoon, NeverBounce, Hunter's built-in verifier)

**Outputs:**
- Every lead tagged with a verification status: Valid / Risky / Invalid / Disposable (email) and In-Service / Disconnected (phone, where applicable)
- A clean, deliverability-confirmed list ready for Stage 11 (Scoring) and eventual outreach sequencing

**Expected Result:** Every lead entering outreach has a confirmed-deliverable contact channel, keeping bounce rate within the acceptable threshold and protecting sender/caller reputation.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **10A** Email Syntax & Format Check | Basic structural validation (valid character set, @ present, domain has MX records) before running paid verification credits |
| **10B** Bulk Email Verification | Run the cleaned list through a bulk verification tool (Reoon/NeverBounce) and classify Valid/Risky/Invalid/Disposable |
| **10C** Domain/MX Health Check | Confirm the target domain accepts mail and isn't a known catch-all trap |
| **10D** Phone Verification | Confirm phone numbers are in-service and correctly formatted with country code, where cold-calling is part of the campaign |
| **10E** Role/Company Currency Check | Spot-check that the contact still holds the role and the company is still active (especially for older or slow-moving batches) |
| **10F** Risky-Lead Manual Review | Route "Risky" classified leads to manual review rather than auto-including or auto-excluding them |
| **10G** Verification Status Logging | Tag every lead with its verification outcome and date, feeding both Stage 11 scoring and future re-verification scheduling |

---

## 3. Complete Methods

Full breakdown of verification methods is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

Not primarily website-based — see [tools.md](tools.md) for verification tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md) for the bulk verification pipeline pattern.

---

## 7. AI Section

**How AI can help:**
- Triaging "Risky" verification results by cross-referencing other signals (does the domain otherwise look legitimate, does the company have an active LinkedIn page) to help a human reviewer decide faster
- Spot-checking role currency by comparing the CRM-recorded title against what's currently shown on the contact's LinkedIn profile
- Summarizing verification-batch results into a clean pass/fail report for Manager review

**Prompt examples:**
```
"Here are 20 leads marked 'Risky' by email verification, with their
LinkedIn profile snapshot and company domain info [paste]. For each, note
any signal suggesting the domain/contact is legitimate despite the risky
classification, and any signal suggesting it should be excluded. Do not
make the final call — flag for human review."
```
```
"Compare this CRM-recorded job title against this current LinkedIn
profile snapshot [paste both]. Flag if the role appears to have changed
or the profile appears inactive/stale."
```

**Agent workflows:** An agent can chain: (1) run bulk email verification via API → (2) auto-pass Valid, auto-exclude Invalid/Disposable → (3) for Risky, pull supplementary signal (domain age, LinkedIn activity) → (4) present a triage summary to a human for the final Risky-lead decision, rather than fully automating that judgment call.

**RAG / vector database considerations:** Not applicable — this is a per-lead verification task, not a retrieval task.

**LLM recommendations:** A lightweight model is sufficient for the triage-summary task; verification itself is handled by dedicated deliverability APIs (Reoon/NeverBounce), not an LLM.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Verification fields — mandatory
`Email Verification Status` (valid/risky/invalid/disposable) · `Phone Verification Status` (in_service/disconnected/not_checked) · `Role Currency Checked` (yes/no) · `Verification Date`

### JSON schema
```json
{
  "lead_id": "string",
  "email_verification_status": "valid|risky|invalid|disposable",
  "phone_verification_status": "in_service|disconnected|not_checked",
  "role_currency_checked": "boolean",
  "verification_date": "ISO 8601 date",
  "next_reverification_due": "ISO 8601 date|null"
}
```

### Validation rules
- No lead proceeds to outreach sequencing (Stage 16+) with an `invalid` or `disposable` email status
- `Risky` leads require a manual review decision logged, not an automatic pass or exclude
- Leads sitting unverified for more than the batch's outreach window should be re-verified before use (contact data decays over time — a valid email today isn't guaranteed valid in 3 months)

### Naming conventions
- Status fields use the fixed enums above for consistent reporting and to match the bounce-rate tracking already in use (hard bounce targets: <2% cold email, <1% newsletter)

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] 100% of leads entering outreach have a `valid` (or manually-reviewed-and-approved `risky`) email verification status
- [ ] No `invalid` or `disposable` leads proceed past this stage
- [ ] Verification date logged for every lead (enables re-verification scheduling)
- [ ] Risky-lead manual review decisions logged with reasoning

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Email validity rate (in CRM) | > 95% | Per existing Data Health KPI standard |
| Cold email hard bounce rate | < 2% | Protects domain reputation |
| Newsletter hard bounce rate | < 1% | Stricter threshold for higher-volume sends |
| Blacklist / unsubscribe compliance | 100%, ongoing | Non-negotiable compliance floor |
| Re-verification cadence for aging lists | Before reuse if list is > 90 days old | Contact data decays — don't assume old-verified is still current |

---

## 11. Templates

See [templates.md](templates.md) for the verification batch report template.

---

## 12. Resources

See [resources.md](resources.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [09 Data Cleaning](../09 Data Cleaning/README.md)
- **Next stage:** [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
- **Also feeds:** [16 Email Outreach](../16 Email Outreach/README.md), [18 Cold Calling](../18 Cold Calling/README.md) (both depend on this stage's deliverability confirmation)
- **Automation file:** [automation.md](automation.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using Nivy's existing "Data Infrastructure OS" Layer 2 — Email Validation workflow (Reoon/NeverBounce/Hunter tool comparison, Valid/Risky/Invalid/Disposable classification flow, and bounce-rate targets), and informed by the general verification philosophy ("process-based, not assumption-based," staged/layered checks before full trust) documented in Nivy's Section H Verification & Due Diligence Framework, adapted here from its original trade-partner-verification context to lead-contact verification.
