# Automation — 24 Follow Up Systems

[⬅ Back to README](README.md)

## Manual
Curating and approving new value-add content (case studies, stats) for the follow-up library.

## Semi-Automated
LLM drafts a follow-up message referencing a library item; human spot-checks before it's added to a channel's template set (Stage 22 review process).

## Full-Automated
HubSpot/n8n workflow advances a non-replying contact through the documented follow-up cadence automatically, and moves a `cold` contact into the 90-day re-engagement sequence without manual intervention.

## AI-Assisted Workflow
1. Contact receives first touch (Stage 16-20) with no reply by the scheduled follow-up date.
2. Automation triggers the next follow-up step, pulling the approved template (which references the value-add library).
3. After the channel's maximum follow-up count is reached with no reply, contact is marked `cold` and scheduled for re-engagement in 90 days.
4. At the 90-day mark, automation re-enrolls the contact in a lighter-touch re-engagement sequence.

## Suggested n8n / integration flow
`CRM (no reply by due date)` → `n8n (advance follow-up step)` → `Channel tool API (send)` → `n8n (max follow-ups reached?)` → `CRM (mark cold, schedule +90 days)` → `n8n (90-day trigger)` → `Re-engagement sequence`
