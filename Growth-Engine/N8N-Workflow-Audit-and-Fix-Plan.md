# N8N Growth Engine — Workflow Audit + Micro-Phase Fix Plan

> **Scope of this audit:** every `.json` file inside `00_Automation.zip` that is presented as a workflow deliverable — the 14 Phase 1/2 modules (in *both* copies found in the zip), the merged single-file funnel, and every Phase 3–7 file (`3.0.1.x` through `7.2`). 70 files total were opened; 62 parsed as real n8n workflow exports and were checked node-by-node for broken connections, orphan nodes, disabled nodes, credential placeholders, hardcoded secrets, unwired IF/Switch branches, webhook-path collisions, and error-handling coverage. The other 8 turned out not to be workflow files at all (see §1). Cross-checked against `N8N-MASTER-FULL-FUNNEL-WORKFLOW-AND-PROGRESS-TRACKER.md`, `DEPLOYMENT-GUIDE.md`, `STATUS-SUMMARY.md`, and the module READMEs.
>
> **How to read this:** §1–§4 are the problems, ranked by how badly they'd bite you, most dangerous first. §5 is a per-module quick-reference table. §6 is the fix plan, split into the smallest steps I could reasonably make them — same spirit as the MAXSPLIT tracker, continuing its phase numbering under a new **Phase F (Fix)** track so it slots into the existing plan instead of replacing it.

---

## 1. P0 — Will break the funnel or silently corrupt data

### 1.1 Two different copies of all 14 Phase 1+2 modules exist in the same zip, and they disagree

`00_Automation.zip` contains **two separate folder trees**, both claiming to hold the same 14 built modules (1.1–2.9):

- `Growth Engline-n8n-workflow/growth-engine-automation/...` — this is the **fixed, pre-wired** copy. `MERGED-FUNNEL-README.md` in this same folder documents that all 5 cross-module `Execute Workflow` placeholders were resolved to real fixed IDs, and a missing hand-off node (2.6 → 2.7) was added.
- `n8n - growth-engine-individual workflows/growth-engine-automation/...` — this is the **original, unwired** copy. Its own `README.md` says *"ye folder poore funnel ke ab tak ke importable n8n workflows rakhta hai"* (this folder holds the importable workflows) and tells you to manually copy-paste workflow IDs into placeholders after import.

Verified directly: every one of the 14 module pairs differs byte-for-byte. Concretely, in the `n8n - growth-engine-individual workflows` copy, `1.5-central-crm-sync/workflow.json` still has 4 `Execute Workflow` nodes pointing at literal string values —

```
"Execute Workflow - 2.4 Proposal Generation" → REPLACE_WITH_2.4_PROPOSAL_GENERATION_WORKFLOW_ID
"Execute Workflow - 2.1 Outreach"            → REPLACE_WITH_2.1_OUTREACH_WORKFLOW_ID
"Execute Workflow - 2.7 Onboarding"          → REPLACE_WITH_2.7_ONBOARDING_WORKFLOW_ID
"Execute Workflow - 2.5 Contract E-sign"     → REPLACE_WITH_2.5_CONTRACT_ESIGN_WORKFLOW_ID
```
— which will error on every run until someone finds and fixes them by hand. The `Growth Engline-n8n-workflow` copy has real numeric IDs in the same 4 nodes. On top of that, `2.6-invoice-payment/workflow.json` in the stale copy is **missing the "Execute Workflow - 2.7 Client Onboarding" node entirely** (17 nodes vs. 18) — meaning payment confirmation never triggers onboarding at all in that copy, it just dead-ends after the receipt email.

**Why this matters:** nothing in the zip marks one tree as canonical and the other as superseded/do-not-use. Anyone following the folder that literally says "this is the importable workflows folder" in its own README will deploy the broken tree.

### 1.2 13 files that look like built n8n workflows are not importable n8n workflows at all

`3.0.3.json`, `3.0.4.json`, `3.0.5.json`, `3.0.6.json`, `3.1.1.json`, `LinkedIn hiring-posts scraper 3.1.2.json`, `Digital Footprints Sub-workflow Wrap 3.1.3.json`, `Lead Generation Agent 3.1.4.json`, `Master Orchestrator 3.1.5.json`, `Enrichment Port Airtable Postgres 3.2.1.json`, `Unified Lead Router 3..3.1.json`, `Booking Confirmation 4.1.1.json`, and `SMS Reminders 4.1.2.json` all sit in the same folder as the real modules, named the same way (`4.1.1`, `4.1.2` etc. match the master tracker's own numbering). Opened as JSON, each one is actually **several separate JSON objects concatenated in one file** (`type: "n8n-node-patch"` or `"workflow-mapping"`) — a build spec describing what a node *should* do, not an n8n workflow export. None of them has the `nodes`/`connections`/`name` structure n8n's importer expects, so **"Import from File" on any of these 13 files will fail outright.**

This is internally consistent with the master tracker, which still shows these as unchecked `[ ]` sub-steps (e.g. `3.0.3.1`–`3.0.3.5`, `4.1.1.1`–`4.1.1.4`) — so nothing is mis-marked as done in the tracker itself. The actual problem is presentation: these spec files are sitting inside the same flat folder as genuinely finished workflows, with filenames indistinguishable from the real ones at a glance (`Booking Confirmation 4.1.1.json` reads exactly like `SMS Reminders 4.1.2.json` next to it, which also isn't real). Anyone doing a quick import pass will hit 13 silent failures and have no obvious way to tell "not built yet" apart from "built but broken."

### 1.3 Zero error handling anywhere, in any of the 62 real workflow files

Every single module — Phase 1, Phase 2, both PATCHED files, and every Phase 4–7 module — has **no `errorTrigger` node, no node-level `onError`/`continueOnFail`, and no `settings.errorWorkflow` set**. In n8n, that means: the moment any node throws (Odoo API times out, Postal SMTP rejects a send, a Postgres connection drops for two seconds), the entire execution just stops. No alert fires, no row gets logged, nothing retries. Combined with §1.4 below, a lead or client can silently vanish mid-pipeline — e.g. a proposal that fails to email out never gets flagged as failed, it just never sends, and the `clients_master` row still says "Proposal Sent" was attempted with no trace it didn't land.

This is a single missing pattern repeated ~62 times, not 62 separate bugs — see Phase F2 below for the one fix that closes all of them.

### 1.4 No `retryOnFail` on any HTTP Request node, across all modules

Every HTTP Request node in every workflow (Odoo calls, Postal sends, Nextcloud/WebDAV uploads, Documenso, Metabase, Cal.com, Waha) is a hard, single-attempt call. A one-second network blip on a self-hosted VPS stack (which is exactly what this whole system runs on, per `DEPLOYMENT-GUIDE.md`) is treated the same as a permanent failure. Given §1.3, that failure is also silent.

---

## 2. P1 — Will cause wrong behavior or data loss under normal operation

### 2.1 IF/Switch nodes with an unwired branch — records get silently dropped, not rejected

| Module | Node | What happens on the unwired branch |
|---|---|---|
| 1.5 Central CRM Sync | `IF Stage = Qualified`, `IF Stage = Won`, `IF Stage = Proposal Sent`, `IF Stage = Booked` (all 4) | Any lead whose stage doesn't exactly match the one string each IF checks just ends the execution there — no log, no "unhandled stage" branch. Since this node is the **only** router between Marketing and Sales, a typo'd or new Odoo stage name means leads quietly stop flowing and nothing tells you why. |
| 2.2 Nurture Sequence | `IF Final Nurture Step` | Leads that fall past the last nurture step vanish from the sequence with no "sequence exhausted" handling. |
| 4.1.3 SMS Re-engagement | `IF Not Suppressed (safety re-check)` | The suppressed branch (i.e. "don't text this person") has nowhere to go — fine in effect (nothing sent), but there's no log confirming the suppression fired, so you can't audit it later. |
| 7.1 Deliverability Monitor | `IF - Over Threshold?` | The "over threshold" alert path is the one left unwired in a bounce/complaint-rate monitor — the one branch that's the entire point of the workflow. |
| `3.0.1.5` HMAC patch spec | `Security - Token Verified?` | The **failed-verification** branch is unwired in the spec itself. This is pre-build content (§1.2), but worth flagging now before it gets built: an unwired reject branch on a signature check means forged webhook calls fall through instead of being blocked. |

### 2.2 Webhook path collisions between the 14-file deployment and the merged single-file deployment

Both deployment options documented (`SINGLE-FILE-MERGE-README.md` explicitly offers the merged file as an alternative to importing 14 separate files) register **identical webhook paths**: `typebot-lead-capture`, `lead-qualification`, `postal-reply-webhook`, `calcom-booking`, `proposal-accept`, `documenso-signed`, `payment-received`, `payment-failed`. If both get imported and activated on the same n8n instance — an easy mistake, since nothing in either README says "these are mutually exclusive, pick one" — n8n will have two active workflows claiming the same path, and whichever activates last silently wins. The other one just never fires again, with no error anywhere.

### 2.3 Placeholder credentials are correct-by-design but have no single master checklist

Every module correctly ships with `REPLACE_WITH_CREDENTIAL_ID` / `REPLACE_WITH_ODOO_POSTGRES_CREDENTIAL_ID` / empty-string credential IDs — that's expected, someone has to point each node at their real n8n credential after import. The gap: `DEPLOYMENT-GUIDE.md` §8–9 only walks through credential setup for the 15 Phase 1/2 workflow entry points. **Modules from Phase 4.3 through 7.2 — 17 more files, ~50 more credential fields — have no equivalent checklist anywhere.** Someone deploying the full stack has to grep each file by hand to find every node that needs a credential swapped in, which is exactly the kind of step that gets missed under time pressure and fails silently later (see §1.3 — a missing credential also just throws and stops, unlogged).

### 2.4 Database migrations are fragmented across the zip with no single run-order

`00-COMBINED-DB-SCHEMA-ADDENDUM.sql` (for modules 6.5–7.3) and `001_phase4_sms_calling_schema.sql` (for Phase 4.1.3–4.2.2) both alter the same `clients_master` table plus add new tables, but live in different subfolders and are never referenced from the top-level `DEPLOYMENT-GUIDE.md`, which only covers the Phase 1/2 schema (§7 "Central Control Table"). There's no single "run these N .sql files, in this order, before importing anything" step — someone deploying will hit `column does not exist` errors mid-way through Phase 4+ modules unless they've separately discovered both SQL files.

---

## 3. P2 — Quality/hygiene issues that will cost debugging time later

### 3.1 Two stubbed/mocked pieces of logic are live in the graph without a flagged sign-off

- **6.1.1 Account Health Snapshot Rollup** has a *disabled* node named `MOCK_TICKETING_PROVIDER - Tickets Pull` sitting inline. Support-ticket volume is one of the inputs to the health score, and right now that input is faked/stubbed with no README note calling it out the way the Phase 6.5–7.3 batch's `STATUS-SUMMARY.md` did for its own assumptions (cadence, thresholds, etc., all listed with a ⚠️ and asked for sign-off). This one wasn't surfaced the same way.
- **4.3.3 Reply Merge/Nurture Suppression** has a disabled `[Manual] Schema Setup - run once` node embedded directly in the operational canvas. Functionally harmless (disabled nodes don't run), but there's no comment/sticky-note next to it explaining it's intentionally disabled and one-time-only — anyone reviewing the canvas cold will wonder if it's a bug.

### 3.2 Orphan one-time-setup nodes with no trigger wiring

`4.3.1 Waha WhatsApp Reply Tracking` and `4.3.2 LinkedIn Reply Check Polling` each ship a `ONE-TIME SETUP - ...` Postgres node plus two sticky notes (`Overview`, `Migration Note`) that have zero connections in or out. This is presumably deliberate — run once by hand, then ignore — but nothing marks it as deliberate versus a wiring mistake, and it'll flag in any future automated workflow linter (including this one) as a broken node.

### 3.3 The master tracker has already had to self-correct once — worth a verification pass, not just trust, before Phase 3 work starts

`N8N-MASTER-FULL-FUNNEL-WORKFLOW-AND-PROGRESS-TRACKER.md` §0.2/§16.0 documents that an earlier pass wrongly marked 19 Sales/Marketing knowledge-base stages as "not yet built to pilot depth" when they actually were — the index file it trusted was stale. The tracker itself flags this and corrects it in §16.0. That's good practice, but it's also a signal: before treating any "✅ Built" marker in this ecosystem (tracker, README, or STATUS-SUMMARY) as ground truth for what to build next, a fresh spot-check against the actual files (the way this audit did) is worth doing rather than trusting the narrative — the same class of drift could exist elsewhere and just hasn't been caught yet.

---

## 4. What's genuinely solid (so the fix plan below doesn't relitigate it)

- Phase 6.5–7.2 (`STATUS-SUMMARY.md` batch) is internally consistent, every assumption it made (NPS cadence, churn win-back timing, deliverability thresholds) is written down with a ⚠️ asking for sign-off rather than silently guessed — that's the right pattern, and §6.4 below just asks Pubby to actually make those calls.
- No dangling connections (references to nodes that don't exist) anywhere in 62 real files — every connection points at a real node.
- No genuinely hardcoded secrets found in any file (the "n8n API Keys.txt" doc contains only illustrative example values like `StrongPassword123`, not real credentials).
- Node naming is consistent and readable across all modules (`[Module] Verb - Object` pattern), which made this whole audit possible to do quickly.

---

## 5. Per-module quick-reference

| # | Module | Real workflow.json? | Error handling | Retry on HTTP | Notable issue |
|---|---|---|---|---|---|
| 1.1 | Content→Social Factory | ✅ | ❌ | ❌ | — |
| 1.2 | SEO Automation | ✅ | ❌ | ❌ | — |
| 1.3 | Website Lead Capture | ✅ (2 copies + 2 PATCHED) | ❌ | ❌ | 4 near-identical copies across the zip |
| 1.4 | Inbound Form Qualification | ✅ | ❌ | ❌ | — |
| 1.5 | Central CRM Sync | ✅ | ❌ | ❌ | 4 unwired IF branches (§2.1); stale-copy placeholders (§1.1) |
| 2.1 | Multichannel Outreach | ✅ | ❌ | ❌ | — |
| 2.2 | Nurture Sequence | ✅ | ❌ | ❌ | 1 unwired IF branch |
| 2.3 | Booking Sync | ✅ | ❌ | ❌ | — |
| 2.4 | Proposal Generation | ✅ (orig + PATCHED) | ❌ | ❌ | — |
| 2.5 | Contract E-Sign | ✅ (orig + PATCHED) | ❌ | ❌ | — |
| 2.6 | Invoice Payment | ✅ | ❌ | ❌ | Stale copy missing 2.7 hand-off node entirely (§1.1) |
| 2.7 | Client Onboarding | ✅ | ❌ | ❌ | — |
| 2.8 | Delivery Reporting | ✅ | ❌ | ❌ | — |
| 2.9 | Renewal Revenue Ops | ✅ | ❌ | ❌ | — |
| 3.0.1.1–.5 | HMAC token patches | ❌ spec only | n/a | n/a | Reject branch unwired in spec (§2.1) |
| 3.0.3–3.0.6, 3.1.1 | Various | ❌ spec only | n/a | n/a | Not importable (§1.2) |
| 3.1.2–3.1.5 | LinkedIn/Digital Footprints/Lead Gen/Orchestrator | ❌ spec only | n/a | n/a | Not importable (§1.2) |
| 3.2.1, 3.3.1 | Enrichment, Unified Router | ❌ spec only | n/a | n/a | Not importable (§1.2) |
| 4.1.1, 4.1.2 | Booking Confirmation, SMS Reminders | ❌ spec only | n/a | n/a | Not importable (§1.2); tracker also marks ⛔ pending SMS gateway choice |
| 4.1.3 | SMS Re-engagement | ✅ | ❌ | ❌ | 1 unwired IF branch |
| 4.2.1 | DNC Call List Prep | ✅ | ❌ | ❌ | — |
| 4.2.2 | Dialer Trigger/Outcome Webhook | ✅ | ❌ | ❌ | — |
| 4.3.1 | Waha WhatsApp Reply Tracking | ✅ | ❌ | n/a | Orphan setup nodes (§3.2) |
| 4.3.2 | LinkedIn Reply Check Polling | ✅ | ❌ | ❌ | Orphan setup nodes (§3.2) |
| 4.3.3 | Reply Merge/Nurture Suppression | ✅ | ❌ | n/a | Disabled setup node inline (§3.1) |
| 5.1.1 | BANT/MEDDIC Extraction | ✅ | ❌ | ❌ | — |
| 5.1.2 | Write Qualification to Odoo | ✅ | ❌ | ❌ | — |
| 6.1.1 | Account Health Rollup | ✅ | ❌ | ❌ | Mocked ticketing input, no sign-off flag (§3.1) |
| 6.2.1, 6.2.2 | Adoption Checklist, Milestone Alert | ✅ | ❌ | ❌ | — |
| 6.3.1 | Support Ticketing Wiring | ✅ | ❌ | ❌ | — |
| 6.4.1 | Upsell/Cross-sell Trigger | ✅ | ❌ | ❌ | — |
| 6.5–6.9 | Churn/NPS/Case Studies/Referral/Advocacy | ✅ | ❌ | ❌ | Assumptions flagged for sign-off in STATUS-SUMMARY (good) |
| 7.1, 7.2 | Deliverability Monitor, List Refresh | ✅ | ❌ | ❌ | 7.1 alert branch unwired (§2.1) |
| — | Merged Full Funnel (161 nodes) | ✅ | ❌ | ❌ | Inherits every credential placeholder + both unwired-IF issues from source modules |

---

## 6. Fix Plan — Micro-Phases (Phase F, continuing the master tracker's numbering)

Same granularity as the MAXSPLIT tracker: each row is one sitting's worth of work, checkbox style. Grouped into parent sessions (F1–F6) the way the master plan groups 48 sessions.

### F0 — Repo hygiene (do this first, before anything else — it's what makes every later phase safe)

|Done|Step|Action|
|-|-|-|
|[ ]|F0.1|Pick one of the two Phase 1/2 trees as canonical. Given §1.1, that's `Growth Engline-n8n-workflow/growth-engine-automation/` (it's the pre-wired one).|
|[ ]|F0.2|Delete or clearly rename the stale `n8n - growth-engine-individual workflows/growth-engine-automation/` tree (e.g. `_ARCHIVE-DO-NOT-IMPORT/`) so its own README stops telling people it's the importable copy.|
|[ ]|F0.3|Move the 13 spec-only files (§1.2) out of the flat workflow folder into a `phase-3-specs-not-yet-built/` subfolder, or rename each with a `-SPEC` suffix, so filename alone tells you import-ready vs. not.|
|[ ]|F0.4|Add one line to the top-level README: "Pick ONE deployment mode — either the 14 separate module files, or `growth-engine-FULL-FUNNEL-merged.json`. Never import both into the same n8n instance." (closes §2.2)|
|[ ]|F0.5|Re-run this audit's validation pass after F0.1–F0.4 to confirm no duplicate webhook paths remain active in whichever tree is kept.|

### F1 — Error handling retrofit (closes §1.3 — the single highest-impact fix)

|Done|Step|Action|
|-|-|-|
|[ ]|F1.1|Build one shared "Error Handler" workflow: receives `{workflow name, node name, error message, item data}`, writes a row to a new `automation_errors` Postgres table, and posts an Odoo Discuss alert.|
|[ ]|F1.2|Add `ALTER TABLE` for `automation_errors` to the schema migration (ties into F5).|
|[ ]|F1.3|Set `settings.errorWorkflow` to point at F1.1's workflow ID on module 1.1.|
|[ ]|F1.4|Repeat F1.3 for 1.2, 1.3, 1.4, 1.5 (Phase 1 batch — one sitting).|
|[ ]|F1.5|Repeat F1.3 for 2.1, 2.2, 2.3, 2.4, 2.5 (Phase 2a batch).|
|[ ]|F1.6|Repeat F1.3 for 2.6, 2.7, 2.8, 2.9 (Phase 2b batch).|
|[ ]|F1.7|Repeat F1.3 for 4.1.3, 4.2.1, 4.2.2, 4.3.1, 4.3.2, 4.3.3 (Phase 4 batch).|
|[ ]|F1.8|Repeat F1.3 for 5.1.1, 5.1.2 (Phase 5 batch).|
|[ ]|F1.9|Repeat F1.3 for 6.1.1 through 6.9 (Phase 6 batch — split into two sittings if needed, 6.1–6.4 then 6.5–6.9).|
|[ ]|F1.10|Repeat F1.3 for 7.1, 7.2 (Phase 7 batch).|
|[ ]|F1.11|Repeat F1.3 on the merged funnel file (one `settings.errorWorkflow` covers all 161 nodes at once — cheapest fix in the whole plan, do this even if F1.4–F1.10 are deferred).|

### F2 — Retry on transient failures (closes §1.4, pairs with F1)

|Done|Step|Action|
|-|-|-|
|[ ]|F2.1|Define the standard retry setting to apply (suggest: `retryOnFail: true`, `maxTries: 3`, `waitBetweenTries: 2000ms` — adjust after first real outage tells you the right numbers).|
|[ ]|F2.2|Apply to all HTTP Request nodes in Phase 1 modules (5 files).|
|[ ]|F2.3|Apply to all HTTP Request nodes in Phase 2 modules (9 files).|
|[ ]|F2.4|Apply to all HTTP Request nodes in Phase 4 modules (5 files: 4.1.3, 4.2.1, 4.2.2, 4.3.1, 4.3.2).|
|[ ]|F2.5|Apply to all HTTP Request nodes in Phase 5–7 modules (9 files).|
|[ ]|F2.6|Re-generate the merged funnel file from the patched sources (don't hand-edit the 161-node file separately — regenerate it, or the two trees drift again like §1.1).|

### F3 — Unwired branches (closes §2.1)

|Done|Step|Action|
|-|-|-|
|[ ]|F3.1|1.5 Central CRM Sync: add an "else"/unmatched-stage branch on all 4 IF nodes → log to a new `unmatched_stage_events` row + Discuss alert, instead of silent drop.|
|[ ]|F3.2|2.2 Nurture Sequence: wire the "sequence exhausted" branch → mark lead `nurture_status = 'exhausted'` instead of dead-ending.|
|[ ]|F3.3|4.1.3 SMS Re-engagement: wire the suppressed branch → log-only node (no send), so suppression is auditable.|
|[ ]|F3.4|7.1 Deliverability Monitor: wire the over-threshold branch → this is the one that actually matters most, since it's the entire point of the workflow — send the alert it's supposed to send.|
|[ ]|F3.5|When 3.0.1.5 (HMAC reject branch) gets built for real (see F6.1), wire its fail branch to reject + alert from day one — don't repeat the spec's gap in the real build.|

### F4 — Credential + secrets master checklist (closes §2.3)

|Done|Step|Action|
|-|-|-|
|[ ]|F4.1|Script or hand-walk every workflow file (all ~40 real files post-F0) and dump every node name + credential type that needs an ID — this audit's validation script already does this (see `validate.py` output used to build §5); turn that into a standing checklist doc.|
|[ ]|F4.2|Extend `DEPLOYMENT-GUIDE.md` §8–9 to cover Phase 4.3–7.2, not just Phase 1/2.|
|[ ]|F4.3|Add a one-command "credential audit" step to the go-live checklist: grep every imported workflow for `REPLACE_WITH_` or empty credential `id` before activating anything.|

### F5 — Database migration consolidation (closes §2.4)

|Done|Step|Action|
|-|-|-|
|[ ]|F5.1|Create one `00-MASTER-MIGRATIONS.sql` that runs, in order: base `clients_master` (from top-level README §7), `00-COMBINED-DB-SCHEMA-ADDENDUM.sql` (6.5–7.3), `001_phase4_sms_calling_schema.sql` (4.1.3–4.2.2), plus the new `automation_errors` table from F1.2.|
|[ ]|F5.2|Add this single file to `DEPLOYMENT-GUIDE.md` §7 as the only migration step anyone needs to run.|
|[ ]|F5.3|Delete/archive the now-redundant pointers to the individual SQL files so there's one source of truth.|

### F6 — Flag-for-sign-off items (closes §3.1, mirrors the STATUS-SUMMARY pattern)

|Done|Step|Action|
|-|-|-|
|[ ]|F6.1|6.1.1 Account Health Rollup: get Pubby's call on the ticketing provider (Chatwoot per §0.3's open item, or something else) so `MOCK_TICKETING_PROVIDER` can be replaced with a real pull instead of staying disabled indefinitely.|
|[ ]|F6.2|Add a sticky note next to every intentionally-disabled/orphan setup node (4.3.3's schema-setup node, 4.3.1/4.3.2's ONE-TIME SETUP nodes) explaining it's deliberate and one-time, so future review passes don't re-flag them.|
|[ ]|F6.3|Do a fresh spot-check (sample 5–10 stages) against §16.0's self-correction in the master tracker before starting new Phase 3+ build work, to confirm no other stale "not built" markers are hiding actually-finished work — cheap insurance against redoing work that already exists.|

### Suggested order

F0 (repo hygiene) → F1+F2 together, in the same batch order (cheapest, highest-impact, and mechanical enough to do fast) → F4 (so nothing gets deployed half-wired going forward) → F5 → F3 → F6. This gets the existing 40 real workflows from "works if nothing ever fails" to "fails loud and recoverable" before any new Phase 3 build work starts on top of them.
