# 13 CRM Setup and Data Structuring — Automation

[⬅ Back to README](README.md)

**n8n template(s):** [Chat with Postgresql Database](https://n8n.io/workflows/2859-chat-with-postgresql-database/) — an AI Agent + Postgres tool nodes flow that lets anyone query the CRM's underlying Postgres tables in plain English instead of writing SQL; useful once CRM data lives in a Postgres backend (Odoo/self-hosted setups). [Generate SQL queries from schema only – AI-powered](https://n8n.io/workflows/2508-generate-sql-queries-from-schema-only-ai-powered/) — same idea but schema-only (the agent never touches live data, only generates the query), a safer fit for read-only reporting access on the CRM schema. Verified 23 Jul 2026.

---

## Standard Automations to Configure at Setup

| Trigger | Action | Tool |
|---|---|---|
| New contact created | Send welcome email template | CRM native email template |
| Deal moved to "Discovery Scheduled" | Send confirmation email | CRM workflow (paid tier) or n8n |
| Deal moved to "Proposal Sent" | Create follow-up task (48h) | CRM native task automation |
| Deal moved to "Closed Won" | Trigger onboarding sequence | n8n → Stage 40/41 systems |
| No activity for 14 days | Create re-engagement task | CRM native task automation |
| Cal.com booking created | Update Lead Score field (+50) and move deal stage | n8n |
| Website form submitted | Create/update contact, tag Lead Source | CRM native form integration or n8n |

---

## Manual Workflow (Free-Tier Setup, No Native Automation)

1. Admin manually builds each pipeline stage and custom property through the CRM UI
2. Team is trained to manually move deals through stages as calls/proposals happen
3. n8n fills the "automation" gaps free-tier CRMs lack (score updates, cross-tool sync)

## Semi-Automated / API-Driven Provisioning

1. Field dictionary (from [templates.md](templates.md)) is stored as structured data (JSON/YAML)
2. A setup script reads the field dictionary and calls the CRM's property-creation API for each field
3. Same approach for pipeline stages, reducing manual click-through when replicating the setup for a new brand/market instance

**Required tools/APIs:** CRM REST API with admin-level auth token.

**Error recovery:** Property-creation calls that fail (duplicate name, invalid type) are logged and re-attempted after manual review — silent partial setup is worse than a visible, resumable failure list.

---

## Ongoing Governance Automation

- A scheduled audit (monthly) pulls the current CRM schema and diffs it against the documented field dictionary, flagging any undocumented fields created outside this stage's process
- Data-completeness monitoring: a scheduled report flags contacts missing mandatory fields (per Stage 08/10/11 requirements) for cleanup

[⬅ Back to README](README.md) · [Next: checklists.md](checklists.md)
