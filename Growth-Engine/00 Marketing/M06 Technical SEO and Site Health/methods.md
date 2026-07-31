# M06 — Methods

## M06.1 — Crawlability & Indexing Audit

- **Manual:** Check `robots.txt` isn't accidentally blocking important sections. Use Search Console's "Coverage"/"Pages" report to see what's indexed vs. excluded, and why.
- **Free-tool:** Google Search Console (primary source of truth). Screaming Frog's free crawl surfaces `noindex` tags, canonical tag issues, and crawl-blocked pages directly.
- **Automated:** n8n scheduled workflow re-pulls the Search Console coverage report weekly and flags any page that dropped from "Indexed" to "Excluded" since the last check.

## M06.2 — Site Speed & Core Web Vitals

- **Manual:** Run Google PageSpeed Insights (free) on key pages (homepage, top pillar pages) and read the Core Web Vitals scores (LCP, INP, CLS).
- **Free-tool:** PageSpeed Insights, and Search Console's own "Core Web Vitals" report (real-user field data, more reliable than lab data alone).
- **Fix approach (no paid tool required):** Compress images (shared with M05.4's TinyPNG/Squoosh step), enable browser caching and compression at the hosting/CMS level, defer non-critical JavaScript — the specific fix depends on the CMS/hosting stack, which should be confirmed before recommending a fix.

## M06.3 — Mobile Usability

- **Manual:** Manually browse the site on an actual phone, not just a resized desktop browser window — some layout bugs only appear on real mobile rendering engines.
- **Free-tool:** Search Console's "Mobile Usability" report flags specific issues (text too small, clickable elements too close together, content wider than screen).

## M06.4 — Structured Data (Schema Markup)

- **Manual:** Add JSON-LD schema for the content types that apply (Article, FAQ, Organization, BreadcrumbList, Product/Service where relevant) directly in the CMS's custom-code area or via a free schema plugin.
- **Free-tool:** Google's Rich Results Test validates markup before/after publishing. Schema.org's own documentation and generator tools (several free ones exist) help build the JSON-LD without writing it by hand.
- **QC note:** Only mark up content that's actually visible on the page — marking up content that doesn't exist on the page (e.g., fake review counts) violates Google's structured-data guidelines and risks a manual action; this is flagged explicitly since it's a common shortcut businesses are tempted to take.

## M06.5 — Broken Links & Redirect Hygiene

- **Manual:** Click through key user journeys periodically to spot broken links firsthand.
- **Free-tool:** Screaming Frog's crawl report lists every 4xx/5xx response and every redirect chain (a redirect chain of 3+ hops should be flattened to a single direct redirect).
- **Automated:** n8n scheduled crawl (via Screaming Frog CLI) diffs broken-link counts week over week and alerts if the count spikes.

## M06.6 — Site Architecture & Sitemap Health

- **Manual:** Confirm the XML sitemap only lists live, indexable, canonical URLs — not redirected or noindexed pages. Confirm important pages are reachable within 3 clicks from the homepage.
- **Free-tool:** Most CMSs (WordPress via Yoast/Rank Math, Webflow natively) auto-generate and maintain the sitemap — verify it's actually being submitted and re-read in Search Console, not just generated and forgotten.
