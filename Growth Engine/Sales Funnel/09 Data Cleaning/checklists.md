# Checklists — 09 Data Cleaning

> Part of Stage 09 (Data Cleaning). See [README.md](README.md) for the full stage overview.
> Reproduced from SOP-VA-012.

---

## QC Checklist (per cleaning session)

- [ ] Duplicate check completed
- [ ] Invalid contacts flagged and resolved
- [ ] Formatting standards checked
- [ ] Dead lead review completed
- [ ] Cleaning Log updated

## Duplicate Resolution Checklist

- [ ] Suspected duplicates compared on Name + Company Name + LinkedIn URL, not name alone
- [ ] Row with more complete data kept; the other deleted
- [ ] Every deletion logged (Name, Company, Date Removed, Reason)

## Invalid Contact Checklist

- [ ] Email format checked (no missing @, no obvious typo)
- [ ] Phone number has a country code
- [ ] LinkedIn URL checked for 404/broken links
- [ ] Company name checked for placeholder values ("TBC", "N/A", "Unknown")
- [ ] Flagged leads attempted for verification before being marked Dead

## Dead Lead Review Checklist

- [ ] Lead completed the full follow-up sequence, OR
- [ ] Lead explicitly asked not to be contacted, OR
- [ ] Lead failed a hard disqualifier
- [ ] Any Dead-marked lead not meeting the above flagged for Manager review

## Common Mistakes to Avoid

- Deleting a duplicate without checking which row has more data
- Not logging deletions (Manager needs to audit what was removed)
- Treating near-duplicate names as confirmed duplicates without checking company and LinkedIn
- Rushing formatting checks — a wrong date breaks follow-up scheduling

---

## Cross-References

- Stage README: [README.md](README.md)
- Templates: [templates.md](templates.md)
