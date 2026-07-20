# Automation — 01 Market Research

> Part of Stage 01 (Market Research). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. Government/Industry Stat Refresh
- **Manual:** Analyst visits stat-bureau site quarterly, copies relevant figures into the brief
- **Semi-automated:** Scheduled scraper/change-detector on the specific published-report page, alerts analyst when a new report is published
- **Fully automated:** n8n workflow polling the source page's RSS/sitemap → diff check → alert to Slack/Notion when new data is published
- **AI-assisted:** LLM reads the newly published report and drafts an updated Market Size / Service Demand section for human review
- **Required tools:** RSS/webhook monitor (n8n, Zapier), LLM API
- **Expected output:** Draft-updated brief section flagged for human sourcing check
- **Common errors:** Stat bureaus republish under new URLs — link-check monitoring, not just content-diff, needed periodically

### 2. Competitor Pricing / Positioning Watch
- **Manual:** Analyst re-visits competitor pricing pages every quarter
- **Semi-automated:** Visualping/Distill.io style page-change monitor on competitor pricing URLs
- **Fully automated:** Scheduled Playwright script screenshots + diffs competitor pricing pages, logs changes to a tracking sheet
- **AI-assisted:** LLM summarizes what changed and whether it affects Nivy's competitive positioning
- **Required tools:** Playwright/Visualping, LLM API, tracking sheet or Notion database
- **Expected output:** Change log entry + flag if reposition is warranted
- **Common errors:** Sites behind login/paywall need manual check; scraper false-positives on cosmetic page changes — diff logic should target price/plan text blocks specifically

### 3. Pain-Point Mining Pipeline
- **Manual:** Analyst reads review/forum threads, tags recurring themes by hand
- **Semi-automated:** Scraper pulls review text in bulk, analyst tags manually
- **Fully automated:** Scrape → LLM-classify by theme → dashboard of theme frequency, refreshed monthly
- **Required tools:** Scraper (respecting site ToS — many review sites prohibit scraping; prefer manual export or official APIs where available), LLM API, simple dashboard (Notion/Sheets)
- **Expected output:** Ranked list of buyer pain-point themes with frequency and representative (paraphrased) examples
- **Common errors:** Review sites' ToS often prohibit scraping — default to manual reading or official export/API access rather than unauthorized scraping

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: _none — this is the first stage_
- Next stage: [02 ICP Definition](../02 ICP Definition/README.md)
