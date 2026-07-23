# M06 — Technical SEO & Site Health

**Phase:** B — SEO Engine
**Feeds:** M05 (On-Page SEO — a technically broken page can't rank regardless of on-page quality), M21 (Marketing Analytics & Reporting)
**Fed by:** M02 (Channel & Platform Selection — determines the CMS/hosting stack this stage audits)
**Build status:** 🟡 Built to pilot depth this session (Batch 2). See `references.md` for a data-gap note.

## Purpose

M06 is the maintenance layer underneath everything else in the SEO Engine phase — it makes sure the site is crawlable, indexable, fast, mobile-usable, and structurally sound. Great keyword targeting (M04) and on-page optimization (M05) can't overcome a site that's slow, broken, or blocked from being crawled. This stage runs recurring audits rather than one-off project work.

## Inputs

- Live site URL and sitemap
- Hosting/CMS platform details
- Existing Search Console property (or setup, if none exists yet)

## Outputs

- Recurring technical health report (crawl errors, broken links, indexing issues, Core Web Vitals scores)
- Prioritized fix list, handed to whoever manages the site (developer, VA, or the business owner directly depending on team size)

## Sub-Stages

| # | Sub-stage | What it does |
|---|---|---|
| M06.1 | Crawlability & indexing audit | Confirms Google can find and index every important page, and isn't indexing pages it shouldn't |
| M06.2 | Site speed & Core Web Vitals | Measures and improves load performance, since speed is both a ranking factor and a conversion factor |
| M06.3 | Mobile usability | Confirms the site works properly on mobile, which is how most search traffic arrives |
| M06.4 | Structured data (schema markup) | Adds machine-readable markup so Google can show rich results (FAQ, review, breadcrumb, etc.) |
| M06.5 | Broken links & redirect hygiene | Finds and fixes 404s, redirect chains, and broken internal/external links |
| M06.6 | Site architecture & sitemap health | Confirms the sitemap is accurate and current, and the site's structure is flat enough for easy crawling |

## How This Stage Is Used

Run a full audit (M06.1–M06.6) at site launch or Track M kickoff, then recurring lighter audits monthly. Any critical issue found (site not indexing, major speed regression) gets flagged immediately rather than waiting for the next scheduled cycle.

## Files In This Stage

`methods.md` · `tools.md` · `automation.md` · `checklists.md` · `templates.md` · `resources.md` · `faq.md` · `references.md`
