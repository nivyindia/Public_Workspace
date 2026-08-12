# Dashboard Tool Spec — v2 (CRM Confirmed: Odoo)

**Module:** 07 — Metrics & Dashboards (Deliverable 9) | **Status:** Draft v2 — CRM tool question resolved (Odoo, already company-wide system of record); remaining blocker is Odoo CRM pipeline *configuration* (Task 38, see `Odoo_CRM_Setup_Guide_v1.md`), not tool selection | **Last updated:** 2026-08-08

## What Changed From v1
v1 treated "which CRM" as an open founder decision blocking this whole module. It isn't — Odoo is already Nivy Next's system of record for everything else, so the dashboard plan below is written directly against Odoo rather than a generic placeholder. The remaining blocker is narrower: build out the Odoo CRM pipeline per `Odoo_CRM_Setup_Guide_v1.md`, which unlocks Sales/Delivery/Retention KPI sourcing. Marketing KPIs sourced from a keyword tool (Task 42) and a survey tool (Task 26) are still separately unblocked.

## Recommended Tool
**Odoo (native reporting/Spreadsheets) for Sales/Delivery/Retention KPIs, + Looker Studio for GA4-sourced Marketing KPIs.** Revised from the v1 Notion recommendation:
- Since CRM = Odoo, every Sales KPI (win rate, sales cycle length, avg deal size, pipeline value, source/channel performance) already lives natively in Odoo CRM's reporting/pivot views once the pipeline is configured per `Odoo_CRM_Setup_Guide_v1.md` — no export/sync step needed to get a first-pass dashboard.
- **Odoo Spreadsheets** (native, built on the CRM/Project/Accounting data models) can build the Weekly Pulse and Monthly Ops Review views directly against live Odoo data, avoiding a second tool and a sync dependency for those KPIs.
- If Nivy Next still wants a workspace-facing view outside Odoo (e.g., for stakeholders who don't have Odoo logins), the existing n8n instance can sync summary tables into Notion — but this is now optional polish, not a hard requirement, since Odoo's own reporting covers the KPI need directly.
- Looker Studio remains the right choice specifically for the two GA4-sourced Marketing KPIs (sessions, keyword rankings) — its native GA4 connector is stronger than routing that data through Odoo or Notion first.

## Proposed Structure
| Dashboard View | KPI Tables Covered | Update Cadence |
|---|---|---|
| Weekly Pulse | Website traffic, Lead volume, Pipeline value, Meetings booked | Weekly (Task 52 review) |
| Monthly Ops Review | CAC, Content output, Win rate, Sales cycle length, Avg deal size, Utilization rate, On-time delivery %, QA pass rate, Onboarding time, SOP compliance | Monthly (Task 53 review) |
| Quarterly Business Review | Gross margin, LTV, LTV:CAC, Churn rate, NPS, Expansion revenue, Referral pipeline, Partner-sourced revenue | Quarterly |

## Build Sequence (once unblocked)
1. Odoo CRM pipeline configured per `Odoo_CRM_Setup_Guide_v1.md` (Task 38) — unlocks Sales, most Delivery, and Retention KPI sourcing directly from Odoo's own data model.
2. Odoo Spreadsheet dashboards built per the three views above, with formula fields for ratio-based KPIs (win rate, LTV:CAC, churn rate) pulling directly from CRM/Project/Accounting records.
3. (Optional) n8n workflow syncing summary tables to Notion for stakeholders without Odoo access — not required for the dashboard to function, only for external visibility.
4. Looker Studio GA4 dashboard connected separately for the two GA4-sourced Marketing KPIs, linked from the Weekly Pulse view rather than duplicated into it.

---
**Status flags:**
- Tool choice for Sales/Delivery/Retention KPIs is resolved (Odoo, native) — no further founder decision needed on that front.
- Still blocked on Task 38 *configuration* (not selection) — the field/stage build in `Odoo_CRM_Setup_Guide_v1.md` needs to be done in the live Odoo instance before Step 2 can start with real data.
- Tasks 26 (survey tool) and 42-followup (Ahrefs/Semrush connection) remain separate, smaller blockers for the NPS and keyword-ranking KPI rows specifically.
