# 🤖 VA Automation Architecture

> **Version:** 1.0 | **Last Updated:** April 29, 2026 | **Owner:** Ops Head | **Status:** Draft — Do not implement until Phases 1–6 have been live with real VAs for 3+ weeks
> 

---

> ⚠️ **Non-negotiable rule:** Do NOT implement any automation here until Phases 1–6 have been tested with real VAs for a minimum of 3 consecutive weeks. Automating a broken process makes it break faster and in harder-to-diagnose ways.
> 

---

## Purpose

This page is the blueprint for the automation layer that removes manual coordination from all repeatable VA processes. Once Phases 1–6 are proven stable, these automations are built in priority order — each one removing a layer of manual work from the Manager and VA team.

---

## Automation Readiness Checklist

Before starting any automation build, confirm all of the following:

- [ ]  All 16 SOPs have been followed by real VAs for 3+ weeks
- [ ]  At least 2 complete weekly scorecard cycles have been run
- [ ]  Daily reports are being submitted on time by ≥90% of VAs
- [ ]  CRM is clean, consistently formatted, and has ≥100 real entries
- [ ]  Manager has run the Monthly Audit at least once
- [ ]  Ops Head has confirmed automation budget and tooling (see Tools section below)

**If any box is unchecked — do not start. Fix the process first.**

---

## Automation Priority Order

---

### Priority 1 — CRM Status Triggers

**What it does:** When a lead’s status changes to "Booked" in the CRM, it automatically generates a pre-filled Call Handover Form template with the lead’s details. When a lead is marked "Closed Won", it triggers a new entry in the client onboarding pipeline.

**Why first:** This is the highest-value handoff in the system. Manual form creation takes 5–10 minutes per booking and is error-prone. Automation eliminates that entirely.

**Tool:** Google Apps Script (if CRM is Google Sheets) or Zapier / Make (if CRM is Airtable or HubSpot)

**Build steps:**

1. Define trigger: Status column changes to "Booked"
2. Auto-create a Notion page with the Handover Form template pre-filled from the CRM row (lead name, company, market, platform, call date)
3. Notify the VA via WhatsApp or email: "Handover form created for [Lead Name] — complete the Conversation Summary and submit."
4. Test with 5 manual entries before going live

**Success metric:** VA time to submit handover form drops from 10 minutes to 3 minutes. Zero blank handover forms.

---

### Priority 2 — Follow-Up Reminder System

**What it does:** Based on the First Contact Date entered in the CRM, the system automatically creates a task or reminder for the VA on Day 3, Day 7, Day 14, and Day 30 — with the correct template loaded for that follow-up stage.

**Why second:** VAs currently track follow-up days manually. This fails when they have 100+ leads in pipeline. Automation means zero missed follow-ups.

**Tool:** Google Apps Script (formula-based) or Notion automations + CRM integration

**Build steps:**

1. Add a calculated column in CRM: Next Follow-Up Date = First Contact Date + follow-up day offset
2. Script checks daily: if Today = Next Follow-Up Date, create a task item for that VA
3. Task shows: lead name, follow-up number, and links to the correct template
4. VA completes the task, marks it done, CRM updates automatically

**Success metric:** Follow-up completion rate increases from ~70% to ~95%. No manual daily CRM scanning required.

---

### Priority 3 — Reporting Aggregation

**What it does:** Each VA’s daily report data is automatically pulled into a Manager-facing dashboard. Manager sees team-wide numbers (total leads, total messages, reply rates, calls booked) without manually compiling them. A weekly summary is auto-generated every Sunday night from the 5 daily entries.

**Why third:** The Manager currently spends 15–20 minutes manually aggregating daily reports. Automation returns this time to coaching and QC.

**Tool:** Google Sheets formulas + Looker Studio (free) for dashboard visualisation, or Notion database with rollup properties

**Build steps:**

1. Standardise daily report into a fixed-column format (already done in SOP-VA-015)
2. Each VA’s daily report feeds into a shared summary sheet (one row per VA per day)
3. Summary sheet calculates: team totals, averages, top performer, below-target flags
4. Looker Studio or Notion gallery view visualises the data in real time
5. Weekly auto-summary email/message sent to Manager every Sunday at 6:00 PM

**Success metric:** Manager’s daily review time drops from 20 minutes to 5 minutes of reading a dashboard.

---

### Priority 4 — Lead Assignment Automation

**What it does:** When new leads are entered into the CRM, they are automatically assigned to VAs based on current capacity (number of active leads already in each VA’s pipeline). Manager is removed from daily lead distribution.

**Why fourth:** Manual lead assignment creates a daily bottleneck on the Manager. Automation removes this entirely once the CRM is stable.

**Tool:** Google Apps Script or Zapier

**Build steps:**

1. Add a "Current Active Leads" counter column per VA in a team capacity sheet
2. Script logic: new lead enters → find VA with fewest active leads → assign
3. Notify VA: "[X] new leads assigned to you today."
4. Manager receives a daily assignment summary (not individual assignments)
5. Override: Manager can manually reassign if needed

**Success metric:** Manager no longer distributes leads daily. VAs self-load from the auto-assigned queue.

---

### Priority 5 — Live Performance Dashboard

**What it does:** Scorecard data is pulled automatically from CRM and daily reports into a real-time dashboard. Manager sees every VA’s current week score, tier, and trend without building reports.

**Why fifth:** This is the most visible output of the system but depends on all other data feeds being stable first.

**Tool:** Looker Studio + Google Sheets, or Notion database with formula properties

**Build steps:**

1. Connect scorecard metric sources (CRM for leads/bookings, daily reports for reply rate, submission rate)
2. Build auto-calculation for each metric
3. Display: VA name, role, current week score, tier badge, trend arrow (up/down vs last week)
4. Manager dashboard shows team average at the top, individual rows below
5. Accessible on mobile (Manager can check from anywhere)

**Success metric:** Manager can check full team performance in under 2 minutes, from any device, at any time.

---

## Tools Reference

| Tool | Cost | Best For | Start When |
| --- | --- | --- | --- |
| **Google Sheets + Apps Script** | Free | CRM automation, follow-up reminders, report aggregation | Phase 7 start |
| **Looker Studio** | Free | Dashboard visualisation, performance charts | After data sources stable |
| **Notion Automations** | Included in plan | Task triggers, status-based page creation | Phase 7 start |
| **Zapier** | Paid (from ~$20/mo) | Cross-tool triggers (CRM → Notion → WhatsApp) | After initial budget confirmed |
| **Make (formerly Integromat)** | Paid (from ~$9/mo) | More complex multi-step automations | After Zapier proven |
| **Existing CRM** | Depends | Source of truth for all lead data | Already in use |

**Start with free tools.** Build the logic manually first, prove it works, then automate. Do not pay for automation tools before the manual process is stable.

---

## Phase 7 Autonomy Test

The automation layer is complete and the system is autonomous when all of the following are true:

- [ ]  New leads are auto-assigned to VAs without Manager involvement
- [ ]  Follow-up reminders fire automatically on the correct day for every lead
- [ ]  Call Handover Forms are auto-generated when a lead is marked Booked
- [ ]  Manager sees full team performance on a live dashboard without compiling any reports
- [ ]  Weekly performance summary is auto-sent to Manager every Sunday
- [ ]  Founder is absent for 4 weeks. Tasks flow. Reports generate. Quality is maintained.
- [ ]  Manager makes 80%+ of operational decisions independently without escalating to Ops Head

---

## Build Timeline (After Phases 1–6 are stable)

| Priority | Automation | Estimated Build Time | Complexity |
| --- | --- | --- | --- |
| 1 | CRM status triggers → Handover Form auto-create | 2–3 hours | Low |
| 2 | Follow-up reminder system | 3–4 hours | Medium |
| 3 | Reporting aggregation dashboard | 4–5 hours | Medium |
| 4 | Lead assignment automation | 3–4 hours | Medium |
| 5 | Live performance dashboard | 4–6 hours | Medium-High |

**Total estimated build time:** 16–22 hours (spread across 2–3 weeks in Month 2)

---

> **The Autonomy Test is the finish line. Not the start line. Build Phases 1–6 first. Run them with real people. Fix what breaks. Then automate what works.**
>