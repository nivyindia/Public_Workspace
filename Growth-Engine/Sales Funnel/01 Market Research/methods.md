# Methods — 01 Market Research

> Part of Stage 01 (Market Research). See [README.md](README.md) for the full stage overview.

---

## Traditional Methods

- **Government statistics review** — SME/MSME registration counts, business census data, sector GDP contribution (e.g. India's Ministry of MSME annual report, US Census Bureau SUSB, UK ONS business population estimates, ABS business counts for Australia)
- **Industry association reports** — chamber of commerce publications, sector body reports (NASSCOM, IAMAI for India; local CPA/accounting bodies for US/UK/AU)
- **Published market research reports** — Statista, IBISWorld, Mordor Intelligence category reports (paid, but often summarized free in press coverage)
- **Buyer interviews** — structured conversations with 5-10 prospective buyers per segment to validate pain points and willingness-to-pay assumptions before committing budget to a market

## Modern / Digital Methods

- **Review-site mining** — G2, Capterra, Trustpilot, Clutch reviews of competitor/adjacent services, read for recurring pain-point language
- **Forum and community scanning** — Reddit (r/smallbusiness, r/Entrepreneur, country-specific subs), Quora, industry Slack/Discord communities
- **Competitor site and pricing page scan** — direct read of competitor positioning, service packaging, and published pricing (see [04 Competitor Research](../04 Competitor Research/README.md) for the full competitor teardown)
- **Job-posting demand signals** — hiring volume for roles the service category would replace or support (e.g. rising "bookkeeper" job postings signals unmet demand better served by an outsourced provider)
- **Search-trend analysis** — Google Trends for category search volume growth/decline over time as a proxy for demand direction

## AI-Assisted Methods

- LLM-assisted synthesis of public statistics and reports into a structured brief (see [README.md §7](README.md#7-ai-section) for prompt patterns)
- AI-assisted pain-point extraction from bulk forum/review text exports
- AI web-search agents for regulatory-change monitoring (flagging new compliance mandates that create fresh demand)

## Manual vs. Automated

| Method | Manual | Semi-Automated | Fully Automated |
|---|---|---|---|
| Government stat pull | Analyst reads published report | Scheduled scrape of stat-bureau page | API where stat bureau offers one (rare) |
| Review-site pain-point mining | Analyst reads reviews, tags themes | Scraper pulls reviews, LLM tags themes | Scheduled pipeline: scrape → LLM-tag → dashboard |
| Competitor pricing scan | Analyst visits pricing pages | Scheduled screenshot/diff tool | Price-monitoring SaaS (e.g. Visualping) with alerting |
| Regulatory change monitoring | Analyst checks gazette/gov site periodically | RSS/news alert on keyword | AI agent monitors + summarizes + flags relevance |

## Public Database & Government Sources

- India: Ministry of MSME, GST Council publications, RBI/MCA data
- US: Census Bureau (SUSB), SBA Office of Advocacy, IRS statistics
- UK: ONS business population estimates, Companies House statistics, HMRC publications
- UAE: UAE Ministry of Economy, Dubai Chamber of Commerce reports
- Australia: ABS business counts, ASIC statistics, ATO publications

## Community & Referral Methods

- Founder/operator communities (Indie Hackers, local startup Slack/WhatsApp groups) for informal demand validation
- Direct conversations with existing clients about what else they struggle to source — often the fastest, highest-signal method available, and free

---

## Cross-References

- Stage README: [README.md](README.md)
- Tools referenced: [tools.md](tools.md)
- Feeds into: [02 ICP Definition](../02 ICP Definition/README.md), [04 Competitor Research](../04 Competitor Research/README.md)
