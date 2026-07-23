# Automation — 22 Personalization and Copywriting

[⬅ Back to README](README.md)

## Manual
Hand-writing Tier-3 lines for named strategic accounts; final human review of any new template before approval.

## Semi-Automated
LLM drafts Tier-2 personalization lines in batch from enrichment data; human spot-checks a sample before the batch is approved for sending.

## Full-Automated
Tier-1 merge-field population (name, company) via the sending tool's native merge-field feature — no review needed since it's a direct data pull, not a generated line.

## AI-Assisted Workflow
1. Segment enters an outreach sequence (Stage 16-21) with an approved Tier-2/3 template.
2. LLM drafts the personalization line per contact from Stage 08 enrichment fields.
3. Human spot-checks 10-20% of the batch before approval.
4. Approved batch flows into the relevant channel tool for sending.
5. Reply/booking rate tracked per template variant, feeding the A/B testing framework.

## Suggested n8n / integration flow
`CRM (contact enters sequence)` → `LLM API (draft personalization line)` → `Sheet (human review queue)` → `n8n (approved rows → channel tool API)` → `Channel tool (send)`
