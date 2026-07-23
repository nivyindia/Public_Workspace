# Automation — 06 Lead Extraction

> Part of Stage 06 (Lead Extraction). See [README.md](README.md) for the stage overview.

For each method family below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. LinkedIn Extraction

| Level | Workflow |
|---|---|
| **Manual** | VA runs Boolean search, reviews each profile, hand-enters into CRM. See [SOP pattern](methods.md#linkedin-boolean-search). |
| **Semi-automated** | Sales Navigator saved searches + Phantombuster "LinkedIn Search Export" Phantom scrapes result pages into CSV; VA still manually QCs before CRM import. |
| **Fully automated** | Scheduled Phantombuster/TexAu workflow runs daily, exports directly to a Google Sheet via its native integration, then a Zapier/Make/n8n flow pushes new rows into the CRM API, tagging Source="linkedin" automatically. |
| **AI-assisted** | An LLM step (Claude/GPT) pre-classifies each scraped profile against the ICP (title match, seniority, company-size plausibility from headline text) and only forwards passing rows to CRM import — cutting manual review time. |

**Required:** LinkedIn/Sales Navigator seat · Phantombuster or TexAu account · Google Sheets or CRM API access · optional n8n instance for the push step.
**Expected output:** de-duplicated CSV/CRM rows tagged `source=linkedin`.
**Common errors:** LinkedIn rate-limiting/soft-blocking accounts that scrape too aggressively (mitigate: cap daily automated actions, use warmed/aged accounts, add randomized delays); Boolean strings returning 0 results (recovery: simplify to 2 keyword groups).

---

## 2. Google Maps Extraction

| Level | Workflow |
|---|---|
| **Manual** | VA searches `[business type] in [city], [country]`, manually reviews, enters CRM. See [SOP pattern](methods.md#google-maps-search). |
| **Semi-automated** | Instant Data Scraper (Chrome) pulls the visible results table per search into CSV; VA still does the LinkedIn cross-reference for a named contact. |
| **Fully automated** | Apify's Google Maps Scraper Actor run against a list of `[category] + [city]` query combinations, scheduled, output piped to a webhook → n8n → CRM. |
| **AI-assisted** | LLM step matches scraped business category text to the ICP's industry taxonomy (handles messy/inconsistent category labels from Maps listings) before rows are accepted. |

**Required:** Apify account + Google Maps Scraper Actor (or Outscraper) · webhook/n8n for CRM push.
**Expected output:** business rows with name/phone/website/address, ICP-matched category.
**Common errors:** franchise/multinational locations slipping through (recovery: add a company-size or brand-name exclusion list); missing contact anchor (recovery: reject rows with neither phone nor website rather than importing dead leads).

---

## 3. Apollo / Database Sourcing

| Level | Workflow |
|---|---|
| **Manual** | VA sets filters, manually reviews first page, exports CSV, manually dedupes in Sheets. See [SOP pattern](methods.md#apollo-database-sourcing). |
| **Semi-automated** | Saved Apollo search + scheduled export; a Sheets formula or Python script flags duplicates against the existing CRM export before human sign-off. |
| **Fully automated** | Apollo API called on a schedule with a saved filter payload; results streamed through a Python dedup script (matching on email + normalized company name) and written directly to the CRM via its API. |
| **AI-assisted** | LLM reviews a sample of the pulled batch for ICP-fit plausibility (title/seniority/company description alignment) as an automated QC gate before the batch is marked ready for Stage 07. |

**Required:** Apollo paid plan with API access · Python (pandas) for dedup logic, or Clay for a no-code equivalent · CRM API credentials.
**Expected output:** net-new, deduplicated leads tagged `source=apollo`.
**Common errors:** bulk-exporting without review (recovery: always sample-check the first 10–20 rows before scaling a saved search); duplicate re-import on repeated runs of the same saved search (recovery: dedupe against the full CRM history, not just the current session's export).

---

## 4. Job Portal / Hiring-Intent Scraping

| Level | Workflow |
|---|---|
| **Manual** | VA browses LinkedIn Jobs/Naukri/Indeed manually, copies company + role + location. |
| **Semi-automated** | Apify LinkedIn Jobs Scraper or Octoparse (Naukri) run on-demand for a target query, output reviewed before enrichment. |
| **Fully automated** | Scheduled Apify Actor run daily across a list of target job-title keywords → output piped into an enrichment step (Apollo/SalesQL/RocketReach API) that resolves the hiring company's decision-maker automatically → CRM push. |
| **AI-assisted** | LLM classifies each job posting by department/urgency (e.g., "hiring 3x Finance roles" → high-intent Accounting-services lead) and ranks the daily batch before it reaches outreach planning ([15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md)). |

**Required:** Apify (LinkedIn Jobs/Indeed Actors) or Octoparse (Naukri/Glassdoor) · an enrichment API (Apollo/SalesQL/RocketReach) chained via n8n/Zapier/Make.
**Expected output:** company + hiring signal + resolved decision-maker contact.
**Common errors:** scraping expired/stale postings (recovery: filter to postings within the last 7–14 days); enrichment API returning no match for smaller companies (recovery: fall back to LinkedIn manual cross-reference for unmatched rows).

---

## 5. Directory / Review-Site Extraction (Clutch, G2, Crunchbase, etc.)

| Level | Workflow |
|---|---|
| **Manual** | VA browses the directory, copies company + category + description. |
| **Semi-automated** | Apify's purpose-built Actor for the specific site (Crunchbase, Clutch, G2, Yelp) run against a category/search-URL, output reviewed. |
| **Fully automated** | Scheduled Actor run + n8n push to CRM, with a Python/pandas dedup pass against existing CRM rows on company name + domain. |
| **AI-assisted** | LLM summarizes each company's listed description into a 1-line ICP-relevance note (populates the Notes field automatically) instead of a human writing it manually. |

**Required:** Apify (site-specific Actor) or Octoparse/ParseHub for sites without a pre-built Actor.
**Expected output:** company rows with category/description context, tagged `source=directory:<sitename>`.
**Common errors:** directory sites changing their page structure and breaking a scraper template (recovery: monitor for silent zero-result runs and alert; rebuild the selector/Actor config when the site changes).

---

## Cross-Stage Automation Note

The output of every workflow above should land in the CRM in the schema defined in [README.md § Data Structure](README.md#8-data-structure) so that Stage 07 (Contact Discovery), Stage 08 (Enrichment), and Stage 09 (Data Cleaning) can consume it without a reformatting step. Building the schema mapping once, at the automation layer, avoids repeated manual reformatting at every stage boundary.

## Recovery Principles (General)

- **Silent failure is the biggest risk in automated extraction** — always alert on a run that returns 0 or near-0 results (usually means a selector broke, a login expired, or a platform is soft-blocking the account) rather than assuming "just a quiet day."
- **Rate-limit conservatively on any account-based scraping** (LinkedIn, Sales Navigator) — an account ban costs far more than the time saved by scraping faster.
- **Keep a raw, unprocessed copy of every extraction batch** before dedup/cleaning runs, so a bad automated cleaning pass can be rolled back.

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods referenced above: [methods.md](methods.md)
- Tools referenced above: [tools.md](tools.md)
- QC gates before CRM write: [checklists.md](checklists.md)
