# Automation — 20 SMS Outreach

[⬅ Back to README](README.md)

## Manual
Any SMS use case outside confirmation/reminder/re-engagement is drafted and sign-off approved manually before sending, given compliance sensitivity.

## Semi-Automated
Re-engagement SMS to a warm-but-quiet contact is drafted by AI, reviewed by a human, then sent individually.

## Full-Automated
Confirmation SMS fires automatically the moment a Stage 28 booking is created; reminder SMS fires automatically at a fixed interval (e.g., 24 hours and 1 hour) before the booked meeting.

## AI-Assisted Workflow
1. Stage 28 booking event triggers the automation.
2. Template (not freshly AI-generated per send, to keep compliance-reviewed language consistent) populates contact/meeting details.
3. SMS gateway sends confirmation immediately and reminder(s) on schedule.
4. Any reply or STOP keyword routes to CRM and, if STOP, immediately suppresses future SMS.

## Suggested n8n / integration flow
`Calendar/CRM (booking created)` → `n8n (schedule reminder timers)` → `SMS gateway API (send confirmation + reminders)` → `SMS gateway webhook (reply/STOP)` → `CRM (log status / suppress on STOP)`
