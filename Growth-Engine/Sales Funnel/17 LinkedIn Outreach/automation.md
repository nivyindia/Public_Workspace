# Automation — 17 LinkedIn Outreach

[⬅ Back to README](README.md)

## Manual
Personally sent connection requests and DMs for named strategic accounts.

## Semi-Automated
VA sets up a Sales Navigator search, exports via PhantomBuster into a sheet, reviews the list for fit, then triggers connection-request sending within daily limits.

## Full-Automated
PhantomBuster scenario runs on schedule: exports new search matches, sends connection requests, and (once accepted) sends DM sequence steps automatically — human still reviews DM copy per segment before it's loaded into the scenario.

## AI-Assisted Workflow
1. PhantomBuster exports daily search matches to a sheet.
2. LLM drafts a one-line personalization per contact using their headline/recent activity (where available).
3. Human spot-checks a sample before the batch is approved for connection-request sending.
4. On acceptance, DM sequence sends automatically per the approved template/timing.
5. Replies flow to Stage 25 triage (AI-assisted classification, human decision on ambiguous cases).

## Suggested n8n / integration flow
`PhantomBuster (search export)` → `Sheet` → `n8n (dedupe against CRM)` → `PhantomBuster (connection request scenario)` → `Sheet/webhook (acceptance status)` → `n8n (trigger DM scenario)` → `CRM (log status)`
