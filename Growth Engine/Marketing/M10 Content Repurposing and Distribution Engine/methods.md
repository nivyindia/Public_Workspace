# M10 — Methods

Same four-tier structure as M09, applied to repurposing instead of original drafting. All four still terminate at the human-review QC gate before anything is scheduled.

## Method 1 — Fully Manual

- Human reads the published M09 piece, manually writes each channel-specific post (LinkedIn post, X thread, IG carousel copy, etc.) from scratch.
- Best for: flagship pieces where each channel version deserves distinct, non-templated treatment (e.g., a major research report).

## Method 2 — Free-Tool-Assisted Manual

- Human drafts manually but uses the repurposing matrix template (`templates.md`) to make sure no format/channel is missed, and free tools (Canva free tier) for any visual assets (carousel slides, quote graphics).
- Best for: standard weekly blog posts getting the full repurposing treatment without needing bespoke strategy per piece.

## Method 3 — AI-Assisted Drafting (Human-Led)

- Human feeds the M09 handoff packet (pull-quotes, key stat, suggested formats) into Claude.ai/ChatGPT free tier with a per-format prompt (e.g., "turn this excerpt into a 5-slide LinkedIn carousel outline"), then edits substantially.
- Draft-only, same rule as M09 — AI output is a first pass, not publish-ready.
- Best for: high-volume, lower-stakes repurposing (e.g., turning every blog post into a standard LinkedIn + X pairing).

## Method 4 — Semi-Automated via n8n

- n8n workflow triggers on M09 publish, pulls the handoff packet, calls the AI drafting step per format, and drops all drafts into the same human-review queue used by M09.
- Best for: scaling repurposing volume once M09 is publishing consistently enough to justify the workflow build.

## Format-Specific Notes

| Format | Recommended method | Notes |
|---|---|---|
| LinkedIn post (M11) | Method 2 or 3 | Text-heavy, AI-assist works well from pull-quotes |
| Instagram carousel (M12) | Method 1 or 2 | Visual design needs more human judgment |
| YouTube/video script (M13) | Method 1 | Video needs a distinct narrative arc, not a copy-paste of blog structure |
| X/Twitter thread (M14) | Method 2 or 3 | Thread structure is templatable |
| Facebook post (M15) | Method 2 or 3 | Often a shortened LinkedIn variant |
| Secondary platforms (M16) | Method 3 or 4 | Highest volume, lowest bespoke-effort format |
| Email segment (M17) | Method 1 or 2 | Nurture emails benefit from a more personal, less templated tone |

No method skips the human-review QC gate in `checklists.md`.
