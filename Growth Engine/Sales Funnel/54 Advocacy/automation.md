# Automation — 54 Advocacy

[⬅ Back to README](README.md)

## Manual
Relationship cultivation and any specific ask (reference call, content participation) — always human-led.

## Semi-Automated
AI drafts an advocate-specific outreach message; a team member personalizes and sends it given the relationship's importance.

## Full-Automated
Advocate-candidate identification (a scheduled report of accounts with sustained high NPS, repeat referrals, or testimonial activity) runs automatically.

## AI-Assisted Workflow
1. Scheduled report aggregates Stage 51-53 data to surface advocate candidates (sustained satisfaction, not a single instance).
2. Team reviews and curates the candidate list — this stays a small, deliberately chosen group.
3. For a specific need (reference call, content interview), AI drafts a personalized ask; a team member sends it.
4. Advocate feedback and market insight gathered over time is periodically synthesized by AI into structured input for Stage 01-03 refinement.

## Suggested n8n / integration flow
`Stage 51-53 data (scheduled aggregation)` → `n8n (surface sustained-satisfaction candidates)` → `Team review (curate advocate list)` → `Specific need arises` → `LLM (draft personalized ask)` → `Human send` → `Periodic feedback synthesis → Stage 01-03`
