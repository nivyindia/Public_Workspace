# Automation — 43 Account Management

[⬅ Back to README](README.md)

## Manual
The monthly strategy call and any renewal negotiation conversation — these are the highest-relationship-value touchpoints and should never be delegated to automation.

## Semi-Automated
Weekly update and monthly report content are AI-drafted from performance data; the AM reviews and personalizes before sending.

## Full-Automated
Weekly metrics pulls, renewal-radar flags (60/45/30/14/7 days), and CSAT survey dispatch can run entirely without manual triggering.

## AI-Assisted Workflow
1. Weekly metrics pulled automatically from analytics/ad platform APIs for every active client.
2. LLM drafts the weekly personal update and flags any metric below threshold for AM review.
3. AM reviews, personalizes, and sends the update; any flagged metric issue is investigated same-day.
4. Bi-weekly/monthly: LLM drafts the formal performance report from the metrics data; AM reviews before send.
5. Renewal radar automatically flags accounts approaching the 60/45/30/14/7-day sequence, prompting the AM to act at each stage.
6. Portfolio dashboard tracks active-account count per AM and flags anyone approaching/exceeding capacity.

## Suggested n8n / integration flow
`Scheduled weekly trigger` → `Pull metrics (analytics/ad APIs)` → `LLM (draft update + flag anomalies)` → `AM review + send` → `Renewal-radar check (60/45/30/14/7 day flags)` → `Notify AM at each renewal-sequence milestone` → `Portfolio dashboard (AM capacity tracking)`
