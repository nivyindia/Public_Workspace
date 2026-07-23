# 50 Churn Prevention

> **Stage 50 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 8, Session 12).

---

## Navigation

- ⬅ Previous stage: [49 Renewal Management](../49 Renewal Management/README.md)
- ➡ Next stage: [51 Customer Feedback and NPS](../51 Customer Feedback and NPS/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Detect churn-risk signals early — via monthly CSAT/NPS surveys and CRM activity monitoring — grade them by severity, and respond at the matching level of urgency and seniority, up to and including a founder-led save-a-client conversation for critical signals.

**Purpose:** Churn discovered only at the moment a client asks to cancel leaves almost no room to save the relationship. This stage exists to catch risk earlier, at the 🟡 Medium stage, and to guard specifically against "silent churn" — a client who never complains but is quietly disengaging — through proactive, scheduled sentiment checks rather than waiting to be told there's a problem.

**Inputs:**
- Monthly CSAT/NPS survey responses (feeds from Stage 51)
- CRM activity data (response times, task volume, delivery status)
- Renewal-sequence outcomes flagged as at-risk (from Stage 49)

**Outputs:**
- A graded churn-risk flag (🟡 Medium / 🔴 High / 🔴 Critical) with an owner-assigned response
- For critical signals: a completed save-a-client conversation and a concrete retention offer
- A logged outcome (retained/churned/pending) feeding pattern analysis

**Expected Result:** Warning signs are caught and responded to at the right severity level before they escalate to a cancellation request, and even genuine losses are exited gracefully with feedback captured rather than a relationship ending on a sour or unresolved note.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **50A** Silent-Churn Detection | Monthly CSAT/NPS survey dispatch, independent of client-initiated complaints |
| **50B** Warning-Sign Grading | 🟡 Medium / 🔴 High / 🔴 Critical severity classification |
| **50C** Response Ownership | VA proactive check-in (Medium) vs. founder call (High/Critical) |
| **50D** Save-a-Client Conversation | Scripted but genuine founder-led retention conversation for critical signals |
| **50E** Graceful Exit & Feedback Capture | When retention isn't possible, exiting cleanly and capturing honest feedback |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Generating a churn-risk score (Low/Medium/High) and recommended action from CSAT trend, engagement, and delivery data
- Drafting a suggested outreach message for the Account Manager or founder to personalize before sending

**Prompt examples:**
```
"Here is this client's CSAT trend, last response time, and delivery
status: [paste]. Return a churn risk level, the primary risk factor,
a recommended action, and a suggested outreach message."
```

**Agent workflows:** An agent can run the monthly risk-scoring pass across the full client base and flag High/Critical cases automatically, but the actual save-a-client conversation must be human — the source script is explicit that this is a real, listening-first conversation, not a message to be sent unread.

**RAG / vector database considerations:** Not required at this stage's scale — CRM/CSAT data is sufficient structured input.

**LLM recommendations:** Standard current-generation models (GPT-4o class or equivalent) are sufficient for risk scoring and outreach drafting.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Churn-risk record fields (mandatory)
`Client ID` · `Warning Sign` · `Severity` (Medium/High/Critical) · `Owner` · `Response Date` · `Save-a-Client Offer Made` · `Outcome` (Retained/Churned/Pending)

### JSON schema
```json
{
  "client_id": "string",
  "warning_sign": "string",
  "severity": "medium|high|critical",
  "owner": "va|account_manager|founder",
  "response_date": "ISO 8601 date",
  "save_a_client_offer_made": "string|null",
  "outcome": "retained|churned|pending"
}
```

### Validation rules
- `severity: critical` requires `owner: founder` and a `response_date` within the same day the signal was detected
- `severity: high` requires founder response within 24 hours
- `outcome: churned` requires exit feedback captured where possible, feeding Stage 51

### Naming conventions
- `severity` is a fixed three-level enum matching the warning-sign table in [templates.md](templates.md), so response-time compliance can be measured consistently

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Monthly CSAT/NPS survey dispatched to guard against silent churn
- [ ] Warning signs matched to the correct severity and owner
- [ ] Critical signals get a same-day founder response
- [ ] Every flag has a logged outcome

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Churn rate by tenure band | <20% (M1-3) / <15% (M4-6) / <10% (M7-12) / <5% (M12+) — verify current targets | Tenure-banded because early-relationship churn risk is structurally higher |
| Critical-signal response time | Same day, 100% compliance | Zero tolerance given save-a-client window is narrow |
| Save-a-client success rate | Track and trend | Primary effectiveness metric for this stage |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [49 Renewal Management](../49 Renewal Management/README.md)
- **Next stage:** [51 Customer Feedback and NPS](../51 Customer Feedback and NPS/README.md)
- **Depends on:** [45 Product and Service Adoption](../45 Product and Service Adoption/README.md), [49 Renewal Management](../49 Renewal Management/README.md) (at-risk flags)
- **Feeds:** [51 Customer Feedback and NPS](../51 Customer Feedback and NPS/README.md) (exit feedback), [49 Renewal Management](../49 Renewal Management/README.md) (saved clients rejoin the renewal pipeline)

> **Source note:** Built primarily from the internal "🌟 Customer Retention System" doc's Churn Warning Signs & Response section (severity grading, response ownership, save-a-client script), cross-referenced with the shorter "Customer Retention System" doc's churn-response sequence and Stage 9 Retention Engine's AI churn-risk predictor and churn-rate KPIs.

[⬅ Back to README](README.md)
