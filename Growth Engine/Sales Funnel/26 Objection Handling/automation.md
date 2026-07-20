# Automation — 26 Objection Handling

[⬅ Back to README](README.md)

## Manual
Live-call objection handling (Stage 18/29) — always a human skill exercised in real time.

## Semi-Automated
A rep logs a newly encountered objection; AI drafts a proposed ARP-framework response; a supervisor reviews before it's added to the library.

## Full-Automated
Written objection-carrying replies (Stage 25) are automatically matched to the closest library entry, surfacing the proven response for the rep to review and send.

## AI-Assisted Workflow
1. Objection-classified reply arrives from Stage 25, or a rep logs a new objection heard on a call.
2. LLM matches it to an existing library entry, or drafts a new ARP-framework response if none fits.
3. Supervisor reviews new entries before they're added to the canonical library.
4. Library stays current; reps periodically re-study updated sections.

## Suggested n8n / integration flow
`Stage 25 (objection-classified reply)` → `LLM API (match to library)` → `Notion/CRM (surface matched response)` → `Human (review + send)` → `New objections logged` → `Supervisor review` → `Library updated`
