# Automation — 38 Deal Desk and Approval Workflows

[⬅ Back to README](README.md)

## Manual
The approval decision itself is always a named human — never auto-approved, regardless of how confident a rule-based system is that the deviation is "safe."

## Semi-Automated
Request submission and routing are automated (CRM form or Slack workflow determines the correct approval tier); the approver still manually reviews and decides.

## Full-Automated
Notification delivery (Slack/Telegram/WhatsApp ping to the correct approver), decision logging back to the CRM deal record, and audit-trail record creation can all run without manual intervention once a decision is made.

## AI-Assisted Workflow
1. Rep submits a deal-desk request (form or CRM field) with deal value, requested deviation, and reason.
2. Rule engine (n8n or CRM workflow) classifies the request against the tier table in [templates.md](templates.md) and routes to the correct approver.
3. LLM can optionally pre-summarize the request and flag anything unusual (e.g., a discount request stacked with a payment-term deviation) so the approver sees the full picture at a glance, not just the headline ask.
4. Approver reviews and responds (approve/reject/modify) via the same channel.
5. Decision is logged back to the CRM deal record automatically, and the rep is notified.
6. If approved, the proposal (Stage 33) or contract (Stage 36) is updated to reflect the exact approved terms before it goes back to the prospect.

## Suggested n8n / integration flow
`Deal-desk request form/CRM field` → `n8n (classify against tier table)` → `Slack/Telegram (notify correct approver)` → `Approver decision (button/reply)` → `n8n (log decision to CRM deal record)` → `Notify rep` → `Update proposal/contract with approved terms`
