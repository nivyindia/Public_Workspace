# 07 Contact Discovery

> **Stage 7 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 2, Session 4).

---

## Navigation

- ⬅ Previous stage: [06 Lead Extraction](../06 Lead Extraction/README.md)
- ➡ Next stage: [08 Lead Enrichment](../08 Lead Enrichment/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Resolve a usable contact channel (verified email and/or phone) for every lead that entered the CRM from Stage 06 without one — turning a "company + name, no way to reach them" row into an outreach-ready contact.

**Purpose:** Stage 06 deliberately allows leads in with just a profile/listing URL if that's all the source offered. Contact Discovery is where that gap gets closed. A lead sitting in the CRM without a resolved contact channel cannot enter Stage 16-21 (outreach) — this stage is the bottleneck between "found" and "reachable."

**Inputs:**
- Leads from Stage 06 tagged `Status = New` with a missing `Full Name`+contact anchor, or present name/company but no verified email/phone
- Access to email-finding tools (Apollo, Hunter, Snov) and domain data

**Outputs:**
- Leads updated with a resolved, format-valid email and/or phone number
- A resolution-rate report (what % of Stage 06 leads got a contact resolved) feeding source-selection decisions (Stage 05)

**Expected Result:** Every lead that proceeds to Stage 08 (Enrichment) has at least one verified contact channel — leads that can't be resolved after reasonable effort are flagged, not silently carried forward.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **7A** Domain-Based Email Discovery | Resolve `firstname.lastname@company.com`-pattern emails from the company's domain using pattern-matching tools |
| **7B** Apollo/Database Contact Resolution | Pull the contact record directly from a B2B database where the lead already exists in it |
| **7C** LinkedIn-to-Email Resolution | Use LinkedIn profile data + enrichment tools (Hunter, Snov, SalesQL) to resolve a work email from a known profile |
| **7D** Phone Number Discovery | Resolve direct-dial or company phone numbers where email alone isn't sufficient (e.g. cold-calling campaigns) |
| **7E** Website Contact-Page Fallback | Manually or semi-automatically pull published contact info from the company's own "Contact Us" / team page when tools fail |
| **7F** AI-Assisted Pattern Inference | Use AI to infer likely email pattern from 2-3 known emails at the same company, then validate the inference (never send without validation) |
| **7G** Unresolvable Lead Flagging | Mark leads that resist resolution after reasonable effort as `Contact Unresolved` rather than leaving them silently stuck |

---

## 3. Complete Methods

Full breakdown of discovery methods is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

Full per-tool breakdown (reusing the Stage 06 pilot's tool stack — Apollo, Hunter, Snov — plus verification tools) is in **[tools.md](tools.md)**.

---

## 6. Automation

See [automation.md](automation.md) for the n8n-style scrape → enrich → validate → CRM pipeline pattern.

---

## 7. AI Section

**How AI can help:**
- Inferring likely email patterns from a small sample of known-valid emails at the same company (e.g. `first.last@`, `firstlast@`, `f.last@`) before running the inferred address through validation
- Parsing messy "Contact Us" page text into structured name/email/phone fields
- Prioritizing which unresolved leads are worth manual follow-up effort based on ICP-fit score (don't spend manual effort resolving contact for a low-fit lead)

**Prompt examples:**
```
"Here are 3 confirmed valid emails from [Company]: [list]. Infer the most
likely email pattern and generate the probable email address for
[Full Name] at the same company. Flag this as an inference requiring
validation before use, not a confirmed contact."
```
```
"Here is raw scraped text from a company's Contact/Team page [paste].
Extract any name, role, email, and phone number into structured fields.
Flag anything ambiguous rather than guessing."
```

**Agent workflows:** An agent can chain: (1) check if lead already has a resolvable email pattern from Layer 2 sources → (2) if not, query Hunter/Snov by domain → (3) if still unresolved, fall back to website contact-page scrape → (4) validate any candidate email before writing to CRM → (5) flag as `Contact Unresolved` if all methods fail.

**RAG / vector database considerations:** Not needed at this stage — this is a per-lead lookup/inference task, not a knowledge-retrieval task.

**LLM recommendations:** A lightweight/cheap model is sufficient for pattern inference and page-text parsing; this doesn't require frontier reasoning.

**Automation opportunities:** See [automation.md](automation.md) for the full n8n-style pipeline (Apify/PhantomBuster scrape → Hunter/Reoon validate → HubSpot CRM write), adapted from the Data Infrastructure OS pattern already in production use.

---

## 8. Data Structure

### Fields resolved at this stage (added to the Stage 06 CRM row)
`Email` · `Email Confidence` (verified/pattern-inferred/unresolved) · `Phone Number` · `Contact Discovery Method` (domain_pattern/database/linkedin_enrichment/website_fallback/ai_inferred) · `Contact Discovery Date`

### JSON schema addition
```json
{
  "lead_id": "string (from Stage 06)",
  "email": "string|null",
  "email_confidence": "verified|pattern_inferred|unresolved",
  "phone": "string|null",
  "discovery_method": "domain_pattern|database|linkedin_enrichment|website_fallback|ai_inferred",
  "discovery_date": "ISO 8601 datetime",
  "status": "resolved|unresolved"
}
```

### Validation rules
- A `pattern_inferred` email must be run through email validation (Stage 10 or an inline check) before being marked `verified` — an inferred pattern is a hypothesis, not a confirmed contact
- Leads unresolved after reasonable effort (2-3 method attempts) are tagged `Contact Unresolved` and routed to Manager review rather than left ambiguous in the pipeline
- No contact discovery via unauthorized data breach sources or purchased lists of unknown provenance

### Naming conventions
- `Contact Discovery Method` uses the fixed enum above for consistent reporting on which methods actually convert

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] Every resolved email passes basic format validation before being marked `resolved`
- [ ] Pattern-inferred emails are explicitly flagged as such, not presented as verified
- [ ] Unresolved leads are flagged, not silently dropped or left ambiguous
- [ ] Discovery method logged for every resolved contact (for resolution-rate reporting)

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Contact resolution rate | > 80% of Stage 06 leads without a starting contact | Below this, reconsider Stage 05 source selection |
| Email format-validity rate | 100% before handoff to Stage 08 | Full deliverability validation happens at Stage 10 |
| Time to resolve (per lead, batch average) | Same-day | Leads sitting unresolved for days lose outreach-window relevance |
| Unresolved-lead rate | < 15-20% | Higher signals a source/ICP mismatch worth flagging to Stage 05 |

---

## 11. Templates

See [templates.md](templates.md).

---

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [06 Lead Extraction](../06 Lead Extraction/README.md) — supplies leads that may lack a resolved contact channel
- **Next stage:** [08 Lead Enrichment](../08 Lead Enrichment/README.md) — adds firmographic/technographic depth once a contact channel exists
- **Also feeds:** [10 Lead Verification](../10 Lead Verification/README.md) (validates what this stage resolves)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)

> **Source note:** This stage was populated using Nivy's existing "Data Infrastructure OS — Scraping, Enrichment & CRM" document (Layer 1 scraping/discovery patterns and Layer 2 validation workflow), generalized here for the multi-vertical knowledge base. Pricing figures are approximate and should be re-verified before use.
