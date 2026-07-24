# Automation — 16 Email Outreach

[⬅ Back to README](README.md)

**n8n template(s):** [LeadPilot Lite – AI Cold Email Writer](https://github.com/enescingoz/awesome-n8n-templates/blob/main/Gmail_and_Email_Automation/LeadPilot%20Lite%20-%20AI%20Cold%20Email%20Writer.json) — reads a Google Sheets lead list and has OpenAI draft a personalized subject line + body per prospect; maps directly onto the AI-Assisted Workflow step below (drafting the first line/subject before human spot-check). Verified 23 Jul 2026.

## Manual
Hand-written, hand-sent emails for named strategic accounts only.

## Semi-Automated
VA loads verified contacts into the sequencer tool, selects the correct template, and reviews AI-drafted personalization fields before the sequence starts sending.

## Full-Automated
Sequencer tool executes the full multi-step sequence (send → wait → follow-up → wait → breakup) automatically, stopping on reply/bounce/unsubscribe, once a contact is loaded and approved.

## AI-Assisted Workflow
1. Pull newly Stage-10-verified contacts for a segment.
2. LLM drafts a personalized first line per contact using enrichment fields (company, industry, recent signal).
3. Human spot-checks a sample (10-20%) of AI-personalized lines before the batch is queued.
4. Sequencer sends on schedule; replies flow to Stage 25 triage (AI-assisted classification, human decision on ambiguous cases).
5. CRM auto-updates via native integration or n8n webhook on every open/reply/bounce event.

## Suggested n8n / integration flow
`CRM (new verified contact)` → `Sequencer API (add to sequence)` → `Sequencer webhook (status change)` → `CRM (update status field)` → `Slack/email alert on "Interested" status`
