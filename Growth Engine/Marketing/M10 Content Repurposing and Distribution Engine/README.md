# M10 — Content Repurposing & Distribution Engine

**Phase:** C — Content Engine
**Status:** ✅ Built to pilot depth (2026-07-22)
**Feeds into:** M11 (LinkedIn), M12 (Instagram), M13 (YouTube/Video), M14 (Twitter/X), M15 (Facebook), M16 (Secondary Platforms), and M17 (Email Newsletter) — every one of these stages consumes M10's output rather than producing its own content from scratch
**Upstream input from:** M09 (Long-Form Content Production) — the published post/pillar page/whitepaper this stage fans out

---

## 1. What This Stage Covers

M10 is the connective tissue of Track M: it takes one piece of long-form content from M09 and systematically repurposes it into the formats each downstream channel needs — LinkedIn posts, Instagram carousels, video scripts, X/Twitter threads, Facebook posts, email newsletter segments, and secondary-platform content (Pinterest pins, Threads posts, WhatsApp broadcast copy).

This is why M09 and M10 were built together as the pilot pair (per `IMPLEMENTATION-PLAN.md` §3): building the repurposing pipeline once here means M11–M17 can each link into an already-working engine instead of restating repurposing logic seven times.

## 2. Sub-Stages

1. **Intake** — receive the M10 handoff packet from M09 (published URL, pull-quotes, key stat, suggested formats).
2. **Format mapping** — decide which pieces of the source content map to which channel format (see `templates.md` repurposing matrix).
3. **Drafting per format** — AI-assisted first drafts per channel, human-edited (same draft-only rule as M09).
4. **Human-review QC gate** — mandatory before scheduling, same standing rule as M09.
5. **Scheduling** — queued into Postiz (or equivalent) for multi-platform scheduling.
6. **Handoff to channel stages** — each of M11–M17 picks up its scheduled/queued content from here; M10 does not manage platform-specific posting cadence or engagement — that's owned by each channel stage.

## 3. Where the Line Is Drawn vs. M11–M17

M10 owns: turning one source piece into N channel-shaped drafts, and getting them into a shared scheduling queue.
M11–M17 each own: platform-specific posting cadence, engagement/community management, platform-specific growth tactics, and platform analytics.

## 4. Cross-References

- **M09** — Long-Form Content Production (upstream: direct source of everything M10 repurposes)
- **M11–M16** — social channel stages (downstream: consume M10's scheduled drafts)
- **M17** — Email Newsletter & Lead Nurture (downstream: consumes M10's email-segment drafts)
- **M18** — Growth Hacking Experiment Engine (adjacent: may test repurposing format variants as experiments)
- **Sales Funnel** — no direct feed; reaches Sales Funnel Stage 06 only via M11–M17 → M22.

## 5. What's Not Built Yet

This pilot covers the 9 standard files. It does not include a populated repurposing log for a real published post — that starts once M09 produces its first real piece and a real handoff packet flows in.
