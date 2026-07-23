# 43 Account Management

> **Stage 43 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7).

---

## Navigation

- ⬅ Previous stage: [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)
- ➡ Next stage: [44 Customer Success Planning](../44 Customer Success Planning/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Run a consistent, defined communication and reporting rhythm for every active client — weekly personal updates, bi-weekly/monthly performance reports, and monthly strategy calls — so no account silently goes unmanaged, satisfaction is monitored continuously, and renewal conversations start early enough to actually influence the outcome.

**Purpose:** Delivery quality alone doesn't retain clients — a client can be getting genuinely good results and still churn because they feel forgotten or under-communicated-with. This stage exists to make relationship management systematic rather than dependent on any one account manager's personal discipline, and to catch relationship or performance problems early through a defined monitoring rhythm rather than discovering them at renewal time.

**Inputs:**
- An active, delivering client (post Stage 42 implementation)
- Ongoing performance/delivery data from the execution team
- Client CSAT and engagement signals

**Outputs:**
- A consistent weekly/bi-weekly/monthly touchpoint history per client
- A monitored client-health record (CSAT, response times, KPI status)
- An early-started, well-managed renewal process for every account approaching contract expiry

**Expected Result:** Clients feel actively managed, not just delivered to — satisfaction is caught and addressed before it becomes churn risk, and renewals are a natural continuation of an ongoing relationship rather than a cold, last-minute conversation.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **43A** Account Manager Assignment | Named AM assigned per client, tracked against the portfolio-capacity threshold |
| **43B** Weekly Client Touchpoint | Personal WhatsApp/message update with a specific win, not a generic check-in |
| **43C** Internal Weekly KPI Check | Metrics reviewed before the client would ever notice an issue |
| **43D** Bi-Weekly/Monthly Reporting | Formal, data-driven performance report delivered on schedule |
| **43E** Monthly Strategy Review Call | Deep KPI review, optimization discussion, next-month priorities agreed |
| **43F** Relationship Health Monitoring | CSAT tracking, response-time SLA adherence, engagement signals |
| **43G** Renewal Pipeline Management | 60/45/30/14/7-day renewal sequence run proactively for every expiring contract |
| **43H** Portfolio Capacity Management | Active-account count per AM tracked against the quality-threshold cap |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for CRM and communication tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting the weekly personal update and the formal bi-weekly/monthly report from performance data, so the AM's time goes into relationship judgment rather than data compilation
- Flagging metrics trending in the wrong direction before the AM manually reviews the full dashboard
- Drafting renewal-sequence messages calibrated to how close the contract is to expiry (see [templates.md](templates.md))

**Prompt examples:**
```
"Here is this week's performance data for [client]: [paste metrics].
Compare to last week. Draft a short, warm client update highlighting one
specific win, and flag anything trending down that I should investigate
before sending."
```

**Agent workflows:** An agent can own weekly metrics pulls, report drafting, and renewal-sequence trigger notifications end to end. The monthly strategy call and any renewal negotiation must remain fully human — these are the highest-relationship-value moments in the account lifecycle and are where genuine trust is built or lost.

**RAG / vector database considerations:** Not required at this stage's scale; performance data and CSAT history are structured inputs sufficient for drafting and flagging tasks.

**LLM recommendations:** Any current-generation model is sufficient for report drafting and anomaly flagging; this task does not require frontier reasoning capability.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Account management record fields (mandatory)
`Client ID` · `Account Manager` · `Weekly Update Sent` (per-week boolean) · `Report Delivery Status` · `Monthly Call Completed` (boolean) · `CSAT Score History` · `Response Time SLA Adherence` · `Contract End Date` · `Renewal Sequence Stage` (60/45/30/14/7-day / Renewed / Churned)

### JSON schema
```json
{
  "client_id": "string",
  "account_manager": "string",
  "weekly_update_log": [{"week": "ISO 8601 date", "sent": true}],
  "report_delivery_status": "on_time|late|missed",
  "monthly_call_completed": false,
  "csat_history": [{"date": "ISO 8601 date", "score": 0}],
  "response_time_sla_pct": 0.0,
  "contract_end_date": "ISO 8601 date",
  "renewal_sequence_stage": "not_started|60_day|45_day|30_day|14_day|7_day|renewed|churned"
}
```

### Validation rules
- Any CSAT score below the defined threshold must trigger an immediate AM follow-up entry, not just a logged number
- Renewal sequence stages must be triggered on schedule — a contract should never reach its end date without the full 60/45/30/14/7-day sequence having run
- No AM's active-account count should exceed the defined portfolio-capacity threshold without a leadership-reviewed exception

### Naming conventions
- `renewal_sequence_stage` uses a fixed enum so renewal-pipeline reporting stays consistent across all account managers

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every active client receives its weekly update and any due report on schedule
- [ ] Monthly strategy call held and logged for every client
- [ ] Any CSAT score below threshold triggers immediate, documented follow-up
- [ ] Renewal sequence started at 60 days for every contract approaching expiry

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Client retention rate (month-on-month) | > 85% | Primary health metric for this stage |
| Client CSAT score | > 8.5/10 | Tracked monthly per client |
| Report delivery on-time rate | 100% | Late reports erode client confidence disproportionately |
| Contract renewal rate | > 75% | Tracked against the full renewal sequence |
| Active clients per account manager | < 8 | Quality threshold — exceeding this should trigger a hiring/reallocation review |
| Time to detect underperformance | < 48 hours from metric drop | Internal weekly KPI check should catch this before the client does |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)
- **Next stage:** [44 Customer Success Planning](../44 Customer Success Planning/README.md)
- **Depends on:** [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md) — delivery must be live before an ongoing management rhythm has anything to report on
- **Feeds:** [44 Customer Success Planning](../44 Customer Success Planning/README.md), [46 Support and Issue Resolution](../46 Support and Issue Resolution/README.md) — escalations beyond AM authority route here

> **Source note:** Built from Stage 8 — Delivery Engine (Growth Engine) for the AM's role within the delivery operating rhythm and the <8-clients-per-AM capacity benchmark, and Stage 9 — Retention Engine (Growth Engine) for the renewal-radar sequence and AM weekly/monthly task structure. Retention-specific loyalty programs (VIP community, appreciation touchpoints, structured renewal incentives) are covered more fully in Stage 44 (Customer Success Planning) to avoid duplicating content across the two stages.

[⬅ Back to README](README.md)
