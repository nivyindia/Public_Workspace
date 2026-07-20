# Automation — 34 Pricing and Packaging

[⬅ Back to README](README.md)

## Manual
Founder sign-off on any Enterprise-tier custom quote or any discount above the standard discretionary threshold.

## Semi-Automated
Rep selects a tier + market (India/International) from the catalog; add-ons are toggled from a fixed list; the tool computes the total rather than the rep doing manual math.

## Full-Automated
Once a tier + market + add-ons are selected, the pricing table auto-populates Section 3 of the proposal (Stage 33) from the single source-of-truth catalog.

## AI-Assisted Workflow
1. Solution map (Stage 31) identifies which tier fits the prospect's scope.
2. Pricing catalog (this stage) supplies the exact figure for that tier + market.
3. LLM drafts the ROI-anchoring paragraph using the prospect's own numbers (deal size, expected volume) against the tier price.
4. Rep reviews before the figure goes into the proposal — pricing errors here are commercially costly, never send unreviewed.

## Suggested n8n / integration flow
`Solution map (Stage 31) → Pricing catalog lookup (tier + market) → Add-on selection → Auto-populate proposal Section 3 (Stage 33) → Rep review → Send`
