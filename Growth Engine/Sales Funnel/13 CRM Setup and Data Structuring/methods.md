# 13 CRM Setup and Data Structuring — Methods

[⬅ Back to README](README.md)

---

## Manual (Free-Tier Click-Through Setup)

Standard approach for early-stage teams: sign up for the CRM's free tier, manually configure properties/pipeline/integrations through the platform UI following a documented checklist (see [templates.md](templates.md)). No code required. This is the approach documented in Nivy Digital's internal HubSpot CRM Setup & Configuration Guide.

**Steps (general pattern, platform-agnostic):**
1. Create account, fill company info (name, timezone, industry)
2. Connect email (for tracking) and install the tracking pixel on the website
3. Create custom contact properties per the field dictionary
4. Build the deal pipeline with stages and probabilities
5. Invite team members with correct role/permission levels
6. Build standard reports and a shared dashboard

## Semi-Automated / API-Driven Setup

For re-provisioning (e.g., setting up an identical CRM structure for a new market entity or brand under the same group), custom properties and pipeline stages can be created via the CRM's REST API instead of manual click-through, using a script that reads the field dictionary and creates each property programmatically.

## AI-Assisted

**Field dictionary consolidation** — feeding an LLM the Section 8 "Data Structure" requirements from every stage in this knowledge base and asking it to produce one non-redundant property list (see AI Section in [README.md](README.md)).

**Migration mapping** — when moving from spreadsheets or a legacy CRM, an LLM can propose a column-to-property mapping from an old export's headers to the new field dictionary, flagging ambiguous matches for human confirmation before any data is imported.

## Method Selection Guide

| Situation | Recommended method |
|---|---|
| First-time CRM setup, single instance | Manual click-through, following [templates.md](templates.md) |
| Replicating an existing configuration to a new instance | Semi-automated / API-driven |
| Consolidating requirements from many stages/teams | AI-assisted field dictionary pass first, then manual/API build |
| Migrating from spreadsheets | AI-assisted mapping, then manual QC before import |

[⬅ Back to README](README.md) · [Next: tools.md](tools.md)
