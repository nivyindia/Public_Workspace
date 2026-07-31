# M12 — Methods

Manual, free-tool, automated, and AI-assisted approaches for running Instagram Organic Engine, ordered from
lowest to highest automation.

## 1. Manual (no tools beyond the native app)

1. Pull the week's topics from M08's editorial calendar.
2. Draft each post directly in the platform's native composer, following the content mix in
   README.md §3.
3. Post manually at the times in README.md §2.
4. Reply to comments/DMs by hand within 24 hours.
5. Log any inbound interest manually into the CRM (until M22's bridge automation exists).

This is the fallback method and requires no budget — appropriate for the first weeks of running this
stage before any automation is wired up.

## 2. Free-tool-assisted

1. Draft posts in a shared doc (Google Docs / Notion free tier) so the QC reviewer (see
   checklists.md) can comment before anything goes live.
2. Queue approved posts in **Postiz** (self-hosted, free — see tools.md) instead of posting natively,
   so the week's content is scheduled in one sitting rather than daily.
3. Track replies/DMs that convert to interest in a shared free-tier tracker (Airtable or Notion) as an
   interim inbound log until M22 exists.

## 3. Automated (n8n)

1. n8n watches the editorial calendar (Notion/Airtable) for posts tagged "M12 — ready".
2. n8n pushes the approved draft into Postiz's queue via its API/webhook at the scheduled time.
3. n8n polls for new comments/DMs (where the platform API allows it) and creates a task/record for
   human follow-up — it does **not** auto-reply, per the QC gate in checklists.md.
4. n8n logs publish confirmations back to the tracker for M21's reporting.

## 4. AI-assisted drafting

- Use **Claude.ai / ChatGPT free tier** (or a self-hosted open model via n8n's HTTP node) to draft the
  first pass of a post from the week's topic + M09's source article.
- The draft is written directly against this stage's content mix and format rotation (README.md §2-3)
  so it doesn't need heavy platform-specific rewriting afterward.
- **A human reviews every AI draft before it is scheduled or published** — see checklists.md. AI
  drafting speeds up the first pass; it does not remove the QC gate.

## Notes specific to this platform

Instagram splits into two lanes that need separate drafting passes: the feed-post/Reel content (planned, drafted, reviewed like the other platforms) and daily Stories (polls, tip-of-the-day, question box), which are lightweight enough to draft same-day rather than batching a week ahead.
