# Automation — 51 Customer Feedback and NPS

[⬅ Back to README](README.md)

## Manual
Detractor follow-up outreach — always human, regardless of how the message was drafted.

## Semi-Automated
AI summarizes open-ended feedback into themes for a quarterly review; a human decides what action to take on the patterns identified.

## Full-Automated
Survey sending on the defined cadence, tied to the existing touchpoint calendar, with no manual trigger needed.

## AI-Assisted Workflow
1. Survey tool sends the NPS survey automatically per the defined cadence (tied to monthly report or quarterly review).
2. Score and open-ended feedback log to the CRM account record automatically.
3. A detractor score (0-6) triggers an automatic task assignment for human follow-up.
4. A promoter score (9-10) triggers an automatic flag for Stage 52/53 consideration.
5. Quarterly, AI summarizes open-ended feedback across all accounts into themed patterns for a team review.

## Suggested n8n / integration flow
`Touchpoint calendar (survey due)` → `Survey tool API (send)` → `Survey tool webhook (response)` → `CRM (log score + feedback)` → `n8n (detractor → task; promoter → Stage 52/53 flag)`
