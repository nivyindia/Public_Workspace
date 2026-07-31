# Templates — 50 Churn Prevention

[⬅ Back to README](README.md)

## Retention Targets by Client Tenure
_Figures below are carried over from internal reference material — verify current targets before use._

| Month | Churn Rate Target |
|---|---|
| Month 1–3 | <20% |
| Month 4–6 | <15% |
| Month 7–12 | <10% |
| Month 12+ | <5% |

## Churn Warning Signs & Response

| Warning Sign | Severity | Response |
|---|---|---|
| Client hasn't replied in 7+ days | 🟡 Medium | VA checks in proactively |
| Client reduces task volume | 🟡 Medium | Founder checks on satisfaction |
| Negative feedback on report | 🔴 High | Founder calls within 24 hrs |
| Client disputes invoice | 🔴 High | Founder handles immediately |
| Client asks about cancellation process | 🔴 Critical | Founder calls same day |
| NPS score < 6 | 🔴 Critical | Founder personal email + call |

## Save-a-Client Script (when cancellation is raised)
```
"[Name], I really appreciate you telling me directly. Can I ask — is
this about the results, the process, or the budget? I want to
understand completely."

[Listen carefully]

"What would need to change for this to work for you?"

[Offer: reassign VA / adjust scope / pause instead of cancel / add
bonus hours]

"I don't want to lose you as a client. Here's what I can do: [specific
offer]. Would that work?"
```

## Early Warning Signs — Broader Reference
- Client response times getting longer
- Complaints about communication or quality
- Missed invoice payments
- Requests to pause or reduce scope
- Silence after a deliverable is sent

## Churn Prevention Response Sequence
1. Book a call immediately — don't wait
2. Acknowledge any issues proactively
3. Offer a concrete improvement plan
4. If genuine dissatisfaction: offer goodwill (e.g., 1 month free or partial refund) — verify current authorization policy before offering
5. If the client wants to leave anyway: exit gracefully, ask for honest feedback

## AI Churn-Risk Analysis Prompt (adapted)
```
You are a client success analyst for [Company], a service business.

Client: {{client_name}}
Tenure: {{months}} months
Current CSAT/NPS: {{score}}/10 (last 3 months trend: {{trend}})
Last response time: {{last_response}}
Delivery/KPI status: {{kpi_status}}
Last issue: {{last_issue}}

Return:
1. Churn Risk Level: LOW / MEDIUM / HIGH
2. Primary risk factor (1 sentence)
3. Recommended action for the Account Manager (2-3 sentences)
4. Suggested outreach message (warm, personal tone)
```
