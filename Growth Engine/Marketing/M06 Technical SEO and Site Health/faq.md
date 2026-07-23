# M06 — FAQ

**Q: How is M06 different from M05 (On-Page SEO)?**
M05 is about a single page's content and metadata quality. M06 is about whether the site as a whole is technically capable of being crawled, indexed, and loaded quickly — infrastructure, not content. A perfectly on-page-optimized page (M05) still won't rank if M06-level issues (blocked by robots.txt, slow load time, not mobile-usable) are present.

**Q: How often should the full audit run?**
Monthly for the recurring checklist; immediately (not on the monthly cadence) for anything Search Console's native alerts flag as urgent (e.g., a manual action, a major indexing drop).

**Q: Do we need a developer for this stage?**
For the audit and detection work, no — Search Console, PageSpeed Insights, and Screaming Frog are all usable by a non-developer VA/marketer. For *fixing* certain issues (server-level caching, code-level speed optimizations), a developer may be needed depending on the CMS/hosting stack; the audit's job is to produce a clear, prioritized fix list either way.

**Q: Is adding schema markup risky?**
Only if it doesn't match what's actually on the page — see the QC note in `methods.md`. Accurate markup that reflects real page content is safe and beneficial; fabricated markup (fake ratings, counts) risks a manual action from Google.

**Q: What's a "good" Core Web Vitals score?**
Google publishes current thresholds for LCP, INP, and CLS that define "Good" vs. "Needs Improvement" vs. "Poor" — check web.dev's Core Web Vitals page for the current numbers rather than relying on a fixed figure here, since thresholds have been revised before (e.g., INP replaced FID as a Core Web Vital) and could be revised again.
