# Implementation Plan — Marketing Funnel Knowledge Base (Track M)

> Master build plan and progress tracker for the 22-stage Marketing / Demand-Generation Knowledge Base. Update the tracker table at the end of every work session — same convention as the Sales Funnel's IMPLEMENTATION-PLAN.md.

---

## 1. Objective

Build all 22 Track M stages to the same depth the Sales Funnel used for its Stage 06 pilot: full `README.md` + `methods.md` + `tools.md` + `automation.md` + `checklists.md` + `templates.md` + `resources.md` + `faq.md` + `references.md` — mining your existing Growth Engine raw material (Growth Hacking Master List, SEO Keyword & Action Plan, Social Media Platform Playbooks, Referral/Viral Engine doc) wherever it already covers a stage, and writing fresh where it doesn't.

A second, standing objective specific to Track M: **every stage's `automation.md` and `tools.md` must default to free or open-source tools first**, with paid tools listed only as an optional upgrade path once volume justifies the cost. This is the opposite default from a typical martech stack recommendation, so it's called out explicitly here rather than left implicit.

## 2. Free / Open-Source Tool Stack (cross-stage reference)

This table is the shared tool reference every stage's `tools.md` will point back to, so the same tool isn't re-justified 22 times. Pricing/limits are marked "verify current" — free-tier limits change without notice.

| Function | Free / OSS tool | Notes | Paid upgrade path (later, optional) |
|---|---|---|---|
| Workflow automation | **n8n** (self-hosted, free) | Core automation layer for every M-W module below; you already have this for the sales side | n8n Cloud, or Zapier/Make if you don't want to self-host |
| Social scheduling (multi-platform) | **Postiz** (open-source, self-hosted) | OSS alternative to Buffer — no channel-count cap since it's self-hosted | Buffer (free tier caps at 3 channels — verify current), Publer |
| SEO keyword research | **Google Keyword Planner**, **Google Trends**, **Ubersuggest** (free tier, verify current daily-query cap) | Combine 2-3 free tools since each caps differently | Ahrefs/SEMrush once ranking budget exists |
| SEO rank tracking | **Google Search Console** (free, unlimited for owned domain) | This is the primary source of truth — always free | — |
| Technical SEO audit | **Screaming Frog** (free up to 500 URLs — verify current cap) | Fine for most SMB sites | Paid license past 500 URLs |
| Content repurposing (AI drafting) | **Claude.ai / ChatGPT free tier**, or a self-hosted open model via n8n's HTTP node | Draft-only — a human still reviews before publish, per Track M's own QC gate | Paid API tier once volume needs batch automation beyond free-tier rate limits |
| Analytics / reporting | **Google Analytics 4** + **Looker Studio** (both free) | GA4 free tier has no meaningful volume cap for most SMBs | — |
| Experiment tracking | **Airtable free tier** or **Notion free tier** (verify current record/block caps) | Either works for the Impact × Effort tracker in M18 | Airtable paid tier if you outgrow the free record cap |
| CRM (inbound bridge target) | **Odoo** (already in use per your existing n8n plan) or **Suite CRM** (fully OSS) if starting fresh | Matches the M-W5 bridge already scoped in your gap-analysis doc | — |
| Community hosting | **WhatsApp Business app** (free), **Discord** (free) | Both already fit your ICP's likely channels | Slack paid tiers only if you need more history/integrations |
| Email newsletter | **Mailchimp free tier** or self-hosted **Listmonk** (fully OSS) | Listmonk avoids the subscriber-count cliff Mailchimp free tiers tend to have — verify current terms either way | Paid ESP once list size or deliverability needs grow |

## 3. Recommended Pilot: M09 (Long-Form Content Production) → M10 (Content Repurposing Engine)

The Sales Funnel picked Stage 06 as its pilot because it was the connective stage with the strongest raw material already in the repo. The equivalent here is **M09 → M10**, for the same two reasons:

- **Raw material already exists**: your Content Marketing Calendar and the "Content Repurposing System" section already documented inside the Social Media Playbooks doc — both referenced directly in your gap-analysis doc as existing but unwired.
- **It's the connective stage**: M10's output is what every social-channel stage (M11-M16) and the newsletter (M17) actually run on. Building M09/M10 to full depth first means M11-M17 can each link into an already-working repurposing pipeline instead of restating it 7 times.

Proposal: build M09 and M10 together as the pilot (they're tightly coupled — one produces the blog, the other fans it out), to the same 9-file depth as Sales Funnel Stage 06. Confirm this before I build it, or tell me a different stage to pilot instead (M22 Inbound-to-CRM Bridge is the other strong candidate, since it's literally the missing bridge your gap-analysis doc flagged as the #1 priority).

## 4. Build Order & Batching Strategy

Batches are sequenced so early ones reuse your existing Growth Engine raw material, matching the Sales Funnel's own batching logic.

| Batch | Stages | Rationale |
|---|---|---|
| Pilot | M09–M10 | Strongest existing raw material (Content Calendar, Content Repurposing System doc); connective stage everything else links to |
| 1 | M01–M03 | Foundation — brand, channel selection, messaging pillars; some raw material in existing ICP/Persona docs (Sales Funnel Stages 02-03) to cross-reference, not duplicate |
| 2 | M04–M07 | SEO Engine — strong existing raw material (SEO Keyword Master List & Action Plan already covers on/off-page and technical checklist content) |
| 3 | M08, M17 | Editorial calendar + email nurture — Content Calendar doc covers M08; email nurture has no dedicated internal doc yet, written fresh |
| 4 | M11–M16 | Social channel engines — Social Media Platform Playbooks doc (8 platforms) covers all 6 stages directly |
| 5 | M18 | Growth Hacking Experiment Engine — 150-tactic Growth Hacking Master List exists; the Impact × Effort tracker itself does not and gets built here |
| 6 | M19–M20 | Community & partnerships — partial coverage in the Referral/Viral Engine doc; PR/HARO written fresh |
| 7 | M21–M22 | Analytics + Inbound-to-CRM Bridge — closes the loop into Sales Funnel Stage 06; built last since it depends on every prior stage's output existing first |
| 8 | M18 tactic bank expansion | Not a new stage — folding a second, previously-unaccounted-for tactic doc into the existing M18/M19 architecture once discovered (see §7/§8 for detail) |

## 5. Per-Stage Build Checklist (applied to every stage — same convention as the Sales Funnel)

- [ ] Search existing Growth Engine docs (Growth Hacking Master List, SEO Keyword Plan, Social Media Playbooks, Referral/Viral Engine) for material relevant to the stage
- [ ] Draft sub-stages specific to the topic
- [ ] Write `methods.md` — manual / free-tool / automated / AI-assisted approaches for the stage
- [ ] Write `tools.md` — pulls from the shared free/OSS stack above, adds stage-specific tools, flags pricing "verify current"
- [ ] Write `automation.md` — manual → semi-auto → full n8n workflow per method, defaulting to free/OSS tools per §2
- [ ] Write `checklists.md` — QC gates (e.g., human review before AI-drafted content publishes)
- [ ] Write `templates.md` — reusable briefs/calendars/scripts for the stage
- [ ] Write `resources.md` — tool docs / vendor library relevant to the stage
- [ ] Write `faq.md`
- [ ] Write `references.md` — internal sources cited + official docs
- [ ] Write full `README.md` last, once supporting files exist to link into it
- [ ] Cross-reference the Sales Funnel stage this feeds (e.g., M22 → Stage 06) and adjacent Track M stages
- [ ] Update the progress tracker below

## 6. Known Constraints / Decisions Carried Forward

- Free-tier limits and OSS project status are marked "verify current" throughout — these change without notice and are not stated as permanent fact.
- No fabricated tool claims, invented case studies, or invented metrics — where no internal doc covers a stage, that stage's files say so explicitly rather than inventing detail.
- Every AI-drafted content step (M09, M10, M18 experiment copy, etc.) keeps a human-review checklist gate before publish — this is a standing QC rule across every automation.md, not just a suggestion.
- I don't have push access to your GitHub repo — each batch is delivered as downloadable files with the exact folder path to drop into `Growth Engine/Marketing Funnel/`; you commit/push on your end.
- Where two internal docs describe the same tactic differently (first surfaced during the M18 tactic bank expansion — see Batch 8 below), both are kept as separate testable variants rather than one silently overwriting the other; that's a scoring decision, not a mining decision.

---

## 7. Progress Tracker

| Batch | Stages | Status | Files Complete | Notes |
|---|---|---|---|---|
| Skeleton | M01–M22 (structural only) | ✅ Done | 2/2 top-level docs | This README.md + IMPLEMENTATION-PLAN.md; per-stage skeleton folders created for all 22 stages |
| Pilot | M09–M10 | ✅ Done | 18/18 | Built 2026-07-22. Tracker previously mis-marked "Not started" — corrected this session; files were already complete on disk |
| 1 | M01–M03 | ✅ Done | 27/27 | Built 2026-07-23. Mined from existing internal docs: "Executive Summary & Company Positioning" and "Brand Guidelines — Logo, Colors, Fonts & Voice" for M01; "Customer Acquisition Channels" reference list and SD-05's Inbound Channels table for M02; SD-05's Content Pillars table and the Email Newsletter System's Email Content Pillars table (reconciled into one framework) for M03. All three stages are correctly framed as 🔴 decision-layer/strategic — `automation.md` in each is honest that positioning, channel choice, and pillar definition are judgment calls, not automatable workflows; only distribution/tracking around each decision is automated. |
| 2 | M04–M07 | ⬜ Not started | 0/36 | Skeleton only |
| 3 | M08, M17 | ⬜ Not started | 0/18 | Skeleton only |
| 4 | M11–M16 | ⬜ Not started | 0/54 | Skeleton only |
| 5 | M18 | ✅ Done | 9/9 | Built 2026-07-23 out of planned batch order, per direct request. Tactic bank mined in full from the existing internal Growth Hacking Master List doc |
| 6 | M19–M20 | ✅ Done | 18/18 | Built 2026-07-23 out of planned batch order, per direct request. M19 mined from the existing internal Community of Growth Engine and Growth Hacking Master List docs; M20 mined from the Partnership & JV Strategy, PR & Media Outreach Package, Affiliate & Referral Program Setup, Partnership Marketing, and Stage 11 Referral & Viral Engine docs |
| 7 | M21–M22 | ⬜ Not started | 0/18 | Skeleton only |
| 8 | M18 tactic bank expansion | ✅ Done | 3/3 files updated | Built 2026-07-24. Folded a second internal doc ("Master list all growth hacking techniques," 12 categories, ~180 tactics) into M18's `resources.md` (7 → 12 tactic categories: 5 new — Viral & Referral, Lead Magnet, Authority & Trust, Offer & Pricing, Guerrilla/Unconventional — plus net-new items deduped into the existing LinkedIn, Email/Outbound, Content/SEO, Automation, and Paid categories) and M18's `README.md` (cross-reference list). Also gave M19 its own populated Community Growth Tactic Bank in `resources.md` instead of only a pointer to M18. Data & Analytics category flagged for M21 (not built yet) rather than force-fit into M18. No new M-stage created. |

**Legend:** ⬜ Not started · 🟡 In progress · ✅ Done

**Overall completion:** 74 / 200 files (2 top-level planning docs + Pilot 18 + Batch 1 27 + Batch 5 9 + Batch 6 18 = 74; 126 stage files across the remaining 10 unbuilt stages — M04–M08, M11–M17, M21–M22 — still remain). Batch 8's 3 file updates are revisions to already-complete Batch 5/6 files, not new stage files, so they don't change this denominator.

**Note on build order:** Batches 5 and 6 were built ahead of Batches 1–4 at direct request, skipping the originally planned sequence in §4. This means M19/M20's cross-references to still-unbuilt stages (e.g., M11 LinkedIn, M07 Off-Page SEO) are forward-references — the links are correct but point to skeleton files, not built-out content, until Batches 1–4 are completed. Batch 8 is a revision pass on top of already-built Batch 5/6 content, not a new stage, so it doesn't change this note.

## 8. Session Log

| Date | Session | What was done |
|---|---|---|
| 2026-07-22 | 1 | Reviewed the live Sales Funnel README.md and IMPLEMENTATION-PLAN.md to copy their exact structure. Designed Track M as 22 single-topic stages (grouped into Phases A-H) instead of the originally-proposed 6 broad tracks, matching the Sales Funnel's one-topic-per-stage granularity. Built the top-level README.md (stage index, folder standard, status legend) and this IMPLEMENTATION-PLAN.md (free/OSS tool stack, batching strategy, pilot recommendation, build checklist, tracker). No per-stage content built yet — awaiting confirmation of pilot stage before proceeding. |
| 2026-07-23 | 2 | Built Batch 5 (M18 Growth Hacking Experiment Engine) and Batch 6 (M19 Community Building, M20 Partnerships/Co-Marketing/PR) to full 9-file pilot depth, out of the planned batch sequence at direct request. Pulled the live repo (Growth Engine/Marketing/ and Growth Engine/ raw material) to mine existing internal docs rather than write fresh: Growth Hacking Master List (100+ Tactics) for M18's tactic bank and Impact × Effort scoring method; Community of Growth Engine doc (phased-rollout and ambassador/leaderboard mechanics only — its internal paid-workforce department structure was explicitly not adopted, see M19/faq.md) for M19; Partnership & JV Strategy, PR & Media Outreach Package, Affiliate & Referral Program Setup, Partnership Marketing, and Stage 11 — Referral & Viral Engine docs for M20. Also discovered and corrected a tracker error: the Pilot (M09–M10) row was mis-marked "Not started" despite being fully built on disk (346 + 315 lines respectively) — corrected in this update. Confirmed via direct file inspection that Batches 1–4 (M01–M08, M11–M17) remain skeleton-only despite the batching plan's intended order; this is flagged in the tracker note above rather than silently built out of turn. |
| 2026-07-23 | 3 | Built Batch 1 (M01 Brand & Positioning Foundation, M02 Channel & Platform Selection, M03 Content Pillars & Messaging Framework) to full 9-file depth, per the Correction Implementation Plan. Mined existing internal docs rather than writing fresh: "Executive Summary & Company Positioning" and "Brand Guidelines — Logo, Colors, Fonts & Voice" for M01 (noting that final brand colors/fonts and the 4 logo file versions are still marked "action needed" in the source doc, not fabricated as already locked); "Customer Acquisition Channels" (general reference list) and SD-05's Inbound Channels table for M02; SD-05's Content Pillars table and the Email Newsletter System's separately-defined Email Content Pillars table (reconciled into one framework rather than left as two inconsistent pillar languages) for M03. All three stages were cross-checked against Sales Funnel Stages 02 (ICP) and 03 (Persona) per the plan's instruction to cross-reference rather than duplicate that material. Each stage's `automation.md` is explicit that positioning, channel selection, and pillar definition are judgment calls, not automatable decisions — only downstream distribution/tracking (e.g., notifying M09/M08 when a decision changes) is automated, avoiding a fabricated workflow diagram just to match the M09/M18-style format. |
| 2026-07-24 | 4 | Folded a second, previously-unaccounted-for internal growth-hacking doc into the existing architecture rather than building a new stage for it. Read the full "Master list all growth hacking techniques" doc (12 categories: Viral & Referral, Community-Led, Content Engine, LinkedIn Scaling, Lead Magnet, Outbound, Authority & Trust, Automation & System, Paid, Product/Offer, Data & Analytics, Guerrilla/Unconventional) against M18's existing 7-category bank line by line. Deduped overlapping tactics (e.g. "20 connections/day" vs. "50 connections/day" — kept both as separate testable variants rather than picking one). Added 5 new categories to M18/resources.md, expanded 5 existing ones with net-new items, moved Community-Led additions into M19's own new tactic bank (M19 previously only pointed at M18 for this), and flagged Data & Analytics for M21 once built rather than force-fitting it. Updated M18's README.md cross-reference list to add Sales Funnel Stages 06/07/16-21/34/53 and the legacy Stage 11 doc as execution homes for the newly-sourced categories. |

---

## Cross-References

- [Marketing Funnel home / full stage index](README.md)
- Sales Funnel home: `Growth Engine/Sales Funnel/README.md` (existing repo)
- Sales Funnel Stage 06 (Lead Extraction) — the stage M22 bridges into
- Sales Funnel Stage 07 (Contact Discovery), Stages 16–21 (Outreach channels), Stage 34 (Pricing and Packaging), Stage 53 (Referral Programs), and the legacy Stage 11 (Referral & Viral Engine) doc — additional execution homes surfaced by the M18 tactic bank expansion (Batch 8)
