# Methods — 20 SMS Outreach

[⬅ Back to README](README.md)

## Traditional
Manually typed/sent confirmation texts from a business phone.

## Modern / Tool-Assisted
SMS gateway platforms (Twilio, MessageBird) triggered automatically off booking events for confirmations/reminders.

## AI-Assisted
LLM-drafted short-form confirmation/reminder/re-engagement copy within character limits.

## Manual
Any cold/first-contact SMS use case (rare, and only where a documented lawful basis exists) is human-reviewed before sending given the compliance sensitivity.

## Automated
Confirmation and reminder SMS triggered automatically off a Stage 28 booking event, since these are transactional rather than cold-outreach messages.

## API / Integration
SMS gateway ⇄ calendar/CRM integration (native or via n8n) so confirmations/reminders fire without manual triggering.

## Browser Automation
Not applicable to this channel.

## Scraping
Not applicable to this channel.

## Public Database / Government
TCPA (US) and equivalent regulations in other markets govern consent requirements for commercial SMS — a required compliance check before any SMS use beyond confirming an already-booked meeting.

## Community / Referral
Not a typical entry point for this channel; SMS in this funnel is downstream of an existing engagement, not a first-touch channel.

## Method Selection Guidance
Automate confirmation/reminder SMS fully — they carry minimal compliance risk since the contact already booked a meeting. Treat any other SMS use case as requiring explicit human sign-off on lawful basis first.
