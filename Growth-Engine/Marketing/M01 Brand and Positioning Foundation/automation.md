# M01 — Automation

Read this file's honesty note before the tiers below: **brand and positioning decisions themselves are not automatable.** No n8n workflow, AI drafting step, or free tool can decide what Nivy Digital's differentiators are or what tone it should use — that's Method 1–3 judgment work from `methods.md`, done by a human who knows the business. What *can* be automated is distribution and consistency-checking once those decisions are made. This file is scoped honestly to that smaller, real piece — per the standing no-fabricated-automation-claims rule in `IMPLEMENTATION-PLAN.md` §6.

## Tier 1 — Manual (the default, and mostly correct default for this stage)

- Founder/team writes and finalizes the positioning statement, mission/vision/values, differentiators, and voice guide directly in Notion or a shared doc.
- No workflow tooling involved, because none is needed for a decision that happens once and gets revisited quarterly at most.

## Tier 2 — Manual Decision, Automated Distribution

Once the brand/positioning doc is finalized (or updated):

```
[Brand Guidelines doc marked "Approved" in Notion]
        ↓ (n8n trigger: Notion API poll on page status property, or manual webhook trigger)
[n8n: pull the finalized doc content]
        ↓
[n8n: Slack/WhatsApp notification to all VAs/freelancers/content writers — "Brand guidelines updated, review before next piece"]
        ↓
[n8n: (optional) push key voice rules into a shared reference the AI-drafting steps in M09/M18 can pull from, e.g. a pinned Notion block or Airtable "house style" record]
```

### Implementation Notes

- This reuses the same n8n instance already running Sales Funnel and other Track M automations — no new infrastructure needed.
- The only thing being automated is *making sure everyone knows the decision changed* — not the decision itself.
- This tier is genuinely useful once M09's Tier 4 (full AI-drafting workflow) is live, since an AI drafting step benefits from having the current house-style rules available to reference in its prompt — but that's a nice-to-have wiring improvement for M09, not something M01 itself needs to run.

## Tier 3 — Consistency Checking (lightweight, optional)

- A simple n8n or free-tool check that scans new content drafts (blog posts, social copy) for phrases explicitly listed in the "Brand Don'ts" list (e.g., corporate jargon phrases the tone-of-voice guide flags) and flags matches for human review before publish.
- This is a QC assist, not a replacement for the human-review gate every other Track M stage already requires (see M09 `checklists.md`) — it catches obvious drift, it doesn't approve content.

## What This Stage Deliberately Does Not Automate

- Writing the positioning statement itself
- Deciding differentiators or target market language
- Approving the final brand color palette or logo files (a real design sign-off, not a documentation task)

If a future version of this repo claims M01 has a "full n8n workflow" the way M09 does, that claim should be treated with skepticism — this stage's nature doesn't support that pattern, and no such workflow exists here.
