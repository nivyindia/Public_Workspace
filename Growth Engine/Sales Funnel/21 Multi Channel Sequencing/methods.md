# Methods — 21 Multi Channel Sequencing

[⬅ Back to README](README.md)

## Traditional
A rep/VA manually tracking a contact's touches across channels in a spreadsheet or CRM notes field and deciding the next touch by memory/judgment.

## Modern / Tool-Assisted
A sales engagement platform (Apollo, Outreach.io, Salesloft) that natively supports multi-channel steps within one sequence definition.

## AI-Assisted
LLM-recommended sequence blueprints per segment based on historical performance data; LLM-drafted cross-channel-continuity copy.

## Manual
Reviewing and approving a new sequence blueprint before it runs at volume; handling any contact whose cross-channel activity looks ambiguous to the automation.

## Automated
Orchestration layer advancing a contact to the next channel/step at the scheduled time, respecting each channel's own volume limits, and halting on reply.

## API / Integration
CRM as the single source of truth, integrated (natively or via n8n) with each channel tool (email sequencer, LinkedIn automation, dialer/CRM calling module, WhatsApp BSP, SMS gateway) so touches and replies sync centrally.

## Browser Automation
Inherited from the underlying channel stages (e.g., LinkedIn's PhantomBuster) — this stage coordinates timing across those tools rather than introducing new automation itself.

## Scraping
Not applicable to this stage directly.

## Public Database / Government
Not applicable to this stage directly; each channel's own compliance constraints (Stages 18/19/20) still apply within a multi-channel sequence.

## Community / Referral
A referral-sourced contact may enter a sequence partway through (e.g., skip the cold email, start at a warm LinkedIn message) rather than always starting at step one.

## Method Selection Guidance
Use a sales-engagement-platform's native multi-channel sequencing where budget allows; where the team uses separate best-of-breed tools per channel (as in this KB's current stack), coordinate via a CRM-centered orchestration layer (n8n) instead.
