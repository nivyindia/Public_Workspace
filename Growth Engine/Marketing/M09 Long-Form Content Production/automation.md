# M09 — Automation

Progression from manual to full n8n workflow, mirroring the four methods in `methods.md`. Every tier below terminates at the same human-review QC gate — automation here accelerates drafting and handoff, it never removes the review step.

## Tier 1 — Manual (no automation)

Writer works entirely in Google Docs from a brief pulled by hand from the M08 calendar. No workflow tooling involved.

## Tier 2 — Semi-Automated (free-tool assisted)

- Manual brief pull, manual drafting.
- Free tools (Hemingway, Grammarly free tier) run as a manual polish pass, not triggered by workflow.

## Tier 3 — AI-Assisted Draft, Manual Handoff

- Human copies the brief into Claude.ai / ChatGPT free tier, generates a first-pass draft, then does substantial manual rewriting.
- Handoff to review queue is still manual (e.g., moving a Google Doc into a "Ready for Review" folder).

## Tier 4 — Full n8n Workflow

```
[M08 Calendar row marked "Ready to Draft"]
        ↓ (n8n trigger: schedule poll or webhook on row status change)
[n8n: pull brief fields — topic, keyword, audience, outline requirements]
        ↓
[n8n: HTTP node → AI drafting API call, using the brief as the prompt]
        ↓
[n8n: create Google Doc from AI output, drop into "Pending Human Review" Drive folder]
        ↓
[n8n: Slack/WhatsApp notification to the assigned writer/editor]
        ↓
[HUMAN REVIEW GATE — see checklists.md — mandatory, not automatable]
        ↓
[Human marks doc "Approved"]
        ↓
[n8n: on approval flag, notify M05 (on-page SEO) and queue for publish]
        ↓
[Publish → n8n: on publish, pass URL + excerpt to M10 intake]
```

### Implementation Notes

- The AI drafting HTTP node can call the Anthropic API directly (paid, usage-based) or route through a self-hosted open model if avoiding any paid API call is a hard requirement — the free Claude.ai/ChatGPT UI tier has no public API, so *fully automating* Tier 4 without any paid API usage means either self-hosting an open model or accepting a manual copy-paste step at the drafting node (which effectively drops back to Tier 3 for that one step).
- The human-review gate is a manual n8n step (a wait-for-webhook or wait-for-manual-approval node) — it cannot be skipped or auto-approved under Track M's standing QC rule.
- This workflow reuses the same n8n instance already running your Sales Funnel automations — no new infrastructure needed.
