# Automation — 49 Renewal Management

[⬅ Back to README](README.md)

## Manual
The 60-day retention call and the 14-day direct call if not yet renewed — both require a human reading the relationship, not a template.

## Semi-Automated
Automated ROI-summary email drafted by AI at day 45, personalized by the Account Manager before send.

## Full-Automated
Renewal radar flag at 60 days before contract end; automated renewal email with incentive offer at 30 days; automated WhatsApp renewal nudge at 30 days.

## AI-Assisted Workflow
1. Renewal radar flags a contract 60 days from expiry (automated, off contract-end-date field).
2. AM books a retention call, reviewing client LTV and delivered wins.
3. Day 45: AI drafts an ROI-summary email; AM personalizes and sends.
4. Day 30: Automated renewal email with incentive offer sent, plus a personal AM WhatsApp message.
5. Day 14: If not renewed, AM calls the client directly.
6. Day 7: Final retention offer, or escalation to founder for high-value accounts.
7. Renewal conversation coach (AI) provides tailored talking points based on the client's specific objection type, when one surfaces.

## Suggested n8n / integration flow
`Contract-end-date field → 60-day radar flag → AM books call → 45-day AI ROI summary → AM personalizes/sends → 30-day automated incentive email + WhatsApp → 14-day AM call if unrenewed → 7-day final offer/escalation`
