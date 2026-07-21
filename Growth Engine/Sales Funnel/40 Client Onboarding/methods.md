# Methods — 40 Client Onboarding

[⬅ Back to README](README.md)

## Traditional
A manual welcome email typed individually, followed by an ad hoc phone call to collect business details and access.

## Modern / Tool-Assisted
An automated welcome sequence (email + WhatsApp) triggered the moment payment is confirmed, paired with a structured questionnaire (Tally/Typeform/Google Forms) that feeds directly into a client portal (Notion) and CRM record.

## AI-Assisted
An LLM generates a personalized welcome email and a first-draft internal team brief from the questionnaire answers, reducing the account manager's manual write-up time.

## Manual
The kickoff call itself (Stage 41) and final review of the AI-drafted team brief before it's shared internally — human judgment on relationship tone and account context still matters here.

## Automated
Client portal creation, Google Drive folder structure creation, questionnaire-reminder sends, and Day 7 CSAT survey dispatch can all run without manual triggering once the automation is set up.

## API / Integration
Contract-signed webhook (from Stage 36/39) ⇄ CRM lifecycle update ⇄ Notion API (portal creation) ⇄ Google Drive API (folder creation) ⇄ WhatsApp/email API (welcome sequence) — a single trigger event that fans out to every onboarding action.

## Browser Automation
Not applicable to this stage.

## Scraping
Not applicable to this stage.

## Public Database / Government
Not applicable to this stage.

## Community / Referral
Inviting the new client into a private client community (WhatsApp group, etc.) as part of the welcome sequence — seeds retention and referral behavior from Day 0 rather than waiting until later stages.

## Method Selection Guidance
Automate everything that doesn't require relationship judgment (portal creation, folder setup, reminders) so the account manager's time is spent entirely on the human parts — the welcome message tone, the kickoff call, and reading whether the client seems confident or uncertain in their early responses.
