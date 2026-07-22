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

---

## 7. Progress Tracker

| Batch | Stages | Status | Files Complete | Notes |
|---|---|---|---|---|
| Skeleton | M01–M22 (structural only) | ✅ Done | 2/2 top-level docs | This README.md + IMPLEMENTATION-PLAN.md; per-stage folders not yet created |
| Pilot | M09–M10 | ⬜ Not started | 0/18 | Awaiting confirmation of pilot choice (§3) |
| 1 | M01–M03 | ⬜ Not started | 0/27 | |
| 2 | M04–M07 | ⬜ Not started | 0/36 | |
| 3 | M08, M17 | ⬜ Not started | 0/18 | |
| 4 | M11–M16 | ⬜ Not started | 0/54 | |
| 5 | M18 | ⬜ Not started | 0/9 | |
| 6 | M19–M20 | ⬜ Not started | 0/18 | |
| 7 | M21–M22 | ⬜ Not started | 0/18 | |

**Legend:** ⬜ Not started · 🟡 In progress · ✅ Done

**Overall completion:** 2 / 200 files (2 top-level planning docs; 198 stage files across 22 stages × 9 files remain).

## 8. Session Log

| Date | Session | What was done |
|---|---|---|
| 2026-07-22 | 1 | Reviewed the live Sales Funnel README.md and IMPLEMENTATION-PLAN.md to copy their exact structure. Designed Track M as 22 single-topic stages (grouped into Phases A-H) instead of the originally-proposed 6 broad tracks, matching the Sales Funnel's one-topic-per-stage granularity. Built the top-level README.md (stage index, folder standard, status legend) and this IMPLEMENTATION-PLAN.md (free/OSS tool stack, batching strategy, pilot recommendation, build checklist, tracker). No per-stage content built yet — awaiting confirmation of pilot stage before proceeding. |

---

## Cross-References

- [Marketing Funnel home / full stage index](README.md)
- Sales Funnel home: `Growth Engine/Sales Funnel/README.md` (existing repo)
- Sales Funnel Stage 06 (Lead Extraction) — the stage M22 bridges into
