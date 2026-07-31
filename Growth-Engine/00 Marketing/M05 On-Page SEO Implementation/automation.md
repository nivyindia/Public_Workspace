# M05 — Automation

## Manual (baseline)

A human works through `methods.md` and the `checklists.md` gate directly in the CMS for each page. This remains the primary path for M05 — on-page SEO is largely judgment-based (does this heading read naturally, is this meta description actually compelling), so full automation is neither realistic nor desirable here.

## Semi-Automated

- CMS-native SEO plugin (Yoast/Rank Math, if WordPress) surfaces a live readability/keyword-usage score while the page is being edited — this is assistive, not a replacement for the manual checklist.
- A shared Airtable/Notion view (linked to the M04 tracker) shows which assigned keywords don't yet have a "Live" status, giving the team a queue rather than relying on memory.

## Full n8n Workflow (supporting tasks only — not full page optimization)

**Trigger:** New page published (webhook from the CMS, or scheduled poll of the sitemap).

1. **Webhook/HTTP node** — detects a newly published or updated URL.
2. **HTTP node** — pings Google Search Console's URL Inspection API to request (re)indexing.
3. **Screaming Frog CLI (Execute Command node)** — re-crawls the site to check whether the new page has at least one inbound internal link; flags it if not (feeds M05.3's orphan-page check).
4. **Airtable/Notion node** — updates the M04 tracker row's status to "Live" once the human sign-off checkbox (from `checklists.md`) is ticked — the workflow does not set this status itself, since the sign-off is a human QC gate, not an automatable step.
5. **Notification node** — alerts the marketer if a page has been live for 7+ days without an inbound internal link, since orphaned pages are a common on-page SEO gap that's easy to miss.

## What Should Never Be Fully Automated

- Writing the actual title tag / meta description copy — templated auto-generation (e.g., "{Keyword} | {Brand Name}") produces weak, generically-templated snippets that underperform in click-through rate; a human writes these.
- The final publish sign-off (M05.5).
