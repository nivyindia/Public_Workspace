# Automation — 29 Discovery Call Execution

[⬅ Back to README](README.md)

## Manual
The live call itself — always human-run, following the SPIN script.

## Semi-Automated
Post-call, the rep reviews an AI-generated transcript summary and finalizes CRM notes rather than writing them from scratch.

## Full-Automated
Deal-stage update and a 48-hour follow-up task can be created automatically based on the logged call outcome.

## AI-Assisted Workflow
1. Call is recorded/transcribed (where legally permitted).
2. LLM extracts pain points, budget signals, timeline, and key quotes into structured notes.
3. Rep reviews and finalizes the notes and outcome classification in CRM within 1 hour.
4. If outcome is `proposal_committed`, an automated reminder ensures the proposal (Stage 33) is sent within 24 hours.

## Suggested n8n / integration flow
`Call recording tool (transcript ready)` → `LLM API (extract structured notes)` → `CRM (populate draft notes)` → `Rep review + finalize` → `CRM (deal stage update)` → `n8n (24hr proposal reminder if committed)`
