# 13 CRM Setup and Data Structuring — Checklists

[⬅ Back to README](README.md)

---

## Initial Setup Checklist

- [ ] Company info, timezone, branding filled
- [ ] Email connected for tracking; tracking pixel installed on website
- [ ] Booking tool (Cal.com or equivalent) connected
- [ ] All mandatory contact properties created (see [templates.md](templates.md))
- [ ] All required custom properties created, matching the field dictionary exactly (names, types, dropdown values)
- [ ] Deal pipeline built with correct stage names/probabilities matching Stages 28-37's actual process
- [ ] Deal custom properties created (Deal Value, Service Type, Lost Reason, Expected Start Date)
- [ ] User roles assigned matching actual team responsibilities (Admin/Rep/View-only)
- [ ] Standard reports built: Deals by Stage, Leads by Source, Deals Closed This Month, Activities by Rep, Average Deal Close Time
- [ ] Dashboard assembled and shared with the team

## Pre-Go-Live QC Gate

- [ ] Test contact created end-to-end (form fill → CRM record → tracking pixel firing → task automation triggering) to confirm integrations work
- [ ] Every downstream stage's Section 8 requirement checked off against the live schema — no stage should discover a missing field after go-live
- [ ] No duplicate/near-duplicate fields exist (e.g., both "Lead Source" and "Source")

## Data Governance (Ongoing)

- [ ] New field requests go through a single owner before creation — no ad hoc fields added directly in the UI by any team member
- [ ] Monthly schema audit run (see [automation.md](automation.md)) and any drift resolved
- [ ] Field dictionary document kept current — any approved new field added there the same day it's created in the CRM

## Migration Checklist (If Importing Legacy Data)

- [ ] Column-to-property mapping reviewed and confirmed before import (not auto-mapped blindly)
- [ ] Duplicate detection run before import completes (avoid re-creating leads already in the new CRM)
- [ ] Post-import spot-check: sample 20 records, confirm all mapped fields landed correctly

[⬅ Back to README](README.md) · [Next: templates.md](templates.md)
