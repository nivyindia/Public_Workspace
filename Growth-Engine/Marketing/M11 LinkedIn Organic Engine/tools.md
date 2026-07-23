# M11 — Tools

Per the Implementation Plan's Track M objective (§1), this stage's tools default to free/OSS options first. Paid tools are listed only as an optional upgrade path once volume justifies the cost. Full cross-stage reference: `../IMPLEMENTATION-PLAN.md` §2.

## Core stack (shared across M11-M16)

| Function | Tool | Notes |
|---|---|---|
| Multi-platform scheduling | **Postiz** (self-hosted, OSS) | No channel-count cap since it's self-hosted — replaces Buffer's free-tier 3-channel limit (verify current) |
| Workflow automation | **n8n** (self-hosted, free) | Same instance already used for the sales side |
| AI drafting | **Claude.ai / ChatGPT free tier**, or self-hosted open model via n8n's HTTP node | Draft-only — human review gate applies (checklists.md) |
| Experiment/content tracking | **Airtable free tier** or **Notion free tier** | Verify current record/block caps |
| Analytics | **M11-native analytics** (built into the platform, free) + **Looker Studio** for cross-platform rollups | Feeds M21 |

## Platform-specific tools

- **LinkedIn native scheduler** (posts, articles) — free, first-party, no third-party app risk; useful as a fallback if Postiz's LinkedIn integration lags a platform change.
- **LinkedIn Creator Mode / analytics** — free, built-in, tracks the follower/impression data M21 needs.

## Paid upgrade path (optional, once volume justifies it)

- Postiz → Buffer/Publer if you'd rather not self-host.
- Free-tier trackers → Airtable paid tier once you outgrow the free record cap.
- AI drafting → paid API tier once volume needs batch automation beyond free-tier rate limits.

All pricing/limits above are marked "verify current" per the Implementation Plan's standing
constraint (§2, §6) — free-tier terms change without notice.
