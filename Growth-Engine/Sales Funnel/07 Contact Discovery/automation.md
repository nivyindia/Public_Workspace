# Automation — 07 Contact Discovery

> Part of Stage 07 (Contact Discovery). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. Scrape → Discover → Validate → CRM Pipeline
- **Manual:** Analyst looks up each lead's email individually via Hunter/Snov
- **Semi-automated:** Bulk CSV export from Stage 06 uploaded to Hunter/Snov in batch, results manually reviewed before CRM import
- **Fully automated:** n8n workflow — new CRM row without email triggers a webhook → Hunter/Clay API call for domain-based discovery → validation step → CRM field update, all without manual intervention
- **AI-assisted:** LLM step handles pattern inference and contact-page text parsing where tool-based discovery returns nothing
- **Required tools:** n8n (or equivalent orchestration), Hunter/Clay API, CRM API (e.g. HubSpot)
- **Expected output:** CRM rows auto-populated with resolved email/phone and discovery method tagged
- **Common errors:** API rate limits on free/low tiers cause silent failures if not handled — build in retry/backoff logic; always validate before writing an inferred email as if confirmed

### Example n8n-style flow (adapted from production pattern)
```
New CRM row (no email) → webhook trigger
        ↓
Hunter/Clay API: domain-based email discovery
        ↓
Found? → validation step → write to CRM, tag discovery_method
        ↓
Not found? → LinkedIn profile enrichment step (Clay/SalesQL)
        ↓
Found? → validation step → write to CRM
        ↓
Not found? → flag Contact Unresolved → route to manual review queue
```

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [06 Lead Extraction](../06 Lead Extraction/README.md)
- Next stage: [08 Lead Enrichment](../08 Lead Enrichment/README.md)
