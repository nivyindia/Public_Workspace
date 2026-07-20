# 15 Outreach Channel Strategy — Methods

[⬅ Back to README](README.md)

---

## Manual

**Persona-driven manual selection** — campaign owner reviews the Buyer Persona (Stage 03) and market compliance notes, selects primary/secondary channel using judgment and the fit table in [templates.md](templates.md), and logs the decision.

## Data-Driven

**Historical performance-based selection** — once enough campaigns have run, channel choice for a segment/market is driven by logged past performance (reply rate, booking rate per channel) rather than judgment alone. Requires the KPI tracking described in [automation.md](automation.md) to have accumulated data.

## AI-Assisted

**Recommendation drafting** — an LLM reviews the persona profile, market, and any available historical performance data and drafts a recommended channel mix with reasoning, which the campaign owner approves or overrides (see prompt examples in [README.md](README.md)).

**Compliance summary drafting** — before entering a new market, an LLM drafts a starting compliance-constraint summary (cold-calling rules, messaging-app business policies, email opt-in norms) for human legal/compliance review — never used unverified as final guidance.

## Method Selection Guide

| Situation | Recommended method |
|---|---|
| New segment/market, no historical data yet | Persona-driven manual selection, AI-assisted draft |
| Established segment with campaign history | Data-driven, historical performance-based |
| Entering a new country for the first time | AI-assisted compliance draft + manual legal review before any send |

[⬅ Back to README](README.md) · [Next: tools.md](tools.md)
