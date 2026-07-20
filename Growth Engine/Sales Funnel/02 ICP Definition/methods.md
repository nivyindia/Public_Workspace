# Methods — 02 ICP Definition

> Part of Stage 02 (ICP Definition). See [README.md](README.md) for the full stage overview.

---

## Data-Driven Methods

- **Existing client analysis** — pull current/past clients, sort by revenue, retention, satisfaction; the highest-value, best-retained clients are the strongest evidence for what an ICP should look like, stronger than any market report
- **CRM win/loss analysis** — compare closed-won vs. closed-lost deal attributes (size, industry, geography) to find where the pattern of "we win" actually sits
- **Market Research inheritance** — pull segment, demand, and buying-behavior data directly from Stage 01 rather than re-deriving

## Interview-Driven Methods

- **Buyer interviews** — 5-10 structured conversations with best-fit existing clients on why they bought, what almost stopped them, and what they were trying to achieve
- **Sales team debrief** — the team closing deals has informal pattern-recognition on "who's easy to close and happy after" that should be captured structurally, not left as tribal knowledge

## Competitor-Inference Methods

- **Competitor case study/testimonial review** — who competitors publicly showcase as clients is a signal of who their (and often the category's) ICP is
- **Competitor pricing tier analysis** — pricing tiers often reveal the company-size bands a competitor is built to serve

## AI-Assisted Methods

- LLM synthesis of market research + client data into draft ICP cards (see [README.md §7](README.md#7-ai-section))
- AI-assisted edge-case stress-testing of draft ICP criteria
- AI-drafted Negative ICP by inversion of positive criteria

## Manual vs. Automated

| Method | Manual | Semi-Automated | Fully Automated |
|---|---|---|---|
| Client data pull for ICP evidence | Analyst exports CRM report | Scheduled CRM export/dashboard | Live CRM segment/report auto-refreshing |
| Win/loss pattern analysis | Analyst reviews deals manually | Spreadsheet pivot on CRM export | BI dashboard (e.g. CRM's native reporting) |
| Draft ICP card generation | Analyst writes from scratch | LLM drafts from pasted inputs, human edits | Agent pulls CRM + market brief and drafts automatically |

---

## Cross-References

- Stage README: [README.md](README.md)
- Feeds into: [03 Buyer Persona](../03 Buyer Persona/README.md), [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
