# 📋 Document Control Standards & Naming Guide

> **Version:** 1.0 | **Last Updated:** April 29, 2026 | **Owner:** Ops Head | **Status:** Live
> 

---

## Purpose

This page defines the document naming system, versioning rules, header standards, and review cycles applied to every page in the Nivy VA system. These standards ensure the system is searchable, traceable, and maintainable by anyone — including someone joining the team with no prior context.

---

## Document Naming System

Every document in the VA system must have a coded name. No exceptions.

| Document Type | Naming Format | Examples |
| --- | --- | --- |
| Knowledge Base | KB-001, KB-002... | KB-001 — What is a Lead |
| Standard Operating Procedure | SOP-VA-001, SOP-VA-002... | SOP-VA-005 — LinkedIn DM Outreach |
| QC Checklist | QC-001, QC-002... | QC-003 — Follow-Up Checklist |
| VA Scorecard (individual) | [VA Name] — Weekly Scorecard | Arjun Sharma — Weekly Scorecard |
| Onboarding Record (individual) | [VA Name] — Onboarding Completion Record | Priya Mehta — Onboarding Completion Record |
| Team-level documents | Emoji + descriptive title | 🔄 VA Handoff System, ⚠️ VA Error Handling System |
| Architecture / system pages | Emoji + descriptive title | 🤖 VA Automation Architecture |

**Rule:** No page in the VA system should have an untitled, vague, or duplicate name. Every name must be unique and searchable.

---

## Required Header Block

Every document must begin with this header (in a callout or quote block):

```
Version: [x.x] | Last Updated: [Date] | Owner: [Role name] | Status: [Live / Draft / Archived]
```

**Status values:**

- **Live** — actively in use, current and accurate
- **Draft** — being built or reviewed, not yet in use
- **Archived** — no longer in use, kept for reference

---

## Version Numbering System

| Change Type | Version Increment | Example |
| --- | --- | --- |
| First published version | 1.0 | New SOP goes live: v1.0 |
| Minor update (small fix, added note, corrected example) | +0.1 | Fixed typo in step 3: v1.0 → v1.1 |
| Major update (process changed, steps restructured) | +1.0 | Full rewrite of outreach sequence: v1.1 → v2.0 |

**Rule:** Every time a document is edited, the version number and Last Updated date must be updated at the top of the page. If you change a document without updating the version, it is treated as unauthorised.

---

## Review Cycle

| Document Type | Review Frequency | Trigger |
| --- | --- | --- |
| Knowledge Base (KB-001 to KB-006) | Every 60 days | Or when a process changes |
| SOPs (all 16) | Every 30 days | Or immediately after any process change |
| QC Checklists (QC-001 to QC-005) | Every 30 days | Or if a recurring error type is identified |
| SLA document | Every 60 days | Or when team size changes significantly |
| Role & Responsibility Matrix | Every 90 days | Or when a new role is created |
| Scorecard templates | Every quarter | Or when KPI targets change |

**Monthly Review Owner:** VA Manager. Ops Head reviews Manager’s audit report.

---

## Naming Don’ts

- ❌ "New SOP" — not a valid name
- ❌ "Copy of KB-001" — duplicate, not valid
- ❌ "Temp page" — no temporary pages in the live system
- ❌ "Notes from meeting" — all permanent content must be formatted, named, and versioned
- ❌ ALL CAPS titles (e.g., "SOP FOR LINKEDIN OUTREACH") — use the standard coded format

---

## Page Ownership Rules

Every page must have one named owner (by role, not personal name):

| Owner Role | Pages They Own |
| --- | --- |
| VA Manager | All SOPs, QC checklists, SLA, Communication System, Onboarding pages, individual scorecards |
| Ops Head | Role Matrix, Progression Criteria, Error Handling System, Handoff System, Document Control Standards, Automation Architecture |
| VA (individual) | Their own scorecard, their own onboarding record |

Owner = responsible for keeping it accurate and up to date. If the owner changes role, the new owner inherits the page within their first week.

---

**A system that is properly named and versioned can be handed to a new Manager on Day 1. That is the standard we are building to.**