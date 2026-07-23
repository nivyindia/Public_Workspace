# Automation — 16 Email Outreach

[⬅ Back to README](README.md)

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
