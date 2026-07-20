# SOP-VA-003 — Apollo.io / Database Sourcing

> **Version:** 1.0 | **Last Updated:** April 29, 2026 | **Owner:** VA Manager | **Status:** Live
> 

> **Who Uses This:** VA Executive (Apollo access assigned by Manager)
> 

---

## Purpose

To use [Apollo.io](http://Apollo.io) (or an equivalent lead database) to extract qualified, contact-verified leads and enter them into the CRM with zero duplication.

---

## Pre-requisites

- [Apollo.io](http://Apollo.io) account access granted by Manager
- Target market, industry, and company size confirmed with Manager before starting
- KB-001 (What is a Lead) read and understood
- CRM access confirmed

---

## Step-by-Step

**Step 1 — Set Up Your Filter in Apollo**

1. Log into [Apollo.io](http://Apollo.io)
2. Navigate to: People Search
3. Apply the following filters:
    - **Job Title:** Founder, CEO, Owner, Director, Managing Director, Head of [Department]
    - **Company Size:** 1–50 employees (SME range)
    - **Location:** Assigned target market
    - **Industry:** Assigned category
    - **Technologies Used (optional):** Only apply if targeting a specific tool stack

**Step 2 — Review and Verify Results**

Before exporting, manually check the first 10–20 results:

- Do the titles match the ICP? (Decision makers only)
- Do the company sizes look right?
- Are there obvious duplicates in the results list?

**Step 3 — Export**

1. Select qualified leads (do not bulk select all — review first)
2. Export as CSV
3. Open in Google Sheets
4. Remove any leads that:
    - Are missing email AND phone
    - Have a title like "intern," "analyst," "student"
    - Are outside the assigned market

**Step 4 — Deduplication**

1. Before importing to CRM, run a duplicate check:
    - Filter by email or company name
    - Compare against existing CRM entries
    - Delete any leads already in CRM
2. Highlight removed rows in red and keep a separate "removed duplicates" tab for audit

**Step 5 — Import to CRM**

1. Format the cleaned export to match CRM column headers exactly
2. Set all new entries to Status: "New"
3. Set Source: "Apollo"
4. Add date added and assigned VA columns
5. Import or paste into CRM

**Step 6 — Report to Manager**

- Total leads pulled
- Total duplicates removed
- Net new leads added to CRM

---

## Output Standard

- Net new leads added (after deduplication): as per daily target
- All required fields populated
- Zero duplicates in the import batch
- Source column set to "Apollo" for every entry
- Report sent to Manager same day

---

## Common Mistakes

- Bulk exporting without reviewing — Apollo results often include poor-quality matches
- Not running deduplication before import — duplicates break CRM accuracy
- Pulling leads with no contact detail (email or phone missing)
- Exporting more than the daily lead target without Manager approval

---

## QC Checklist

- [ ]  Filters applied correctly (title, size, market, industry)
- [ ]  First 10–20 results reviewed manually before export
- [ ]  Deduplication completed and documented
- [ ]  Source column set to "Apollo"
- [ ]  Report sent to Manager with totals

---

**Next →** SOP-VA-004 — Lead Qualification Scoring