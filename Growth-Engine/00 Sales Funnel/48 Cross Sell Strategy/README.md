# 48 Cross Sell Strategy

> **Stage 48 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 8, Session 11).

---

## Navigation

- ⬅ Previous stage: [47 Upsell Identification](../47 Upsell Identification/README.md)
- ➡ Next stage: [49 Renewal Management](../49 Renewal Management/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Add a second or third complementary service to a client already on one Level 2 retainer, using a defined "golden combination" map, and recognize when a client's growing service footprint signals readiness for an integrated Level 3 system.

**Purpose:** Cross-selling without a combination logic risks pitching services that don't reinforce each other, or missing genuine expansion opportunities entirely. This stage exists to give every rep the same reasoned map of which services compound together, so cross-sell conversations are grounded in "why this helps what you already have" rather than a generic add-on pitch.

**Inputs:**
- A client's current service holdings (from CRM/delivery records)
- Results and trust already established on the primary service (feeds from Stage 45/47)

**Outputs:**
- A cross-sell conversation matched to the golden combination table, or
- A flagged Level 3 system-upgrade opportunity routed to the strategy team
- A logged attempt (same tracker as Stage 47 upsell attempts)

**Expected Result:** Clients expand their service footprint along combinations that genuinely reinforce their existing results, growing account value predictably rather than through opportunistic, unreasoned pitching.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **48A** Service-Holding Tracking | CRM record of what a client currently has, feeding combination matching |
| **48B** Golden Combination Matching | Mapping current service to the reasoned Cross-Sell 1 / Cross-Sell 2 pairing |
| **48C** Quick-Trigger Recognition | Listening for specific client phrases that signal a cross-sell opportunity |
| **48D** Level 3 System-Upgrade Readiness | Recognizing when 2+ Level 2 services or explicit integration requests signal upgrade readiness |
| **48E** Regional Framing | USA (ROI/dollar-led) vs. international (value-for-money/local-comparison-led) approach |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Matching a client's current service holding against the golden combination table automatically, surfacing the correct Cross-Sell 1/2 pairing
- Recognizing quick-trigger phrases in client conversation transcripts/messages and suggesting the matching cross-sell response

**Prompt examples:**
```
"This client currently has [SERVICE]. Using the golden combination
table, what are the two recommended cross-sell services and the
one-sentence rationale for each?"
```

**Agent workflows:** An agent can flag combination matches and quick-trigger phrases, but the actual cross-sell conversation and any Level 3 upgrade recommendation remain human — these carry real relationship and budget-readiness judgment that shouldn't be automated.

**RAG / vector database considerations:** Not required — the combination table is small and structured enough for direct lookup.

**LLM recommendations:** Standard current-generation models are sufficient for matching and trigger-phrase recognition.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Cross-sell attempt fields (mandatory)
`Client ID` · `Date` · `Primary Service` · `Cross-Sell Offered` · `Trigger Used` · `Response` (Interested/Not Now/No/Closed) · `Level 3 Flag` (Y/N) · `Next Step`

### JSON schema
```json
{
  "client_id": "string",
  "date": "ISO 8601 date",
  "primary_service": "string",
  "cross_sell_offered": "string",
  "trigger_used": "string",
  "response": "interested|not_now|no|closed",
  "level_3_flag": false,
  "next_step": "string"
}
```

### Validation rules
- `cross_sell_offered` must map to an actual row in the golden combination table for the client's `primary_service`
- `level_3_flag: true` requires the client to hold 2+ Level 2 services or have an explicit integration-request quote on record
- `response: interested` on a Level 3 flag routes to a strategy-team call booking, not a self-close

### Naming conventions
- Shares its tracker and enum conventions with Stage 47's upsell attempt log, so combined-motion reporting (upsell + cross-sell) stays consistent

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Cross-sell matches an actual golden-combination-table row
- [ ] Rationale communicated, not a generic bolt-on pitch
- [ ] Level 3 only recommended once readiness signals are genuinely present
- [ ] Regional framing (USA vs. international) applied correctly

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Cross-sell-to-interested conversion rate | Track and trend | Should reflect the reasoning behind the combination, not just offer volume |
| Clients holding 2+ services | Track and trend | Direct measure of expansion-strategy effectiveness |
| Level 3 upgrade conversion rate | Track and trend | High-value metric given system-tier deal sizes |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [47 Upsell Identification](../47 Upsell Identification/README.md)
- **Next stage:** [49 Renewal Management](../49 Renewal Management/README.md)
- **Depends on:** [45 Product and Service Adoption](../45 Product and Service Adoption/README.md), [47 Upsell Identification](../47 Upsell Identification/README.md)
- **Feeds:** [33 Proposal Creation](../33 Proposal Creation/README.md) through [37 Closing Techniques](../37 Closing Techniques/README.md) (for the expanded-scope deal), [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md)

> **Source note:** Built directly from the internal "Sell → Upsell → Cross-Sell Playbook" doc, which is already a complete, comprehensive playbook covering the entry/upsell/cross-sell/system-upgrade flow, golden combination tables, Level 3 upgrade signals, regional selling guidance, and quick-trigger phrase recognition.

[⬅ Back to README](README.md)
