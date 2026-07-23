# Automation — 40 Client Onboarding

[⬅ Back to README](README.md)

## Manual
The kickoff call (handed off to Stage 41) and any personal follow-up when a client seems confused or unresponsive during onboarding — relationship judgment stays human.

## Semi-Automated
Welcome sequence content is templated and can be AI-personalized, but the account manager's personal WhatsApp message should read as genuinely personal, not obviously templated.

## Full-Automated
Client portal creation, Google Drive folder creation, questionnaire dispatch and reminder, internal team notification, and Day 7 CSAT survey dispatch can all run without manual triggering.

## AI-Assisted Workflow
1. Contract signed + payment confirmed (Stage 36/39) fires the onboarding trigger.
2. CRM lifecycle stage updates to Customer; welcome email and WhatsApp message send automatically.
3. Client portal (Notion) and asset folder (Google Drive) are created from template.
4. Internal ops channel is notified with a checklist so the team is briefed before the client's first question arrives.
5. Onboarding questionnaire is sent; a Day 2 reminder fires automatically if not completed.
6. Once submitted, an LLM drafts a 1-page internal team brief from the questionnaire answers for the account manager to review and share with the delivery team.
7. Kickoff call is scheduled (hands off to Stage 41); Day 7 CSAT survey fires automatically and low scores trigger an immediate account-manager alert.

## Suggested n8n / integration flow
`Contract signed + payment webhook` → `CRM lifecycle update` → `n8n (fan-out: welcome email, WhatsApp, portal creation, Drive folder creation, ops notification)` → `Questionnaire sent` → `n8n (Day 2 reminder if incomplete)` → `LLM (draft internal team brief)` → `Kickoff call scheduled (Stage 41)` → `n8n (Day 7 CSAT trigger)` → `Alert AM if CSAT below threshold`
