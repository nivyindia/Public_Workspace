# M09 — Methods

Four approaches, in ascending order of speed/descending order of manual effort. All four still pass through the same human-review QC gate in `checklists.md` before publish — that gate is non-negotiable regardless of which method produced the draft.

## Method 1 — Fully Manual

- Writer researches, outlines, and drafts by hand in Google Docs.
- Best for: cornerstone pillar pages, anything requiring original data, founder-voice thought leadership, legally sensitive content (compliance, financial, medical claims).
- Slowest, highest quality ceiling, no AI-drafting risk to manage.

## Method 2 — Free-Tool-Assisted Manual

- Writer still drafts by hand, but uses free tools to speed research and tighten prose:
  - Google Trends / AnswerThePublic (free tier) for angle validation
  - Hemingway Editor (free) for readability pass
  - Grammarly free tier for grammar/clarity pass
- Best for: standard blog posts and how-to guides where a human is writing but wants faster research and a mechanical polish pass.

## Method 3 — AI-Assisted Drafting (Human-Led)

- Human writes the brief and outline; Claude.ai or ChatGPT (free tier) generates a first-pass draft against that outline; human then rewrites/edits substantially before it's considered a draft, not just a polish.
- This is **draft-only** per the standing QC rule in the Implementation Plan §6 — an AI-assisted draft is never publish-ready as generated.
- Best for: high-volume supporting content (comparison posts, glossary-style explainers, FAQ roundups) where the outline does most of the quality-control work.

## Method 4 — Semi-Automated via n8n

- n8n workflow (see `automation.md`) pulls the brief from the M08 calendar, calls an AI drafting step via API or the free-tier UI workflow, and routes the output straight into the human-review queue.
- Mechanically this is Method 3 with the manual hand-off steps automated — the review gate is identical, just triggered by workflow instead of a person copy-pasting.
- Best for: scaling output volume once M08's calendar is populated far enough ahead that briefs can queue automatically.

## Choosing a Method Per Piece

| Content type | Recommended method |
|---|---|
| Pillar / cornerstone page | Method 1 |
| Founder thought-leadership | Method 1 or 2 |
| Standard SEO blog post | Method 2 or 3 |
| High-volume supporting/comparison content | Method 3 or 4 |
| Whitepaper / gated asset | Method 1 or 2 (higher trust bar) |
| Case study | Method 1 (requires real customer input — not AI-draftable) |

No method skips research, outlining, or the human-review QC gate. The methods differ only in how the first draft gets produced.
