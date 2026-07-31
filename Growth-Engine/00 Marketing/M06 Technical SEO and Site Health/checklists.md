# M06 — Checklists / QC Gates

## Monthly recurring audit

- [ ] Search Console Coverage report checked — no new pages dropped from "Indexed" to "Excluded" without explanation
- [ ] `robots.txt` reviewed — no accidental blocking of important sections
- [ ] Core Web Vitals report checked (Search Console field data, not just lab data) — no metric regressed from "Good" to "Needs Improvement" or "Poor"
- [ ] Mobile Usability report checked — zero open issues, or open issues are known and scheduled for a fix
- [ ] Screaming Frog crawl re-run — broken-link (4xx) and redirect-chain counts compared to last month, investigated if increased
- [ ] XML sitemap spot-checked — only live, canonical, indexable URLs listed

## Before publishing new structured data (M06.4)

- [ ] Markup validated in Google's Rich Results Test with zero errors
- [ ] Every marked-up field corresponds to content actually visible on the page — no fabricated ratings, counts, or details

## At site launch or major redesign (one-time, not recurring)

- [ ] Search Console property verified and sitemap submitted
- [ ] `robots.txt` reviewed line by line before launch (not left on a default that may block staging-site crawling remnants)
- [ ] Core Web Vitals baseline measured before the redesign ships, to have a before/after comparison
