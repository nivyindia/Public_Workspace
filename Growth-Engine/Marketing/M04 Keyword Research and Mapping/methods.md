# M04 — Methods

Each sub-stage below is described at four levels of effort. Start manual, graduate to semi-automated once volume justifies it — do not build the n8n workflow (see `automation.md`) before the manual version has been run at least once by a human, so the scoring logic is validated against real judgment first.

## M04.1 — Seed Keyword & Topic Discovery

- **Manual:** List every product/service term, ICP pain point phrase, and "job to be done" phrase from the M01 positioning doc and M03 pillars. Type each into Google, note autocomplete suggestions and the "People also ask" box.
- **Free-tool:** Run each seed through Google Keyword Planner (needs a Google Ads account, no spend required) and Google Trends for relative interest over time. Cross-check with Ubersuggest's free daily searches.
- **Automated:** n8n workflow hits an HTTP node against Ubersuggest/AnswerThePublic where an API or scrape endpoint is available, appends results to the tracker automatically (see `automation.md`).
- **AI-assisted:** Feed the M03 pillar list to an LLM and ask it to brainstorm long-tail variations and question-based phrasings a buyer at each funnel stage would type. Treat this as a first draft only — every AI-suggested keyword still needs a real search-volume check before it enters the tracker, since LLMs cannot verify current search volume themselves.

## M04.2 — Competitor Keyword Gap Analysis

- **Manual:** Search the top 5–10 phrases from M04.1 and note which competitor domains (from M02) appear repeatedly in positions 1–10.
- **Free-tool:** Google Search Console's "Performance" report (once the domain has query history) shows what the domain already ranks for near page 1–2 — cheap wins to prioritize. Screaming Frog's free tier can crawl a competitor's site structure to see what topics they've built pages around (crawl, don't scrape gated data).
- **Automated:** n8n scheduled workflow re-crawls the tracked competitor list monthly and diffs new pages/titles against the previous crawl, flagging new topics they've started targeting.
- **AI-assisted:** Paste a competitor's page titles/H1s into an LLM and ask it to categorize which pillar each maps to — speeds up manual gap-spotting, but a human confirms the categorization.

## M04.3 — Search Intent Classification

- **Manual:** For each keyword, actually look at the current top 5 SERP results — the format Google already ranks (blog post vs. product page vs. comparison table) is the most reliable intent signal, more reliable than guessing from the phrase alone.
- **Free-tool:** None needed beyond a browser — this is a judgment step.
- **Automated:** n8n can pull the top-5 result *types* via a SERP-scraping HTTP call and pre-tag likely intent (e.g., mostly product pages → transactional), but a human still confirms before it's locked in the tracker.
- **AI-assisted:** An LLM can suggest an intent label from the keyword phrase alone as a first pass; always override it with the SERP-based manual check above, since phrase-based guessing misses cases where Google's actual ranking behavior disagrees with the surface-level phrasing.

## M04.4 — Keyword-to-Funnel-Stage Mapping

- **Manual:** Informational intent → Awareness. Commercial-investigation intent → Consideration. Transactional/navigational intent → Decision. Apply this mapping consistently once M04.3 tags are set.
- **Automated:** A simple n8n/Airtable formula field derives funnel stage directly from the intent tag — no separate manual step needed once M04.3 is done well.

## M04.5 — Keyword-to-Content Mapping (Pillar/Cluster)

- **Manual:** Group related keywords under a single pillar topic (from M03); one pillar page targets the head term, cluster articles target the long-tail variants and interlink back to the pillar.
- **Checklist gate:** Before assigning a keyword to a *new* article, check it isn't already assigned to an existing URL — this is the single most common SEO content-planning mistake (keyword cannibalization) and gets its own checklist item in `checklists.md`.

## M04.6 — Prioritization & Tracking List

- **Manual scoring formula (no paid tool required):** Priority Score = (Business Relevance 1–5) × (Estimated Volume tier 1–5) ÷ (Estimated Difficulty tier 1–5). Business Relevance is a judgment call from the business owner/marketer — this is the one input no tool can substitute for.
- **Free-tool:** Google Keyword Planner's volume ranges and Search Console's existing-position data feed the Volume and Difficulty tiers.
- **Automated:** Once the tracker lives in Airtable/Notion, the Priority Score is a formula field that recalculates automatically as new data is entered.
