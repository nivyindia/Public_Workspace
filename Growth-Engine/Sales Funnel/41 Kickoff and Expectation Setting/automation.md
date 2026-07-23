# Automation — 41 Kickoff and Expectation Setting

[⬅ Back to README](README.md)

## Manual
The call itself — tone, rapport, and reading the client's confidence level cannot and should not be automated.

## Semi-Automated
Agenda generation is AI-drafted from the Stage 40 questionnaire answers, then reviewed by the account manager before the call.

## Full-Automated
Call scheduling and reminders, post-call recap email drafting (from call notes), and project-plan creation in the client portal can run largely without manual effort once notes are logged.

## AI-Assisted Workflow
1. Onboarding questionnaire (Stage 40) complete → LLM drafts a personalized kickoff agenda with industry-specific discovery questions.
2. Account manager reviews and lightly edits the agenda before the call.
3. Call happens; account manager takes notes (or an AI notetaker transcribes/summarizes, human-reviewed for accuracy).
4. LLM drafts the post-call recap email and a week-by-week project plan from the call notes and service package.
5. Account manager reviews and sends the recap; project plan is published to the client portal.
6. CRM/lifecycle record updated to reflect kickoff complete, triggering handoff to Stage 42 (Implementation and Delivery Setup).

## Suggested n8n / integration flow
`Stage 40 questionnaire complete` → `LLM (draft agenda)` → `AM review` → `Cal.com (call scheduled)` → `Call happens (notes logged)` → `LLM (draft recap + project plan)` → `AM review + send` → `Notion (publish project plan)` → `CRM (kickoff complete → trigger Stage 42)`
