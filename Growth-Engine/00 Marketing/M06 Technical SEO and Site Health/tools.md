# M06 — Tools

| Tool | Use in M06 | Cost | Notes |
|---|---|---|---|
| Google Search Console | Indexing, mobile usability, Core Web Vitals field data (M06.1–M06.3) | Free, unlimited for owned domain | The single most important tool in this stage — set up before anything else if not already done |
| Google PageSpeed Insights | Lab + field speed data per page (M06.2) | Free | Run on key pages, not every page, on a recurring cadence |
| Screaming Frog | Crawl for indexing tags, broken links, redirect chains (M06.1, M06.5) | Free up to 500 URLs — verify current cap | Shared with M04/M05 |
| Google Rich Results Test | Validates schema markup before/after publish (M06.4) | Free | |
| Schema.org / free JSON-LD generators | Building structured data without hand-coding (M06.4) | Free | Verify generated markup against Rich Results Test before publishing |
| GTmetrix (free tier) | Secondary speed-testing cross-check (M06.2) | Free tier, verify current limits | Optional second opinion alongside PageSpeed Insights |
| n8n (self-hosted) | Scheduled re-crawls, coverage-report diffing, alerting | Free | See `automation.md` |

## Paid Upgrade Path (optional)

- Ahrefs/SEMrush Site Audit — hosted, scheduled crawling at larger scale than Screaming Frog's free cap, with historical trend dashboards.
- A CDN/caching service (e.g., a paid tier of a hosting-level caching add-on) — if speed fixes at the CMS level aren't sufficient once traffic grows.

No paid tool is required to run M06 at pilot depth for an SMB-scale site.
