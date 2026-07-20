# Automation — 23 Deliverability and Domain Health

[⬅ Back to README](README.md)

## Manual
Incident-response decisions (pause/rotate/retire an identity) always require human sign-off.

## Semi-Automated
A team member reviews a weekly AI-summarized health report and decides on any flagged identities.

## Full-Automated
Daily data pull from each channel tool's API into a centralized health-tracking sheet/dashboard; automatic status flag (`warning`) when a threshold is crossed, blocking new sends from that identity until reviewed.

## AI-Assisted Workflow
1. Scheduled job pulls bounce/complaint/blacklist data from Stage 16-19 tool APIs daily.
2. Any identity crossing a threshold is flagged `warning` and paused from new sends automatically.
3. LLM summarizes the day's flagged identities into a short report.
4. Human reviews the report and decides: resume after investigation, rotate volume to a healthier identity, or retire.

## Suggested n8n / integration flow
`Channel tool APIs (Stage 16-19)` → `n8n (daily pull + threshold check)` → `Sheet/dashboard (health status)` → `n8n (auto-pause sends on warning)` → `Slack alert + LLM summary` → `Human decision`
