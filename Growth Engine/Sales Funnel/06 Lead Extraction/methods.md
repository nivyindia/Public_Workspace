# Methods — 06 Lead Extraction

> Part of Stage 06 (Lead Extraction). See [README.md](README.md) for the stage overview.

Full method coverage across traditional, modern, AI, manual, automated, API, browser automation, scraping, public database, government, community, and referral approaches.

---

## Method Coverage Checklist

- [x] Traditional methods (directories, referrals, chambers of commerce)
- [x] Modern methods (lead databases, Sales Navigator, review sites)
- [x] AI methods (agentic browsing, LLM-assisted search generation)
- [x] Manual methods (LinkedIn search + review, Google Maps search)
- [x] Automated methods (Apollo bulk export, cloud scrapers)
- [x] API methods (Apollo API, Clearbit, People Data Labs)
- [x] Browser automation (Playwright, Selenium, Phantombuster, TexAu)
- [x] Scraping (Apify, Octoparse, ParseHub, custom Python)
- [x] Public databases (Crunchbase, Product Hunt, G2)
- [x] Government sources (Companies House, ABR/ASIC, IRS EIN, Dubai Chamber)
- [x] Community sources (LinkedIn/industry groups, associations)
- [x] Referral methods (partner/JV lead sharing, existing client referrals — see also [53 Referral Programs](../53 Referral Programs/README.md))

---

## A. Manual Methods

### LinkedIn Boolean Search {#linkedin-boolean-search}

**When to use:** Founder/CEO/Director-level targeting where LinkedIn's own search + manual judgment outperforms a database's stale records. **Skill level:** Beginner–Intermediate.

**Workflow:**
1. LinkedIn → Search → "People" filter → "All Filters"
2. Set: Connections = 2nd degree (warmer, better reply rate) · Location = target market · Industry = assigned vertical · Title keywords using a Boolean pattern
3. Boolean string patterns that work well (keep to 2–3 keyword groups — overly complex strings return zero results):
   - `(Founder OR CEO OR Owner) AND (marketing agency OR digital agency)`
   - `(Director OR Head) AND (accounting OR finance OR bookkeeping)`
   - `(Founder OR CEO) AND (SaaS OR software OR tech startup)`
4. Review each profile (~30 sec/profile): is this a decision-maker? Is the company a real SME (not solo, not 1000+ employees)? Right market? Already in CRM (search before adding)?
5. Capture: Full Name, Job Title, Company Name, Profile URL, Location, Industry, Source="linkedin", Date Added, Owner, Status="New", 1-line Notes (a pain signal from their profile/recent post)
6. Enter into CRM same day; report count to Manager

**Output standard:** 20 qualified leads/day (junior) – 30/day (senior); zero duplicates; every field populated.

**Common mistakes:** padding numbers with unqualified leads; skipping the CRM duplicate check; blank Notes column; overly complex Boolean strings; capturing employees instead of decision-makers.

---

### Google Maps / Local Business Search {#google-maps-search}

**When to use:** Local/SME B2B targeting where a physical presence matters (accounting firms, agencies, clinics, retail-adjacent services). **Skill level:** Beginner.

**Workflow:**
1. maps.google.com → search query format: `[business type] in [city], [country]` — always city-specific, never broad ("accounting USA" returns poor results)
   - Examples: `accounting firm in Manchester, UK` · `digital marketing agency in Dubai, UAE` · `IT services company in Toronto, Canada`
2. Review each result (~30 sec): real business (not residential)? Matches assigned industry? SME-sized, not a mega-corp? Has phone or website?
3. Capture: Business Name, Phone, Website, Address, Maps URL, Industry/Category, Source="google_maps", Date Added, Owner, Status="New", Notes (rating, years in business, category tag)
4. **Cross-reference for a named contact:** search the business name on LinkedIn, find the Owner/Founder/Director, attach their profile URL — this converts an anonymous business listing into an outreach-ready lead
5. Enter into CRM, checking duplicates first

**Output standard:** 20 qualified leads/day; every lead has phone OR website; same-day entry.

**Common mistakes:** entering businesses with no contact info at all (unusable); skipping the LinkedIn cross-reference step; broad geographic searches; capturing franchise locations or multinationals that don't match the SME ICP.

---

## B. Automated / Database Methods

### Apollo.io / Lead Database Sourcing {#apollo-database-sourcing}

**When to use:** Bulk, filter-driven sourcing once the ICP is well-defined and volume matters more than hand-picked precision. **Skill level:** Intermediate.

**Workflow:**
1. Apollo → People Search → apply filters: Job Title (Founder, CEO, Owner, Director, Managing Director, Head of [Dept]) · Company Size (1–50 for SME range, or per ICP) · Location (target market) · Industry · optional Technology-Used filter
2. Manually review the first 10–20 results before exporting — do titles/company sizes actually match the ICP? Any obvious duplication in the result set?
3. Select and export as CSV (do not bulk-select all without reviewing)
4. In the spreadsheet, remove rows missing both email AND phone, junior titles (intern/analyst/student), and out-of-market entries
5. **Deduplicate before CRM import:** filter by email or company name against existing CRM; keep a "removed duplicates" audit tab
6. Format to match CRM headers exactly; set Status="New", Source="apollo"
7. Report to Manager: total pulled, duplicates removed, net new added

**Output standard:** net-new leads per daily target after dedup; zero duplicates in the import batch; Source always tagged "apollo".

**Common mistakes:** bulk-exporting without manual review of the first page of results; skipping deduplication (breaks CRM accuracy); exporting contacts with no email/phone; exceeding the daily target without approval.

Equivalent workflow applies to **ZoomInfo, Lusha, RocketReach, Snov.io** — the filter fields differ slightly per platform but the review → export → dedup → import sequence is identical.

---

## C. Job Portal / Hiring-Intent Scraping (High-Intent Method)

**Why this method is valuable:** a company actively hiring for Finance/Marketing/Tech/HR is signaling an active budget and an urgent operational gap — this consistently produces a higher reply rate than cold company lists.

**Data to capture:** Company Name · Job Title (signals which department has the need) · Location · Recruiter/HR Name · Company Website · Job Posting URL (proof of hiring intent)

**Sources & scrapers:**
| Portal | Scraper | What you get |
|---|---|---|
| LinkedIn Jobs | Apify LinkedIn Jobs Scraper, Phantombuster | Company, role, location, recruiter |
| Naukri.com | Octoparse | Company, HR contact, visible email |
| Indeed.com | Apify Indeed Scraper | Company list + job roles |
| Glassdoor | ParseHub | Hiring companies + titles |
| Monster | Web Scraper (Chrome) | Company + job info |

**Workflow:**
1. Scrape hiring companies (Apify/Octoparse/Phantombuster) → Company, Role, Location, Website
2. Enrich company → decision-maker (Apollo free tier, SalesQL, Snov.io, RocketReach) → Founder/HR Head/Finance Head + email/phone
3. Outreach with a hiring-aware hook, e.g.: *"Saw you're hiring for [X] — many growing companies outsource this instead of building the function internally."*

**Best paired with:** Sales Navigator's own "Hiring" filters, applied with: company headcount growth, active job postings, department = Finance/Marketing/Tech/HR, geography = target market.

---

## D. Website / Directory & Review-Site Extraction

**When to use:** Vertical directories (agencies, ISO-certified manufacturers, real estate) where the site itself is a pre-filtered list of your ICP. **Skill level:** Beginner–Intermediate depending on scraper.

- **Business directories (India-focused):** JustDial, IndiaMART, Sulekha, TradeIndia — free, search by category + city
- **Agency/service directories:** Clutch.co, GoodFirms, DesignRush, Agency Spotter, The Manifest, SortList — free browsing, useful for agency-to-agency partnership or service-buyer leads
- **Review sites as company lists:** G2, Capterra, Trustpilot — the reviewed *companies*, not the reviewers, are the lead list (useful for SaaS/software ICPs)
- **Startup/funding databases:** Crunchbase (funded startups, filter by round/date), Product Hunt (recently launched SaaS/tech), AngelList/Wellfound (early-stage hiring companies)

**Scraping tools that work across most of these:** Apify (has purpose-built Actors for Crunchbase, Clutch, G2, Yelp), Octoparse (no-code, good for any directory), ParseHub (best for JS-heavy dynamic sites), Web Scraper Chrome extension (free, static sites only).

---

## E. Public / Government Registry Methods

Fully legal, free, and authoritative — best used for company-level (not individual) data, then cross-referenced with LinkedIn for a named contact.

| Country | Registry | What you get |
|---|---|---|
| 🇬🇧 UK | Companies House | Every registered company, searchable by SIC code and size — free |
| 🇦🇺 Australia | ABR (Australian Business Register) / ASIC Connect | All registered businesses — free |
| 🇦🇪 UAE | Dubai Chamber of Commerce / Abu Dhabi Chamber / DED | Registered businesses, freezone company lists (partial public) |
| 🇺🇸 US | IRS EIN database, SEC EDGAR (public companies) | Registered business existence — free |
| 🇮🇳 India | MCA (Ministry of Corporate Affairs) portal | Registered company filings — free |

Full country-by-country playbooks (best sources, target titles, best channel, opening hook) are in [country-playbooks.md](country-playbooks.md).

---

## F. Community & Association Methods

- Industry associations: IAMAI, NASSCOM (India tech), Federation of Small Businesses / FSB (UK SME), AccountingWeb (UK accountants)
- LinkedIn/Slack/Discord industry groups — often gated but high-trust once inside
- Local business WhatsApp groups (India) — typically requires an existing-member introduction
- Event/conference attendee & exhibitor lists, badge-scan exports, webinar registrant lists — see also [Sub-stage 6G]

---

## G. API & Data Provider Methods

For teams with engineering resources or Clay-style no-code enrichment stacks: Apollo API, Clearbit API, Crunchbase API, People Data Labs, FullContact, ZoomInfo API. These provide structured, scalable, contract-governed access — the correct choice once manual/browser methods can't sustain the required volume. See [tools.md](tools.md) for pricing/access tiers.

---

## H. AI-Assisted Methods

- LLM-generated Boolean search strings and Apollo filter combinations from a plain-English ICP (see [README.md § AI Section](README.md#7-ai-section) for prompt examples)
- Agentic browser automation (Claude in Chrome, Playwright driven by an LLM controller) for directories with no pre-built scraper template
- AI-based classification of job-posting intent (which department, how urgent) to prioritize hiring-intent leads
- LLM-assisted cleaning/deduplication pass on messy CSV exports before CRM import

Full automation pipeline patterns (including where AI steps fit relative to deterministic scraping steps) are in [automation.md](automation.md).

---

## Legal & Ethical Map (Applies Across All Methods)

| Source type | Legal status | Notes |
|---|---|---|
| Hiring companies (job portals) | ✅ Fully legal | Scraping public job postings/career pages |
| Public professional profiles (LinkedIn + enrichment) | ✅ Legal | Public data, subject to each platform's ToS on automation |
| Government/public registries | ✅ Legal | Purpose-built for public access |
| Event/webinar registrant lists | ✅ Legal via consent | Only if attendee gave marketing consent at registration |
| Aggregated B2B databases (Apollo, ZoomInfo, Lusha) | 🟡 Legal via vendor ToS | Compliant when used within each vendor's terms |
| Cross-sell/resale via partner or ed-tech lead-sharing agreements | 🟡 Semi-legal, consent-based | Confirm consent basis before use |
| Leaked, stolen, or "database seller" lists (Telegram, call-center dumps) | ❌ Illegal / high risk | Never use — legal exposure and reputational risk far outweigh any short-term lead volume gain |

**GDPR/UK note:** for UK/EU targets, only contact people at a business email with a legitimate-interest basis, and always include an unsubscribe option in outreach (this connects to [16 Email Outreach](../16 Email Outreach/README.md) and [23 Deliverability and Domain Health](../23 Deliverability and Domain Health/README.md)).

---

## Cross-References

- Stage README: [README.md](README.md)
- Tool details for every method above: [tools.md](tools.md)
- Automation pipelines: [automation.md](automation.md)
- Country-specific stacks: [country-playbooks.md](country-playbooks.md)
- Previous stage: [05 Lead Source Selection](../05 Lead Source Selection/README.md)
- Next stage: [07 Contact Discovery](../07 Contact Discovery/README.md)
