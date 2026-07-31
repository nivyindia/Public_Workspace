# n8n Automation Index — All 54 Stages

> Companion to [IMPLEMENTATION-PLAN.md](IMPLEMENTATION-PLAN.md). This file is the single cross-stage map of **what n8n (or another open-source tool) can concretely automate at each stage, real template links to start from, and what must stay human** — so nothing in the 54-stage funnel is left without an automation verdict, even where the stage's own `automation.md` is still pending full pilot-depth content (see Section 3).

**How to use this file:** each stage links to a real n8n.io template category (always current, since n8n's library changes daily) plus 1–2 specific templates found and verified at build time. Specific template IDs get taken down or renamed over time — if a direct link 404s, use the category link and search the stage's keyword; that reliably surfaces an equivalent.

**Core OSS stack referenced throughout** (matches [Nivy Automation Architecture](../../../areas/odoo-n8n-funnel-automation.md) already agreed): n8n (orchestration) · Odoo Community (CRM/ERP/Accounting) · PostgreSQL · Mautic (marketing automation) · Mailcow (email infra) · Cal.com (scheduling) · Chatwoot (support inbox) · Documenso (OSS e-signature) · Metabase (BI/dashboards) · NocoDB/Baserow (lightweight airtable-style DB where Odoo is overkill) · Ollama/Open WebUI (self-hosted LLM for AI-assist steps where sending data to a paid API isn't wanted) · Evolution API/Wuzapi (WhatsApp) · Rocket.Chat (internal team chat).

**n8n's official live libraries** (browse directly, always current):
- All workflows: https://n8n.io/workflows/
- Lead Generation (748+ templates): https://n8n.io/workflows/categories/lead-generation/
- CRM (452+ templates): https://n8n.io/workflows/categories/crm/
- Support (929+ templates): https://n8n.io/workflows/categories/support/
- Community template mega-repo (GitHub, importable JSON): https://github.com/Zie619/n8n-workflows

## 0. Reference Collection (second, curated source)

Alongside n8n.io's live library above, use **[enescingoz/awesome-n8n-templates](https://github.com/enescingoz/awesome-n8n-templates)** (280+ free, ready-to-import JSON templates, curated by category — Gmail/Email, WordPress, Slack, Notion, PDF/Document Processing, Database/Storage, etc.) as a second, curated source when a stage needs a specific pre-built workflow rather than a category browse. Every template link added to a stage's own `automation.md` in this batch was sourced from n8n.io directly or from this collection.

> **Correction note (batch 1 pass):** this section originally referenced `nivyindia/all_n8n_templates_collection` as the second source. That repository could not be found on GitHub as of this pass — it does not appear to exist publicly. `enescingoz/awesome-n8n-templates` is linked above instead, since it's the actual repo the individual template links below resolve to. If `nivyindia/all_n8n_templates_collection` is a private fork or was renamed, swap this line for the correct URL — don't leave the old name unlinked.

---

## 1. Automation Feasibility Legend

| Flag | Meaning |
|---|---|
| 🟢 **High** | 70–100% automatable end-to-end with n8n + APIs/scrapers; human only reviews exceptions. |
| 🟡 **Partial** | Data movement/triggers/reminders automate well, but the core judgment step (writing, negotiating, deciding) stays human. n8n's job is to remove the admin around that human step, not replace it. |
| 🔴 **Low** | Fundamentally a human-relationship or legal-judgment activity. Automation is limited to logging, reminders, and prep — attempting more produces generic or risky output (e.g., AI-negotiated contract terms). |

---

## 2. Stage-by-Stage Map

### Batch 1 — Research & Targeting (01–05) 🟢 fully built at pilot depth already
| # | Stage | Flag | n8n template(s) | OSS / tool notes |
|---|---|---|---|---|
| 01 | Market Research | 🟡 | Scheduled HTTP Request + AI summarization of industry news/reports → Notion/Sheets. Category: [Lead Generation](https://n8n.io/workflows/categories/lead-generation/) (search "market research AI") | Ollama/Open WebUI for private summarization instead of sending competitor data to a paid LLM API. |
| 02 | ICP Definition | 🔴 | N/A — strategic definition, not a data pipeline | Store the finished ICP as a structured record (Odoo tag/segment) so *downstream* stages (05, 11, 12) can automate against it. |
| 03 | Buyer Persona | 🔴 | N/A — same as above | Same: output feeds Stage 22 (Personalization) as structured fields, not automated itself. |
| 04 | Competitor Research | 🟡 | Scheduled scrape of competitor pricing pages/G2 reviews → AI diff-summary → Slack. Search n8n.io for "competitor monitoring" | Apify "Website Content Crawler" Actor is the OSS-adjacent (free tier) scraper of choice. |
| 05 | Lead Source Selection | 🟡 | n/a (decision layer), but the *output* (source list) becomes automation.md's input for Stage 06 | — |

### Batch 2 — Extraction & Verification (06–10) 🟢 fully built at pilot depth already
| # | Stage | Flag | n8n template(s) | OSS / tool notes |
|---|---|---|---|---|
| 06 | Lead Extraction | 🟢 | [Lead generation agent](https://n8n.io/workflows/7423-lead-generation-agent/) (Apify + Gemini + Sheets); [Hunter.io + Perplexity enrichment](https://n8n.io/workflows/3616-automated-lead-generation-and-contact-enrichment-with-hunterio-and-perplexity-ai/) | Already fully documented in this stage's own `automation.md`. |
| 07 | Contact Discovery | 🟢 | Category: [Lead Generation](https://n8n.io/workflows/categories/lead-generation/) → search "email finder", "contact discovery" | Hunter.io/Snov.io free tiers + n8n HTTP Request node = no-cost pattern below ~50/day. |
| 08 | Lead Enrichment | 🟢 | Same Hunter+Perplexity template above generalizes directly to enrichment | Clearbit/Apollo API node → Odoo contact update. |
| 09 | Data Cleaning | 🟢 | Scheduled dedup workflow: Google Sheets/Postgres node → Code node (fuzzy-match on email+company) → flag duplicates → Slack digest | Fully scriptable in n8n's Code node (JS) with no paid API — genuinely free to run. |
| 10 | Lead Verification | 🟢 | ZeroBounce/NeverBounce HTTP Request node in a scheduled batch job | Free tier covers small volumes; batch verification avoids per-call cost creep. |

### Batch 3 — Scoring & CRM Foundation (11–15) 🟢 fully built at pilot depth already
| # | Stage | Flag | n8n template(s) | OSS / tool notes |
|---|---|---|---|---|
| 11 | Lead Scoring & Prioritization | 🟢 | Category: [CRM](https://n8n.io/workflows/categories/crm/) → search "lead scoring" | Rule-based scoring is a pure Code-node exercise in n8n; no paid tool required. |
| 12 | Lead Segmentation | 🟢 | Same CRM category, "segmentation" search | Odoo CRM tags updated by n8n on a schedule from the scoring output. |
| 13 | CRM Setup & Data Structuring | 🔴 (setup) / 🟢 (ongoing sync) | One-time setup isn't a workflow; ongoing field sync is: search "CRM sync", "duplicate CRM contact" | Odoo Community's own API + n8n's native Odoo-compatible HTTP node. |
| 14 | List Building & List Management | 🟢 | "Google Sheets to CRM sync" template family (see Neogen Media roundup pattern) | NocoDB as the OSS list layer if Odoo's list views feel heavy. |
| 15 | Outreach Channel Strategy | 🔴 | N/A — strategic decision | Output (channel mix) becomes config for Stages 16–21's workflows, not a workflow itself. |

### Batch 4 — Outreach Execution (16–21) 🟢 fully built at pilot depth already
| # | Stage | Flag | n8n template(s) | OSS / tool notes |
|---|---|---|---|---|
| 16 | Email Outreach | 🟢 | Category search "cold email sequence"; ["Form-to-pipeline" + follow-up chain pattern](https://neogenmedia.com/blog/n8n-workflow) | Mailcow (self-hosted SMTP) + n8n Wait/IF nodes = zero-cost sequencing vs. Instantly/Lemlist. |
| 17 | LinkedIn Outreach | 🟡 | Category: [Lead Generation](https://n8n.io/workflows/categories/lead-generation/) → "LinkedIn" search | Automation risk here is real (LinkedIn account bans) — see 🔴 caveat in stage's own checklists.md; keep humans in the send-loop for connection requests. |
| 18 | Cold Calling | 🔴 | Only the *dialer queue/logging* automates (Aircall/CRM webhook → Odoo activity log); the call itself is human | — |
| 19 | WhatsApp Outreach | 🟢 | Evolution API/Wuzapi + n8n HTTP node — fully scriptable send/receive | Watch WhatsApp's own anti-spam policies; template messages need pre-approval. |
| 20 | SMS Outreach | 🟡 | Twilio node in n8n for transactional/confirmation SMS only | Cold/unsolicited SMS is a compliance risk in most target markets (US/UK/UAE/AU) — scope narrowly, per this stage's own automation.md. |
| 21 | Multi Channel Sequencing | 🟢 | n8n's own Merge/Switch nodes orchestrate 16+17+19+20 into one sequence — this stage's entire job is exactly what n8n is built for | — |

### Batch 5 — Messaging & Qualification (22–27) 🟢 fully built at pilot depth already
| # | Stage | Flag | n8n template(s) | OSS / tool notes |
|---|---|---|---|---|
| 22 | Personalization & Copywriting | 🟡 | AI-draft step (OpenAI/Claude/Ollama node) generates a first draft per lead; human reviews before send | Genuinely AI-assisted, not AI-autonomous — keep a review gate. |
| 23 | Deliverability & Domain Health | 🟢 | Scheduled DNS/blacklist check (SPF/DKIM/DMARC lookup via HTTP Request) → Slack alert if degraded | Mailcow exposes these natively; n8n just needs to poll and alert. |
| 24 | Follow Up Systems | 🟢 | Wait + IF (no-reply-after-X-days) branching — a textbook n8n pattern | — |
| 25 | Reply Handling & Triage | 🟢 | Category: [Support](https://n8n.io/workflows/categories/support/) → "ticket categorization"/"email triage" pattern (AI classifies intent → routes) | Chatwoot or a shared inbox + n8n webhook for triage. |
| 26 | Objection Handling | 🔴 | Only the *library lookup* automates (n8n serves the matched rebuttal doc to the rep); the conversation is human | — |
| 27 | Qualification (BANT/MEDDIC) | 🟡 | Structured form/call-notes → n8n scores against BANT/MEDDIC fields → CRM update | The scoring math automates; the discovery conversation that produces the inputs doesn't. |

### Batch 6 — Sales Cycle (28–37) 🟢 fully built at pilot depth already
| # | Stage | Flag | n8n template(s) | OSS / tool notes |
|---|---|---|---|---|
| 28 | Discovery Call Scheduling | 🟢 | Cal.com's own webhook → n8n → CRM + calendar + reminder sequence | Fully OSS: Cal.com replaces Calendly with no automation loss. |
| 29 | Discovery Call Execution | 🔴 | Only recording/transcription/note-sync automates (e.g., a transcript webhook → AI summary → CRM); the call is human | — |
| 30 | Needs Analysis | 🟡 | AI summarizes call transcript into structured needs fields → CRM | — |
| 31 | Solution Mapping | 🔴 | N/A — expert judgment | — |
| 32 | Demo & Presentation | 🟡 | Scheduling/reminder/asset-delivery automates; the demo itself is human | — |
| 33 | Proposal Creation | 🟢 | Template-merge workflow: CRM data → doc template (Google Docs API/PandaDoc-equivalent) → auto-send | Documenso (OSS) for the e-sign step that follows. |
| 34 | Pricing & Packaging | 🔴 | N/A — strategic/negotiated | Price *list* lookup can automate; the packaging decision doesn't. |
| 35 | Negotiation | 🔴 | N/A — human judgment, high stakes | Automating language here risks legally binding mistakes — logging only. |
| 36 | Contract & Legal | 🟡 | Documenso webhook (signed/unsigned status) → n8n → CRM stage update + Slack/Email notify | Contract *drafting/terms* stays human/legal-reviewed; status-tracking automates fully. |
| 37 | Closing Techniques | 🔴 | N/A — human skill | — |

### Batch 7 — Deal-to-Delivery (38–46) 🟡 **partially built — see gap below**
| # | Stage | Flag | n8n template(s) | OSS / tool notes | automation.md status |
|---|---|---|---|---|---|
| 38 | Deal Desk & Approval Workflows | 🟢 | Category: [CRM](https://n8n.io/workflows/categories/crm/) → "approval workflow"; Slack/Email approve-reject buttons via n8n's Form/Webhook nodes | Odoo's own approval chains + n8n as the notification layer | ⬜ **pending pilot-depth build** |
| 39 | Payment & Invoicing | 🟢 | [QuickBooks/Stripe invoice automation family](https://www.intuz.com/blog/best-n8n-workflow-templates/) — same pattern applies to Odoo Accounting | Odoo Invoicing (native) + n8n for payment-reminder sequences and Stripe/Razorpay webhook → CRM update | ⬜ **pending pilot-depth build** |
| 40 | Client Onboarding | 🟢 | ["Contract signed" trigger chain](https://medium.com/@ciphernutz/10-plug-and-play-n8n-workflow-templates-you-can-use-immediately-15507a7a4da3): Notion/Odoo project creation → Drive/Nextcloud folder → welcome email → kickoff scheduling | This exact pattern is the highest-ROI n8n build in the whole 54-stage funnel — fully OSS-stackable | ⬜ **pending pilot-depth build** |
| 41 | Kickoff & Expectation Setting | 🟡 | Scheduling + agenda-doc generation automates; the kickoff conversation is human | — | ⬜ **pending pilot-depth build** |
| 42 | Implementation & Delivery Setup | 🟡 | Project/task creation in Odoo Project via n8n from the signed-scope doc; execution itself is delivery-team work | — | ⬜ **pending pilot-depth build** |
| 43 | Account Management | 🟡 | Scheduled health-check digest (usage/ticket/NPS data merged) → CSM Slack alert | Metabase for the underlying dashboard | ⬜ **pending pilot-depth build** |
| 44 | Customer Success Planning | 🟡 | Milestone-tracking reminders automate; the plan itself is human-authored | — | ⬜ **pending pilot-depth build** |
| 45 | Product & Service Adoption | 🟡 | Usage-threshold trigger → nudge email/task | — | ✅ built at pilot depth |
| 46 | Support & Issue Resolution | 🟢 | Category: [Support](https://n8n.io/workflows/categories/support/) (929+ templates) — ticket triage/categorization/routing is one of n8n's deepest template categories | Chatwoot (OSS helpdesk) + n8n for routing/escalation | ✅ built at pilot depth |

### Batch 8 — Retention & Growth (47–54) 🟡 **partially built — see gap below**
| # | Stage | Flag | n8n template(s) | OSS / tool notes | automation.md status |
|---|---|---|---|---|---|
| 47 | Upsell Identification | 🟢 | Usage/spend-threshold trigger → CRM opportunity creation | — | ✅ built at pilot depth |
| 48 | Cross Sell Strategy | 🟡 | Trigger automates; the offer design is human | — | ✅ built at pilot depth |
| 49 | Renewal Management | 🟢 | Contract-end-date lookup → reminder cascade (90/60/30/7-day) → CRM task | Classic n8n Schedule Trigger + IF pattern | ✅ built at pilot depth |
| 50 | Churn Prevention | 🟡 | [Health-scoring workflow pattern](https://goodspeed.studio/blog/n8n-workflow-examples-for-saas-companies) (usage+billing+ticket+NPS merge → risk flag → CSM alert) | This is a well-documented, near-turnkey n8n pattern — see link | ⬜ **pending pilot-depth build** |
| 51 | Customer Feedback & NPS | 🟢 | Scheduled NPS survey send (Typeform/native form) → sentiment scoring (AI node) → Metabase dashboard | — | ⬜ **pending pilot-depth build** |
| 52 | Case Studies & Testimonials | 🔴 | Only the *request trigger* automates (high-NPS score → auto-send testimonial request); writing the case study is human | — | ⬜ **pending pilot-depth build** |
| 53 | Referral Programs | 🟢 | Referral-link generation + reward-trigger (referred deal closed → CRM webhook → payout task/coupon email) | Odoo's affiliate/loyalty modules + n8n as the trigger layer | ⬜ **pending pilot-depth build** |
| 54 | Advocacy | 🔴 | N/A — relationship-driven; only outreach-timing reminders automate | — | ⬜ **pending pilot-depth build** |

---

## 3. Honest Gap Report (the part of "nothing left behind" that matters most)

Per [IMPLEMENTATION-PLAN.md § 5](IMPLEMENTATION-PLAN.md), **12 of 54 stages do not yet have their own `automation.md`/`methods.md`/`tools.md`/etc. built to the Stage-06 pilot depth** — right now they only have the skeleton file + this index's summary row above:

- **Batch 7 remainder:** 38 Deal Desk & Approval Workflows, 39 Payment & Invoicing, 40 Client Onboarding, 41 Kickoff & Expectation Setting, 42 Implementation & Delivery Setup, 43 Account Management, 44 Customer Success Planning (7 stages × 9 files = 63 files)
- **Batch 8 remainder:** 50 Churn Prevention, 51 Customer Feedback & NPS, 52 Case Studies & Testimonials, 53 Referral Programs, 54 Advocacy (5 stages × 9 files = 45 files)

**That's 108 files across 12 stages still needed to bring the whole funnel to one consistent depth.** Each of those stages, once built, will get the same full treatment as Stage 06 — methods/tools/automation/checklists/templates/resources/faq/references — not just the one-line summary in the table above. This index closes the gap partially (every stage now has *a* documented automation verdict + real template link), but it is not a substitute for the full per-stage files the rest of the repo has.

**Recommended next action:** continue the existing batch cadence (this index + a Batch 9 session builds 38–44 to full pilot depth; Batch 10 builds 50–54) rather than trying to force all 108 files into a single pass — the existing session log shows ~1 batch (~5–9 stages) per work session holds quality; rushing it is how the placeholder/generic-content problem shows up.

---

## 4. What Genuinely Cannot Be Automated (funnel-wide pattern, not stage-specific)

Repeated across almost every batch above, so stated once here instead of 20 times: n8n (or any tool) cannot automate a **negotiation, a discovery conversation, a demo, an objection-handling exchange, a closing conversation, a contract's actual terms, or a case study's actual narrative** — these are judgment/relationship activities. What automates well around every one of them is identical: the *scheduling*, *reminding*, *data capture into CRM*, *status tracking*, and *follow-up sequencing* that surrounds the human moment. Trying to push automation past that line (e.g., an AI-negotiated contract clause, an AI-run cold call) is where this kind of build creates real business risk rather than saving time — flagged 🔴 above wherever that applies.

---

## Cross-References
- Master plan and per-batch status: [IMPLEMENTATION-PLAN.md](IMPLEMENTATION-PLAN.md)
- Funnel overview: [README.md](README.md)
- Pilot depth example: [06 Lead Extraction/automation.md](06%20Lead%20Extraction/automation.md)
