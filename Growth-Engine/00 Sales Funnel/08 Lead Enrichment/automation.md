# Automation — 08 Lead Enrichment

> Part of Stage 08 (Lead Enrichment). See [README.md](README.md) for the full stage overview.

**n8n template(s):** [Qualify new leads in Google Sheets via OpenAI's GPT-4](https://n8n.io/workflows/2163-qualify-new-leads-in-google-sheets-via-openais-gpt-4/) — same pattern as Stage 06's link, generalized to enrichment: swap the qualification-rule prompt for an enrichment-field prompt and it re-scores/re-writes the same row via the Merge → Google Sheets update pattern. Verified 23 Jul 2026.

---

## Automation Workflows

### Clay Enrichment Flow (n8n → Clay API → CRM)
- **Manual:** Analyst looks up each field per lead across multiple tool sites
- **Semi-automated:** Bulk CSV enrichment upload to Clay, manual review of the output before CRM import
- **Fully automated:** Production-pattern flow —
```
New CRM contact (webhook trigger)
        ↓
Clay Enrichment API call (email + company → enriched fields)
        ↓
Update CRM contact:
  - company_size
  - industry
  - linkedin_url
  - annual_revenue
  - tech_stack
        ↓
Apply segmentation tags (country, industry, size, service_interest)
```
- **AI-assisted:** LLM step resolves conflicts between multi-source enrichment output and classifies service-interest tag from company description
- **Required tools:** n8n, Clay API, CRM API (HubSpot or equivalent)
- **Expected output:** Fully enriched, tagged CRM contact ready for Stage 11 scoring
- **Common errors:** Enrichment APIs return partial data for very small/obscure companies — mark missing fields explicitly rather than leaving them blank with no confidence indicator; API costs scale with volume, so consider gating full enrichment behind a minimum ICP-fit pre-check for very high-volume campaigns

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [07 Contact Discovery](../07 Contact Discovery/README.md)
- Next stage: [09 Data Cleaning](../09 Data Cleaning/README.md)
