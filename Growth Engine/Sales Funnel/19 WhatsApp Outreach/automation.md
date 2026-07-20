# Automation — 19 WhatsApp Outreach

[⬅ Back to README](README.md)

## Manual
Sending from the standard WhatsApp Business app for low-volume/high-touch contacts.

## Semi-Automated
VA loads an approved contact batch into the BSP tool and triggers the first-contact template send within the daily limit; follow-ups reviewed before sending.

## Full-Automated
BSP-scheduled sequence sends first-contact and Day 3/Day 7 follow-ups automatically, stopping on any reply, once a batch is approved.

## AI-Assisted Workflow
1. Pull newly Stage-10-verified contacts for a market confirmed WhatsApp-appropriate (Stage 15).
2. LLM drafts the personalization line per contact.
3. Human spot-checks a sample before the batch is queued.
4. BSP sends on schedule; replies routed to Stage 25 triage (AI-assisted classification, human decision on ambiguous/complaint-style replies).
5. CRM auto-updates via BSP webhook.

## Suggested n8n / integration flow
`CRM (new verified, market-approved contact)` → `BSP API (queue template send)` → `BSP webhook (delivery/read/reply status)` → `CRM (update status)` → `Positive reply → Slack alert + Stage 25 handoff`
