# Checklists — 06 Lead Extraction

> Part of Stage 06 (Lead Extraction). See [README.md](README.md) for the stage overview.

---

## Pre-Extraction Checklist (before starting a session)

- [ ] ICP and target market/industry confirmed for today's session
- [ ] Daily/weekly lead target known
- [ ] Correct tool access confirmed (LinkedIn/Sales Navigator, Apollo, Apify, etc.)
- [ ] CRM column schema open for reference (see [README.md § Data Structure](README.md#8-data-structure))

---

## Per-Lead QC Checklist (applied to every row before CRM entry)

- [ ] Is this a decision-maker per the ICP (Founder/CEO/Director/Owner/Head of X — not general staff)?
- [ ] Is the company a real, appropriately-sized business (not solo/freelancer, not 1000+ employee enterprise, unless ICP explicitly targets that size)?
- [ ] Is the lead in the assigned target market/geography?
- [ ] Does the lead have at least one contact anchor — phone, email, or a verifiable profile/listing URL?
- [ ] Has the CRM been searched for this name/company to confirm it isn't already present?
- [ ] Does the lead pass any hard disqualifiers defined in the ICP (e.g., competitor, existing client, blacklisted industry)?

---

## Batch-Level QC Checklist (before submitting the day's batch)

- [ ] All required CRM fields populated for every row — no blank required cells
- [ ] Zero duplicate entries (checked against full CRM history, not just today's batch)
- [ ] Every lead passes the per-lead checklist above
- [ ] Notes field has at least 1 line of context per lead
- [ ] Source field correctly tagged per the fixed enum (linkedin / google_maps / apollo / job_portal / directory:name / event:name)
- [ ] Date Added and Assigned Owner populated
- [ ] Same-day CRM entry completed (not queued for "tomorrow")
- [ ] Daily count reported to Manager: total pulled → duplicates removed → net new

---

## Duplicate Detection Method

1. Primary match key: email (exact match)
2. Secondary match key: normalized company name + normalized full name (handles cases where email differs but it's the same lead re-surfaced from a different source)
3. Any match on either key → flag as duplicate, do not re-import, note the original source/date in a "seen before" audit log rather than silently discarding (useful for Stage 11 Lead Scoring re-engagement logic)

## Completeness Scoring (per batch)

| Field completeness | Score |
|---|---|
| All mandatory fields + 1 contact anchor + Notes | 100% — accept |
| All mandatory fields + 1 contact anchor, no Notes | 80% — accept but flag for VA follow-up |
| Missing a mandatory field | 0% — reject, do not import |
| No contact anchor at all | 0% — reject, do not import |

## Risk Checks (Legal/Ethical)

- [ ] Source method is on the "legal" or "semi-legal, consent-based" list in [methods.md § Legal & Ethical Map](methods.md#legal--ethical-map-applies-across-all-methods) — never the "illegal/high-risk" tier
- [ ] For UK/EU targets: business email only, legitimate-interest basis confirmed, unsubscribe path exists downstream
- [ ] No personal mobile numbers scraped/stored where only business contact is permitted by the source's ToS

---

## Cross-References

- Stage README: [README.md](README.md)
- Data structure referenced above: [README.md § 8](README.md#8-data-structure)
- Legal map referenced above: [methods.md](methods.md)
- Next stage's verification checklist (deeper contact-level validation): [10 Lead Verification](../10 Lead Verification/README.md)
