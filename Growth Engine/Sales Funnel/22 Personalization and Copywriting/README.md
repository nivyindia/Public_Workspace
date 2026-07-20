# 22 Personalization and Copywriting

> **Stage 22 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 5, Session 7).

---

## Navigation

- ⬅ Previous stage: [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)
- ➡ Next stage: [23 Deliverability and Domain Health](../23 Deliverability and Domain Health/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Define the copywriting standards and personalization method used across every channel template in Stages 16-21, so messaging stays persuasive, on-brand, and genuinely tailored rather than templated-and-obvious.

**Purpose:** Stages 16-21 each ship channel-specific templates, but none of them define *how* to write good outreach copy or *what* "personalized" actually means beyond inserting a first name. Without this stage, templates drift — some reps write long pitchy emails, others write generic one-liners, and "personalization" becomes merge-field insertion rather than a genuine signal that the sender did their homework. This stage exists to give every channel template a shared copywriting standard and a repeatable personalization method.

**Inputs:**
- Buyer Persona and Value Proposition research (Stages 02-03)
- Enrichment data available per contact (Stage 08) to draw personalization signals from
- Channel-specific format constraints (character limits, tone norms) from Stages 16-21

**Outputs:**
- A documented copywriting style guide (voice, length, structure rules) applied across all channel templates
- A personalization framework defining which data fields justify a genuine personalization line vs. generic merge-fields
- Reviewed/approved template library feeding back into Stages 16-21's templates.md files

**Expected Result:** Every outreach message — regardless of channel — reads as written by a person who did specific homework on that contact, not as an obviously mail-merged template, while staying within each channel's format constraints.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **22A** Voice & Tone Standard | The brand voice rules every template must follow (see Value Proposition, Stage 02) |
| **22B** Personalization Data Sources | Which Stage 08 enrichment fields are strong enough to build a genuine personalization line from |
| **22C** Personalization Depth Tiers | Tier 1 (name/company merge) vs. Tier 2 (industry-specific line) vs. Tier 3 (contact-specific researched line) |
| **22D** Copy Length & Structure Rules | Per-channel length/structure constraints, consolidated from Stages 16-21 |
| **22E** A/B Testing Framework | Structured comparison of copy variants by reply/booking rate |
| **22F** Copy Review & Approval Workflow | Who reviews new templates before they go live at volume |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for copy-drafting and A/B testing tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting Tier-2/Tier-3 personalization lines from enrichment data at scale, for human spot-check before sending
- Generating copy variants for A/B testing against a documented voice/tone standard
- Flagging templates that violate length/structure rules before they're approved

**Prompt examples:**
```
"Using this voice/tone guide [paste] and this enrichment data on the
contact [paste], write a Tier-3 personalization line (1 sentence,
specific to this contact, not generic industry language)."
```
```
"Here are 2 email opener variants: [paste both]. Which better matches
this voice/tone standard [paste], and why?"
```

**Agent workflows:** A batch-personalization agent can draft Tier-2 (industry-specific) lines automatically for an entire segment, but Tier-3 (contact-specific researched) lines should be spot-checked by a human before volume sending, since a wrong or stale personalization detail reads worse than a generic one.

**RAG / vector database considerations:** A small reference set (voice/tone guide, past high-performing templates, persona docs) is sufficient context; not at a scale requiring a vector database.

**LLM recommendations:** Standard current-generation models are sufficient for drafting; human review remains the quality gate before volume use.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Template metadata fields (mandatory)
`Template ID` · `Channel` · `Segment` · `Personalization Tier` (1/2/3) · `Status` (Draft/Approved/Live/Retired) · `Approved By` · `A/B Variant Group`

### JSON schema
```json
{
  "template_id": "string",
  "channel": "email|linkedin|cold_call|whatsapp|sms",
  "segment": "string",
  "personalization_tier": 1,
  "status": "draft|approved|live|retired",
  "approved_by": "string",
  "ab_variant_group": "string|null"
}
```

### Validation rules
- No template goes live at volume without an `Approved` status and a named approver
- Personalization Tier must match what the template actually delivers — a template with only merge-fields cannot be labeled Tier 2/3

### Naming conventions
- Template IDs follow `[Channel]-[Segment]-[Tier]-v[N]` (e.g., `email-SME-T2-v1`) so performance can be tracked and compared across variants and channels

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every live template reviewed and approved against the voice/tone standard
- [ ] Personalization tier claimed matches what the template actually delivers
- [ ] No unfilled merge-field placeholders in any sent message

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Reply rate by personalization tier | Track and trend | Should show Tier 3 > Tier 2 > Tier 1; if not, investigate copy quality |
| Template approval turnaround | Track and trend | Slow approval delays campaign launches |
| % of sent messages with unfilled placeholders | 0% | Hard QC failure |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)
- **Next stage:** [23 Deliverability and Domain Health](../23 Deliverability and Domain Health/README.md)
- **Feeds into:** [16 Email Outreach](../16 Email Outreach/README.md) through [20 SMS Outreach](../20 SMS Outreach/README.md) templates

> **Source note:** No single internal doc addresses copywriting/personalization as a standalone discipline; this stage synthesizes the tone and structure patterns already present across the Cold Email, LinkedIn, and WhatsApp SOPs mined for Stages 16-19, generalized into a shared standard for this knowledge base.

[⬅ Back to README](README.md)
