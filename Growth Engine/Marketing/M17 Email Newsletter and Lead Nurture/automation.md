# M17 — Automation

## Manual (baseline)

A human sets up the welcome sequence and newsletter template once, then reviews/curates each newsletter send manually from the M08 calendar. Sequence logic (once built) runs automatically inside the ESP without further manual intervention per subscriber.

## Semi-Automated

- ESP-native automation (Listmonk/Mailchimp) handles the welcome sequence (M17.2) and segmented nurture sequences (M17.3) automatically once built — this is standard ESP functionality, not custom n8n work.
- A shared Airtable/Notion view pulls the M08 calendar's "published this week" items as newsletter-curation candidates, reducing the manual search-for-content step.

## Full n8n Workflow

**Trigger:** Event-based (new signup) and scheduled (weekly hygiene check, monthly deliverability review).

1. **Webhook node** — new signup from a site form triggers list addition in Listmonk/Mailchimp via API, tagged with the source (which lead magnet/page).
2. **Scheduled node (weekly)** — pulls engagement data (opens/clicks) and flags contacts matching the M17.6 sales-readiness rules (e.g., clicked pricing page link, opened 3+ decision-stage sends).
3. **CRM node (Odoo/SuiteCRM)** — pushes flagged contacts into the CRM as a qualified inbound lead, tagged for M22's bridge into Sales Stage 06.
4. **Scheduled node (monthly)** — pulls list-wide engagement stats, flags the long-unopened segment for the M17.5 hygiene review, and checks SPF/DKIM/DMARC status hasn't broken (a surprisingly common silent failure after DNS/hosting changes).
5. **Notification node** — alerts the marketer of newly-flagged sales-ready leads and the monthly hygiene summary.

## What Should Never Be Fully Automated

- Writing new nurture sequence copy — draft-assisted by AI is fine (see `methods.md`), but publishing without human review risks tone-deaf or inaccurate content going to the entire segment at once, which is a larger blast radius than a single social post.
- List purging decisions at the "should we actually delete this contact" level — flagging disengaged contacts can be automated; the final removal decision (especially distinguishing genuinely disengaged from simply infrequent openers) benefits from a human pass.
