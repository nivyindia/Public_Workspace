# Automation — 27 Qualification BANT MEDDIC

[⬅ Back to README](README.md)

## Manual
The final Qualified/Not-Yet-Qualified/Disqualified decision — always a human sales judgment call.

## Semi-Automated
Rep fills in structured BANT/MEDDIC fields in the CRM during/immediately after the call, using an AI-drafted summary as a starting point.

## Full-Automated
Not applicable to the qualification decision itself; the transcript-to-draft-assessment step can run automatically as input to the manual decision.

## AI-Assisted Workflow
1. Discovery call (Stage 29) is recorded/transcribed (where legally permitted).
2. LLM summarizes the transcript into a first-pass BANT/MEDDIC draft, flagging any element not clearly addressed.
3. Rep reviews, corrects, and finalizes the assessment in the CRM opportunity record.
4. Qualified opportunities are automatically flagged for Stage 30 proposal follow-up; Not-Yet-Qualified ones are flagged for further nurture.

## Suggested n8n / integration flow
`Call transcription tool (transcript ready)` → `LLM API (draft BANT/MEDDIC summary)` → `CRM (populate draft fields)` → `Rep review + finalize` → `CRM (decision logged)` → `Qualified → Stage 30 trigger`
