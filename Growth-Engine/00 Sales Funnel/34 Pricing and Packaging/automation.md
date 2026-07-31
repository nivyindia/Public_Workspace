# Automation — 34 Pricing and Packaging

[⬅ Back to README](README.md)

> **Flag: 🔴 (mostly strategic/negotiated)** — per [N8N-AUTOMATION-INDEX.md](../N8N-AUTOMATION-INDEX.md). The *packaging decision* (which tier structure exists, what's bundled, when to introduce a new tier) is a strategic call that shouldn't be automated. What legitimately automates is the *lookup, calculation, and delivery* of an already-decided price — that's where this file puts its depth, rather than fabricating automation for the judgment call.

For each component below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Price Catalog Lookup & Quote Total Calculation

| Level | Workflow |
|---|---|
| **Manual** | Rep looks up the current tier + market (India/International) price in a shared doc, manually adds any add-ons, hand-types the total into the proposal. |
| **Semi-automated** | Rep selects a tier + market from a dropdown in the CRM/quoting tool's product library; add-ons are toggled from a fixed list; the tool computes the total rather than the rep doing manual math. |
| **Fully automated** | A single source-of-truth pricing catalog (HubSpot Product Library, Odoo Sales Pricelist, or a Notion/Sheets database) is queried by tier + market + add-on selection, and the total is computed and returned without a human doing arithmetic anywhere in the chain. |
| **AI-assisted** | None appropriate here — a calculation step should be deterministic, not LLM-generated. This is the one sub-area of this stage where "AI-assisted" is deliberately skipped rather than forced in. |

**Required:** one catalog system of record (HubSpot Product Library, Odoo Sales pricelist, or Notion/Sheets database) · CRM or quoting-tool integration to read it.
**Expected output:** a tier + market + add-on combination resolving to a single correct total, with no manual arithmetic step.
**Common errors:** two copies of the price list drifting out of sync (e.g., a Notion table and a separately-maintained Sheet) — recovery: designate exactly one system of record and have every other surface (CRM, proposal tool) read from it via API/sync rather than being re-typed; a rep manually overriding a catalog price without logging why (recovery: require a reason-code field on any manual override, feeding Batch discount-threshold logging in [35 Negotiation](../35 Negotiation/automation.md)).

---

## 2. Add-On & Bundle Configuration

| Level | Workflow |
|---|---|
| **Manual** | Rep remembers (or re-checks a doc for) which add-ons are compatible with which tier and prices them individually. |
| **Semi-automated** | Add-ons are pre-mapped to compatible tiers in the catalog tool, so an incompatible combination can't be selected in the first place. |
| **Fully automated** | Selecting a tier automatically filters the add-on list to only compatible options and pre-fills their pricing — no separate compatibility check required. |
| **AI-assisted** | LLM step (optional) suggests likely-relevant add-ons based on the prospect's stated scope from [31 Solution Mapping](../31 Solution Mapping/README.md) — a suggestion only, never an auto-added line item. |

**Required:** catalog tool with tier/add-on relationship data (not just a flat price list).
**Expected output:** an add-on selection that's always valid for the chosen tier, with no manual compatibility check.
**Common errors:** an add-on quietly discontinued or repriced without updating its catalog entry (recovery: catalog changes should go through the same single source-of-truth update as the base tiers, not a side channel).

---

## 3. Proposal Section Auto-Population (feeds Stage 33)

| Level | Workflow |
|---|---|
| **Manual** | Rep re-types the agreed tier/add-on/total into the proposal document by hand. |
| **Semi-automated** | Rep copies the calculated total from the quoting tool into the proposal document's pricing section. |
| **Fully automated** | Once a tier + market + add-ons are selected in the catalog tool, the pricing table auto-populates Section 3 of the proposal directly (same document-merge mechanism used in [33 Proposal Creation](../33 Proposal Creation/automation.md)) — no copy-paste step. |
| **AI-assisted** | LLM drafts the ROI-anchoring paragraph that sits alongside the pricing table, using the prospect's own numbers (deal size, expected volume, cost of the problem) against the tier price — never the price itself, only the framing text around it. |

**Required:** the same document-merge pipeline as Stage 33 · read access to the catalog's calculated total.
**Expected output:** a proposal pricing section that always reflects the catalog's current figure, with zero manual re-entry.
**Common errors:** a stale cached total if the proposal is generated before the catalog finishes updating (recovery: generate the proposal section on-demand from a live catalog query, not from a cached snapshot); rep sending a proposal before the ROI paragraph is reviewed (recovery: keep a mandatory human review gate before send — see §4 below).

---

## 4. Discount-Threshold Guardrail & Logging

| Level | Workflow |
|---|---|
| **Manual** | Founder verbally approves a discount over chat/call with no written record. |
| **Semi-automated** | Rep logs the discount and reason in a CRM note after the fact. |
| **Fully automated** | Any discount applied beyond the standard discretionary threshold is automatically flagged and logged in the CRM the moment it's entered — before, not after, founder sign-off is granted — so there's always a record even if approval is still pending. |
| **AI-assisted** | None — approval of a discount beyond threshold is a human, non-automatable decision by design (see below). |

**Required:** a threshold value configured in the catalog/CRM tool · a logging field that captures amount, reason, and approver.
**Expected output:** a complete, timestamped audit trail of every above-threshold discount, whether or not it was ultimately approved.
**Common errors:** discounts applied and only logged verbally or in a side chat thread that isn't searchable later (recovery: the CRM log is the only record that counts — a Slack/WhatsApp approval message should always be followed by a CRM log entry, not treated as a substitute for one).

---

## What Does NOT Automate Here (and Why)

- **Founder/named-approver sign-off on any Enterprise-tier custom quote or any discount above the standard discretionary threshold.** This is a commercial judgment call with real margin consequences — automating it away removes the one check that catches a pricing mistake before it reaches a client.
- **The packaging/tier design decision itself** (what belongs in which tier, when to introduce or retire a tier). This is a strategic decision made periodically, not a per-deal workflow, and doesn't belong in a per-deal automation pipeline at all.

---

## Suggested n8n / Integration Flow

`Solution map (Stage 31) → Pricing catalog lookup (tier + market) → Compatible add-on filter → Total calculation → Auto-populate proposal Section 3 (Stage 33) → If discount requested: threshold check → (above threshold: log + hold for approval | at/below threshold: proceed) → Rep review → Send`

## Recovery Principles (General)

- **One system of record for pricing, always.** Every tool that displays a price (CRM, proposal tool, this stage's own catalog) should read from the same source rather than maintaining its own copy — this is the single biggest failure mode across all four sub-areas above.
- **Log before approving, not after.** A discount request should hit the CRM log the moment it's raised, independent of whether it's later approved — this preserves the audit trail even for requests that get rejected.
- **Never let arithmetic be the human's job once a catalog exists.** Any step where a rep is doing multiplication or addition by hand is a step that should have already been automated by §1 above.

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods referenced above: [methods.md](methods.md)
- Tools referenced above: [tools.md](tools.md)
- Feeds pricing into: [33 Proposal Creation](../33 Proposal Creation/README.md)
- Discount requests escalate to: [35 Negotiation](../35 Negotiation/README.md)
- Agreed price flows into: [36 Contract and Legal](../36 Contract and Legal/README.md)
