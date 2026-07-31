# Automation — 03 Buyer Persona

> Part of Stage 03 (Buyer Persona). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. ICP-to-Persona Draft Generation
- **Manual:** Analyst reads finalized ICP card, writes persona narrative from scratch
- **Semi-automated:** LLM drafts full narrative from a pasted ICP card, human edits and fact-checks
- **Fully automated:** Agent watches Stage 02 ICP store for new/updated `active` ICPs and auto-drafts a persona narrative for review
- **Required tools:** LLM API, ICP data store (Notion database or similar)
- **Expected output:** Draft persona narrative flagged for human validation (per the validation method in [methods.md](methods.md))
- **Common errors:** Auto-drafted personas may confidently invent specific real-world details (named podcasts, communities) — always route through a fact-check step before marking `active`

### 2. Interview-to-Persona Enrichment
- **Manual:** Analyst reviews interview transcripts, manually extracts persona-relevant detail
- **Semi-automated:** Transcription tool (Otter/Fireflies) + manual review for persona-relevant quotes
- **AI-assisted:** LLM scans transcripts for persona-relevant signals (tools mentioned, pain language, tone) and suggests narrative updates
- **Required tools:** Transcription tool, LLM API
- **Expected output:** Persona narrative enriched with real (paraphrased) buyer language
- **Common errors:** Never quote interview subjects verbatim in externally-shared persona docs without explicit permission — paraphrase

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [02 ICP Definition](../02 ICP Definition/README.md)
- Next stage: [04 Competitor Research](../04 Competitor Research/README.md)
