# Automation — 53 Referral Programs

[⬅ Back to README](README.md)

## Manual
Program structure design and payout approval decisions — human-owned given the financial commitment.

## Semi-Automated
AI drafts a personalized referral-ask message for a flagged promoter; a team member reviews before sending.

## Full-Automated
Tracking-link generation, referral status updates, and conversion reporting run automatically once the platform is set up.

## AI-Assisted Workflow
1. Stage 51 flags a promoter account.
2. Automated (or AI-assisted, human-reviewed) referral-ask message sends with the client's unique tracking link.
3. Referred contact enters the funnel tagged with the referrer's tracking code.
4. Referral status updates automatically as the referred lead progresses (Introduced → Contacted → Qualified → Closed Won/Lost).
5. On Closed Won, payout triggers per the documented commission structure.

## Suggested n8n / integration flow
`Stage 51 (promoter flagged)` → `n8n (send referral ask with tracking link)` → `Referral platform (link click → new contact)` → `CRM (tagged with referrer code)` → `Funnel progression (Stage 07-33)` → `Closed Won → n8n (trigger payout)`
