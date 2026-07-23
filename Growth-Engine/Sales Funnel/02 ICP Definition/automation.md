# Automation — 02 ICP Definition

> Part of Stage 02 (ICP Definition). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. Client-Data-to-ICP-Evidence Pipeline
- **Manual:** Analyst exports CRM client list, sorts/reviews by hand
- **Semi-automated:** Scheduled CRM export to a spreadsheet with pre-built pivot views (by industry, size, revenue, retention)
- **Fully automated:** CRM native dashboard auto-segmenting active clients by firmographic fields, refreshed live
- **AI-assisted:** LLM reviews the segmented client data and drafts/updates ICP card language when patterns shift materially
- **Required tools:** CRM with API/export, spreadsheet or BI dashboard, LLM API
- **Expected output:** Updated evidence base feeding the next ICP review cycle
- **Common errors:** Stale/incomplete CRM fields (missing industry or size data) undermine the whole analysis — a CRM data-hygiene pass should precede this workflow

### 2. ICP-Fit Scoring Rule Generation
- **Manual:** Analyst writes scoring rubric by hand from the finalized ICP cards
- **Semi-automated:** LLM drafts a scoring rubric from ICP cards, human reviews and finalizes
- **Fully automated:** Rubric encoded directly into Stage 11 (Lead Scoring) CRM automation rules, auto-applied to every new lead
- **Required tools:** LLM API, CRM automation/workflow builder
- **Expected output:** A scoring rubric ready for Stage 11 implementation
- **Common errors:** Overly complex rubrics with too many weighted fields become unmaintainable — keep to 5-8 scoring criteria per ICP

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [01 Market Research](../01 Market Research/README.md)
- Next stage: [03 Buyer Persona](../03 Buyer Persona/README.md)
