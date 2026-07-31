# 12 Lead Segmentation — Automation

[⬅ Back to README](README.md)

---

## Manual Workflow

1. On lead entry/enrichment, VA checks title/industry/company size/country against the controlled tag list
2. Assigns Primary Segment (persona match) and secondary tags
3. Lead becomes visible in the relevant saved list/view for campaign building

## Semi-Automated Workflow (n8n + CRM)

**Trigger:** Lead created or key field updated (title, industry, size, country) — typically fires right after Stage 08 enrichment or Stage 11 scoring completes.

**Steps:**
1. n8n receives the trigger event
2. Applies the rule table (persona/industry/geography/size mapping) to the lead's current field values
3. Writes Primary Segment + Secondary Segment tags back to the CRM via API
4. If no rule matches confidently, tags the lead "Needs Manual Review" instead of guessing
5. Adds the lead to the corresponding CRM smart list/saved view automatically

**Required tools/APIs:** CRM API/webhooks, n8n instance.

**Error recovery:** Ambiguous matches route to a manual-review queue rather than being force-assigned a segment — a wrong segment silently corrupts every downstream campaign it's used in.

## AI-Assisted Workflow

1. For leads flagged "Needs Manual Review" by the rule-based step, an LLM call reviews available unstructured text (bio, company description) and proposes a persona match + confidence score
2. High-confidence AI matches (above an agreed threshold) can auto-apply; low-confidence matches still route to human review
3. Periodic (e.g., monthly) LLM-assisted cluster discovery pass reviews the "Warm" tier pool for emerging sub-segments worth formalizing into the rule table

**Required tools/APIs:** LLM API, CRM bulk export/import.

[⬅ Back to README](README.md) · [Next: checklists.md](checklists.md)
