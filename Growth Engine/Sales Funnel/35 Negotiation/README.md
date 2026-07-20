# 35 Negotiation

> **Stage 35 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 9).

---

## Navigation

- ⬅ Previous stage: [34 Pricing and Packaging](../34 Pricing and Packaging/README.md)
- ➡ Next stage: [36 Contract and Legal](../36 Contract and Legal/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Handle price and term pushback on a sent proposal (Stage 33) using standard scripted responses and a defined discount-authorization policy, converging on agreed terms without eroding margin below the policy floor.

**Purpose:** Improvised, rep-by-rep negotiation risks inconsistent discounting and can erode the value-based pricing discipline built in Stage 34. This stage exists to give every rep the same response scripts for the same handful of common asks, and a clear escalation ladder and approval gate for anything beyond standard policy — so negotiation converges predictably rather than becoming a case-by-case improvisation.

**Inputs:**
- Sent proposal and any price/term pushback received (Stage 33)
- Pricing catalog and discount policy (Stage 34)
- Broader objection-response library (Stage 26), for non-price objections raised at this point

**Outputs:**
- Agreed final price, discount %, and terms, logged with an approver if above threshold
- Either a deal ready to move to contract (Stage 36), or a politely declined deal routed to 90-day nurture (Stage 24)

**Expected Result:** Price/term negotiation resolves quickly using consistent scripts, discounting stays within policy or is explicitly approved, and deals that can't be sustainably closed are declined rather than under-priced.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **35A** Negotiation Principles | Scripted-response-first discipline; never improvise a discount on the spot |
| **35B** Common Asks & Scripted Responses | Standard replies to "cheaper?", "one service only?", "thinking about it", "comparing others" |
| **35C** Price-Pushback Escalation Ladder | Reframe on ROI → smaller scope → prepay discount → decline and nurture |
| **35D** Discount Authorization | Standard discretionary threshold and named-approver sign-off above it |
| **35E** Walk-Away Handling | When and how to decline gracefully and route to 90-day nurture |

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
- Personalizing a standard scripted response to the prospect's exact wording without altering the underlying policy
- Flagging when a rep's draft response implies a discount beyond the standard threshold, before it's sent

**Prompt examples:**
```
"The prospect said: '[exact objection text]'. Match this to one of our
four standard negotiation categories and draft a personalized response
using the matching script from templates.md, without changing the
underlying discount policy."
```

**Agent workflows:** An agent can draft the personalized response and flag threshold-breaching discount requests for approval, but the actual approval decision and any final discount above policy remain human (founder/named-approver) calls.

**RAG / vector database considerations:** Not required — the scripted-response table is small and fixed enough for direct lookup.

**LLM recommendations:** Standard current-generation models are sufficient; the policy logic (threshold checks) should be enforced by the workflow, not left to model judgment.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Negotiation record fields (mandatory)
`Opportunity ID` · `Objection Category` · `Discount Requested (%)` · `Discount Approved (%)` · `Approver` · `Outcome` (Agreed/Declined/Nurture) · `Final Price`

### JSON schema
```json
{
  "opportunity_id": "string",
  "objection_category": "price|scope|hesitation|competitor",
  "discount_requested_pct": 0.0,
  "discount_approved_pct": 0.0,
  "approver": "string|null",
  "outcome": "agreed|declined|nurture",
  "final_price": 0.0
}
```

### Validation rules
- `discount_approved_pct` above the standard threshold requires a non-null `approver`
- `outcome: agreed` requires `final_price` to be populated and to match the figure that will appear in the contract (Stage 36)
- `outcome: declined` or `nurture` routes the opportunity back to Stage 24's 90-day cadence

### Naming conventions
- `objection_category` is a fixed enum matching the four standard scripted-response categories in [templates.md](templates.md)

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Response matched to a standard category before drafting, not improvised
- [ ] Discount within threshold or has a named approver
- [ ] Hourly-rate floor never breached
- [ ] Final negotiated terms match what's written into the contract

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Negotiation-to-signed rate | Track and trend | Primary success metric for this stage |
| Average discount granted | Track and trend, flag if trending above threshold | Signals pricing/positioning health |
| Above-threshold approval turnaround time | Track and trend | Slow approvals risk losing deal momentum |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [34 Pricing and Packaging](../34 Pricing and Packaging/README.md)
- **Next stage:** [36 Contract and Legal](../36 Contract and Legal/README.md)
- **Depends on:** [33 Proposal Creation](../33 Proposal Creation/README.md), [34 Pricing and Packaging](../34 Pricing and Packaging/README.md), [26 Objection Handling](../26 Objection Handling/README.md)
- **Feeds:** [36 Contract and Legal](../36 Contract and Legal/README.md), [24 Follow Up Systems](../24 Follow Up Systems/README.md) (on decline)

> **Source note:** Built from the "Handling Negotiation" section of the internal "Proposal & Deal Closing SOP" doc, combined with the "Discount & Negotiation Policy" and price-pushback escalation ladder from the internal "Pricing Strategy — Tiers & Packaging" doc.

[⬅ Back to README](README.md)
