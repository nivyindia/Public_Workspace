# 14 List Building and List Management

> **Stage 14 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 3, Session 5).

---

## Navigation

- ⬅ Previous stage: [13 CRM Setup and Data Structuring](../13 CRM Setup and Data Structuring/README.md)
- ➡ Next stage: [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Assemble segmented leads (Stage 12) into named, campaign-ready lists — static or dynamic — with defined ownership, freshness rules, and suppression logic, so outreach (Stages 16-21) always works from a current, non-duplicated, non-suppressed list rather than a raw CRM export.

**Purpose:** Segmentation defines *categories*; list building turns a category into an *actionable, bounded set of leads a campaign will actually be sent to*. Without disciplined list management, the same lead gets contacted by two different campaigns simultaneously, suppressed/unsubscribed contacts get re-added by accident, and stale lists keep getting reused past their useful life.

**Inputs:**
- Segmented leads from Stage 12
- Campaign brief (which segment(s), what volume, what time window)
- Suppression list (unsubscribes, opt-outs, do-not-contact flags, existing customers where relevant)

**Outputs:**
- A named, dated campaign list with a defined owner and lead count
- Suppression-checked, deduplicated against any currently active list for the same segment
- List metadata logged (source segment, build date, size, campaign it's assigned to)

**Expected Result:** Every outreach campaign in Stages 16-21 pulls from a list that was deliberately built, deduplicated against other active lists, and suppression-checked — never a raw, unfiltered CRM export.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **14A** Static List Building | One-time export/snapshot for a specific campaign |
| **14B** Dynamic/Smart Lists | Auto-updating lists based on live filter criteria (segment + status) |
| **14C** Suppression List Management | Unsubscribes, opt-outs, bounced contacts, existing customers, do-not-contact |
| **14D** Cross-List Deduplication | Preventing the same lead being active in two simultaneous outreach campaigns |
| **14E** List Freshness & Expiry Rules | How long a static list remains valid before it must be rebuilt against current CRM state |
| **14F** List Ownership & Access | Who can build/edit/export lists, and audit trail of list usage |
| **14G** List-to-Campaign Assignment | Formal handoff of a built list to a Stage 15/21 outreach campaign |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — this stage operates on internal CRM/list data. See [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md) for dynamic-list sync and suppression-check workflows.

---

## 7. AI Section

**How AI can help:**
- Reviewing a proposed campaign list against the suppression list and flagging near-duplicate matches (name/company variants) that exact-match deduplication misses
- Estimating whether a list is large enough and fresh enough to support a given campaign's target volume before the campaign launches
- Summarizing list composition (persona mix, geography mix, tier mix) in plain language for a campaign owner before send

**Prompt examples:**
```
"Compare this new campaign list [paste] against this suppression list
[paste]. Flag any near-duplicate matches by company name or email domain
that aren't exact string matches, so I can review before this list goes
to outreach."
```

**Agent workflows:** A pre-send agent step can pull the proposed list, cross-check it against active lists and the suppression list, and produce a go/no-go summary with flagged exceptions for human review — before the list is handed to Stage 16-21.

**RAG / vector database considerations:** Not required at this stage's typical scale.

**LLM recommendations:** Standard current-generation models are sufficient for deduplication and summarization tasks.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### List metadata (mandatory)
`List Name` · `Source Segment` · `Build Date` · `Owner` · `Lead Count` · `Status` (Draft/Active/Expired/Archived) · `Assigned Campaign`

### Suppression list fields
`Contact/Email` · `Reason` (Unsubscribed/Bounced/Opt-out/Customer/Do-Not-Contact) · `Date Added` · `Source Stage`

### JSON schema
```json
{
  "list_id": "string (uuid)",
  "list_name": "string",
  "source_segment": "string",
  "build_date": "ISO 8601 date",
  "owner": "string",
  "lead_count": "number",
  "status": "draft|active|expired|archived",
  "assigned_campaign": "string|null"
}
```

### Validation rules
- No list is marked Active without a suppression-check pass completed and logged
- No lead appears on two simultaneously Active lists targeting different campaigns without a deliberate exception logged (e.g., a multi-touch cross-channel campaign that intentionally spans lists)
- Static lists have an expiry date; past expiry, the list must be rebuilt against current CRM state, not reused as-is

### Naming conventions
`[SegmentName]_[CampaignType]_[BuildDate]` e.g. `FounderCEO-Tier1_ColdEmail_2026-07-19`

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Suppression check completed before any list goes Active
- [ ] Deduplication check against other Active lists completed
- [ ] List metadata fully logged (owner, count, source segment, expiry)
- [ ] List size matches the campaign's intended volume (not over- or under-built)

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of campaign sends from a suppression-checked list | 100% | Non-negotiable — prevents compliance and reputation issues |
| Cross-list duplicate rate | < 2% | Higher indicates list-building process is being skipped |
| List expiry compliance | 0 sends from expired static lists | Enforced at Stage 16-21 handoff |
| Average list build-to-send time | Tracked, no fixed benchmark | Long gaps mean list data may be stale by send time |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [12 Lead Segmentation](../12 Lead Segmentation/README.md) via [13 CRM Setup and Data Structuring](../13 CRM Setup and Data Structuring/README.md)
- **Next stage:** [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md)
- **Also feeds:** [16 Email Outreach](../16 Email Outreach/README.md) through [21 Multi Channel Sequencing](../21 Multi Channel Sequencing/README.md)

> **Source note:** Built from Stage 12/13 outputs and general CRM list-management best practice, generalized for this knowledge base. No dedicated internal "list management SOP" existed in source material at time of writing — checklists here should be refined against real campaign operations as they accumulate.

[⬅ Back to README](README.md)
