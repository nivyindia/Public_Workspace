# Automation — 18 Cold Calling

[⬅ Back to README](README.md)

## Manual
The call itself — opening, discovery questions, objection handling — is always manual.

## Semi-Automated
Softphone/dialer auto-dials the next number and logs connect/no-answer automatically; rep manually selects the detailed outcome code and adds notes.

## Full-Automated
Call-list preparation (pulling today's contacts, filtering against DNC status and calling-hours window) runs automatically each morning, requiring no manual list-building before the calling block starts.

## AI-Assisted Workflow
1. Automation pulls the day's eligible contacts (verified, DNC-clear, within calling-hours window for their timezone).
2. LLM drafts a 2-3 line pre-call brief per contact from available enrichment data.
3. Rep calls manually using the script and brief.
4. Post-call, rep dictates or types a short note; LLM summarizes into the CRM outcome/notes fields (transcription only where legally permitted).
5. Booked outcomes trigger a Stage 28 handoff automatically.

## Suggested n8n / integration flow
`CRM (daily eligible-contact pull)` → `n8n (DNC + calling-hours filter)` → `Dialer/softphone (manual calling)` → `Dialer webhook (outcome)` → `CRM (log outcome)` → `Booked → Stage 28 calendar handoff`
