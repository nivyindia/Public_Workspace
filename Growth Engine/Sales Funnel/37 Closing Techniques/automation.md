# Automation — 37 Closing Techniques

[⬅ Back to README](README.md)

## Manual
Recognizing a genuine buying signal (re-opened proposal, direct question about start date, forwarding the proposal to a colleague) and deciding whether a live nudge is warranted.

## Semi-Automated
Standard follow-up cadence (Stage 24/33) continues automatically; a rep manually inserts a personalized nudge only when a buying signal is detected.

## Full-Automated
Proposal-tool view/open events logged automatically to the CRM, so buying signals are visible without a rep having to ask the client directly.

## AI-Assisted Workflow
1. Proposal sent (Stage 33), standard follow-up cadence active.
2. Proposal-tool tracking surfaces a view/open or reply event.
3. If the event suggests active consideration (re-opened after silence, forwarded internally), LLM drafts a short, low-pressure nudge referencing the specific signal.
4. Rep sends after review; if signed, contract (Stage 36) proceeds; if declined, deal routes to 90-day nurture (Stage 24).

## Suggested n8n / integration flow
`Proposal tracking event (Stage 33) → Signal classification → If genuine buying signal: draft nudge → Rep review + send → Signed → Contract (Stage 36) | No response → Standard cadence continues`
