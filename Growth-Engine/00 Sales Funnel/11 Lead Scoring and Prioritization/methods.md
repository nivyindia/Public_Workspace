# 11 Lead Scoring and Prioritization — Methods

[⬅ Back to README](README.md)

---

## Traditional / Manual

**Manual VA daily scoring** — a VA reviews new/updated contacts each morning, checks the CRM activity feed (emails opened, pages visited, forms filled), and manually enters a fit + behavior score using the documented rule table (see [templates.md](templates.md)). Works on any CRM, including free tiers with no native scoring field beyond a custom number property. Slow at volume (>50 leads/day becomes a bottleneck) but requires zero tooling spend.

**Spreadsheet scoring** — for teams not yet on a CRM, a scoring formula column in Google Sheets/Excel (`=SUMIF` style weighted sum across fit and behavior columns) replicates the rule table mechanically. Useful as a bridge before CRM adoption but loses real-time behavioral triggers.

---

## Semi-Automated

**Webhook-triggered score updates (n8n)** — CRM events (form submit, booking, email click) fire a webhook; an n8n workflow reads the event type, looks up the point value from the rule table, adds it to the lead's current score field via the CRM API, and re-tags the tier if a threshold is crossed. This is the standard approach for teams on free-tier CRM (HubSpot Free) that lacks native scoring — see [automation.md](automation.md) for the workflow pattern.

**Scheduled batch re-scoring** — a nightly/weekly automation pulls all leads, recalculates fit scores against current ICP rules (catches leads whose company size/role data was updated by enrichment), and applies score decay to leads with no activity in N days.

---

## Fully Automated (Native Platform)

**Native CRM lead scoring** — HubSpot Starter+/Professional, Salesforce, and Pipedrive all include configurable scoring engines where rules are set once in the platform UI and scores update automatically on every tracked event, with no external automation layer required. Recommended once budget allows (~$20-50/mo entry tier); removes the webhook-maintenance overhead of the semi-automated approach.

**Predictive/AI-native scoring** — higher CRM tiers (HubSpot Enterprise, Salesforce Einstein) offer machine-learned scoring based on historical closed-won patterns rather than manually-weighted rules. Appropriate only once there is enough historical conversion data (typically 100+ closed deals) to train against; not a Stage 11 baseline for an early-stage funnel.

---

## AI-Assisted

**LLM-based qualitative fit scoring** — for signals a CRM field can't capture (LinkedIn bio tone, recent post content, job-posting language suggesting a pain point), an LLM reads the unstructured text and outputs a fit sub-score plus a one-line justification, which is then written to the CRM alongside the rule-based score.

**Bulk backlog scoring** — when a large unscored lead backlog exists (e.g., after a big extraction batch), an LLM can apply the documented rule table consistently across hundreds of rows from a CSV export faster and more consistently than manual review, with a QC spot-check afterward.

**Score-reason summarization** — instead of a VA reconstructing why a lead is "Hot" from raw activity logs, an LLM generates a one-line summary ("Founder, US, visited pricing 2x, booked then no-showed a call") attached to the Slack alert — see [automation.md](automation.md).

---

## Method Selection Guide

| Team situation | Recommended method |
|---|---|
| Free-tier CRM, < 20 leads/day | Manual VA daily scoring |
| Free-tier CRM, 20-100 leads/day | Semi-automated (n8n webhook) |
| Paid CRM tier available, any volume | Native CRM scoring |
| Large unscored backlog after a bulk import | AI-assisted bulk scoring, then switch to ongoing automation |
| Mature funnel with 100+ closed deals of history | Consider predictive/AI-native scoring as an enhancement |

---

[⬅ Back to README](README.md) · [Next: tools.md](tools.md)
