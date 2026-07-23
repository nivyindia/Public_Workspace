# Methods — 08 Lead Enrichment

> Part of Stage 08 (Lead Enrichment). See [README.md](README.md) for the full stage overview.

---

## Multi-Source Waterfall Method

- **Waterfall enrichment** — query multiple sources in priority order (e.g. Clay → Apollo → Clearbit) and take the first confident hit per field, rather than relying on a single source that may have gaps
- **Cross-source conflict flagging** — where two sources disagree on a field (e.g. company size), flag rather than silently pick one

## Per-Field Method Mapping

| Field | Primary Source | Secondary Source |
|---|---|---|
| Company name & size | Apollo / Clay | LinkedIn company page |
| Industry + sub-industry | Apollo / Clearbit | Manual classification from company description |
| Tech stack | BuiltWith API / Clay | Manual site inspection |
| Annual revenue estimate | Clay / Apollo | Crunchbase (for funded companies) |
| Founding year | Clay / Crunchbase | Company "About" page |
| Recent funding/news | Clay + AI web-search synthesis | Manual news search |
| Social media profiles | Clay | Manual LinkedIn/Twitter search |

## AI-Assisted Methods

- LLM-based merging of multi-source enrichment output into a single clean record (see [README.md §7](README.md#7-ai-section))
- AI-assisted service-interest classification from company description

## Manual vs. Automated

| Method | Manual | Semi-Automated | Fully Automated |
|---|---|---|---|
| Firmographic enrichment | Analyst looks up each company | Bulk CSV enrichment via Clay/Apollo | Webhook-triggered per new CRM contact |
| Tech stack detection | Analyst checks BuiltWith site tool | Bulk BuiltWith API lookup | Integrated into the same enrichment pipeline |
| News/signal enrichment | Analyst searches manually | AI-assisted search summary per company | Scheduled batch re-check for active/high-value accounts only (too costly to automate for every lead) |

---

## Cross-References

- Stage README: [README.md](README.md)
- Feeds into: [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md), [12 Lead Segmentation](../12 Lead Segmentation/README.md)
