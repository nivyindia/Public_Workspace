# ⚡ NIVY SYSTEM UPGRADE PLAN — PHASE 2

> **Purpose:** Full system upgrade plan based on the 62 issues identified in the NIVY SYSTEM DEEP AUDIT REPORT (April 30, 2026).
> 

> **Status:** ✅ ALL 6 TRACKS COMPLETE — 2026-04-30 🎉
> 

> **Owner:** Abhi
> 

> **Audit Source:** [🔍 NIVY SYSTEM DEEP AUDIT REPORT](NIVY%20SYSTEM%20DEEP%20AUDIT%20REPORT%20351e5082b9d481228223e605b4bb742a.md)
> 

> **Change Log:** [📝 NIVY SYSTEM CHANGE LOG](%F0%9F%93%9D%20NIVY%20SYSTEM%20CHANGE%20LOG%20351e5082b9d4817ca340cdb45bcd780f.md)
> 

> **Command Center:** [🏠 NIVY COMMAND CENTER](%F0%9F%8F%A0%20NIVY%20COMMAND%20CENTER%20351e5082b9d48141a015f007367743b9.md)
> 

---

## ❓ 10 DATA QUESTIONS — ANSWER BEFORE TRACKS B–F BEGIN

> Track A is already done. Tracks B–F require your answers below. Reply to each one.
> 

| # | Question | Why It Matters | Answer |
| --- | --- | --- | --- |
| Q1 | Which of the 3 setup checklists is the official current version? | To delete the other 2 from search results | ✅ Resolved via Track D audit — ⚙️ Day 0 Setup Checklist — VA confirmed as official. No further action needed. |
| Q2 | Are Closers a separate role type or promoted Senior VAs? | To design the Closer Portal correctly | ✅ Separate hire. Build for dedicated Closer role from the start. |
| Q3 | Do Closers currently have any scripts or reference materials? | To incorporate existing assets into the portal | ✅ No existing scripts. Built from scratch. |
| Q4 | Is the CRM staying external permanently, or planned to move into Notion? | Changes the entire data architecture | ✅ CRM stays external permanently. Notion will NOT replace the CRM. Build a Notion mirror dashboard for visibility only. |
| Q5 | Is Service Delivery (under Nivy HQ) actively being built or abandoned? | To decide where delivery SOPs live | ✅ Resolved — Delivery SOPs (001–006) built under NIVY MASTER PACKAGE HUB SYSTEM. Service Delivery section not required. |
| Q6 | What are your top 5 most-sold packages by volume? | To prioritize delivery SOP build order | ✅ SMM, Content Creation, Performance Marketing, SEO, Lead Generation. SOPs 001–005 built in this order. |
| Q7 | What is the CPA product — who sells it and who delivers it? | To integrate CPA into training and sales system | ✅ CPA = Business Financial Management System. 4 tiers: Starter/Growth/Scale/CFO. Delivered by CPA team. SOP-006 built. |
| Q8 | Current team size: VA count, supervisor count, manager count? | For capacity planning | ⏳ Not answered — non-blocking. KPI standards and performance thresholds built generically. Update when team size is confirmed. |
| Q9 | USA vs India client split — current ratio and target ratio? | For USA Market Playbook priority | ✅ India = volume/low-mid price. USA = high-ticket/systems. Separate playbooks built. International Playbook live. |
| Q10 | What automation tools exist currently (Zapier, Make, n8n, etc.)? | For automation layer planning | ✅ None for now. Start from scratch. Recommend tool stack as part of Automation Roadmap. |

---

## 🗺️ 6 BUILD TRACKS — OVERVIEW

| Track | Name | Start When | Depends On | Status |
| --- | --- | --- | --- | --- |
| Track A | 🔴 Critical Fixes | Immediately | Nothing | ✅ COMPLETE — 2026-04-30 |
| Track B | 💰 Closer System Build | After Q2, Q3 answered | Q2, Q3 | ✅ COMPLETE — 2026-04-30. Closer Portal + SOP + Script Library + Package Quick-Reference built. |
| Track C | 📦 Package Infrastructure | After Q1, Q6, Q7 answered | Q1, Q6, Q7 | ✅ COMPLETE — 2026-04-30. SOP-001 through SOP-006 built. Upsell Trigger System built. |
| Track D | 🏗️ Architecture Cleanup | After Q1 answered | Q1 | ✅ COMPLETE — 2026-04-30 |
| Track E | 🌐 International Layer | After Q9 answered | Q9 | ✅ COMPLETE — 2026-04-30. International Market Playbook built (India/USA split, outreach, pricing, compliance, bundle system). |
| Track F | 🤖 Automation Roadmap | After Q4, Q10 answered | Q4, Q10 | ✅ COMPLETE — 2026-04-30. CRM Mirror Dashboard design + KPI Trigger Table + Automation Opportunity Map + AI Integration Plan built. |

---

## ✅ TRACK A — CRITICAL FIXES (COMPLETE)

**Completed:** April 30, 2026

| Fix | Action Taken | Result |
| --- | --- | --- |
| Broken Command Center links | All 4 broken links fixed — Senior VA, Closer, Package System, Sales View now point to correct pages | ✅ Done |
| New Joiner routing | VA Trainee now goes to current Trainee Path; Supervisor now goes to Supervisor Portal | ✅ Done |
| Legacy Supervisor page | Deprecation banner added — redirects to Supervisor Portal | ✅ Done |
| Legacy VA Trainee Path | Deprecation banner added — redirects to current VA Trainee Path in VA Portal | ✅ Done |
| VA Trainee Path SOP numbers | Confirmed Stages 3–5 already reference correct SOPs (002, 003, 005, 009, 010, 014) | ✅ Done |
| Deep Audit Report | Updated to post-optimization version — 62 issues identified, Promotion Plan added | ✅ Done |

---

## 💰 TRACK B — CLOSER SYSTEM BUILD

**Priority:** Immediate after Q2 and Q3 answered

**Why this is the highest-value build:** Closer = revenue conversion. Every VA booking that hits a broken or non-existent Closer system is a lost deal.

**What will be built:**

1. **💰 CLOSER PORTAL** — Role entry point under Nivy HQ (same level as VA Operations)
    - Links to: Closer SOP, Package Views, Scripts, Call Tracker, Escalation Rules
2. **📋 Closer SOP — Call Protocol**
    - Pre-call prep (review call handover form, check lead history)
    - Opening script
    - Discovery framework (5 questions)
    - Package positioning by client type
    - Objection handling (top 10 objections with responses)
    - Close sequence
    - Post-call CRM update protocol
3. **📦 L3 & L4 Package View for Closers**
    - Stripped-down package view showing only: Problem → Solution → Pricing → ROI frame → Upsell path
    - Built for live call reference — not for training
4. **💬 Closer Script Library**
    - Cold call opening (if applicable)
    - Post-VA-handover opening
    - Discovery scripts
    - Objection scripts (pricing, timing, "need to think about it," competitor comparison)
    - Close scripts
5. **📊 Closer Performance Tracker**
    - Calls taken, show-up rate, close rate, deal value, packages closed by tier

**Data needed from Abhi:** Q2 (role type), Q3 (existing scripts)

---

## 📦 TRACK C — PACKAGE INFRASTRUCTURE

**Priority:** Week 1–2 after Q1, Q6, Q7 answered

**Why this is critical:** No package database = manual inconsistency across 50+ pages. No delivery SOPs = client experience is improvised.

**What will be built:**

1. **🗄️ Master Package Database (Notion Database)**
    - Fields: Package Name, Level (L1–L4), Category, Service Type, Target Client, Problem Solved, Price (India), Price (USA), Delivery Team, Upsell To, Cross-Sell With, Package Page Link, Status (Active/Coming/Archived)
    - Views: By Tier, By Category, By Target Market, By Status
    - This becomes the single source of truth — all other package pages pull from here
2. **📋 Delivery SOPs — Top 5 Packages**
    - Using the SOP/VA Version Format (23-section template already built)
    - One delivery SOP per package covering: Onboarding, Access Collection, Execution Cycle, Deliverables, KPI Tracking, QC Checklist, Reporting Format
    - Priority order = top 5 by sales volume (Q6 needed)
3. **🌍 CPA Package Integration**
    - Add CPA packages to Master Package Database
    - Add CPA to the correct training stage
    - Build one CPA delivery SOP
    - (Q7 needed to confirm CPA scope)
4. **🔁 Upsell Trigger System**
    - Convert 2-bullet upsell map into an operational guide:
    - Trigger moment (after X days / after Y results)
    - Signal to look for in client conversation
    - Script for upsell conversation
    - Package to propose + ROI framing

**Data needed from Abhi:** Q1, Q6, Q7

---

## 🏗️ TRACK D — ARCHITECTURE CLEANUP

**Priority:** Week 2 after Q1 confirmed

**Why this matters:** The Autonomous Systems folder contains 21 unorganised pages. Role portals are buried 2 levels deep. This blocks natural navigation.

**What will be done:**

1. **Move 6 Role Portals** out of Autonomous Systems → directly under VA Operations
    - VA PORTAL, SUPERVISOR PORTAL, MANAGER PORTAL, HIRING PORTAL, STRATEGY PORTAL, SYSTEM ENGINE
    - This makes them findable in the sidebar without knowing the Autonomous Systems folder exists
2. **Restructure Autonomous Systems folder** into 3 sub-sections:
    - 🧱 Frameworks (all design blueprints — real autonomy stack, growth engine, etc.)
    - 📋 Plans (all Master Plans — archived)
    - ⚙️ Build Tools (SOP formats, templates, format pages)
3. **Declare one master setup checklist** — deprecate the other two:
    - Add "[DEPRECATED — use X instead]" to title of losing checklists
    - Add redirect banner to body of each deprecated page
    - (Q1 needed to confirm which is correct)
4. **Merge two navigation indexes** into one:
    - Keep: 🗺️ Full Navigation Index — All Pages in This System (under VA Operations)
    - Deprecate: 🗺️ System Navigation Map (under Autonomous Systems)
    - Add redirect banner to deprecated page

**Data needed from Abhi:** Q1 (which checklist is correct)

---

## 🌐 TRACK E — INTERNATIONAL LAYER

**Priority:** Week 3–4 after Q9 answered

**Why this matters:** Without market-specific infrastructure, Nivy VAs are improvising on international (USA/UK) prospects — highest-value segment.

**What will be built:**

1. **🇺🇸 USA Market Playbook**
    - ICP for USA (industries, company sizes, pain points by vertical)
    - USA-specific outreach scripts (tone, personalisation, cultural norms)
    - USA timezone management protocol
    - USA pricing reference (already partially in package pages)
    - Common USA objections + responses
2. **⚖️ International Legal / Compliance Reference**
    - GDPR basics for EU leads
    - CAN-SPAM basics for USA email outreach
    - Data handling rules for international lead lists
    - Contract and NDA templates (basic)
3. **🌍 Multi-Market Outreach Protocol**
    - How to adjust scripts by market
    - Response time expectations by timezone
    - Currency and payment method reference

**Data needed from Abhi:** Q9 (USA/India split + target ratio)

---

## 🤖 TRACK F — AUTOMATION ROADMAP (COMPLETE)

**Completed:** April 30, 2026

**Answers used:** Q4 = CRM external permanently | Q10 = No tools currently — start from scratch

---

### 1. CRM Mirror Dashboard (Notion)

> CRM stays external. Notion will NOT replace it. Instead, build a lightweight Notion mirror that syncs key fields manually (or via automation later) for team visibility.
> 

**Dashboard Name:** 📊 CRM PIPELINE MIRROR — NIVY

**Fields to include:**

| Field | Type | Source |
| --- | --- | --- |
| Lead Name | Text | Manual entry from CRM |
| Company | Text | Manual entry |
| Source | Select (Instagram / LinkedIn / Referral / Website / Other) | Manual |
| Status | Select (New / In Contact / Call Booked / Called / Proposal Sent / Closed / Lost) | Manual |
| Assigned VA | Person | Manual |
| Call Date | Date | Manual |
| Last Action | Text | Manual |
| Next Action | Text | Manual |

**Views to build:**

- **Today's Pipeline** — filtered by Call Date = Today, sorted by Status
- **By VA** — grouped by Assigned VA, filtered by Status ≠ Closed/Lost
- **Closing This Week** — filtered by Status = Proposal Sent + Call Date = this week

> ⚠️ Rule: This mirror is for team visibility only. The CRM remains the system of record. Any discrepancy → CRM wins.
> 

---

### 2. KPI → Trigger → Action Table

| KPI | Standard | Trigger Threshold | Responsible | Action |
| --- | --- | --- | --- | --- |
| Messages sent per day | ≥ 20/day per VA | < 20/day for 3 consecutive days | Supervisor | Flag in daily check-in. VA coaching session. |
| Reply rate | ≥ 8% per campaign | < 5% for 2 campaigns | Manager | Review ICP + message quality. Escalate to Abhi if no improvement. |
| Call show-up rate | ≥ 70% | < 60% in any week | Closer / Supervisor | Review lead quality from VAs. Check booking confirmation process. |
| Close rate | ≥ 20% | < 15% in any 2-week period | Closer / Manager | Script review. Role-play session. Escalate to Abhi. |
| Delivery SOP adherence | 100% per QC checklist | Any QC failure | Supervisor | Block delivery until QC passed. Log in delivery tracker. |
| Report submission | By Day 5 each month | Late or missing | Supervisor | Warning + escalation within 24 hours. |
| Upsell conversion | ≥ 10% of active clients/month | < 5% for 2 months | Manager | Review upsell trigger log. Check if VAs are identifying triggers. |
| Client retention (month 2+) | ≥ 80% | Drop below 70% | Manager | Client health review. Retention call protocol activated. |

---

### 3. Automation Opportunity Map

**Tool Recommendation:** Start with [**Make.com**](http://Make.com) (formerly Integromat)

- Free tier available — good for starting
- Better for multi-step workflows than Zapier at lower cost
- n8n = consider only if team has developer capability
- Zapier = fine but expensive at scale

**Phase 1 — Start here (Month 1–2):**

| Task | Current State | Automation | Tool |
| --- | --- | --- | --- |
| Follow-up reminder after call not booked | Manual | Auto-reminder in Notion after 3 days with no status change | [Make.com](http://Make.com) |
| Report submission reminder | Manual | Auto-message to VA on Day 3 of each month | [Make.com](http://Make.com) |
| New lead assigned notification | Manual | Auto-notify VA when new lead added in CRM Mirror | [Make.com](http://Make.com)  • Notion |
| QC checklist completion alert | Manual | Auto-flag Supervisor when QC block submitted | [Make.com](http://Make.com)  • Notion |

**Phase 2 — Month 2–3:**

| Task | Automation | Tool |
| --- | --- | --- |
| CRM → Notion Mirror sync | Auto-populate CRM Mirror from external CRM via webhook | [Make.com](http://Make.com) |
| Daily VA activity summary | Auto-compile daily report from Notion tracker → WhatsApp/Email to Manager | [Make.com](http://Make.com) |
| Upsell trigger alert | Auto-flag VA when client hits trigger condition (Day 45, 90) | [Make.com](http://Make.com)  • Notion |

**Phase 3 — Month 3+:**

| Task | Automation | Tool |
| --- | --- | --- |
| Lead scoring | Score leads by source + reply behaviour | [Make.com](http://Make.com)  • CRM |
| Script improvement suggestions | QC data → AI analysis → weekly script improvement summary | [Make.com](http://Make.com)  • Claude API |
| Automated daily report summary for managers | Pull KPIs from trackers → summarize → send to manager | [Make.com](http://Make.com)  • Claude API |

---

### 4. AI Integration Plan

| Use Case | When to Build | Input | Output | Tool |
| --- | --- | --- | --- | --- |
| Outreach message personalisation | Phase 2 | Lead name, company, industry, ICP | Personalised outreach message draft | Claude API |
| Objection response suggestions | Phase 2 | Objection text logged in CRM | 3 response options ranked by scenario | Claude API |
| Lead scoring from CRM data | Phase 3 | Lead source, reply rate, company size | Score 1–10 + recommended action | [Make.com](http://Make.com)  • Claude API |
| Daily report summary for managers | Phase 3 | KPI tracker data | Plain English summary with flags | [Make.com](http://Make.com)  • Claude API |
| Script improvement | Phase 3 | QC failure logs | Weekly suggestion list | [Make.com](http://Make.com)  • Claude API |

---

## 📊 ISSUE TRACKER — PHASE 2 TARGETS

| Issue | Track | Priority | Status |
| --- | --- | --- | --- |
| Broken Command Center links | A | 🔴 Critical | ✅ Fixed |
| New Joiner wrong routing | A | 🔴 Critical | ✅ Fixed |
| Legacy pages without deprecation notices | A | 🔴 Critical | ✅ Fixed |
| No Closer Portal or SOP | B | 🔴 Critical | ✅ Fixed — 2026-04-30. Closer Portal + SOP + Scripts + Package Ref built. |
| No Master Package Database (Notion DB) | C | 🔴 Critical | ✅ Fixed — 2026-04-30 |
| No Delivery SOPs for any package | C | 🔴 Critical | ✅ COMPLETE — 2026-04-30. SOP-001 through SOP-005 built (SMM, Content Creation, Performance Marketing, SEO, Lead Gen). CPA SOP + upsell triggers pending Q6/Q7. |
| CPA package disconnected from system | C | 🟠 High | ✅ Fixed — 2026-04-30 (4 CPA tiers in database) |
| Upsell system has no timing/trigger logic | C | 🟡 Medium | ✅ Fixed — 2026-04-30. Upsell Trigger System built with timing, conditions, and scripts for all 6 service lines. |
| Role portals buried in Autonomous Systems | D | 🟠 High | ✅ Fixed — 2026-04-30 |
| 3 setup checklists — no declared winner | D | 🔴 Critical | ✅ Fixed — 2026-04-30 |
| 2 navigation indexes running in parallel | D | 🟡 Medium | ✅ Fixed — 2026-04-30 |
| No USA Market Playbook | E | 🟠 High | ✅ Fixed — 2026-04-30. International Market Playbook built. |
| No legal/compliance reference | E | 🟠 High | ✅ Fixed — 2026-04-30. CAN-SPAM + GDPR reference built into International Playbook. |
| No CRM in Notion / no live dashboards | F | 🔴 Critical | ✅ Fixed — 2026-04-30. CRM stays external. Notion CRM Mirror Dashboard designed with 8 key fields + 3 views (Today's Pipeline, By VA, Closing This Week). |
| No KPI → Trigger → Action system | F | 🔴 Critical | ✅ Fixed — 2026-04-30. KPI Trigger Table built: 8 KPIs with thresholds, responsible owners, and exact actions defined. |
| No automation layer | F | 🟠 High | ✅ Fixed — 2026-04-30. Automation Opportunity Map built: 12 tasks mapped, tool recommendations (start with [Make.com](http://Make.com)), 4 priority phases defined. |
| QC → Feedback → Retraining loop missing | D/F | 🟠 High | ⏳ Phase 2 |
| No client system (onboarding, retention) | E | 🌐 Strategic | ⏳ Phase 2 |
| Dual training systems (no unified path) | D | 🟠 High | ⏳ Phase 2 |

---

> **→ STATUS: ALL 6 TRACKS COMPLETE — 2026-04-30** 🎉
> 

> **→ Phase 2 is fully executed.** Tracks A, B, C, D, E, and F are all done.
> 

> **→ Next Phase:** Review deliverables, begin implementation of Automation Roadmap ([Make.com](http://Make.com) recommended as starting tool), and populate CRM Mirror Dashboard with live data.
>