# Methods — 09 Data Cleaning

> Part of Stage 09 (Data Cleaning). See [README.md](README.md) for the full stage overview.

---

## Step-by-Step Method (from SOP-VA-012)

**Step 1 — Duplicate Check**
1. Sort CRM by Lead Name column A→Z
2. Visually scan for identical or near-identical names
3. For suspected duplicates, compare Name + Company Name + LinkedIn URL
4. If confirmed duplicate, keep the row with more data, delete the other
5. Log every deletion in the Cleaning Log: Name, Company, Date Removed, Reason

**Step 2 — Invalid Contact Check**

Flag any lead where:
- Email is in an invalid format (missing @, obvious typo)
- Phone number has no country code
- LinkedIn URL is broken or returns a 404
- Company name is a placeholder ("TBC", "N/A", "Unknown")

For flagged leads: attempt to verify via LinkedIn or company website search. If verifiable, update the field. If not verifiable, mark as Dead.

**Step 3 — Formatting Standards Check**

Ensure every entry matches the Approved Formatting Standards (see [README.md §8](README.md#8-data-structure)).

**Step 4 — Dead Lead Review**

Confirm all leads marked Dead have completed the full follow-up sequence, explicitly asked not to be contacted, or failed a hard disqualifier. A lead marked Dead after only 1-2 follow-ups is flagged for Manager review.

**Step 5 — Cleaning Log Update**

After every session, add a summary row: date of clean, total duplicates removed, total invalid contacts corrected/deleted, total formatting issues fixed, who ran the clean.

## Cadence

- Weekly (every Friday, before end of day)
- After any bulk import (Apollo, CSV, manual batch)
- Any time Manager requests a CRM audit

## AI-Assisted Methods

- LLM-assisted fuzzy duplicate flagging (see [README.md §7](README.md#7-ai-section))
- LLM-assisted bulk formatting-violation scan

---

## Cross-References

- Stage README: [README.md](README.md)
- Feeds into: [10 Lead Verification](../10 Lead Verification/README.md), [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
