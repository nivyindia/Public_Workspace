# 34 Pricing and Packaging

> **Stage 34 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 9).

---

## Navigation

- ⬅ Previous stage: [33 Proposal Creation](../33 Proposal Creation/README.md)
- ➡ Next stage: [35 Negotiation](../35 Negotiation/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Maintain and apply a single, market-segmented, value-based pricing catalog (tiers, add-ons, discount policy) so every proposal (Stage 33) quotes consistent, ROI-anchored pricing rather than ad hoc, rep-negotiated figures.

**Purpose:** Inconsistent or improvised pricing erodes margin and creates internal confusion about what's actually being sold. This stage exists to give every rep the same published tier catalog and communication framework, so pricing conversations are predictable, defensible, and always framed around value rather than led with a raw number.

**Inputs:**
- Approved solution map (Stage 31) — determines which tier fits
- Market segment (India vs. International)
- Competitor pricing benchmarks (Stage 04, refreshed periodically)

**Outputs:**
- The tier + price + add-ons figure that populates Section 3 of the proposal (Stage 33)
- The discount/negotiation policy that governs Stage 35 (Negotiation)

**Expected Result:** Every proposal quotes from the same current catalog, discounting stays within policy unless a named approver signs off, and pricing is always presented after — never before — the value/ROI case is made.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **34A** Pricing Philosophy | Value-based, retainer-first, market-segmented, transparent, results-anchored |
| **34B** Service Tiers | Starter / Growth / Pro / Enterprise — scope, hours, team allocation, support level |
| **34C** Pricing Table | International (US/UK/AU/UAE) and India-market figures per tier |
| **34D** Add-On Services | Priced extras (extra hours, lead lists, copywriting, automation builds, etc.) |
| **34E** Discount & Negotiation Policy | What's discountable, what isn't, and the price-pushback escalation ladder |
| **34F** Pricing Communication Guide | Never-lead-with-price sequencing and ROI-anchoring proposal structure |

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
- Drafting the ROI-anchoring paragraph for a specific prospect's numbers, once tier + price are selected from the catalog
- Flagging when a rep's draft quote deviates from the published catalog figures

**Prompt examples:**
```
"The prospect's average deal size is [X] and they expect [Y] extra
qualified conversations per month from our Growth tier ($1,000/mo).
Draft a 2-sentence ROI-anchoring paragraph in the style of the source
doc's example, using their own numbers."
```

**Agent workflows:** An agent can auto-populate Section 3 of a proposal (Stage 33) directly from the pricing catalog once tier + market + add-ons are selected, but any discount above the standard threshold or any Enterprise custom quote requires human (founder/named-approver) sign-off before it reaches a prospect.

**RAG / vector database considerations:** Not required — the catalog is small and structured enough to be looked up directly rather than retrieved semantically.

**LLM recommendations:** Standard current-generation models are sufficient for ROI-paragraph drafting; pricing figures themselves must come from the catalog, never generated or estimated by the model.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Pricing catalog fields (mandatory)
`Tier` · `Market` (India/International) · `Monthly Price` · `Hours Included` · `Effective Hourly Rate` · `Team Allocation` · `Support Level` · `Last Verified Date`

### JSON schema
```json
{
  "tier": "starter|growth|pro|enterprise",
  "market": "india|international",
  "monthly_price": 0.0,
  "currency": "USD|INR",
  "hours_included": 0,
  "effective_hourly_rate": 0.0,
  "support_level": "string",
  "last_verified_date": "ISO 8601 date"
}
```

### Validation rules
- Every quoted price must trace to a catalog row with a `last_verified_date` — stale, unverified figures are not quoted
- Discount percentage applied must not exceed the standard threshold without a logged approver (see [checklists.md](checklists.md))
- Enterprise tier is always marked "custom" — never quoted from a fixed number

### Naming conventions
- Tier names are a fixed enum (Starter/Growth/Pro/Enterprise) so pipeline reporting on tier mix stays consistent across markets

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Single source-of-truth catalog, no conflicting figures across documents
- [ ] Quote matches the approved solution map's tier
- [ ] Discount within policy or has a named approver
- [ ] Price presented only after discovery/solution framing (never led with)

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Catalog-to-quote consistency | 100% | No proposal should quote a figure that doesn't match the current catalog |
| Average discount applied | Track and trend, flag if above threshold | Signals whether pricing/positioning needs review |
| Tier mix distribution | Track and trend | Informs whether packaging (not just price) needs adjustment |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [33 Proposal Creation](../33 Proposal Creation/README.md)
- **Next stage:** [35 Negotiation](../35 Negotiation/README.md)
- **Depends on:** [31 Solution Mapping](../31 Solution Mapping/README.md), [04 Competitor Research](../04 Competitor Research/README.md)
- **Feeds:** [33 Proposal Creation](../33 Proposal Creation/README.md) Section 3, [35 Negotiation](../35 Negotiation/README.md)

> **Source note:** Built directly from the internal "Pricing Strategy — Tiers & Packaging" doc in this repo's Growth Engine folder, which is already a complete pricing playbook covering philosophy, tiers, market-segmented pricing tables, add-ons, discount policy, and communication guidance.

[⬅ Back to README](README.md)
