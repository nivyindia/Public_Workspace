# M21 — Marketing Analytics and Reporting: Methods

## 21A — Analytics Infrastructure Setup

Mined directly from the "Analytics Setup & Dashboard System" service package, generalized from a client-facing offer into the internal method Track M itself follows:

1. **Technical audit** of current tracking status — confirm whether GA4/Search Console already exist and are correctly configured, or need setup from scratch
2. **GA4 property setup** — one property per domain/brand (relevant for Nivy's multi-brand structure: Nivy Academy, Nivy Next, etc. each need their own property, not one shared property, so channel performance doesn't get blended across brands)
3. **Google Search Console setup and verification** — DNS or HTML-tag verification, then linked to the GA4 property
4. **Goal/conversion setup** — form submissions, calls booked (Cal.com), key page visits, defined as GA4 conversion events
5. **Testing and validation** — confirm each goal fires correctly with a live test submission before calling the stage "done"
6. **30-day data validation** — a follow-up check that data is flowing with no gaps, per the source package's own standard

## 21B — Ad & Pixel Tracking

Mined from the "Tracking & Pixel Setup Package." Only relevant once a paid channel is actually running (M18 growth experiments or a future paid-ads stage) — organic-only Track M stages don't need pixel tracking, so this sub-stage is conditional, not a blanket requirement:

1. Google Tag Manager container setup (the umbrella container everything else sits inside)
2. Meta Pixel installation via GTM, with standard events (PageView, Lead, Purchase/Signup as relevant)
3. Google Ads conversion action setup, if/when Google Ads is running
4. Retargeting audience creation (website visitors, page viewers, cart/form abandoners)
5. 7-day tracking validation, per the source package's own QA standard

## 21C — UTM & Source Tagging Standard

No dedicated internal doc covers this — written fresh, since it's the connective piece that makes M21's dashboard numbers match M22's Source field.

**Convention (proposed, following standard UTM practice):**
```
utm_source = the platform (linkedin / instagram / youtube / twitter / facebook / newsletter / whatsapp)
utm_medium = the content type (organic / paid / referral / email)
utm_campaign = the specific piece/campaign (e.g. m09-pillar-post-jul26)
```

Applied to every trackable outbound link from M11-M17 and M20's partnership placements. Case and spelling must be locked to a fixed list — a channel tagged `linkedin` in one post and `LinkedIn` in another silently splits into two rows in GA4's source report, which is exactly the kind of tracking gap 21A's validation step exists to catch.

## 21D — Dashboarding

Per the source package: a Looker Studio (or Google Data Studio) dashboard pulling from GA4 + Search Console as the primary sources, with the free/OSS Airtable or Notion experiment tracker (from M18) as a secondary data source for growth-experiment results. Minimum dashboard views: traffic by source/channel, top-performing content pages, goal-conversion rate, and lead volume by source (cross-checked against M22's CRM entry counts).

## 21E — Recurring Reporting Cadence

Written fresh — no dedicated internal marketing-reporting doc exists, though the cadence structure is adapted directly from the sales side's daily/weekly/monthly reporting discipline (per "16. Performance Metrics & KPIs"):

- **Weekly:** channel-level snapshot — sessions, top content, leads generated, any notable spike/drop
- **Monthly:** business-level rollup — total traffic, total leads by source, which M18 experiments to keep/kill, which content pillar (M03) is over/under-performing

## 21F — Experiment Result Tracking

M18's Impact × Effort tracker (Airtable/Notion free tier, per the shared tool stack) records the experiment idea and effort estimate; M21's job is to feed it the actual result once an experiment has run — real traffic/conversion numbers, not a subjective "seemed to work." This closes the loop so M18's next batch of experiments is prioritized on evidence.
