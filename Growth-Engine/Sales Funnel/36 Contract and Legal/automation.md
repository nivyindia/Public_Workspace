# Automation — 36 Contract and Legal

[⬅ Back to README](README.md)

## Manual
Legal review of any non-standard clause, custom Enterprise-tier term, or client-requested redline — never auto-approved.

## Semi-Automated
Contract generated from the standard template, populated with the negotiated price/terms (Stage 35), and routed for e-signature by a rep.

## Full-Automated
Signed-contract status change automatically updates the CRM deal stage to Closed Won and triggers the onboarding workflow (Stage 40) and invoice send (Stage 39).

## AI-Assisted Workflow
1. Negotiation (Stage 35) concludes with agreed price and terms.
2. LLM drafts the SOW-specific deliverables/timeline section from the approved solution map (Stage 31) and agreed scope.
3. Standard contract template (scope, pricing, payment terms, notice period, confidentiality) is populated and reviewed before send.
4. Contract sent for e-signature.
5. On signature: CRM auto-updates to Closed Won, invoice/payment link sent (Stage 39), onboarding triggered (Stage 40).

## Suggested n8n / integration flow
`Negotiation agreed (Stage 35) → Contract template populated → Human review → E-signature tool (send) → Signed webhook → CRM (Closed Won) → Invoice send (Stage 39) → Onboarding trigger (Stage 40)`
