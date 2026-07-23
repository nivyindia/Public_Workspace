# M07 — Automation

Off-page SEO is the most manual, relationship-driven stage in the SEO Engine phase — automation here supports the pipeline and tracking, not the actual relationship-building, which cannot and should not be automated.

## Manual (baseline — primary method for this stage)

A human identifies link-worthy assets, researches prospects, writes personalized outreach, and follows up. This is the correct default for the entire stage, not just a fallback.

## Semi-Automated

- Outreach tracked in an Airtable/Notion pipeline (Prospect Identified → Contacted → Follow-up Sent → Replied → Link Live / Declined) so nothing falls through the cracks, without automating the outreach content itself.
- A saved-search or alert (via a free backlink checker, where available) surfaces new competitor backlinks periodically as a prospect-discovery aid.

## Full n8n Workflow (pipeline support only — never the outreach message itself)

**Trigger:** Scheduled (weekly).

1. **Airtable/Notion node** — checks the outreach pipeline for any prospect in "Contacted" status with no reply after a set follow-up window (e.g., 7 days).
2. **Notification node** — reminds the person running outreach to send a follow-up — the workflow surfaces the reminder, a human writes and sends the actual follow-up.
3. **HTTP node (monthly)** — pulls the latest Search Console Links report data and appends new backlinks found to the tracker automatically, flagging any that look pattern-spammy for the M07.5 manual review.

## What Should Never Be Fully Automated

- The outreach message itself — mass-templated, unpersonalized outreach has a low success rate and damages the domain's reputation with the sites being contacted; every message should reflect that a human actually looked at the specific site being pitched.
- Directory submissions at scale (mass-submitting to hundreds of low-quality directories) — explicitly against the standing "no purchased links / no schemes at scale" rule in `methods.md`.
- Disavow file submissions — a human decision requiring documented judgment, not a scheduled task.
