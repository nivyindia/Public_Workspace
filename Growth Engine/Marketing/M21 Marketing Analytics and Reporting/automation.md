# M21 — Marketing Analytics and Reporting: Automation

## Manual (baseline)

- Log into GA4/Search Console/Looker Studio and read the dashboard weekly — works, but doesn't scale past one person's attention and produces no proactive alerting.

## Semi-Automated

- Looker Studio dashboard auto-refreshes from GA4/Search Console (native — no build needed beyond the initial 21A/21D setup)
- A scheduled n8n workflow (weekly, e.g. Monday 9am) pulls a GA4 API export and posts a summary to Slack/email, so the weekly snapshot in [templates.md](templates.md) doesn't rely on someone remembering to open the dashboard

## Fully Automated / AI-Assisted

- n8n workflow: GA4 Data API export → LLM node (per the AI Section prompt in README.md) → formatted weekly summary → auto-posted, with a human review step before it's treated as final (per the standing QC rule)
- Anomaly flagging: a simple threshold check in n8n (e.g., "traffic from any single channel dropped >30% week-over-week") that fires a Slack alert, so a broken UTM tag or a tracking-code removal is caught within days, not discovered a month later during the monthly rollup

## What Is Not Automated Here

- The decision to kill/keep an M18 experiment stays human — automation surfaces the number (21F), a person decides
- UTM tag application itself isn't automated across every channel (M11-M17 each apply their own link's UTM tag per the 21C standard) — this stage validates compliance, it doesn't retroactively fix a missing tag
