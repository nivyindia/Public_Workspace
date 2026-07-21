# Automation — 48 Cross Sell Strategy

[⬅ Back to README](README.md)

## Manual
The cross-sell conversation itself, and any Level 3 system-upgrade recommendation — requires reading the client's budget and relationship readiness, not automated.

## Semi-Automated
CRM flags when a client's current service matches a row in the golden combination table; a human decides timing and delivers the conversation.

## Full-Automated
Standing monitoring for a client crossing into 2+ Level 2 services simultaneously, auto-flagging for a Level 3 system-upgrade review.

## AI-Assisted Workflow
1. Client's current service holdings tracked in CRM (fed by delivery/onboarding records).
2. System matches current holdings against the golden cross-sell combination table.
3. If a client conversation contains a recognized "quick trigger" phrase, AI suggests the matching cross-sell recommendation.
4. Account Manager delivers the cross-sell script during a natural touchpoint (quarterly review, delivery check-in).
5. Outcome logged in the same tracker used for Stage 47 upsell attempts.

## Suggested n8n / integration flow
`CRM service-holding data → Match against golden combination table → Flag + script surfaced → AM delivers conversation → Log outcome → 2+ Level 2 services held → Flag for Level 3 review`
