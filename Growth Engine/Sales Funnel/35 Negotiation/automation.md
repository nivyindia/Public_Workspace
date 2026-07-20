# Automation — 35 Negotiation

[⬅ Back to README](README.md)

## Manual
Founder/named-approver sign-off on any discount beyond the standard threshold or any custom Enterprise-tier term — never automated.

## Semi-Automated
Rep pulls the standard scripted response for a recognized common ask, personalizes it to the prospect's wording, and sends — response content is templated, delivery timing and personalization stay manual.

## Full-Automated
Discount-request logging in the CRM the moment a rep applies any discount, so there's always a record even before founder sign-off is granted.

## AI-Assisted Workflow
1. Prospect raises a price/term objection during or after the proposal (Stage 33).
2. Rep matches it to one of the standard categories (price, scope, hesitation, competitor comparison — see [templates.md](templates.md)).
3. LLM personalizes the standard scripted response to the prospect's exact wording without changing the underlying policy.
4. If the ask requires a discount beyond threshold, rep requests approval before responding with a firm number.
5. Final negotiated terms are logged and flow into the contract (Stage 36).

## Suggested n8n / integration flow
`Objection logged in CRM → Match to standard category → Draft personalized response → If discount > threshold: approval request (Slack/WhatsApp) → Approved terms → Contract draft (Stage 36)`
