# Automation — 04 Competitor Research

> Part of Stage 04 (Competitor Research). See [README.md](README.md) for the full stage overview.

---

## Monitoring Cadence

### Weekly (~20 minutes)
- Check competitor social media top posts
- Monitor live ads in Meta Ads Library / Google Ads Transparency Center
- Track new blog posts / YouTube videos
- Check follower growth trend (Social Blade)

### Monthly (~40 minutes)
- Full SEO check (Ubersuggest / Ahrefs free tools)
- Website/pricing/offer change check
- Review new testimonials on Google/Trustpilot/Clutch/G2
- Check landing page changes
- Broader industry trend scan (Google Trends)

## Automation Workflows

### 1. Pricing/Positioning Change Detection
- **Manual:** Analyst re-visits competitor pricing pages monthly
- **Semi-automated:** Visualping/Distill.io page-change monitor on pricing/service pages
- **Fully automated:** Scheduled screenshot-diff pipeline logging changes to a tracking sheet, alerting on detected changes
- **AI-assisted:** LLM summarizes what changed and whether Nivy's positioning response needs updating
- **Required tools:** Page-change monitor, LLM API, tracking sheet
- **Common errors:** Cosmetic page changes trigger false positives — target the diff logic at price/plan text blocks specifically

### 2. Review Sentiment Monitoring
- **Manual:** Analyst reads new reviews monthly
- **Semi-automated:** Manual export of new reviews + LLM-assisted theme summary
- **Required tools:** LLM API
- **Expected output:** Updated "what clients praise/complain about" summary per competitor
- **Common errors:** Most review platforms' ToS prohibit automated scraping — default to manual reading or official export, not unauthorized scraping

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [03 Buyer Persona](../03 Buyer Persona/README.md)
- Next stage: [05 Lead Source Selection](../05 Lead Source Selection/README.md)
