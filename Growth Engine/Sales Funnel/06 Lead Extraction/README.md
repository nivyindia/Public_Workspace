# 06 Lead Extraction

> **Stage 6 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ⭐ **Pilot — fully populated.** This is the quality template the remaining 53 stages will be built to match.

---

## Navigation

- ⬅ Previous stage: [05 Lead Source Selection](../05 Lead Source Selection/README.md)
- ➡ Next stage: [07 Contact Discovery](../07 Contact Discovery/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md) · [country-playbooks.md](country-playbooks.md)

---

## 1. Stage Overview

**Objective:** Convert a selected lead source (Stage 05) into a raw list of named companies and/or individuals that match the ICP, captured with enough identifying detail (name, company, location, profile URL, or listing URL) to be handed to Stage 07 (Contact Discovery) for email/phone resolution.

**Purpose:** Lead Extraction is the first point where the funnel produces a physical, storable asset — a row in a spreadsheet or CRM. Every later stage (enrichment, verification, outreach) depends on the accuracy and legality of what is captured here. A weak extraction stage (wrong ICP, unusable duplicates, no contact anchor) silently degrades every downstream conversion rate.

**Inputs:**
- Confirmed ICP (Stage 02) and Buyer Persona (Stage 03) — job titles, company size, industry, geography
- Selected lead source(s) from Stage 05 (e.g., LinkedIn, Google Maps, Apollo.io, a specific directory or job portal)
- Daily/weekly extraction target and assigned market from the Manager or campaign plan
- CRM/sheet access with the correct column schema (see [Data Structure](#8-data-structure))

**Outputs:**
- A deduplicated batch of qualified raw leads entered into the CRM/sheet with Status = "New" and Source correctly tagged
- A same-day count report (pulled / duplicates removed / net new)

**Expected Result:** A steady, source-tagged, duplicate-free stream of ICP-matching leads flowing into the CRM at the agreed daily/weekly volume, ready for Stage 07 contact resolution.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **6A** Search Engines | Google/Bing operator searches, "site:linkedin.com" style dorking, niche search engines |
| **6B** Business Directories | JustDial, IndiaMART, Yellow Pages (per country), Sulekha, TradeIndia |
| **6C** Agency / Service Directories | Clutch, GoodFirms, DesignRush, Agency Spotter, The Manifest, SortList |
| **6D** Startup & Funding Databases | Crunchbase, AngelList/Wellfound, Product Hunt |
| **6E** Communities | LinkedIn/Slack/Discord groups, Reddit niche subs, industry associations (IAMAI, NASSCOM) |
| **6F** Government & Public Registries | Companies House (UK), ASIC/ABR (Australia), Dubai/Abu Dhabi Chamber (UAE), IRS EIN / SEC EDGAR (US), MCA (India) |
| **6G** Events, Expos & Job Fairs | Conference attendee/exhibitor lists, badge-scan exports, webinar registrant lists |
| **6H** APIs & Data Providers | Apollo API, Clearbit, People Data Labs, Crunchbase API, ZoomInfo API |
| **6I** AI-Assisted Methods | LLM-assisted list building, AI-agent browsing/extraction, AI-classified job-posting intent signals |
| **6J** LinkedIn / Sales Navigator | Boolean search + manual review (see [SOP-VA-001 pattern](methods.md#linkedin-boolean-search)) |
| **6K** Google Maps / Local Business | Location + category search (see [SOP-VA-002 pattern](methods.md#google-maps-search)) |
| **6L** Lead Databases (Apollo, ZoomInfo, Lusha) | Filter-driven bulk export (see [SOP-VA-003 pattern](methods.md#apollo-database-sourcing)) |
| **6M** Job Portal / Hiring-Intent Scraping | LinkedIn Jobs, Naukri, Indeed, Glassdoor — hiring companies as high-intent leads |
| **6N** Review Site Company Extraction | G2, Capterra, Trustpilot — extracting the companies being reviewed, not the reviewers |

Full workflow detail, tools, and step-by-step SOPs for each sub-stage are in [methods.md](methods.md).

---

## 3. Complete Methods

Full breakdown — traditional, modern, AI, manual, automated, API, browser automation, scraping, public database, government, community, referral — is in **[methods.md](methods.md)**.

Country-specific source stacks (India, US, UK, UAE, Australia) are in **[country-playbooks.md](country-playbooks.md)**.

---

## 4. Complete Website Library

Full per-website breakdown (URL, category, countries, industries, pricing, API/export/scraping ability, pros/cons, alternatives) is in **[resources.md](resources.md)**.

---

## 5. Complete Tool Library

Full per-tool breakdown (purpose, pricing, OSS/free alternative, API/automation support, learning curve, docs) is in **[tools.md](tools.md)**.

---

## 6. Automation

Manual → semi-automated → fully automated → AI-assisted workflows, required tools/APIs/scripts, and error recovery are in **[automation.md](automation.md)**.

---

## 7. AI Section

**How AI can help:**
- Classifying scraped job postings by department/intent ("hiring for Finance" → target Accounting/CFO-services offer) instead of manual triage
- Generating and iterating Boolean search strings for LinkedIn/Apollo from a plain-English ICP description
- Deduplicating and normalizing messy exports (name casing, company name variants, phone formats) via an LLM pass before CRM import
- Using a browser-automation agent (e.g., Claude in Chrome, Playwright + LLM) to visit directory listing pages and extract structured fields when no scraper template exists
- Scoring extracted leads against ICP fit before they even reach Stage 11 (Lead Scoring), reducing wasted enrichment spend in Stage 08

**Prompt examples:**
```
"Given this ICP: [SME, 5-50 employees, US-based, Founder/CEO/Director titles,
industries: accounting, digital marketing, e-commerce], generate 8 Apollo.io
search filter combinations and 5 LinkedIn Boolean search strings to source
decision-maker leads. Exclude students, interns, and companies over 200 employees."
```
```
"Here is a raw CSV export of 200 Google Maps listings [paste data]. Extract
business name, phone, website, and city into clean columns. Flag any row that
is missing both phone and website as 'unusable — no contact anchor'."
```

**Agent workflows:** An agentic pipeline can chain: (1) generate search queries → (2) drive Playwright/Sales-Navigator or Apollo UI → (3) capture raw rows → (4) LLM-clean and dedupe → (5) write to CRM via API/MCP — with a human QC checkpoint before CRM write, per [checklists.md](checklists.md).

**RAG / vector database considerations:** Not typically needed at the extraction stage itself (this stage produces raw structured rows, not unstructured knowledge). RAG becomes relevant later, in Stage 08 Enrichment and Stage 26 Objection Handling, where firmographic/news context needs to be retrieved per lead.

**LLM recommendations:** Any current-generation model (e.g., Claude, GPT-4-class) is sufficient for search-string generation and data cleaning; this task does not require frontier reasoning models. Cost-sensitive teams can route bulk cleaning tasks to a cheaper/faster model tier and reserve larger models for ICP-fit scoring judgment calls.

**Automation opportunities:** See [automation.md](automation.md) for concrete n8n / Python / Apify Actor patterns.

---

## 8. Data Structure

### CRM / Sheet columns (mandatory)
`Full Name` (blank if company-only lead) · `Job Title` · `Company Name` · `Profile/Listing URL` · `Location (City, Country)` · `Industry` · `Source` · `Date Added` · `Assigned VA/Owner` · `Status` (New/Duplicate/Rejected) · `Notes` (1-line context)

### CRM / Sheet columns (optional, source-dependent)
`Phone Number` · `Website URL` · `Company Size` · `Google/Review Rating` · `Job Posting URL` (hiring-intent leads) · `LinkedIn Company Page`

### JSON schema (for API/automation pipelines)
```json
{
  "lead_id": "string (uuid)",
  "full_name": "string|null",
  "job_title": "string|null",
  "company_name": "string",
  "profile_url": "string|null",
  "website_url": "string|null",
  "phone": "string|null",
  "location": {"city": "string", "country": "string"},
  "industry": "string",
  "source": "string (e.g. linkedin | google_maps | apollo | job_portal)",
  "date_added": "ISO 8601 datetime",
  "assigned_owner": "string",
  "status": "new|duplicate|rejected",
  "notes": "string"
}
```

### Validation rules
- Every row must have **at least one** of: email, phone, or verified profile URL — a lead with none is unusable and should be rejected, not entered
- No entry without Company Name (person-only leads with no company context are rejected)
- Location must match the day's assigned target market
- Job title must match the ICP decision-maker list, not general staff

### Naming conventions
- Source field uses a fixed enum (`linkedin`, `google_maps`, `apollo`, `job_portal`, `directory:<name>`, `event:<name>`) — free text sources break downstream reporting
- Company name entered exactly as it appears on the source (no abbreviating) to make deduplication matching reliable

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates before any batch is submitted:
- [ ] Every lead passes the ICP hard-disqualifier check
- [ ] Zero duplicate rows (checked against CRM, not just within the new batch)
- [ ] Every lead has phone, email, or verified profile URL
- [ ] Notes field has at least one line of context per lead
- [ ] Source and Date Added correctly populated

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Qualified leads / day (manual, LinkedIn or Maps) | 20 per Intern, 30 per Executive | Per SOP-VA-001/002 pattern |
| Net new leads / day (Apollo/database sourcing) | Per assigned daily target, post-dedup | Per SOP-VA-003 pattern |
| Duplicate rate | < 5% of raw pull | Higher indicates poor pre-search CRM checking |
| Missing-contact-anchor rate | < 10% of raw pull | Leads with neither phone/email/URL should be rejected before entry, not counted |
| Same-day CRM entry rate | 100% | Leads scraped but not entered same day are effectively lost to follow-up decay |
| ICP-fit accuracy (QC sample audit) | > 90% | Manager samples 10% of daily batch against ICP criteria |

---

## 11. Templates

See [templates.md](templates.md) for CSV column templates, Boolean search string libraries, and the daily reporting message format.

---

## 12. Resources

See [resources.md](resources.md) (website library) and [tools.md](tools.md) (tool library).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [05 Lead Source Selection](../05 Lead Source Selection/README.md) — decides *which* of the sources below to use for a given campaign
- **Next stage:** [07 Contact Discovery](../07 Contact Discovery/README.md) — resolves email/phone for leads that were captured here without one
- **Also feeds:** [08 Lead Enrichment](../08 Lead Enrichment/README.md), [09 Data Cleaning](../09 Data Cleaning/README.md), [10 Lead Verification](../10 Lead Verification/README.md)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using operational SOPs already in production at Nivy Digital (SOP-VA-001/002/003, Data Sources & Databases Guide, International Lead Sources guide, and the Data Scraping Methods master doc), generalized here for a multi-vertical, multi-market B2B knowledge base. Pricing figures are approximate as of the source docs' last update (May 2026) and should be verified against vendor sites before operational use.
