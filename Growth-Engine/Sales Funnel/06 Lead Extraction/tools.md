# Tools — 06 Lead Extraction

> Part of Stage 06 (Lead Extraction). See [README.md](README.md) for the stage overview.
> Pricing is approximate and sourced from internal docs last updated May 2026 — **verify current pricing on the vendor site before purchase**, as B2B SaaS pricing changes frequently.

---

## Tier 1 — Lead Databases (Ready-Made Contacts)

| Tool | Purpose | Pricing (approx.) | Free/OSS Alt | API | Automation | Learning Curve | Docs |
|---|---|---|---|---|---|---|---|
| **Apollo.io** ⭐ | Best all-round B2B contact database + sequencing | ~$49–99/mo | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes (Apollo API) | Sequences, Zapier/Make | Low | apollo.io/docs |
| ZoomInfo | Enterprise-grade firmographic + contact accuracy | High (enterprise, custom quote) | Apollo/RocketReach as budget substitute | Yes | Yes | Medium | zoominfo.com |
| Lusha | Direct-dial phone + email enrichment | Free tier + paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes | Chrome extension | Low | lusha.com |
| Snov.io | Email finding + verification + drip campaigns | Free tier + paid | Mautic (OSS marketing automation) | Yes | Yes | Low | snov.io |
| RocketReach | Personal + work email lookup | Free tier + paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes | Limited | Low | rocketreach.co |
| Clearbit | Company + person enrichment for CRM | Paid | Odoo Community (CRM module, self-hosted, free) | Yes (Clearbit API) | Yes | Medium | clearbit.com |

---

## Tier 2 — LinkedIn / Decision-Maker Extraction

| Tool | Purpose | Pricing | Free Alt | API | Automation | Learning Curve |
|---|---|---|---|---|---|---|
| LinkedIn Sales Navigator | Advanced role/company search + saved lead lists | ~$80/mo | Free LinkedIn search (limited filters) | No public API | HubSpot native integration | Medium |
| Phantombuster | Export LinkedIn search results, profiles, followers at scale | Free trial + paid | No OSS equivalent — carries LinkedIn ToS risk regardless of tool; Airscale/Instant Data Scraper (free tier) is the lowest-cost option available | Yes | Full scheduling | Medium |
| TexAu | LinkedIn scraping + enrichment automation chains | Free credits + paid | No OSS equivalent — carries LinkedIn ToS risk regardless of tool; Airscale/Instant Data Scraper (free tier) is the lowest-cost option available | Yes | Multi-step workflows | Medium |
| Evaboot | Clean, structured exports from Sales Navigator searches | Low–mid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | No | Upload-URL based | Low |
| Airscale | Budget Sales Navigator scraper (unlimited leads via extension) | Free/very low | This *is* the budget alt | No | Chrome extension | Low |
| Linked Helper | Desktop automation: profile visiting + saving + messaging | Trial + paid | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | No | Semi-automated | Medium |
| Waalaxy | LinkedIn leads + automated outreach sequencing | Paid | No OSS equivalent — carries LinkedIn ToS risk regardless of tool; Airscale/Instant Data Scraper (free tier) is the lowest-cost option available | Limited | Yes | Low |
| SalesQL | LinkedIn profile → email/phone enrichment | Low–mid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes | Chrome extension | Low |

---

## Tier 3 — Local Business / Google Maps Scraping

| Tool | Purpose | Pricing | Free Alt | API | Automation |
|---|---|---|---|---|---|
| Apify (Google Maps Scraper Actor) | Business name/phone/website/address/category at scale | Free + paid credits | Instant Data Scraper (manual, small batches) | Yes (Apify API) | Cloud scheduling |
| Outscraper | Maps + reviews + websites bulk export | Free credits + paid | Instant Data Scraper (Chrome, free) or a self-hosted Playwright/Puppeteer script via n8n's Code node | Yes | Yes |
| Instant Data Scraper (Chrome) | Any visible page table → export | Free | — this is the free option | No | Manual trigger |
| Octoparse | No-code scraping of Maps/directories | Free + paid | Instant Data Scraper (Chrome, free) or a self-hosted Playwright/Puppeteer script via n8n's Code node | Limited | Scheduled tasks |
| ParseHub | JavaScript-heavy / dynamic sites | Free + paid | Instant Data Scraper (Chrome, free) or a self-hosted Playwright/Puppeteer script via n8n's Code node | Yes | Scheduled |

---

## Tier 4 — Email Finding & Verification

| Tool | Purpose | Pricing | Free Alt | API |
|---|---|---|---|---|
| Hunter.io | Find emails by domain/name | Free (25/mo) + paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes |
| Prospeo | Cheap email + LinkedIn enrichment | Low paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes |
| FindThatLead | Website/LinkedIn email finder | Free + paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes |
| VoilaNorbert | High-accuracy email finding | Paid | No OSS equivalent for paid contact/lead databases — stack free tiers (e.g. Hunter.io 25/mo, Snov.io free tier) instead of one paid tool | Yes |
| NeverBounce | Bulk email verification | Paid | check-if-email-exists (OSS CLI/API, self-hosted SMTP verification) | Yes |
| ZeroBounce | Verification + scoring | Free trial + paid | check-if-email-exists (OSS CLI/API, self-hosted SMTP verification) | Yes |
| BriteVerify | Enterprise-scale verification | Paid | check-if-email-exists (OSS CLI/API, self-hosted SMTP verification) | Yes |

**Data quality rule (applies across all of the above):** never send to an unverified email — bounce rates above ~3% should trigger a pause-and-clean cycle. Verification connects forward to [10 Lead Verification](../10 Lead Verification/README.md).

---

## Tier 5 — Custom / Developer Scraping Stack

| Library/Tool | Use | Best For |
|---|---|---|
| `requests` / `aiohttp` | Fetch HTML pages | Fast static scraping |
| BeautifulSoup | Parse HTML | Simple site scraping |
| lxml | Fast HTML/XML parsing | Large datasets |
| Selenium | Browser automation | Login-based / dynamic sites |
| Playwright | Modern browser automation | Anti-bot-heavy sites |
| pandas | Clean & structure output | Deduplication, formatting |
| Scrapy | Full scraping framework | Large recurring crawl jobs |

---

## Tier 6 — Automation / Orchestration Layer

| Tool | Purpose | Pricing | Notes |
|---|---|---|---|
| Clay ⭐ | Full enrichment + scraping + AI in one no-code pipeline | Paid | Best for advanced outbound systems combining multiple sources |
| Zapier / Make (n8n as OSS alt) | Move data between scraping tools, sheets, and CRM | Free tier + paid | n8n (self-hosted, free/OSS) is the automation-engineer-friendly substitute |
| Apify | Cloud-hosted scraping Actors for dozens of sites (Crunchbase, Clutch, G2, job portals) | Free + paid credits | Broadest pre-built Actor library |

---

## Recommended Stacks

### Low-Budget Stack (Start Mode)
| Purpose | Tool |
|---|---|
| Company scraping | Apify / Instant Data Scraper |
| Founder scraping | LinkedIn (manual) + Phantombuster trial |
| Email finding | Hunter/Snov free tier |
| Verification | ZeroBounce trial |
| Storage | Google Sheets / Notion |

### Professional Stack (Scale Mode)
| Purpose | Tool |
|---|---|
| Lead database | Apollo.io |
| Founder targeting | Sales Navigator |
| Automation | Clay + Phantombuster |
| Outreach handoff | Smartlead / Instantly (see [16 Email Outreach](../16 Email Outreach/README.md)) |
| CRM | HubSpot / Zoho |

### Budget Alternatives to Premium Platforms
| Instead of | Use | Saves roughly |
|---|---|---|
| ZoomInfo | Apollo.io, RocketReach, Snov.io | 70–90% |
| Sales Navigator native export | Airscale, Evaboot, Linked Helper | 70–90% |
| Crunchbase Pro bulk export | Apify Crunchbase Actor, ParseHub, Octoparse | 70–90% |
| Native Apollo export limits | Apollo Exporter (Chrome), Aoleads, third-party pay-per-lead export services | Varies |

---

## Cross-References

- Stage README: [README.md](README.md)
- Method-by-method usage: [methods.md](methods.md)
- Automation pipelines using these tools: [automation.md](automation.md)
- Website/registry library: [resources.md](resources.md)
