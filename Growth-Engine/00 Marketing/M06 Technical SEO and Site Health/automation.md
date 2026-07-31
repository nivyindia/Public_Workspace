# M06 — Automation

## Manual (baseline)

A human runs the audits in `methods.md` on a monthly cadence using Search Console and PageSpeed Insights directly. This is sufficient for a small site with infrequent changes.

## Semi-Automated

- Search Console's own email alerts (native, no extra setup) notify on major indexing/manual-action issues as they happen, rather than waiting for the monthly manual check.
- A shared checklist (from `checklists.md`) in Airtable/Notion tracks which audits have been run and when, so cadence doesn't silently slip.

## Full n8n Workflow

**Trigger:** Weekly schedule.

1. **HTTP node** — pulls the latest Search Console coverage and Core Web Vitals report data via the API.
2. **Screaming Frog CLI (Execute Command node)** — re-crawls the site for broken links, redirect chains, and indexing-tag issues.
3. **Function node** — diffs this week's results against last week's stored snapshot (in Airtable/Notion) to detect regressions (e.g., indexed-page count dropped, broken-link count spiked, a Core Web Vitals metric moved from "Good" to "Needs Improvement").
4. **Notification node** — alerts the team only on a detected regression, not on every routine run, to avoid alert fatigue.
5. **Airtable/Notion node** — logs the audit as complete for the cadence-tracking checklist regardless of whether an issue was found.

## What Should Never Be Fully Automated

- Deciding *how* to fix a flagged speed or structural issue — the right fix depends on the specific CMS/hosting stack and sometimes requires a developer; the workflow's job is detection and alerting, not auto-remediation, since an automated "fix" (e.g., auto-compressing every image without review) can break page layouts unexpectedly.
- Schema markup content — must reflect what's actually visible on the page (see the QC note in `methods.md`), which requires a human check against the live page.
