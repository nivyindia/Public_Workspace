# M05 — Methods

## M05.1 — Title Tag & Meta Description Writing

- **Manual:** Write a title tag (aim ~50–60 characters so it doesn't truncate in the SERP — verify current display limits, as Google's pixel-based truncation isn't a fixed character count) containing the target keyword near the front. Write a meta description (~150–160 characters) that reads as a compelling reason to click, not just a keyword restatement.
- **Free-tool:** A SERP snippet preview tool (several free browser-based ones exist) shows how the title/description will actually render before publishing.
- **AI-assisted:** An LLM can draft 3–5 title/meta variants fast; a human picks or edits the best one — never publish an AI draft unedited, since AI-written meta descriptions tend to default to generic phrasing that doesn't differentiate the page in the SERP.

## M05.2 — Header Structure & Keyword Placement

- **Manual:** One H1 per page (matching or close to the target keyword), H2s for major sections (working in supporting/secondary keywords from the M04 cluster naturally, not forced), H3s for sub-points. Keyword stuffing is a real risk here — if a heading reads awkwardly because a keyword was forced in, rewrite it for the reader first.
- **Checklist gate:** Confirm exactly one H1 exists on the page (a common CMS default-theme bug is generating two).

## M05.3 — Internal Linking

- **Manual:** Every cluster article links back to its pillar page (from M04.5's cluster map) using descriptive anchor text — not "click here." The pillar page links out to its top 3–5 cluster articles.
- **Free-tool:** Screaming Frog's free crawl (up to its URL cap — verify current) can audit existing internal-link structure and flag orphaned pages (pages with no internal links pointing to them).
- **Automated:** Once a site has enough pages, an n8n workflow can flag newly-published pages that don't yet have any inbound internal link, prompting a manual linking pass.

## M05.4 — Image Optimization

- **Manual:** Rename image files descriptively before upload (e.g., `email-nurture-workflow-diagram.png`, not `IMG_4821.png`), write descriptive alt text (for both accessibility and image-search SEO), and compress before upload.
- **Free-tool:** TinyPNG or Squoosh (both free, browser-based) for compression without a paid plan.

## M05.5 — On-Page QC & Publish Sign-Off

- **Manual:** Run the full checklist in `checklists.md` against the page before marking it live. This is a human sign-off step, not automatable — see the standing QC-gate rule in IMPLEMENTATION-PLAN.md §6.
