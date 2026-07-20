# 13 CRM Setup and Data Structuring — Templates

[⬅ Back to README](README.md)

---

## Contact Property Field Dictionary (Template)

| Property Name | Type | Values / Notes |
|---|---|---|
| Lead Source | Dropdown | Website / Chatbot / LinkedIn / Cold Email / WhatsApp / Directory / Referral / Other |
| Service Interest | Dropdown | [list your service lines] |
| Market | Dropdown | [list target countries] |
| Budget Range | Dropdown | e.g. <$300 / $300-600 / $600-1,500 / $1,500+ / Unknown |
| Outreach Channel | Dropdown | LinkedIn / Cold Email / WhatsApp / Social DM / Inbound |
| Referral Source | Text | Name of referrer |
| Lead Score | Number | See Stage 11 |
| Primary Segment | Dropdown | See Stage 12 |
| Status | Dropdown | New / Duplicate / Rejected / Verified / Working / Customer |

## Deal Pipeline Template

| Stage # | Stage Name | Probability | Description |
|---|---|---|---|
| 1 | New Lead | 10% | Lead entered CRM from any source |
| 2 | Contacted | 20% | First outreach sent/responded |
| 3 | Discovery Scheduled | 40% | Call booked |
| 4 | Proposal Sent | 60% | Proposal document shared |
| 5 | Negotiation | 75% | Client reviewing/asking questions |
| 6 | Closed Won | 100% | Contract signed, onboarding starts |
| 7 | Closed Lost | 0% | Deal declined (log Lost Reason) |

## Deal Custom Properties

`Deal Value` (currency) · `Service Type` (dropdown) · `Lost Reason` (dropdown: Price / Timing / Competitor / No Need / Unresponsive) · `Expected Start Date` (date)

## Standard Reports Checklist

1. Deals by Stage (pipeline funnel view)
2. Leads by Source
3. Deals Closed This Month
4. Activities by Rep
5. Average Deal Close Time

## User Role Template

| Role | Access Level | Typical Assignee |
|---|---|---|
| Admin | Full — schema, users, billing | Founder |
| Sales Rep | Create/edit contacts & deals, no schema changes | Outreach VA |
| View-Only | Read-only dashboards | Stakeholders, part-time contractors |

## New Field Request Form (Template)

```
Requested by: ___
Field name: ___
Field type: ___
Which stage/process needs this: ___
Proposed dropdown values (if applicable): ___
Approved by: ___  Date added: ___
```

[⬅ Back to README](README.md) · [Next: resources.md](resources.md)
