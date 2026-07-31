# Checklists — 16 Email Outreach

[⬅ Back to README](README.md)

## Pre-Send Setup QC
- [ ] Sending domain is dedicated (not primary company domain)
- [ ] SPF, DKIM, DMARC verified via MXToolbox or equivalent
- [ ] Warm-up schedule followed (see methods.md volume table) before any volume sending
- [ ] Sequence template reviewed and approved by supervisor before first use

## Per-Batch QC (before loading a new contact batch)
- [ ] Every contact carries a Stage 10 "verified" email status
- [ ] No duplicate contacts already in an active sequence
- [ ] Personalization fields populated (no `[First Name]` placeholders left unfilled)
- [ ] Segment/persona matches the template selected

## Daily Send QC
- [ ] Daily volume within warm-up-stage limit
- [ ] Bounce rate checked — pause sending if above 3%
- [ ] Replies from previous 24h triaged and actioned
- [ ] CRM statuses current (no contact left un-updated after a send)

## Duplicate / Accuracy / Completeness Checks
- [ ] No contact receives two different sequences simultaneously
- [ ] Unsubscribe/opt-out requests suppressed list-wide within the same day
- [ ] Sequence step counts match template design (no skipped or duplicated steps)
