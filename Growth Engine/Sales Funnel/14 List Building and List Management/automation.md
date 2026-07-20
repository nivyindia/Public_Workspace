# 14 List Building and List Management — Automation

[⬅ Back to README](README.md)

---

## Manual Workflow

1. Campaign owner defines target segment + volume from the campaign brief
2. Filters CRM/dynamic list to that segment, reviews count
3. Cross-checks against suppression list manually (or via the semi-automated step below)
4. Names and logs the list per the naming convention in [templates.md](templates.md)
5. Hands off to Stage 15/16-21 with list metadata attached

## Semi-Automated Workflow (n8n + CRM)

**Trigger:** List marked "ready for suppression check" by the campaign owner.

**Steps:**
1. n8n pulls the proposed list and the current suppression list from the CRM
2. Cross-references by email/contact ID, removes exact matches, logs what was removed and why
3. Runs a secondary fuzzy-match pass (company name/domain similarity) and flags near-duplicates for human review rather than auto-removing them
4. If the list passes, n8n sets Status = Active and notifies the campaign owner
5. On a schedule, n8n checks all Active static lists against their expiry date and flags/archives expired ones

**Required tools/APIs:** CRM API, n8n instance.

**Error recovery:** If the suppression list itself fails to load (API error), the workflow halts and does not mark the list Active — a list must never go live without a completed suppression check, even under time pressure.

## Fully Automated Workflow (Dynamic/Smart Lists)

1. Dynamic list criteria configured once in the CRM (segment + tier + status)
2. CRM auto-populates/depopulates the list as records change, with suppression status as one of the filter criteria so suppressed contacts never appear in the list at all

**Required tools/APIs:** CRM native dynamic list feature (most platforms support this at free or low-cost tiers).

## AI-Assisted Step

1. Before a list is finalized, an LLM reviews the list for near-duplicate entries the exact-match dedup missed and produces a flagged-exceptions summary
2. Campaign owner reviews flagged exceptions and approves/rejects each before the list goes Active

[⬅ Back to README](README.md) · [Next: checklists.md](checklists.md)
