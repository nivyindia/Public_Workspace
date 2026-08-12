# KPI Definitions — Master

**Module:** 07 — Metrics & Dashboards (Deliverable 9) | **Status:** v1 — mirrors Master Blueprint Deliverable 9 verbatim, with owners/cadence resolved against the current RACI | **Last updated:** 2026-08-06

## Marketing KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Website traffic | GA4 sessions | GA4 | Weekly | Marketing | Growth trend |
| Lead volume | # MQLs | CRM | Weekly | Marketing | Set per quarter |
| CAC (marketing) | Spend ÷ new customers | Finance + CRM | Monthly | Marketing | Benchmark vs. LTV |
| Content output | # published assets | Content calendar | Monthly | Marketing | Per plan |
| Keyword rankings | # top-10 rankings | Ahrefs/Semrush | Monthly | Marketing | Growth trend |

## Sales KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Pipeline value | Sum of open deal value | CRM | Weekly | Sales | Per quota |
| Win rate | Won ÷ (Won + Lost) | CRM | Monthly | Sales | Benchmark 20–30% |
| Sales cycle length | Avg days lead→close | CRM | Monthly | Sales | Shorten over time |
| Meetings booked | # discovery calls | CRM | Weekly | Sales | Per quota |
| Avg deal size | Total revenue ÷ deals won | CRM | Monthly | Sales | Growth trend |

## Delivery KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Utilization rate | Billable hrs ÷ available hrs | Time tracking | Weekly | Delivery lead | 70–80% |
| On-time delivery % | On-time projects ÷ total | PM tool | Monthly | Delivery lead | >90% |
| QA pass rate | Passed ÷ total reviewed | QA log | Monthly | QA lead | >95% |

## Finance KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Gross margin | (Revenue - COGS) ÷ Revenue | Finance | Monthly | Finance | Per service benchmark |
| LTV | Avg revenue per client × avg tenure | CRM + Finance | Quarterly | Finance | Grow over time |
| LTV:CAC ratio | LTV ÷ CAC | Finance | Quarterly | Finance | >3:1 |

## Retention KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Churn rate | Lost clients ÷ total clients | CRM | Monthly | Account mgmt | <5%/quarter |
| NPS | Standard NPS survey calc | Survey tool | Quarterly | Account mgmt | >40 |
| Expansion revenue | Upsell revenue ÷ total revenue | Finance | Quarterly | Account mgmt | Growth trend |

## Partnerships KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Referral pipeline | # referred leads | CRM | Monthly | Partnerships | Growth trend |
| Partner-sourced revenue | Revenue from partner leads | CRM + Finance | Quarterly | Partnerships | Growth trend |

## Operations KPIs
| KPI | Formula | Source | Frequency | Owner | Target |
|---|---|---|---|---|---|
| Onboarding time | Days signed→delivery start | PM tool | Monthly | Ops | <5 days |
| SOP compliance | Audited tasks following SOP | QA audit | Monthly | Ops | >95% |

## Reporting Cadence & Ownership (Task 51)
Every "Owner" column above maps to a functional role, not a named individual — per the current RACI (RACI.md), the Founder is Accountable for every module until specific role assignments (Task 3) are confirmed. Until then:

| Cadence | What Happens | Who |
|---|---|---|
| Weekly | Marketing + Sales KPIs reviewed in the recurring weekly review (Task 52, not yet scheduled) | Founder (Accountable across all functional Owner roles today) |
| Monthly | Delivery, Finance (monthly rows), Retention (monthly rows), Operations KPIs reviewed in the monthly steering review (Task 53, not yet scheduled) | Founder |
| Quarterly | Finance (quarterly rows), Retention (NPS/expansion), Partnerships KPIs reviewed | Founder |

**This is a placeholder ownership model, not a final one** — as soon as Task 3 (assign module owners) resolves real names against functional roles, this section should be updated to name owners per KPI rather than defaulting everything to the Founder. Flagging this explicitly rather than fabricating names now.

---
**Status flags:**
- All formulas/targets above are taken directly from the approved Master Blueprint (Deliverable 9) — not new hypotheses, so no additional validation flag needed on the KPI definitions themselves.
- Several KPIs cannot actually be measured yet because their Source system doesn't exist (CRM — Task 38; keyword tool — Task 42's real-data follow-up; survey tool — Task 26; time tracking — not yet selected). This file defines *what* to measure; Dashboard_Tool_Spec.md addresses *where*.
