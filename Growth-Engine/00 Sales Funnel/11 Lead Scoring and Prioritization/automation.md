# 11 Lead Scoring and Prioritization — Automation

[⬅ Back to README](README.md)

---

## Manual Workflow

1. VA opens CRM each morning, filters to contacts updated in the last 24 hours
2. For each, checks activity feed (opens, clicks, page visits, form fills, replies)
3. Applies fit + behavior points from the rule table (see [templates.md](templates.md))
4. Enters Total Score and Tier into custom CRM fields
5. Flags any Hot/Priority leads to the founder/senior VA directly

---

## Semi-Automated Workflow (n8n + Free-Tier CRM)

**Trigger:** CRM webhook fires on a tracked event (form submission, email click, page visit, call booking, reply logged).

**Steps:**
1. n8n receives the webhook payload (contact ID, event type)
2. n8n looks up the point value for that event type from a stored rule table (Google Sheet or n8n Set node)
3. n8n calls the CRM API to fetch the contact's current score
4. n8n adds the new points, writes the updated Total Score back via CRM API
5. n8n checks if the new score crosses a tier threshold (20/50/80)
6. If threshold crossed upward → n8n sends a Slack message to #sales with lead name, company, score, and source (see message format in [templates.md](templates.md))
7. Weekly: a scheduled n8n workflow re-checks all leads' Last Activity Date and applies score decay to leads inactive > 30 days

**Required tools/APIs:** CRM webhook + REST API access, n8n instance, Slack incoming webhook.

**Error recovery:** If the CRM API call fails (rate limit, auth expiry), n8n retries with exponential backoff (3 attempts) then logs the failed event to a "needs manual review" sheet so no scoring event is silently lost.

---

## Fully Automated Workflow (Native CRM Scoring)

1. Scoring rules configured once inside the CRM's native scoring UI (property-based + behavior-based points, per [templates.md](templates.md) rule table)
2. CRM recalculates scores automatically on every tracked event — no external automation needed
3. Native workflow/automation feature sends the Slack/email alert on threshold crossing directly, replacing the n8n alert step
4. Score decay handled via a native time-based workflow (e.g., "if no activity in 30 days, subtract 10 points")

**Required tools/APIs:** Paid CRM tier with native scoring (HubSpot Starter+, Salesforce, Pipedrive).

---

## AI-Assisted Workflow (Qualitative Fit + Bulk Backlog)

1. For new leads lacking clean structured fit data (ambiguous title, non-standard company size field), an LLM call reads the lead's LinkedIn bio/company description and returns a fit sub-score (0-10) + one-line reason in a fixed JSON format
2. That sub-score is merged into the composite score via the same n8n or native workflow above
3. For a backlog of unscored leads (e.g., after a large extraction batch), a batch LLM job processes a CSV export row-by-row, applying the documented rule table, and outputs a scored CSV for CRM re-import
4. A human QC pass samples 10% of AI-scored leads against the rule table before the batch is trusted for outreach prioritization

**Required tools/APIs:** LLM API access (Claude/GPT-4-class), CSV export/import capability, CRM bulk-import tool.

---

## Error Recovery (All Workflows)

- Leads with missing fit-critical data (no company size, no title) are flagged "Fit Score Incomplete" rather than scored with a default/assumed value — silent defaults corrupt the rule table's meaning
- Any automation failure that could cause duplicate point-additions (e.g., a webhook firing twice for one event) is guarded with an idempotency check (event ID logged, duplicate event IDs ignored)

[⬅ Back to README](README.md) · [Next: checklists.md](checklists.md)
