# M04 — Automation

Per Track M's standing rule: every workflow below defaults to free/OSS tools first. Each method is shown at three levels — manual, semi-automated, and full n8n — so a VA with no automation experience can still run the manual version while the workflow is being built.

## Manual (baseline — always available as fallback)

A human runs M04.1–M04.6 directly in a spreadsheet or Airtable/Notion base, following `methods.md` step by step. This is the required starting point — the workflow below should be validated against a manually-produced tracker before it's trusted to run unattended.

## Semi-Automated

- VA runs seed discovery manually (M04.1), then pastes the raw keyword list into an Airtable "Intake" view.
- An Airtable/Notion automation (native, no n8n needed) auto-tags rows with a draft funnel-stage label based on a keyword-phrase rule (e.g., contains "vs" or "review" → Consideration; contains "buy" or "price" → Decision) as a starting suggestion — a human still confirms per the M04.3/M04.4 manual check.

## Full n8n Workflow

**Trigger:** Scheduled (monthly) or manual button trigger in n8n.

1. **HTTP Request node** — pulls the latest Google Search Console query data for the domain (via the Search Console API) into a staging table.
2. **HTTP Request node** — re-crawls the tracked competitor domain list (Screaming Frog CLI called via n8n's Execute Command node, or a lightweight scraping HTTP call) and diffs new page titles against the last run.
3. **Function node** — applies the phrase-rule intent pre-tagging described above (Semi-Automated section) to any new keywords found.
4. **Airtable/Notion node** — upserts new rows into the Master Keyword Tracker, flags them "needs human review" rather than auto-publishing the intent tag.
5. **Notification node** (email/WhatsApp/Slack per whichever the team already monitors) — alerts the marketer that N new keywords are queued for review, with a direct link to the filtered tracker view.
6. **Human step (required, not automatable):** Marketer reviews flagged rows, confirms/corrects intent and funnel-stage tags, assigns to an existing or new URL per M04.5, and un-flags the row. This human-review gate is a standing QC rule (see `checklists.md`), not optional automation debt to remove later.

## What Should Never Be Fully Automated

- Business Relevance scoring (M04.6) — this is a judgment call the tool cannot make; automating it would silently misprioritize the content calendar.
- Final intent/funnel-stage confirmation (M04.3/M04.4) — pre-tagging is fine, auto-publishing without review is not.
