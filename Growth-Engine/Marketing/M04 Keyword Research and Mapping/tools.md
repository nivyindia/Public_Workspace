# M04 — Tools

Pulls from the shared free/OSS stack in `IMPLEMENTATION-PLAN.md §2`. Pricing and free-tier limits below are marked "verify current" per that stack's own convention — they change without notice.

| Tool | Use in M04 | Cost | Notes |
|---|---|---|---|
| Google Keyword Planner | Seed discovery, volume ranges (M04.1, M04.6) | Free (needs a Google Ads account; no ad spend required) | Volumes shown as ranges, not exact numbers, unless the account has active spend — verify current behavior |
| Google Trends | Relative interest over time, seasonality (M04.1) | Free, unlimited | Good for spotting seasonal pillar timing, not absolute volume |
| Google Search Console | Existing query/impression data for owned domain (M04.2, M04.6) | Free, unlimited for owned domain | Primary source of truth once the domain has 3+ months of data |
| Ubersuggest | Secondary volume/difficulty check (M04.1, M04.6) | Free tier, daily query cap — verify current | Use to cross-check Keyword Planner ranges, not as sole source |
| AnswerThePublic | Question-based long-tail discovery (M04.1) | Free tier, limited daily searches — verify current | Strong for informational/awareness-stage phrasing |
| Screaming Frog | Competitor site crawl for topic/URL structure (M04.2) | Free up to 500 URLs — verify current cap | Crawl only public pages; do not attempt to bypass paywalls or login walls |
| Airtable (free tier) or Notion (free tier) | Master Keyword Tracker home | Free tier record/block caps — verify current | Matches the shared Experiment Tracker choice used in M18 |
| n8n (self-hosted) | Automating gap-analysis re-crawls and tracker updates | Free (self-hosted) | Already in use for the Sales Funnel side per the existing n8n plan |

## Paid Upgrade Path (optional, once volume justifies it)

- Ahrefs or SEMrush — replaces Keyword Planner + Ubersuggest + Screaming Frog's competitor-crawl role with one integrated toolset, once keyword volume/rank-tracking needs outgrow the free stack.
- Keywords Everywhere (paid credits) — faster bulk volume lookups than manually checking Keyword Planner one term at a time.

No paid tool is required to run M04 end to end at pilot depth. The free stack above is sufficient for an SMB-scale keyword universe (low hundreds of tracked terms).
