# Automation — 33 Proposal Creation

[⬅ Back to README](README.md)

## Manual
Final review of pricing, terms, and tone before sending — always human, given the commercial/legal weight of this document.

## Semi-Automated
AI drafts the narrative sections from the approved solution map; rep finalizes pricing and terms before send.

## Full-Automated
Follow-up sends (Day 3/7/12) trigger automatically off the "no response" status once the initial proposal is confirmed sent.

## AI-Assisted Workflow
1. Solution map (Stage 31) approved, presentation (Stage 32) complete.
2. LLM drafts the proposal document from the standard structure, populated with solution-map content and current pricing (Stage 34).
3. Rep reviews pricing/terms/tone and finalizes.
4. Proposal sent within 24 hours via email with a personal note.
5. Automated follow-up cadence (Day 3/7/12) fires if no response, using the tool's tracked-view status to skip unnecessary follow-ups if the prospect hasn't opened it yet.
6. On agreement, contract sent for e-signature (feeds Stage 36); on signature, CRM deal stage auto-updates to Closed Won and triggers onboarding.

## Suggested n8n / integration flow
`Stage 31/32 (solution approved, presentation complete)` → `LLM API (draft proposal)` → `Rep review + finalize` → `Proposal tool (send + track)` → `n8n (Day 3/7/12 follow-up if no response)` → `Signed → CRM (Closed Won) → Onboarding trigger`
