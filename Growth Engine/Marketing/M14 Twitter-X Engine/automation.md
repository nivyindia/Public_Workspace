# M14 — Automation

Manual → semi-auto → full n8n workflow, defaulting to free/OSS tools per the Implementation Plan §2.
Every piece of AI-drafted copy for this channel is reviewed by a human before it is scheduled or published. This is a standing rule across all of Track M's automation.md files, not a suggestion specific to this stage (Implementation Plan §6).

## Level 0 — Manual

Post directly in the native app. No automation. See methods.md §1.

## Level 1 — Semi-automated (scheduling only)

1. Draft is written (manually or AI-assisted) and reviewed by a human (checklists.md gate).
2. Approved draft is queued in **Postiz** for the scheduled slot.
3. Publishing happens automatically at the scheduled time; replies/DMs are still handled manually.

## Level 2 — Full n8n workflow

```
[Editorial calendar: post tagged "M14 — ready"]
        │
        ▼
[n8n: pull draft + assets from calendar/Drive]
        │
        ▼
[n8n: post draft to review channel (Slack/email/Notion comment)]
        │
        ▼
[HUMAN REVIEW GATE — approve / edit / reject]  ◄── QC-002 equivalent, see checklists.md
        │  (approved only)
        ▼
[n8n: push to Postiz queue via API]
        │
        ▼
[Postiz: publish at scheduled time]
        │
        ▼
[n8n: log publish confirmation + post URL to tracker]
        │
        ▼
[n8n: poll platform API for new comments/DMs (where supported)]
        │
        ▼
[n8n: create follow-up task for human — NOT an auto-reply]
        │
        ▼
[M21 Analytics: pulls performance data from tracker on schedule]
```

**What this workflow does NOT do:** auto-reply to comments/DMs, auto-approve AI drafts, or bypass the
human review gate. Those are explicit non-goals per the Implementation Plan's QC rule (§6).

## Platform-specific automation notes

At 3-5 posts/day, the review gate needs to run in batches (e.g. review a full day's posts at once) rather than one-by-one, or the human review step becomes the bottleneck.
