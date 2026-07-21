# Automation — 50 Churn Prevention

[⬅ Back to README](README.md)

## Manual
The founder-level save-a-client call for 🔴 Critical signals — always a real, live conversation, never a templated response.

## Semi-Automated
AI drafts a churn-risk analysis (risk level, primary factor, recommended action, suggested outreach message) from CRM/CSAT data; the Account Manager or founder reviews and personalizes before acting.

## Full-Automated
Monthly NPS/CSAT survey dispatch; automatic flagging when a score falls below the detractor threshold (0-6) or a warning-sign pattern (7+ days no reply, reduced task volume) is detected in CRM activity data.

## AI-Assisted Workflow
1. CSAT/NPS survey and engagement data feed the churn-risk predictor automatically each month.
2. AI returns a risk level (Low/Medium/High), primary risk factor, and recommended action.
3. 🟡 Medium-severity signals route to the VA/Account Manager for a proactive check-in.
4. 🔴 High/Critical signals route to the founder for a same-day or within-24-hours call, using the save-a-client script.
5. Outcome (retained/churned/pending) logged against the client record and feeds Stage 49's renewal pipeline if relevant.

## Suggested n8n / integration flow
`Monthly CSAT/NPS dispatch → Response data → Churn-risk predictor (LLM) → Risk level + recommended action → Route: Medium → VA check-in | High/Critical → Founder call (same day/24hrs) → Outcome logged`
