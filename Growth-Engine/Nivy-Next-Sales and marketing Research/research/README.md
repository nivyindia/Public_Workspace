# Nivy Next Research Repository

This is the working repository for the Nivy Next Global Market Research program, structured per the Master Blueprint (`Nivy_Next_Global_Market_Research_Master_Blueprint.md`).

## Folder Structure & What Goes Where

| Folder | Contents | Roadmap Phase |
|---|---|---|
| `01-Foundation` | Blueprint, RACI, repo setup notes | Phase 1 |
| `02-Market-Intelligence/Country-Snapshots` | One file per country (USA, Canada, UK, Australia, UAE) | Phase 2 |
| `02-Market-Intelligence/Competitor-Benchmarking` | Competitor matrix, SWOT files | Phase 2 |
| `03-ICP-Buyer-Research/VoC-Interviews` | Interview notes/transcripts, coded | Phase 3 |
| `03-ICP-Buyer-Research/ICP-Cards` | One file per ICP per service line | Phase 3 |
| `04-Positioning-Offers` | Messaging house, value props, package/pricing sheets | Phase 4 |
| `05-Channels-Sales-Systems` | Outreach sequences, CRM setup notes, content calendar | Phase 5 |
| `06-Trust-Compliance` | Security policy, contract templates, compliance checklists | Phase 6 |
| `07-Metrics-Dashboards` | KPI definitions, dashboard specs | Ongoing |
| `08-Governance-Decision-Log` | Decision log, meeting notes | Ongoing |

## File Naming Convention
`YYYYMMDD_Module_Country(or-ALL)_ShortDescription_vX.md`
Example: `20260810_ICP_USA_SaaSStartups_v1.md`

## Live Tracker
`Nivy_Next_Progress_Tracker.xlsx` — the single source of truth for task status. Update this after every work session.

## Status
Phase 1 (Foundation) — Repo structure, RACI (proposed role structure), and blueprint approval are in place; progress tracker live in Excel. Task 1 (blueprint approval) and full Task 3 (real name assignments, not just proposed roles) still require founder action — the only true blockers left in Phase 1.
Phase 2 (Market Intelligence) — Complete: 5 country snapshots, competitor benchmarking (5 direct competitors + SWOT top 3), industry prioritization scoring. **Update 2026-08-08:** re-checked pricing by going directly to each competitor's own website (not just Clutch). Found a likely name-correction — the entry previously recorded as "Z Rankings" closely matches **EZ Rankings**' own published stats and services; EZ Rankings has full, real published SEO pricing ($225–$1,099/mo), a significantly lower floor than previously known. Eminenture and Fusion/FBSPL both confirmed genuinely quote-only on their own sites, but both carry a matching Clutch aggregate band ($1,000+ min. project, <$25/hr) for directional reference. Task 11 pricing is now close to complete for what desk research can surface — remaining gap is a human confirming the Z Rankings/EZ Rankings identity against the original source.
Phase 3 (ICP & Buyer Research) — All 8 ICP cards drafted (7 service-line + the Task 14 Accounting-Adjacent/Ops cross-sell card), VoC interview plan + question bank ready. Two secondary-research passes complete as an interim stand-in (public review evidence, then SMB survey data) — see `VoC-Interviews/`. Awaiting real interviews to validate (Tasks 22-24, action needed from founder/team per `Founding_Client_and_VoC_Bridge_Plan_v1.md`).
Phase 4 (Positioning & Offers) — Draft complete: messaging house, value propositions per ICP, 3-tier pricing for all 7 service lines, and country pricing corridors. All hypothesis-stage pending real deal/competitor pricing data.
Phase 5 (Channels & Sales Systems) — Draft complete: CRM pipeline framework, cold email + LinkedIn outreach sequences, keyword map by country, Q1 content calendar, and now **full copy for all 7 pillar articles + the cross-cutting pillar** (Task 43 — see `Pillar-Articles-FullCopy/`). Cross-cutting pillar Section 3 intentionally left as a founder-voice prompt rather than pre-written, per the outline's own flag. Outstanding and NOT fakeable: (1) actually selecting/configuring a CRM tool, (2) email domain warming/infra (Task 41 — technical setup), (3) connecting a real keyword tool (Ahrefs/Semrush) to validate these articles' SEO targeting, (4) the 3 case studies (Task 44) — genuinely blocked on real client interviews, which two of the new articles (AI & Automation, Video Editing) currently substitute with clearly-labeled illustrative examples.
Phase 6 (Trust & Compliance) — Draft v1 complete: Information Security Policy, Data Handling Policy (with regional compliance statements for all 5 target countries), Vendor Security Questionnaire Answer Bank, and MSA/SOW/NDA templates. All explicitly flagged NOT FOR USE until legal review. Two real gaps surfaced (not drafting tasks): cyber liability/E&O insurance not yet purchased, and governing-law/dispute-resolution jurisdiction undecided.
Phase 7 (Metrics & Dashboards) — Draft v1 complete: KPI_Definitions_Master.md (mirrors blueprint Deliverable 9) and Dashboard_Tool_Spec.md (recommends Notion + Looker Studio, pending founder approval). Hard-blocked from actual dashboard construction until Task 38 (CRM) is resolved — most KPI sources depend on it.
Phase 8 (Governance) — Decision log active and current. Tasks 52-53 (recurring review cadences) still need calendar invites sent — a founder action, not a drafting one.

**Cross-cutting blocker:** Phase 3 (VoC interviews) remains the true blocker for validating everything built on top of it — the longer that's delayed, the more downstream rework (messaging, pricing, sequences, content, and now the Accounting-Adjacent ICP's trust positioning) is likely once real client language comes in. As of this update, essentially everything that can be desk-drafted has been — remaining Not Started/blocked tasks are real-world execution items (tool purchases, legal review, scheduling, interviews), not research gaps.

**Update 2026-08-08 (v2 pass):** Closed several gaps that were previously waiting on ambiguous tool/data questions rather than genuine external blockers:
- **CRM (Task 38):** Tool choice resolved — Odoo, already the company-wide system of record. New `05-Channels-Sales-Systems/Odoo_CRM_Setup_Guide_v1.md` translates the tool-agnostic pipeline design into concrete Odoo configuration (stages, custom fields, automation rules, saved views). Remaining gap is implementing it in the live instance, not deciding what to implement.
- **Pricing (Tasks 30-36):** New `04-Positioning-Offers/Package_Pricing_AllServiceLines_v2.md` applies the real competitor pricing data found in the Task 11 benchmark. IT Services, AI & Automation, Web Development, and Graphic Design are now resolved (structural fix or validated-no-change). Digital Marketing, Video Editing, and Virtual Assistant are reduced from "needs research" to "needs one founder lane decision" — the doc lays out explicit options rather than a vague flag.
- **Dashboards (Task 50):** `Dashboard_Tool_Spec.md` updated to v2 — since CRM = Odoo, most KPIs can source from Odoo's native reporting/Spreadsheets directly, removing the Notion-sync dependency for everything except the two GA4 marketing KPIs (still Looker Studio).
- **Case studies (Task 44):** Still genuinely blocked on real client interviews — no way around that — but `05-Channels-Sales-Systems/Case_Study_Templates_v1.md` now provides a fill-in-ready structure, interview question bank, and placement plan so turnaround is fast once the first client agrees.
- **Cross-cutting pillar Section 3:** Deliberately left untouched — the outline's own reasoning for keeping it founder-voice-only (avoiding generic copy that doesn't sound like real founder reasoning) still holds, so this wasn't drafted around.
