# 51 Customer Feedback and NPS

> **Stage 51 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7, Session 9).

---

## Navigation

- ⬅ Previous stage: [50 (see funnel home for full stage list)](../README.md)
- ➡ Next stage: [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Systematically collect client satisfaction data — via Net Promoter Score (NPS) surveys and open-ended feedback — on a regular cadence, so satisfaction is measured rather than assumed, and so the resulting data feeds churn prevention, case studies (Stage 52), and referral asks (Stage 53).

**Purpose:** A client who never says anything is not necessarily a happy client — they may simply not have raised a concern yet. Without a structured feedback loop, the first signal of dissatisfaction is often a churn notice, by which point it's too late to act. This stage exists to make satisfaction measurement a routine, low-friction part of the account relationship rather than something that only happens reactively when something goes wrong.

**Inputs:**
- Active client accounts and their onboarding/touchpoint history (from the retention system)
- A defined NPS/feedback survey cadence tied to existing monthly/quarterly touchpoints
- CRM account record to log responses against

**Outputs:**
- NPS scores and open-ended feedback logged per client, per survey cycle
- Detractor accounts flagged for proactive account-management follow-up
- Promoter accounts flagged as strong candidates for Stage 52 (case studies/testimonials) and Stage 53 (referral asks)

**Expected Result:** Client satisfaction is tracked as a trended number over time, not guessed at — detractors get intervention before they churn, and promoters get identified as advocacy opportunities before the relationship naturally fades.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **51A** Survey Cadence Design | Tying NPS/feedback collection to existing monthly/quarterly touchpoints, not a separate disruptive ask |
| **51B** NPS Survey Format | The standard 0-10 "how likely to recommend" question plus one open-ended follow-up |
| **51C** Score Classification | Promoter (9-10) / Passive (7-8) / Detractor (0-6) |
| **51D** Detractor Follow-Up Protocol | Proactive outreach when a client scores as a detractor |
| **51E** Promoter Flagging | Routing high scorers to Stage 52/53 as advocacy candidates |
| **51F** NPS Trend Tracking | Company-wide and per-account NPS trend over time |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for survey tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Summarizing open-ended feedback responses across many clients into themed patterns (e.g., "3 clients this quarter mentioned slow turnaround on X")
- Drafting a personalized detractor follow-up message from their specific feedback

**Prompt examples:**
```
"Here are this quarter's open-ended NPS feedback responses: [paste].
Group them into themes and flag any theme mentioned by 3+ clients."
```

**Agent workflows:** Survey sending and score logging can run fully automated off the existing touchpoint calendar, but detractor follow-up should always be a human outreach, even if AI-assisted drafting speeds up the message.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for thematic summarization.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### NPS response fields (mandatory)
`Account ID` · `Survey Date` · `NPS Score` (0-10) · `Classification` (Promoter/Passive/Detractor) · `Open-Ended Feedback` · `Follow-Up Status`

### JSON schema
```json
{
  "account_id": "string",
  "survey_date": "ISO 8601 date",
  "nps_score": 9,
  "classification": "promoter|passive|detractor",
  "open_ended_feedback": "string",
  "follow_up_status": "not_needed|pending|completed"
}
```

### Validation rules
- Every detractor score triggers a mandatory follow-up task, not left unaddressed
- Every promoter score (9-10) flags the account for Stage 52/53 consideration
- NPS is calculated as % Promoters − % Detractors, at both company-wide and per-account levels

### Naming conventions
- Classification thresholds (Promoter 9-10 / Passive 7-8 / Detractor 0-6) follow the standard, industry-wide NPS methodology

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Survey sent on the defined cadence for every active account
- [ ] Every detractor has a logged follow-up action
- [ ] Every promoter is flagged for Stage 52/53 consideration

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Company-wide NPS | 8+ (per internal retention system benchmark — verify current target) | Trended over time, not a one-off snapshot |
| Survey response rate | Track and trend | Low response rate may indicate survey fatigue or poor timing |
| Detractor follow-up completion rate | 100% | Hard QC gate |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Next stage:** [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md)
- **Also feeds:** [53 Referral Programs](../53 Referral Programs/README.md)
- **Related:** the Customer Retention System's monthly/quarterly touchpoint cadence (this stage's survey timing rides on that existing structure)

> **Source note:** Built from the internal "Customer Retention System" doc in this repo's Growth Engine folder, which references an NPS benchmark (8+) as part of its retention KPIs, combined with standard, industry-wide NPS survey methodology (0-10 recommend question, Promoter/Passive/Detractor classification) since no internal doc details a full NPS survey process end-to-end.

[⬅ Back to README](README.md)
