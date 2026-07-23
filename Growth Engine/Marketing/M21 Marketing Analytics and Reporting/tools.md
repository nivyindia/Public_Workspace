# M21 — Marketing Analytics and Reporting: Tools

Per `IMPLEMENTATION-PLAN.md` §2, this stage defaults to free tools first; paid tools are listed only as an optional upgrade path.

| Function | Free / OSS tool | Notes | Paid upgrade path |
|---|---|---|---|
| Web analytics | **Google Analytics 4** | Free, no meaningful volume cap for an SMB/agency site | — |
| Rank tracking / search performance | **Google Search Console** | Free, unlimited for an owned/verified domain — primary source of truth for organic search data | Ahrefs/SEMrush rank tracking once a ranking budget exists |
| Tag management | **Google Tag Manager** | Free — the container that holds GA4, Meta Pixel, Google Ads tags | — |
| Dashboarding | **Looker Studio** | Free, connects directly to GA4/Search Console | Paid BI tools only if data volume/complexity outgrows Looker Studio |
| Ad pixel (only if paid social running) | **Meta Pixel** | Free to install; the ad spend behind it is the only cost | — |
| Experiment tracking | **Airtable free tier** or **Notion free tier** | Per the shared stack (§2) — used for M18's Impact × Effort tracker, which 21F feeds | Airtable paid tier if the free record cap is outgrown |

## Client-Facing Pricing Reference (from the source service packages — for context, not a cost to Track M itself)

These packages describe what Nivy already charges clients for this exact setup, useful context for scoping effort even though Track M is building this internally, not selling it:

| Package | Tier | Price |
|---|---|---|
| Analytics Setup & Dashboard System | Basic (GA4 + Search Console + basic goals) | $500-$800 |
| Analytics Setup & Dashboard System | Full (+ custom dashboard + conversion tracking) | $1,200-$1,500 |
| Analytics Setup & Dashboard System | Premium (+ monthly reporting management) | $2,000, or $300-$500/mo maintenance |
| Tracking & Pixel Setup Package | Basic (Meta Pixel + 1 conversion event) | $400-$600 |
| Tracking & Pixel Setup Package | Standard (+ Google Ads tracking + GTM) | $700-$900 |
| Tracking & Pixel Setup Package | Full (all platforms + retargeting + GA4 integration) | $1,000-$1,200 |

Figures as stated in the source docs (approximate, May 2026) — verify current before quoting to a client.
