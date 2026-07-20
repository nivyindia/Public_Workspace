# Automation — 10 Lead Verification

> Part of Stage 10 (Lead Verification). See [README.md](README.md) for the full stage overview.

---

## Automation Workflows

### 1. Bulk Email Verification Pipeline
- **Manual:** Analyst uploads a batch CSV to Reoon/NeverBounce manually and reviews results
- **Semi-automated:** Scheduled batch upload triggered whenever Stage 09 cleaning completes, with results emailed/notified to the team
- **Fully automated:** API-triggered verification — new cleaned lead → Reoon/NeverBounce API call → status written back to CRM automatically, Valid leads auto-tagged ready-for-outreach, Invalid/Disposable auto-excluded, Risky routed to a review queue
- **Required tools:** Reoon/NeverBounce API, CRM API
- **Expected output:** CRM leads tagged with verification status, ready for Stage 11 scoring
- **Common errors:** Re-verifying the same list repeatedly wastes credits — check verification date before re-running; a list re-used after 90+ days should be re-verified, but a freshly-verified list shouldn't be re-checked unnecessarily

### 2. Risky-Lead Review Queue
- **Manual:** Analyst manually reviews each Risky-flagged lead
- **AI-assisted:** LLM triage step pulls supplementary signal (domain legitimacy indicators, LinkedIn activity) and presents a summary to speed up the human review decision
- **Required tools:** LLM API, CRM/Notion review queue
- **Expected output:** Logged review decision per Risky lead (include/exclude + reasoning)

---

## Cross-References

- Stage README: [README.md](README.md)
- Previous stage: [09 Data Cleaning](../09 Data Cleaning/README.md)
- Next stage: [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md)
