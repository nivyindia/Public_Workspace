# Automation — 25 Reply Handling and Triage

[⬅ Back to README](README.md)

**n8n template(s):** [Auto-label incoming Gmail messages with AI nodes](https://github.com/enescingoz/awesome-n8n-templates/blob/main/Gmail_and_Email_Automation/Auto-label%20incoming%20Gmail%20messages%20with%20AI%20nodes.json) — AI reads each incoming reply and applies a label (adapt the label set to Interested/Objection/Not Interested/Auto-reply for this stage's triage categories). [InboxZero Lite – AI Email Classifier](https://github.com/enescingoz/awesome-n8n-templates/blob/main/Gmail_and_Email_Automation/InboxZero%20Lite%20-%20AI%20Email%20Classifier.json) — lighter single-workflow classifier (urgent/important/info/spam) with Google Sheets logging, useful where a full label taxonomy is overkill. Verified 23 Jul 2026.

## Manual
Sending the final response to any Interested or Objection-classified reply — always human-sent, even if AI-drafted.

## Semi-Automated
LLM classifies and drafts a response; human reviews and sends within the SLA window.

## Full-Automated
Unsubscribe/DNC replies trigger automatic suppression across all channels with no human step required.

## AI-Assisted Workflow
1. Inbound reply arrives on any channel (Stage 16-20 webhook).
2. LLM classifies into one of the defined categories and drafts a first-pass response for Interested/Question categories.
3. Human reviews and sends (or edits) within the SLA window.
4. Objection-classified replies route to Stage 26's library before a final response is drafted.
5. Unsubscribe/DNC replies auto-suppress the contact; no draft/response needed.
6. Outcome logged in CRM; Interested replies handed to Stage 28 for booking.

## Suggested n8n / integration flow
`Channel tool webhooks (Stage 16-20)` → `n8n (route to centralized reply queue)` → `LLM API (classify + draft)` → `Slack alert (Interested/high-priority)` → `Human review + send` → `CRM (log outcome)` → `Booked → Stage 28`
