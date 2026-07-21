# 49 Renewal Management

> **Stage 49 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 8, Session 11).

---

## Navigation

- ⬅ Previous stage: [48 Cross Sell Strategy](../48 Cross Sell Strategy/README.md)
- ➡ Next stage: [50 Churn Prevention](../50 Churn Prevention/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Run a structured, multi-touch renewal sequence starting 60 days before a contract's expiry — combining an ROI-led retention call, automated reminder/incentive sends, and escalating personal outreach — so renewals are proactively managed rather than discovered as an urgent, reactive scramble.

**Purpose:** A renewal handled only when a contract is about to lapse gives no room to address price resistance or re-establish value before the client has already mentally moved on. This stage exists to front-load ROI proof and relationship touchpoints well ahead of the decision point, converting renewal into a natural continuation rather than a re-sell under pressure.

**Inputs:**
- Contract end date (from CRM)
- Client LTV, CSAT history, and delivered results/wins (from Stage 44/45)

**Outputs:**
- A completed 60/45/30/14/7-day renewal sequence
- A renewal outcome (renewed, churned, or pending) logged against the client record
- For at-risk accounts surfaced during the sequence: a handoff to Stage 50 (Churn Prevention)

**Expected Result:** Renewal conversations lead with demonstrated ROI before any price discussion, incentive offers are tailored to the client's actual LTV and history rather than a flat default, and no renewal is ever discovered for the first time inside a two-week window.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **49A** 90-Day Renewal Pipeline | Rolling CRM view of all upcoming contract renewals |
| **49B** 60-Day Retention Call | AM-booked call reviewing client LTV and delivered wins |
| **49C** 45-Day ROI Summary | AI-drafted, AM-personalized email proving value before price discussion |
| **49D** 30-Day Incentive Sequence | Automated email + personal WhatsApp with renewal incentive offer |
| **49E** 14/7-Day Escalation | Direct AM call, then final offer/founder escalation for high-value accounts |

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
- Drafting the 45-day ROI-summary email from the client's actual delivered results data
- Generating tailored renewal talking points based on the client's profile and the specific objection type raised, for the AM to use on the 14-day call
- Recommending the best renewal incentive (discount vs. bonus service vs. upgrade) based on client LTV, package, and history

**Prompt examples:**
```
"Here is this client's delivery data over the contract period: [paste].
Draft a 45-day ROI-summary renewal email in the standard tone,
highlighting the 2-3 strongest results."
```

**Agent workflows:** An agent can draft ROI summaries and recommend incentive types, and fully automate the scheduled radar-flag/email/WhatsApp sends, but the actual retention calls (60-day and 14-day) and any incentive beyond standard offers require human judgment and, for high-value accounts, founder involvement.

**RAG / vector database considerations:** Not required at this stage's scale — client delivery/CRM data is sufficient structured input.

**LLM recommendations:** Standard current-generation models are sufficient for drafting and incentive recommendation.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Renewal record fields (mandatory)
`Client ID` · `Contract End Date` · `Renewal Stage` (60d/45d/30d/14d/7d) · `Incentive Offered` · `Outcome` (Renewed/Churned/Pending) · `Renewed Date` · `Escalated to Founder` (Y/N)

### JSON schema
```json
{
  "client_id": "string",
  "contract_end_date": "ISO 8601 date",
  "renewal_stage": "60d|45d|30d|14d|7d",
  "incentive_offered": "string|null",
  "outcome": "renewed|churned|pending",
  "renewed_date": "ISO 8601 date|null",
  "escalated_to_founder": false
}
```

### Validation rules
- Every active client contract must have a non-null `contract_end_date` feeding the 90-day rolling pipeline
- `renewal_stage` progression follows the fixed 60/45/30/14/7-day sequence; stages are not skipped
- `outcome: churned` at any renewal stage routes the client record's churn detail to Stage 50 for pattern analysis

### Naming conventions
- `renewal_stage` is a fixed enum matching the standard cadence in [templates.md](templates.md)

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every renewal caught by the 60-day radar flag, never discovered late
- [ ] ROI shown before price discussion at every renewal
- [ ] Incentive tailored to LTV/history, not a flat default
- [ ] High-value at-risk accounts escalated to founder by day 7

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Renewal rate | >75% (verify current target) | Primary success metric for this stage |
| Monthly churn rate | <5% (verify current target, cross-check Stage 50) | Shared metric with churn prevention |
| Renewal-sequence on-time compliance | 100% | Late-starting sequences lose the "ROI before price" advantage |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [48 Cross Sell Strategy](../48 Cross Sell Strategy/README.md)
- **Next stage:** [50 Churn Prevention](../50 Churn Prevention/README.md)
- **Depends on:** [44 Customer Success Planning](../44 Customer Success Planning/README.md), [45 Product and Service Adoption](../45 Product and Service Adoption/README.md)
- **Feeds:** [50 Churn Prevention](../50 Churn Prevention/README.md) (on churn outcome), [53 Referral Programs](../53 Referral Programs/README.md) (on successful renewal)

> **Source note:** Built directly from the internal "Stage 9 — Retention Engine" doc's renewal-specific systems (renewal radar automation, the 60/45/30/14/7-day sequence, renewal KPIs, and AI-assisted ROI/incentive tooling), which is already a complete, comprehensive renewal playbook.

[⬅ Back to README](README.md)
