# Automation — 30 Needs Analysis

[⬅ Back to README](README.md)

## Manual
Final review and sign-off on the needs-analysis document before Stage 31 begins.

## Semi-Automated
AI drafts the structured document from the call transcript; rep reviews, corrects, and finalizes.

## Full-Automated
Not appropriate for the finalization step, given how directly this document shapes the proposal; the drafting step can run automatically.

## AI-Assisted Workflow
1. Discovery call transcript/notes (Stage 29) become available.
2. LLM extracts and ranks problems, implications, and desired outcomes into the template structure.
3. LLM flags any problem missing a clear desired-outcome statement (a gap).
4. Rep reviews, resolves gaps (via quick clarification if needed), and finalizes.
5. Finalized document attached to the CRM opportunity record, unlocking Stage 31.

## Suggested n8n / integration flow
`Stage 29 (call notes/transcript ready)` → `LLM API (structure into needs analysis)` → `CRM (draft attached)` → `Rep review + finalize` → `CRM (status = finalized)` → `Stage 31 trigger`
