# 13 CRM Setup and Data Structuring

> **Stage 13 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 3, Session 5).

---

## Navigation

- ⬅ Previous stage: [12 Lead Segmentation](../12 Lead Segmentation/README.md)
- ➡ Next stage: [14 List Building and List Management](../14 List Building and List Management/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Stand up and correctly configure the CRM (contact properties, deal pipeline, custom fields, permissions) so every prior stage's output (extraction, enrichment, scoring, segmentation) has a structured home, and every later stage (outreach, follow-up, closing, account management) has reliable data to work from.

**Purpose:** Every other stage in this funnel writes to or reads from the CRM. If the CRM schema is inconsistent, missing required fields, or has no defined pipeline stages, every downstream automation (Stage 11 scoring, Stage 21 sequencing, Stage 24 follow-up) either breaks or silently produces bad data. This stage is infrastructure, not a one-time setup task — it also covers ongoing data-structure maintenance as the funnel evolves.

**Inputs:**
- Chosen CRM platform decision (budget, team size, integration needs)
- Field/property requirements gathered from every other stage in this knowledge base (each stage's Section 8 "Data Structure" defines what it needs the CRM to hold)
- Team roster and required access levels

**Outputs:**
- A fully configured CRM: contact/company properties, deal pipeline with stages and probabilities, custom fields, user roles/permissions
- Documented field dictionary so every team member and every automation refers to fields the same way
- Working integrations (email tracking, booking tool, forms, website tracking pixel)

**Expected Result:** Any lead entering the funnel from any stage lands in a CRM record with a consistent schema; any team member or automation can rely on field names/values being exactly as documented, with no ad hoc or duplicate fields created outside this stage's governance.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **13A** Platform Selection | Choosing CRM platform against budget/team-size/integration needs |
| **13B** Account & Company Setup | Base account creation, company info, timezone, branding |
| **13C** Contact Property Configuration | Default + custom contact fields (see [templates.md](templates.md)) |
| **13D** Deal Pipeline Configuration | Pipeline stages, probabilities, deal custom fields |
| **13E** Integration Setup | Email tracking, booking tool, website tracking pixel, form tool, chatbot |
| **13F** User Roles & Permissions | Admin/rep/view-only access mapped to team roles |
| **13G** Reports & Dashboards | Standard reporting views every stage's KPIs feed into |
| **13H** Data Governance & Field Dictionary | Documenting what every field means, who can create new fields, naming conventions |
| **13I** Migration (If Applicable) | Importing existing spreadsheet/legacy CRM data into the new structure without data loss |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — this stage is a platform configuration task. See [tools.md](tools.md) for CRM platform comparison.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md) for the sequences/workflows configured at setup time.

---

## 7. AI Section

**How AI can help:**
- Drafting the field dictionary and custom-property naming scheme from a plain-English description of what each downstream stage needs to store
- Reviewing an existing messy CRM (duplicate fields, inconsistent naming) and proposing a cleanup/consolidation plan
- Generating the exact click-path setup instructions for a chosen CRM platform when documentation is unclear

**Prompt examples:**
```
"Here are the Section 8 'Data Structure' requirements from Stages 06-27 of
our sales funnel knowledge base [paste]. Consolidate these into a single
non-redundant CRM contact + deal property list, flagging any fields that
appear to serve the same purpose under different names."
```

**Agent workflows:** A one-time setup agent can read this stage's field dictionary and, via CRM API/MCP integration, create the custom properties and pipeline stages programmatically instead of manual click-through setup — useful when re-provisioning a CRM instance (e.g., new market entity) to match an existing configuration.

**RAG / vector database considerations:** Not applicable to this stage.

**LLM recommendations:** Standard current-generation models are sufficient.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Contact properties (mandatory, standard)
`First Name` · `Last Name` · `Email` · `Phone` · `Company` · `Job Title` · `Country` · `Website`

### Contact properties (custom, required by this funnel)
`Lead Source` · `Service Interest` · `Market` · `Budget Range` · `Outreach Channel` · `Referral Source` · `Lead Score` (Stage 11) · `Primary Segment` (Stage 12) · `Status`

### Deal pipeline stages (template — adapt names to the business)
`New Lead (10%)` → `Contacted (20%)` → `Discovery Scheduled (40%)` → `Proposal Sent (60%)` → `Negotiation (75%)` → `Closed Won (100%)` / `Closed Lost (0%)`

### Deal custom properties
`Deal Value` · `Service Type` · `Lost Reason` · `Expected Start Date`

### Validation rules
- No custom field is created outside this stage's governance (Sub-Stage 13H) without being added to the field dictionary — prevents silent schema drift
- Every field a downstream stage's Section 8 requires must exist in the CRM before that stage goes live — audited at rollout, not discovered as a gap later

### Naming conventions
- Field names use Title Case, no abbreviations invented ad hoc (`Lead Source`, not `LdSrc`)
- Dropdown/enum fields use a fixed value list, documented in the field dictionary, not free text

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every field required by Stages 06-54's Section 8 exists in the CRM
- [ ] No duplicate fields serving the same purpose
- [ ] Pipeline stages match the actual sales process stages used in Stages 28-37
- [ ] User permissions match actual team roles (no over-provisioned access)
- [ ] Integrations (tracking pixel, booking tool, forms) verified working with a test record

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Field dictionary coverage | 100% of downstream-required fields present | Audited at initial setup and after any major funnel change |
| Duplicate/orphaned field count | 0 | Reviewed quarterly |
| Data completeness rate (mandatory fields filled) | > 90% | Sampled across active contacts |
| Integration uptime (tracking, booking sync) | No unnoticed failures > 48 hrs | Broken integrations silently starve Stage 11 scoring of data |

---

## 11. Templates

See [templates.md](templates.md) for the full property list, pipeline template, and field dictionary format.

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [12 Lead Segmentation](../12 Lead Segmentation/README.md)
- **Next stage:** [14 List Building and List Management](../14 List Building and List Management/README.md)
- **Underpins:** every stage from [06 Lead Extraction](../06 Lead Extraction/README.md) through [54 Advocacy](../54 Advocacy/README.md) — all rely on this stage's schema
- **Automation file:** [automation.md](automation.md)

> **Source note:** This stage was populated using the HubSpot CRM Setup & Configuration Guide and CRM Usage Guide already in production at Nivy Digital (SD-09, May 2026), generalized here to be platform-agnostic where the underlying concept (pipeline, custom fields, permissions) applies regardless of vendor. Pricing and platform-specific feature availability should be verified against current vendor documentation.

[⬅ Back to README](README.md)
