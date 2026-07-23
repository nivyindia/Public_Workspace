# Automation — 32 Demo and Presentation

[⬅ Back to README](README.md)

## Manual
Live delivery of the presentation and real-time handling of prospect questions — always human.

## Semi-Automated
AI drafts a deck outline from the approved solution map; rep reviews/adjusts before the session.

## Full-Automated
Not appropriate for this stage's core activity; only the outline-drafting step can run automatically.

## AI-Assisted Workflow
1. Solution map (Stage 31) is approved.
2. LLM drafts a short presentation outline (Problem → Solution → Process → Proof → Next Steps).
3. Rep reviews and finalizes the deck before the session (or the discovery call's closing minutes, if folded in).
4. Post-session, rep logs questions raised and any adjustments needed for the proposal.

## Suggested n8n / integration flow
`Stage 31 (solution map approved)` → `LLM API (draft presentation outline)` → `Deck tool (rep finalizes)` → `Session delivered` → `CRM (log questions/adjustments)` → `Stage 33 trigger`
