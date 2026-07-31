# M16 — Tools

Per the Implementation Plan's Track M objective (§1), this stage's tools default to free/OSS options first. Paid tools are listed only as an optional upgrade path once volume justifies the cost. Full cross-stage reference: `../IMPLEMENTATION-PLAN.md` §2.

## Core stack (shared across M11-M16)

| Function | Tool | Notes |
|---|---|---|
| Multi-platform scheduling | **Postiz** (self-hosted, OSS) | No channel-count cap since it's self-hosted — replaces Buffer's free-tier 3-channel limit (verify current) |
| Workflow automation | **n8n** (self-hosted, free) | Same instance already used for the sales side |
| AI drafting | **Claude.ai / ChatGPT free tier**, or self-hosted open model via n8n's HTTP node | Draft-only — human review gate applies (checklists.md) |
| Experiment/content tracking | **Airtable free tier** or **Notion free tier** | Verify current record/block caps |
| Analytics | **M16-native analytics** (built into the platform, free) + **Looker Studio** for cross-platform rollups | Feeds M21 |

## Platform-specific tools

- **WhatsApp Business app** — free, first-party; used for the WhatsApp Channel broadcast (the one fully-sourced platform in this stage).
- Pinterest and Threads: no tool stack recommended yet — see the source coverage flag in README.md. Once goals/cadence are defined, the same Postiz + n8n stack likely applies (both support these platforms), but that should be confirmed rather than assumed.

## Paid upgrade path (optional, once volume justifies it)

- Postiz → Buffer/Publer if you'd rather not self-host.
- Free-tier trackers → Airtable paid tier once you outgrow the free record cap.
- AI drafting → paid API tier once volume needs batch automation beyond free-tier rate limits.

All pricing/limits above are marked "verify current" per the Implementation Plan's standing
constraint (§2, §6) — free-tier terms change without notice.
