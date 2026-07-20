# Methods — 16 Email Outreach

[⬅ Back to README](README.md)

## Traditional
- Manual prospecting and personally written emails sent one at a time from a standard mailbox — low volume, high personalization, still used for high-value target accounts.

## Modern / Tool-Assisted
- Sequencer tools (Instantly, Lemlist, Apollo sequences) that automate send timing, track opens/replies/bounces, and rotate across multiple warmed mailboxes.

## AI-Assisted
- LLM-drafted subject lines and opener copy, personalized per contact using enrichment data fields; LLM-based reply classification (Interested/Not Interested/Unsubscribe).

## Manual
- Hand-verifying a small batch of high-priority contacts before adding to a sequence; manually replying to nuanced inbound responses that a template/AI classification isn't confident about.

## Automated
- Sequencer tool handles step timing (Day 1 opener → Day 4 follow-up → Day 10 breakup) automatically once a contact is loaded, stopping the sequence on any reply.

## API / Integration
- CRM ⇄ sequencer integration (via native integration or n8n/Zapier) so sequence status and replies sync back to the CRM without manual re-entry.

## Browser Automation
- Not typically used for sending itself (violates most ESP terms); may be used upstream to gather contact/company signals feeding personalization fields.

## Scraping
- Not used directly for email sending; company/contact data feeding personalization comes from Stage 07/08, not scraped at this stage.

## Public Database / Government
- Not applicable to this stage.

## Community / Referral
- Warm intros and referral-sourced contacts (Stage 53/54 origin) can enter an email sequence at the "value follow-up" step rather than the cold opener, since some context already exists.

## Method Selection Guidance
Use sequencer tools for all volume outreach; reserve fully manual, hand-written emails for named strategic accounts where template language would visibly undersell the relationship.
