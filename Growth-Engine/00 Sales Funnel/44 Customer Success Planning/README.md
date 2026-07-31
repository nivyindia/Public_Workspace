# 44 Customer Success Planning

> **Stage 44 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7).

---

## Navigation

- ⬅ Previous stage: [43 Account Management](../43 Account Management/README.md)
- ➡ Next stage: [45 Product and Service Adoption](../45 Product and Service Adoption/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Run a structured, proactive success framework for every client — a defined lifecycle touchpoint map, monthly NPS measurement, and a severity-tiered churn-warning-sign response system — so client success is actively engineered and monitored, not assumed until a complaint or cancellation request proves otherwise.

**Purpose:** The account-management rhythm in Stage 43 keeps clients communicated with; this stage adds the structured measurement and intervention layer on top — knowing quantitatively how satisfied a client actually is (via NPS), watching for the specific behavioral signals that precede churn, and having a rehearsed, human-led process for saving a relationship when it's genuinely at risk. Results delivery, proactive relationship management, and always showing what else is possible together form the retention philosophy this stage operationalizes.

**Inputs:**
- Ongoing account-management activity (Stage 43) and delivery performance data
- Monthly NPS survey responses
- Behavioral signals (response latency, task/scope volume changes, report feedback)

**Outputs:**
- A tracked NPS score history and churn-risk classification per client
- Documented, on-time responses to every detected warning sign, tiered by severity
- A logged save-a-client outcome for any at-risk account, and a review/referral ask for every promoter

**Expected Result:** Churn is caught and addressed while it's still preventable, satisfied clients are systematically converted into reviews and referrals, and retention rate improves measurably as tenure increases, per the tenure-based targets in [templates.md](templates.md).

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **44A** Lifecycle Touchpoint Mapping | Day 1, Day 7, Day 30, monthly, quarterly, and annual touchpoints scheduled and tracked |
| **44B** Monthly NPS Measurement | Standardized 3-question survey sent to every active client monthly |
| **44C** Churn-Risk Scoring | Combined CSAT/NPS/engagement/delivery signal analysis producing a Low/Medium/High risk classification |
| **44D** Warning-Sign Detection | Behavioral and feedback signals monitored continuously, not just at scheduled reviews |
| **44E** Severity-Tiered Response | Medium signals get a proactive check-in; critical signals get a same-day founder call |
| **44F** Save-a-Client Process | Structured conversation script for any client raising cancellation |
| **44G** NPS-Driven Action | Promoters asked for reviews/referrals, passives asked what would improve their score, detractors escalated immediately |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — public review destinations are listed in [templates.md](templates.md). See [tools.md](tools.md) for survey/CRM tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Combining CSAT trend, NPS score, response-time data, and delivery performance into a single churn-risk score with a recommended action
- Drafting the specific outreach message for a detected warning sign, calibrated to its severity tier
- Analyzing open-text NPS responses across the client base to surface recurring themes in what clients say would improve their experience

**Prompt examples:**
```
"Client: [name]. Tenure: [months]. Current NPS: [score] (trend: [last 3
scores]). Last response time: [time]. Task/scope volume change: [detail].
Last delivery issue: [detail, if any]. Return: (1) churn risk level
LOW/MEDIUM/HIGH, (2) primary risk factor in one sentence, (3) recommended
account-manager action, (4) a suggested WhatsApp message to send within
48 hours."
```

**Agent workflows:** An agent can own lifecycle-touchpoint scheduling, NPS dispatch, and warning-sign detection end to end. Churn-risk scoring output should always route to a human decision — the recommended action is a starting point for the account manager or founder, not an autonomous response. The save-a-client conversation itself must always be human-led.

**RAG / vector database considerations:** Not required at typical portfolio sizes; NPS history and delivery data are structured inputs sufficient for scoring and drafting.

**LLM recommendations:** Any current-generation model is sufficient for risk scoring and message drafting; the value here comes from consistently combining the right signals, not from model sophistication.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Customer success record fields (mandatory)
`Client ID` · `Tenure (months)` · `NPS Score History` · `NPS Label` (Promoter/Passive/Detractor) · `Churn Risk Level` (Low/Medium/High) · `Warning Signs Detected` · `Response Logged` (boolean, per warning sign) · `Save-a-Client Outcome` (if applicable) · `Review/Referral Requested` (boolean)

### JSON schema
```json
{
  "client_id": "string",
  "tenure_months": 0,
  "nps_history": [{"date": "ISO 8601 date", "score": 0}],
  "nps_label": "promoter|passive|detractor",
  "churn_risk_level": "low|medium|high",
  "warning_signs": [{"signal": "string", "severity": "medium|high|critical", "detected_date": "ISO 8601 date", "response_logged": false}],
  "save_a_client_outcome": "string|null",
  "review_referral_requested": false
}
```

### Validation rules
- Every detected warning sign must have a logged response — an unaddressed critical signal for more than 24 hours is a process failure
- NPS label (Promoter/Passive/Detractor) determines the mandatory next action per [templates.md](templates.md) — never left unactioned
- Churn-risk level should be recalculated whenever a new NPS score or warning sign is logged, not only on a fixed schedule

### Naming conventions
- `nps_label` and `churn_risk_level` use fixed enums so retention reporting stays consistent across the client base

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] All lifecycle touchpoints happen on schedule for every client
- [ ] Monthly NPS survey sent and results actioned per the score-based rules
- [ ] Every warning sign gets a response matched to its severity tier, with no critical sign unaddressed past 24 hours
- [ ] Save-a-client conversations follow the structured script and outcomes are logged

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Churn rate by tenure band | <20% (M1-3), <15% (M4-6), <10% (M7-12), <5% (M12+) | Reflects that early tenure is highest-risk |
| NPS score (company-wide average) | Track and trend, target promoter-majority | Primary satisfaction metric |
| Critical warning-sign response time | < 24 hours, 100% of the time | Non-negotiable given churn stakes |
| Promoter-to-review conversion rate | Track and trend | Feeds Stage 01/04 social proof upstream |
| Save-a-client success rate | Track and trend | Measures how often a raised cancellation is actually retained |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [43 Account Management](../43 Account Management/README.md)
- **Next stage:** [45 Product and Service Adoption](../45 Product and Service Adoption/README.md)
- **Depends on:** [43 Account Management](../43 Account Management/README.md) — the ongoing communication rhythm this stage's measurement layer is built on top of
- **Feeds:** [45 Product and Service Adoption](../45 Product and Service Adoption/README.md), [46 Support and Issue Resolution](../46 Support and Issue Resolution/README.md), and upstream to Stage 01/04 (referrals and social proof)

> **Source note:** Built directly from the internal Customer Retention System doc — a complete, ready-to-use success-planning framework covering the client lifecycle, monthly success SOP, churn warning-sign matrix, save-a-client script, and NPS system — cross-referenced against Stage 9 — Retention Engine's churn-risk AI prompt pattern. Churn-rate targets and NPS thresholds should be verified against current company policy before operational use.

[⬅ Back to README](README.md)
