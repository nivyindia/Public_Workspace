# Automation — 31 Solution Mapping

[⬅ Back to README](README.md)

## Manual
Internal sign-off for any customized/non-standard solution before it's presented to the prospect.

## Semi-Automated
AI drafts a package match and case study selection from the finalized needs analysis; rep/supervisor reviews before approval.

## Full-Automated
Not appropriate for the approval step; the initial draft-matching step can run automatically once Stage 30 is finalized.

## AI-Assisted Workflow
1. Stage 30's finalized needs-analysis document becomes available.
2. LLM drafts a problem-to-deliverable map and recommends a package (standard or flagged as needing customization).
3. LLM selects 2-3 matching case studies from the library.
4. Rep/supervisor reviews; customized scope gets explicit internal sign-off.
5. Approved solution map feeds directly into Stage 32/33.

## Suggested n8n / integration flow
`Stage 30 (needs analysis finalized)` → `LLM API (draft solution map + case studies)` → `CRM (draft attached)` → `Rep/supervisor review + approve` → `CRM (status = approved)` → `Stage 32/33 trigger`
