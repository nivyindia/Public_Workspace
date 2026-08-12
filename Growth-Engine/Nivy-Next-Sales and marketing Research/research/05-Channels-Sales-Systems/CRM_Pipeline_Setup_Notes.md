# CRM Pipeline Setup Notes

**Module:** 05 — Channels & Sales Systems | **Status:** Draft v1 (ready to implement; tool-agnostic — works in HubSpot, Pipedrive, Attio, or Notion CRM) | **Last updated:** 2026-08-06

Built to operationalize the ICPs (Phase 3), messaging (Phase 4), and pricing tiers (Phase 4). Replaces ad hoc tracking with one system of record feeding the KPI dashboard (Module 07).

---

## 1. Pipeline Stages

| # | Stage | Definition | Exit Criteria (moves to next stage) | Owner |
|---|---|---|---|---|
| 1 | **Lead** | Contact identified/inbound, not yet engaged | First outreach sent | Sales |
| 2 | **Engaged** | Replied, opened a thread, or booked nothing yet | Positive reply or meeting request | Sales |
| 3 | **Meeting Booked** | Discovery call scheduled | Call held | Sales |
| 4 | **Qualified** | Call held; fits ICP, has budget/timeline signal | Scope + proposal requested | Sales |
| 5 | **Proposal Sent** | Pricing/scope document delivered | Buyer responds (yes/no/negotiate) | Sales |
| 6 | **Negotiation** | Terms, scope, or price under discussion | Verbal or written agreement | Sales/Founder |
| 7 | **Closed Won** | Contract signed | Handoff to delivery | Sales → Delivery |
| 8 | **Closed Lost** | Deal dead | Logged with loss reason | Sales |

**Stalled-deal rule:** any deal with no stage movement in 14 days gets flagged for manager review (feeds Sales KPI "sales cycle length," Deliverable 9).

---

## 2. Required Fields Per Deal

| Field | Purpose |
|---|---|
| Country | USA / Canada / UK / Australia / UAE — feeds country-level reporting |
| Service Line | One of the 7 — feeds service-line win-rate reporting |
| ICP Match | Which of the 7 ICP cards this contact matches (or "Unmapped") |
| Source/Channel | Cold email / LinkedIn / Referral / SEO-inbound / Marketplace / Event |
| Deal Value (est.) | Tied to package tier (Starter/Growth/Scale) from Pricing sheet |
| Decision Criteria Flagged | Price / Trust / Speed / Expertise / Compliance (from Deliverable 5 coding framework) |
| Objection Tags | Price / Trust / Timing / Authority / Competitor (from Objection Database Structure) |
| Loss Reason (if lost) | Free text + category, feeds Win/Loss template |
| Competitor Mentioned | Free text — feeds Quarterly Competitive Shift Report |
| Contact Role | Initiator / Decision-Maker / Both — track separately per SMB survey data (below), since the person who starts the search is often not the one who signs |

These fields are what makes the CRM double as the data source for VoC coding, win/loss analysis, and the KPI dashboard — do not skip them at deal creation.

**Pipeline velocity benchmark (source: `20260806_Secondary_VoC_Research_SMBSurveyData_v1.md`):** SMB agency deals typically take 1-4 weeks from qualified lead to close; sub-1-week closes are the minority. Use this as the default expectation for the 14-day stalled-deal rule rather than treating any multi-week deal as at-risk by default — recalibrate after real deal data comes in.

---

## 3. Pipeline Views to Build

1. **By Country** — five saved views (USA/Canada/UK/Australia/UAE), each showing stage distribution and $ pipeline value.
2. **By Service Line** — seven saved views for the same, to see which service lines are converting.
3. **By Source/Channel** — reply rate and meeting rate by channel (cold email vs. LinkedIn vs. referral), feeding the Email/LinkedIn Testing Matrices (Deliverable 7).
4. **Stalled Deals** — filter: no activity in 14+ days, any stage before Closed.
5. **This Week's Priorities** — deals with a task due in the next 7 days.

---

## 4. Automation Rules (set up once CRM is chosen)

| Trigger | Action |
|---|---|
| New lead added | Auto-assign owner by country/service-line rule; auto-tag ICP if firmographic data matches |
| Deal sits in a stage >14 days | Slack/email alert to owner + manager |
| Deal marked Closed Won | Auto-create delivery/onboarding task; auto-request case-study interview at 60 days (feeds Content & SEO, Deliverable 6) |
| Deal marked Closed Lost | Force-required Loss Reason field before save; auto-queue for win/loss interview outreach (Deliverable 5) |
| Meeting booked | Auto-send discovery-call prep checklist to rep |

---

## 5. Reporting Cadence Tied to CRM

| Report | Frequency | Pulled From |
|---|---|---|
| Pipeline value & stage snapshot | Weekly (Governance weekly review) | CRM |
| Win rate, sales cycle length, avg deal size | Monthly (Steering review) | CRM |
| Source/channel performance | Monthly | CRM + outreach tool |
| Win/loss theme summary | Monthly | CRM Loss Reason field + interviews |
| Full funnel benchmark (stage-to-stage conversion, drop-off) | Quarterly | CRM |

---

## 6. Compliance Fields (ties to Module 06 — Trust & Compliance)

Add a **Consent/Compliance** field per contact recording:
- Opt-in method (for CASL — Canada — and PECR — UK — this must be explicit and logged)
- Do-not-contact flag, honored across all sequences immediately on request
- Data retention start date (supports GDPR/APP/PIPEDA deletion-on-request obligations)

---

## 7. Immediate Setup Checklist (Task 38)

- [ ] Choose CRM tool (recommend a tool that supports custom fields + automation on the starter/team plan — HubSpot Free/Starter, Pipedrive, or Attio all fit)
- [ ] Build the 8 pipeline stages above
- [ ] Add the 9 required fields above as custom fields
- [ ] Build the 5 saved views above
- [ ] Configure the 5 automation rules above (or manual SOP if tool tier doesn't support automation yet)
- [ ] Import any existing deal history for baseline win-rate/cycle-length benchmarking
- [ ] Connect CRM to outreach tool (Task 41) so replies auto-log

---
*Next: once live, run for 30 days before trusting conversion-rate benchmarks — early data will be noisy.*
