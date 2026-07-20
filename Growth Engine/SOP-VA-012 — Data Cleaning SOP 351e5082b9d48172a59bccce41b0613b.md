# SOP-VA-012 — Data Cleaning SOP

> **Version:** 1.0 | **Last Updated:** April 29, 2026 | **Owner:** VA Manager | **Status:** Live
> 

> **Who Uses This:** VA Executive, VA Manager
> 

---

## Purpose

To clean the CRM regularly — removing duplicates, correcting invalid data, and standardising formatting so the database remains accurate and usable.

---

## When to Run Data Cleaning

- Weekly (every Friday, before end of day)
- After any bulk import (Apollo, CSV, manual batch)
- Any time Manager requests a CRM audit

---

## Step-by-Step

**Step 1 — Duplicate Check**

1. Sort CRM by "Lead Name" column A→Z
2. Visually scan for identical or near-identical names
3. For suspected duplicates, compare: Name + Company Name + LinkedIn URL
4. If confirmed duplicate: keep the row with more data, delete the other
5. Log every deletion in a "Cleaning Log" tab: Name, Company, Date Removed, Reason

**Step 2 — Invalid Contact Check**

Flag any lead where:

- [ ]  Email is in an invalid format (e.g., missing @, obvious typo)
- [ ]  Phone number has no country code
- [ ]  LinkedIn URL is broken or returns a 404
- [ ]  Company name is a placeholder ("TBC", "N/A", "Unknown")

For flagged leads: attempt to verify by searching LinkedIn or company website.

- If verifiable → update the field
- If not verifiable → mark as Dead

**Step 3 — Formatting Standards Check**

Ensure every entry matches:

- Date format: yyyy-mm-dd (not dd/mm or mm/dd)
- Market values: US / UK / Canada / AU / UAE (exact, no "United States", "Britain", etc.)
- Status values: Exact list only (from SOP-VA-011)
- LinkedIn URLs: Full https:// format, not shortened
- Phone numbers: Country code included (+1, +44, +971, etc.)

**Step 4 — Dead Lead Review**

Confirm all leads marked Dead:

- Have completed the full follow-up sequence (FU4 sent) OR
- Explicitly asked not to be contacted OR
- Failed a hard disqualifier

If a lead is marked Dead but only has FU1 or FU2 — flag for Manager review.

**Step 5 — Cleaning Log Update**

After every cleaning session, add a summary row to the Cleaning Log:

- Date of clean
- Total duplicates removed
- Total invalid contacts corrected or deleted
- Total formatting issues fixed
- VA who ran the clean

---

## Output Standard

- Zero confirmed duplicates after cleaning
- Zero invalid email formats
- All date and status values follow the approved format
- Cleaning Log updated after every session

---

## Common Mistakes

- Deleting a duplicate without checking which row has more data — always keep the fuller row
- Not logging deletions — Manager needs to audit what was removed
- Treating near-duplicate names as confirmed duplicates without checking company and LinkedIn
- Rushing through formatting checks — one wrong date breaks follow-up scheduling

---

## QC Checklist

- [ ]  Duplicate check completed
- [ ]  Invalid contacts flagged and resolved
- [ ]  Formatting standards checked
- [ ]  Dead lead review completed
- [ ]  Cleaning Log updated

---

**Next →** SOP-VA-013 — Appointment Setting