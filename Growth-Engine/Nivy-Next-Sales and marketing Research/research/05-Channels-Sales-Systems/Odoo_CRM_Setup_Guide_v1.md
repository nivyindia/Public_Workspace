# Odoo CRM Setup Guide — v1

**Module:** 05 — Channels & Sales Systems | **Status:** Draft v1 — ready to implement in Odoo | **Supersedes:** the "choose a CRM tool" step in `CRM_Pipeline_Setup_Notes.md` (Task 38), since Odoo is already Nivy Next's system of record | **Last updated:** 2026-08-08

This translates the tool-agnostic pipeline design in `CRM_Pipeline_Setup_Notes.md` into concrete Odoo CRM app configuration. Read that file first for the *why*; this file is the *how*, in Odoo.

---

## 1. Pipeline Stages (Odoo CRM > Configuration > Stages)

Odoo's CRM app ships with 4 default stages (New, Qualified, Proposition, Won). Replace with the 8-stage model:

| Order | Stage Name (as typed in Odoo) | Maps to |
|---|---|---|
| 1 | Lead | Contact identified, not engaged |
| 2 | Engaged | Replied/opened thread |
| 3 | Meeting Booked | Discovery call scheduled |
| 4 | Qualified | Call held, fits ICP |
| 5 | Proposal Sent | Pricing/scope delivered |
| 6 | Negotiation | Terms under discussion |
| 7 | Closed Won | *(use Odoo's built-in Won marker, don't rename default)* |
| 8 | Closed Lost | *(use Odoo's built-in "Lost" flag via the Lost reason wizard, not a manual stage — see §4)* |

Note: Odoo treats Won/Lost as flags on a lead, not just stages — set stage 7 as the pipeline stage that also triggers "Mark Won," and use the Lost wizard (not a manual "Closed Lost" stage) so the required Loss Reason field is enforced automatically.

**Stalled-deal rule:** CRM > Configuration > Stages doesn't natively support day-count alerts per stage. Implement instead as a **Scheduled Action** (Settings > Technical > Automation > Scheduled Actions) that flags any lead with `stage_id not in (won, lost)` and `write_date < today - 14 days`, then creates an Activity assigned to the deal owner's manager.

---

## 2. Required Fields (CRM > Configuration > Custom Fields, or Studio if available)

| Field | Odoo Field Type | Notes |
|---|---|---|
| Country | Selection (USA/Canada/UK/Australia/UAE) | Or reuse existing `country_id` on the linked Contact if contacts are already geo-tagged |
| Service Line | Selection (7 values) | New custom field — Odoo has no native equivalent |
| ICP Match | Selection (7 ICP names + "Unmapped") | New custom field |
| Source/Channel | Selection (Cold Email/LinkedIn/Referral/SEO-Inbound/Marketplace/Event) | Odoo has a native `source_id` field on leads — reuse it and set these as Utm Sources rather than creating a duplicate field |
| Deal Value (est.) | Reuse Odoo's native `expected_revenue` | Tie to package tier via a linked Selection field: Starter/Growth/Scale |
| Decision Criteria Flagged | Selection (Price/Trust/Speed/Expertise/Compliance) | New custom field |
| Objection Tags | Multi-select tags (`crm.tag`) | Odoo natively supports tags on leads — use these instead of a plain text field so they're filterable |
| Loss Reason | Reuse Odoo's native Lost Reason field (Settings > CRM > Lost Reasons) | Pre-load with: Price / Trust / Timing / Authority / Competitor |
| Competitor Mentioned | Free text field | New custom field |
| Contact Role | Selection (Initiator/Decision-Maker/Both) | New custom field |
| Consent/Compliance | Three sub-fields: Opt-in Method (text), Do-Not-Contact (checkbox), Data Retention Start Date (date) | New custom fields — do-not-contact checkbox should be wired to suppress the contact in any Odoo Email Marketing / mailing list sync |

Odoo Studio (if licensed) is the fastest way to add these without a developer; otherwise a small custom module or the free-tier "Custom Fields" option under CRM settings works for simple Selection/Text/Checkbox types.

---

## 3. Pipeline Views to Build (Odoo CRM > Pipeline, saved as Favorites)

1. **By Country** — Group By: Country. Filter into 5 saved Favorites (one per country) or one grouped view with country columns.
2. **By Service Line** — Group By: Service Line, same pattern.
3. **By Source/Channel** — Group By: Source (native `source_id`), Measure: Count + Expected Revenue, to see reply/meeting rate by channel.
4. **Stalled Deals** — Filter: `Stage != Won/Lost AND Last Updated > 14 days ago`. Save as Favorite, share with team.
5. **This Week's Priorities** — Filter: Activities due in next 7 days (Odoo's native Activity view already supports this — use the built-in "My Activities" or a team-shared filtered Activity list).

---

## 4. Automation Rules (Settings > Technical > Automation Rules — Odoo's native automation engine)

| Trigger | Odoo Automation Rule |
|---|---|
| New lead created | Automation Rule on `crm.lead` create: assign owner by Country/Service-Line matching rule (use a simple assignment rule in Odoo's Sales Teams config, or an Automation Rule with domain conditions) |
| Deal >14 days in stage | Scheduled Action (see §1) creates an Activity + sends internal notification to owner and manager |
| Stage = Closed Won | Automation Rule: create a Project/Task in Odoo Project app for delivery handoff; create a scheduled Activity 60 days out labeled "Request case-study interview" |
| Mark Lost | Odoo's native Lost wizard already force-requires a Lost Reason — no extra config needed beyond pre-loading the reasons in §2. Add an Automation Rule to queue a win/loss interview Activity on Lost. |
| Meeting Booked stage entered | Automation Rule: send an internal email/Activity to the rep with the discovery-call prep checklist attached |

Odoo's Automation Rules module (native, no third-party app needed) covers all five without external tooling — no need for n8n on this specific set, though n8n (already in use for the broader sales-to-retention funnel per `Dashboard_Tool_Spec.md`) can still handle the outreach-tool → CRM reply logging in §5 below if the outreach tool isn't natively Odoo-integrated.

---

## 5. Connect to Outreach (Task 41 dependency)

Once the cold email/LinkedIn sequences (Tasks 39-40) are live: replies should log back to the matching Odoo lead automatically. If the outreach tool has a native Odoo connector, use it directly; otherwise route through the existing n8n instance (already the automation layer per the dashboard spec) to write replies onto the lead's chatter/activity log.

---

## 6. Immediate Setup Checklist (replaces the tool-agnostic checklist in `CRM_Pipeline_Setup_Notes.md` §7)

- [x] ~~Choose CRM tool~~ — Odoo (already in use company-wide)
- [ ] Rename/reorder the 4 default CRM stages to the 8-stage model (§1)
- [ ] Add the 8 new custom fields + reuse the 3 native fields noted (§2)
- [ ] Pre-load Lost Reasons and Objection Tags
- [ ] Build the 5 saved Pipeline views (§3)
- [ ] Build the Scheduled Action for the 14-day stalled-deal rule (§1)
- [ ] Build the 4 Automation Rules (§4)
- [ ] Connect outreach tool replies to Odoo (§5, depends on Task 41)
- [ ] Import any existing deal history for baseline win-rate/cycle-length benchmarking

---
*Once configured, this directly unblocks Task 50 (KPI dashboard) for every Sales/Delivery/Retention KPI sourced from CRM data — see updated `Dashboard_Tool_Spec.md`.*
