# Templates — 06 Lead Extraction

> Part of Stage 06 (Lead Extraction). See [README.md](README.md) for the stage overview.

---

## CSV Column Template (copy-paste header row)

```
full_name,job_title,company_name,profile_url,website_url,phone,city,country,industry,source,date_added,assigned_owner,status,notes
```

## CRM Row Example

| full_name | job_title | company_name | profile_url | phone | city | country | industry | source | date_added | assigned_owner | status | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Jane Doe | Founder | Acme Digital Ltd | linkedin.com/in/janedoe | +44 xxxx xxx xxx | Manchester | UK | Digital Marketing | linkedin | 2026-07-18 | VA-014 | New | Posted about scaling ops last week — pain signal |

---

## Boolean Search String Library (LinkedIn)

```
(Founder OR CEO OR Owner) AND (marketing agency OR digital agency)
(Director OR Head) AND (accounting OR finance OR bookkeeping)
(Founder OR CEO) AND (SaaS OR software OR tech startup)
(Managing Director OR MD) AND (manufacturing OR engineering)
(Founder OR Owner) AND (e-commerce OR D2C OR retail)
```

## Google Maps Query Template

```
[business type] in [city], [country]

e.g.
accounting firm in Manchester, UK
digital marketing agency in Dubai, UAE
IT services company in Toronto, Canada
law firm in Sydney, Australia
```

## Apollo Filter Template

```
Job Title: Founder, CEO, Owner, Director, Managing Director, Head of [Department]
Company Size: 1–50 employees (adjust to ICP)
Location: [target market]
Industry: [assigned vertical]
Exclude: student, intern, job seeker titles
```

---

## Daily Reporting Message Template (to Manager)

```
[Date] — Lead Extraction Report
Source: [LinkedIn / Google Maps / Apollo / Job Portal / Directory]
Pulled: [X]
Duplicates removed: [X]
Net new added to CRM: [X]
Notes/blockers: [one line, if any]
```

## Prospecting Job-Posting Outreach Hook Templates

```
"Saw you're hiring for [role] — many growing companies outsource this
instead of building the function internally in-house."

"Noticed [Company] is expanding the [Department] team — happy to share
how we support companies at a similar stage."
```

---

## Cross-References

- Stage README: [README.md](README.md)
- Data schema this template maps to: [README.md § 8](README.md#8-data-structure)
- Checklist to apply before using these templates: [checklists.md](checklists.md)
