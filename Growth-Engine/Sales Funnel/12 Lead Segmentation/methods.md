# 12 Lead Segmentation — Methods

[⬅ Back to README](README.md)

---

## Manual

**Manual tagging at data entry** — VA assigns Persona/Industry/Geography tags from a controlled dropdown list when a lead is entered or enriched (Stage 08), based on the same job-title/firmographic rules used for ICP fit checking in Stage 02.

**Manual list export by filter** — building a campaign segment by manually filtering the CRM/sheet on the required tag combination and exporting the resulting list.

## Semi-Automated

**Rule-based auto-tagging** — an automation reads incoming/updated lead fields (title, industry, company size, country) and assigns segment tags automatically based on a documented rule table (mirrors the ICP-matching logic from Stage 02), removing manual tagging for the majority of clear-cut cases while flagging ambiguous ones for manual review.

**CRM native lists/smart lists** — most CRMs (HubSpot Lists, Salesforce List Views, Pipedrive Filters) support saved dynamic segments that auto-populate/depopulate as lead data changes, without a separate automation layer.

## AI-Assisted

**LLM persona classification** — for leads where title/bio don't cleanly map to a persona (ambiguous job titles, non-English profiles), an LLM reads the available unstructured text and assigns the closest-matching persona with a confidence note, flagging low-confidence matches for human review.

**Cluster discovery** — periodically running an LLM- or embedding-based review across a large "ungrouped" or "Warm tier" pool to surface natural sub-segments the rule table doesn't already capture (see AI Section in [README.md](README.md)).

## Method Selection Guide

| Situation | Recommended method |
|---|---|
| Clear structured fields (title, size, country) available | Rule-based auto-tagging |
| Small volume, no automation set up yet | Manual tagging at entry |
| Ambiguous/unstructured profile data | LLM persona classification |
| Large backlog needing fresh segment ideas | AI cluster discovery, human-reviewed |

[⬅ Back to README](README.md) · [Next: tools.md](tools.md)
