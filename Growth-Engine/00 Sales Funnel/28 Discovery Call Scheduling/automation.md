# Automation — 28 Discovery Call Scheduling

[⬅ Back to README](README.md)

## Manual
Rep reviewing the pre-call brief before the call — never skipped even when AI-drafted.

## Semi-Automated
AI drafts the pre-call research brief; rep reviews and adds any additional notes before the call.

## Full-Automated
Booking confirmation and reminders (Stage 16/20) fire automatically off the calendar event with no manual trigger needed.

## AI-Assisted Workflow
1. Contact books via the scheduling link shared in an Interested-reply response (Stage 25).
2. Confirmation message sends automatically (Stage 16/20).
3. Research agent pulls company website/LinkedIn data and drafts a pre-call brief with problem hypotheses, attached to the CRM opportunity record.
4. Rep reviews the brief before the call.
5. If no-show, an automated rebooking outreach attempt triggers within 24 hours (Stage 24 follow-up logic).

## Suggested n8n / integration flow
`Scheduling tool (booking created)` → `n8n (trigger confirmation/reminder)` → `Research agent (company data → brief)` → `CRM (attach brief to opportunity)` → `Reminder fired` → `No-show? → Stage 24 rebooking trigger`
