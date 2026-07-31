# M17 — Email Newsletter & Lead Nurture

**Phase:** E — Email
**Feeds:** M22 (Inbound-to-CRM Bridge — nurtured leads flow into Sales Stage 06), M21 (Marketing Analytics & Reporting)
**Fed by:** M08 (Editorial Calendar — content to feature), M09/M10 (source content and repurposed assets), M04 (funnel-stage tags inform segmentation)
**Build status:** 🟡 Built to pilot depth this session (Batch 3). No dedicated internal doc for email nurture exists yet per IMPLEMENTATION-PLAN.md §4 ("written fresh" was the plan's own note for this stage) — see `references.md`.

## Purpose

M17 owns the owned-audience channel — the list of people who've opted in directly, rather than being reached via a platform's algorithm. It has two distinct jobs that shouldn't be run as one undifferentiated stream: nurturing new leads through a structured sequence toward sales-readiness, and maintaining an ongoing newsletter relationship with people not yet ready to buy. Both eventually feed M22's bridge into the sales funnel.

## Inputs

- Signups (from site opt-in forms, lead magnets, or event capture)
- Published content to feature (M08 calendar, M09/M10 assets)
- Funnel-stage segmentation data (M04)

## Outputs

- Growing, hygienic email list
- Automated welcome/nurture sequences
- Recurring newsletter send
- Sales-ready leads flagged and handed to M22

## Sub-Stages

| # | Sub-stage | What it does |
|---|---|---|
| M17.1 | List building & signup capture | Opt-in forms, lead magnets, and capture points across the site |
| M17.2 | Welcome / onboarding sequence | The automated first-touch sequence a new subscriber receives |
| M17.3 | Nurture sequence design | Segmented, funnel-stage-aware sequences that move a lead toward sales-readiness |
| M17.4 | Newsletter cadence & curation | The recurring (e.g., weekly/biweekly) send to the full active list |
| M17.5 | Deliverability & list hygiene | Keeping the list clean and sender reputation healthy so email actually reaches the inbox |
| M17.6 | Sales-readiness handoff | Flags and hands off leads showing buying-intent signals to M22 |

## How This Stage Is Used

M17.1–M17.2 run continuously as new signups arrive. M17.3's sequences are built once per funnel-stage segment and refined periodically, not rebuilt per subscriber. M17.4 runs on a fixed recurring cadence. M17.5 is a monthly hygiene check. M17.6 is the trigger point into M22 — a lead engaging with decision-stage content or matching defined intent signals gets flagged.

## Files In This Stage

`methods.md` · `tools.md` · `automation.md` · `checklists.md` · `templates.md` · `resources.md` · `faq.md` · `references.md`
