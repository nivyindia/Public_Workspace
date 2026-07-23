# Methods — 44 Customer Success Planning

[⬅ Back to README](README.md)

## Traditional
Success is assumed rather than measured — the team assumes a client is fine unless they explicitly complain.

## Modern / Tool-Assisted
A defined lifecycle touchpoint map (Day 1 welcome → Day 7 check-in → Day 30 review → monthly reports → quarterly strategy review → annual review) paired with a monthly NPS survey, so success is tracked proactively against a schedule, not reactively against complaints.

## AI-Assisted
An LLM analyzes CSAT/NPS trend, engagement signals, and delivery data together to produce a churn-risk score (Low/Medium/High) and a recommended action per client.

## Manual
The "save-a-client" conversation when cancellation is raised, and any founder-level intervention on a detractor (NPS ≤6) — these require human judgment and authority that automation cannot substitute for.

## Automated
Monthly NPS survey dispatch, churn-warning-sign detection (no reply in 7+ days, reduced task volume), and renewal-reminder sequencing.

## API / Integration
NPS survey tool (Tally/Brevo) ⇄ CRM (score history) ⇄ n8n (warning-sign detection, alert routing) — so a declining trend triggers a human response quickly rather than being discovered at the next scheduled review.

## Browser Automation
Not applicable to this stage.

## Scraping
Not applicable to this stage.

## Public Database / Government
Not applicable to this stage.

## Community / Referral
A promoter (NPS 9-10) is asked for a public review and a referral in the same touchpoint — turning a success signal directly into growth-engine input (feeds back to Stage 01/04 of this funnel).

## Method Selection Guidance
Treat churn-warning signs as tiered by severity (medium: proactive check-in; critical: same-day founder call) rather than uniformly — a 7-day silence and an explicit cancellation question demand very different response speeds, and treating them the same either overreacts to normal quiet periods or underreacts to genuine risk.
