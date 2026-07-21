# Automation — 42 Implementation and Delivery Setup

[⬅ Back to README](README.md)

## Manual
Final QC review of the first deliverable before it goes live — always a human check given how much this first proof point matters for client trust.

## Semi-Automated
Task board creation is templated per service SOP and auto-populated, but a human adds client-specific customizations flagged from the kickoff call.

## Full-Automated
Tracking-verification checks (confirming GA4 goals/pixel are firing correctly) and internal deadline reminders for the first-deliverable target date can run without manual triggering.

## AI-Assisted Workflow
1. Kickoff call complete (Stage 41) → project plan and call notes available.
2. Task board auto-created from the relevant service-specific delivery SOP template.
3. LLM cross-references kickoff notes against the standard SOP to flag any client-specific customization needed.
4. Delivery specialist and team-lead QC reviewer assigned; internal brief shared via Slack/Telegram.
5. Platform access tested; tracking setup configured and automatically verified via API check.
6. Phase 1 (Foundation) activities scheduled against the standard timeline.
7. First deliverable produced, QC'd by team lead, and shipped within the 7-day target; client notified.

## Suggested n8n / integration flow
`Stage 41 kickoff complete webhook` → `n8n (create task board from service SOP template)` → `LLM (flag customizations from kickoff notes)` → `Slack/Telegram (notify + brief delivery team)` → `API check (verify tracking/pixel firing)` → `Deadline reminder (7-day first-deliverable target)` → `QC review` → `Client notification on go-live`
