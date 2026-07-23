# Automation — 44 Customer Success Planning

[⬅ Back to README](README.md)

## Manual
The save-a-client conversation and any founder-level detractor call — these require relationship authority and judgment automation cannot replicate.

## Semi-Automated
Churn-risk scoring is AI-generated from combined signals (CSAT/NPS trend, engagement, delivery data), but the account manager decides the actual response.

## Full-Automated
NPS survey dispatch, lifecycle touchpoint reminders (Day 1/7/30, quarterly, annual), warning-sign detection (silence, reduced volume), and review-request dispatch to promoters.

## AI-Assisted Workflow
1. Scheduled triggers fire lifecycle touchpoints automatically (welcome, Day 7 check-in reminder, Day 30 review reminder, quarterly review scheduling, annual review reminder).
2. Monthly NPS survey dispatched to all active clients.
3. LLM combines NPS score, CSAT trend, response-time data, and delivery performance into a churn-risk score (Low/Medium/High) with a recommended action.
4. Warning signs (7+ day silence, reduced task volume, negative feedback) are detected automatically and routed to the account manager or founder based on severity.
5. NPS score determines the automatic next action: promoters get a review/referral request, passives get a "what would make this a 10" follow-up, detractors trigger an immediate founder alert.
6. Save-a-client conversations, once triggered, are run entirely by a human using the structured script.

## Suggested n8n / integration flow
`Scheduled lifecycle triggers` → `Touchpoint reminders (Day 1/7/30, quarterly, annual)` → `NPS survey dispatch (monthly)` → `LLM (churn-risk scoring from combined signals)` → `n8n (route by severity: AM check-in / founder alert)` → `NPS-based action (review request / gap follow-up / founder call)`
