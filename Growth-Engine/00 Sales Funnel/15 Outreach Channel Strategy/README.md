# 15 Outreach Channel Strategy

> **Stage 15 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 3, Session 5). Batch 3 complete — Stages 11–15 now at pilot depth.

---

## Navigation

- ⬅ Previous stage: [14 List Building and List Management](../14 List Building and List Management/README.md)
- ➡ Next stage: [16 Email Outreach](../16 Email Outreach/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Decide, per segment and market, which channel(s) — email, LinkedIn, cold call, WhatsApp, SMS — a campaign will use and in what sequence/combination, before any individual channel stage (16-21) is executed.

**Purpose:** Stages 16-21 each document *how* to execute a single channel well. This stage decides *which* channel(s) to use for a given segment/market and *why* — a decision Stages 16-21 assume has already been made. Skipping this stage means every campaign defaults to whatever channel the VA is most comfortable with, rather than the channel actually best suited to that persona and geography (e.g., WhatsApp is a primary business channel in India/UAE but a poor fit for cold B2B outreach in the US).

**Inputs:**
- Segment definitions (Stage 12) and campaign list (Stage 14)
- Persona channel preferences (from Stage 03 buyer persona research)
- Market-specific channel norms and compliance constraints (e.g., cold-calling regulations, email opt-in requirements per country)
- Available team capacity/skill per channel

**Outputs:**
- A documented channel plan per campaign: primary channel, secondary/backup channel, and whether channels run sequentially or in parallel
- Channel-mix rationale logged, so future campaigns can reuse or challenge past decisions with evidence

**Expected Result:** No campaign launches without an explicit, justified channel decision; channel selection is based on persona/market fit and past performance data, not default habit.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **15A** Channel Landscape by Market | Which channels are viable/preferred/regulated per target country |
| **15B** Channel Fit by Persona | Which channel(s) each Buyer Persona (Stage 03) responds to best |
| **15C** Single-Channel vs. Multi-Channel Decision | When one channel suffices vs. when sequencing (Stage 21) is warranted |
| **15D** Channel Sequencing Logic | Order and timing when multiple channels are combined (e.g., email → LinkedIn → call) |
| **15E** Compliance Constraints by Channel/Market | Opt-in/opt-out rules, cold-calling registries, WhatsApp Business API policies |
| **15F** Channel Performance Tracking | Logging which channel-mix decisions actually convert, feeding future decisions |
| **15G** Channel Capacity Planning | Matching channel choice to available team bandwidth/skill |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — this is a decision/strategy stage. See [tools.md](tools.md) for channel-mix planning and tracking tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Recommending a starting channel mix for a new segment/market combination based on documented persona research and past campaign performance data
- Drafting the compliance constraint summary for a new target market before the team starts outreach there
- Reviewing historical channel performance data and surfacing which channel-mix patterns are under- or over-performing

**Prompt examples:**
```
"Given this Buyer Persona [paste Stage 03 summary] and this target market
[country], and this table of past channel performance by segment [paste],
recommend a primary and secondary outreach channel with reasoning."
```
```
"Summarize cold-outreach compliance constraints (email opt-in, cold-calling
registry rules, messaging-app business-use policies) for [country]. Flag
anything materially different from US/UK norms."
```

**Agent workflows:** Not typically needed as a standing agent — this is a periodic planning decision (per campaign or per new market) rather than a continuous automated process. An LLM-assisted planning pass is sufficient.

**RAG / vector database considerations:** Not applicable at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient; treat compliance-related outputs as a starting point requiring verification against current local regulation before relying on it operationally.

**Automation opportunities:** See [automation.md](automation.md) for performance-tracking automation feeding future channel decisions.

---

## 8. Data Structure

### Channel plan fields (mandatory)
`Segment` · `Market` · `Primary Channel` · `Secondary Channel` · `Sequencing` (parallel/sequential + order) · `Compliance Notes` · `Owner` · `Date Decided`

### JSON schema
```json
{
  "segment": "string",
  "market": "string",
  "primary_channel": "email|linkedin|cold_call|whatsapp|sms",
  "secondary_channel": "email|linkedin|cold_call|whatsapp|sms|null",
  "sequencing": "parallel|sequential",
  "sequence_order": ["string"],
  "compliance_notes": "string",
  "owner": "string",
  "date_decided": "ISO 8601 date"
}
```

### Validation rules
- Every campaign list (Stage 14) must have an associated channel plan before being handed to Stages 16-21
- Channel choice for a given market must be checked against that market's compliance constraints before approval (e.g., cold-calling into a Do-Not-Call-registry country requires a documented exemption or is disallowed)

### Naming conventions
- Channel values are drawn from the fixed enum matching Stage 16-20's names exactly (`email`, `linkedin`, `cold_call`, `whatsapp`, `sms`) so cross-referencing is reliable

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every active campaign list has a documented, approved channel plan
- [ ] Compliance notes reviewed for any new market before first send
- [ ] Channel choice logged with a rationale, not left blank/default

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of campaigns with a documented channel plan before launch | 100% | |
| Channel-mix decision accuracy (post-campaign review) | Reviewed per campaign | Did the chosen channel actually outperform alternatives tested? |
| Compliance incidents | 0 | Any cold-calling/messaging violation is a hard stop, not a metric to minimize |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [14 List Building and List Management](../14 List Building and List Management/README.md)
- **Next stage:** [16 Email Outreach](../16 Email Outreach/README.md)
- **Also feeds:** [17 LinkedIn Outreach](../17 LinkedIn Outreach/README.md), [18 Cold Calling](../18 Cold Calling/README.md), [19 WhatsApp Outreach](../19 WhatsApp Outreach/README.md), [20 SMS Outreach](../20 SMS Outreach/README.md), [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)

> **Source note:** No dedicated internal "channel strategy" SOP existed in source material at time of writing. This stage was built from the persona/market research established in Stages 01-03 plus general multi-channel B2B outreach practice, generalized for this knowledge base. Compliance notes are a starting point only and must be verified against current local regulation before operational use.

[⬅ Back to README](README.md)
