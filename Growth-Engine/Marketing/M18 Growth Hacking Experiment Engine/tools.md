# M18 — Tools

Pulls from the shared free/OSS stack in `IMPLEMENTATION-PLAN.md` §2, plus stage-specific additions below. All pricing/limits marked "verify current" — free-tier terms change without notice.

## From the Shared Stack

| Function | Tool | Notes |
|---|---|---|
| Experiment tracking | Airtable free tier or Notion free tier | Named directly in the shared stack as the tracker home for M18's Impact × Effort log |
| Workflow automation | n8n (self-hosted) | Powers Method 4 in `methods.md` — scoring reminders and tracker automation |
| Analytics / reporting | Google Analytics 4 + Looker Studio | Source of the metrics that feed each experiment's result |

## Stage-Specific Additions

| Function | Free / OSS tool | Notes | Paid upgrade path |
|---|---|---|---|
| Tactic bank home | Notion or Airtable (same base as tracker) | Store the tactic bank as rows so it can be filtered/sorted by category, not just read as a static doc | — |
| Scoring collaboration | Google Sheets (free) | If multiple people score candidates, a shared sheet with a simple Impact/Effort formula column is enough | Airtable paid tier if the tactic bank + tracker outgrows free record caps |
| A/B test statistical significance check | Free online sample-size/significance calculators (e.g., Evan Miller's A/B test tools) | Needed before declaring a winner on any tactic involving a split test (subject lines, ad copy variants) | — |
| Landing page / form variant testing | Native platform tools already in use (e.g., form builder split-testing) where available | Avoids adding a dedicated paid CRO tool for basic variant tests | Paid CRO tools (VWO, Optimizely) once volume justifies |

## Notes

- No tool in this list requires a paid tier to run the full Impact × Effort scoring and tracking cycle end-to-end.
- Verify current Airtable/Notion free-tier record caps before scaling the tactic bank + tracker combined base past a few hundred rows — these change without notice.
