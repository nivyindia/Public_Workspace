# Automation — 42 Implementation and Delivery Setup

> Part of Stage 42 (Implementation and Delivery Setup). See [README.md](README.md) for the stage overview.

For each sub-stage below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Task Board Creation & Team Assignment (42A–42B)

| Level | Workflow |
|---|---|
| **Manual** | Delivery lead builds a fresh Notion/ClickUp board by hand for each client, copying tasks from memory of "what this service usually needs." |
| **Semi-automated** | A per-service SOP template board exists and is manually duplicated, then manually customized after re-reading the kickoff notes. |
| **Fully automated** | Stage 41's "kickoff complete" trigger fires an n8n workflow that duplicates the correct service-specific SOP template board via the Notion/ClickUp API automatically, matched to the exact service line sold — no manual duplication step. |
| **AI-assisted** | An LLM reads the kickoff call notes/project plan (Stage 41) against the standard SOP template and flags specific customizations the delivery team should add (e.g., "client requested weekly instead of bi-weekly reporting — add a recurring task"), so the human customization pass starts from a flagged list, not a blank re-read. |

**Required:** Notion/ClickUp API · per-service SOP board templates (one per service line) · n8n for the trigger → duplicate sequence · LLM step for customization-flagging.
**Expected output:** a fully structured, correctly-templated task board existing before the delivery specialist's first working day on the account, with client-specific customizations already flagged for review.
**Common errors:** wrong SOP template duplicated because the service-line field on the CRM deal record doesn't match the template-mapping key exactly (recovery: keep the service-line taxonomy identical between the CRM package field and the template-mapping table — a naming drift here silently breaks the automation); customization flags generated but never actually reviewed because they land in a place no one checks (recovery: post flags directly into the new task board as a checklist item, not a separate report).

---

## 2. Access Verification & Tracking/Analytics Setup (42C–42D)

| Level | Workflow |
|---|---|
| **Manual** | Delivery specialist logs into each platform by hand to confirm access works, and manually checks GA4/pixel is firing by watching real-time reports. |
| **Semi-automated** | Access credentials are collected (Stage 40) but "verification" means someone logs in once and assumes it's fine going forward. |
| **Fully automated** | An automated API check (per platform: Google Analytics, Meta Ads, CMS, social) runs against each collected credential immediately after collection and again at delivery kickoff, confirming both access *and* that tracking events are actually firing — not just that a login succeeds. |
| **AI-assisted** | For platforms without a clean API health-check (some CMS/legacy tools), an LLM-assisted browser-automation check (Playwright script + LLM verification of the resulting screenshot/page state) can substitute for a human eyeballing a login. |

**Required:** Platform APIs (GA4 Measurement Protocol / Meta Conversions API / CMS API) for automated health checks · Playwright for platforms without API-level verification · n8n to schedule and alert on check results.
**Expected output:** every credential collected in Stage 40 is confirmed *working and tracking correctly* — not just "logged in once" — before Phase 1 work starts.
**Common errors:** access confirmed at collection time (Stage 40) but silently expires or gets revoked before delivery actually starts weeks later (recovery: re-run the verification check at the actual delivery-kickoff trigger, not just once at collection); GA4 goal/pixel technically "firing" but attributed to the wrong property/account (recovery: the automated check should verify the *specific* property ID matches the client's, not just that some event fired somewhere).

---

## 3. Phase 1 Scheduling & First Deliverable QC/Go-Live (42E–42G)

| Level | Workflow |
|---|---|
| **Manual** | Delivery lead manually tracks the 7-day first-deliverable deadline in their head or a personal to-do list. |
| **Semi-automated** | The 7-day deadline is written into the task board manually as a due date, with no automated reminder if it's approaching. |
| **Fully automated** | Phase 1 (Foundation) activities auto-schedule against the standard timeline the moment the task board is created (section 1 above), and an n8n reminder fires automatically as the 7-day first-deliverable deadline approaches — visible to both the delivery specialist and their QC reviewer, not tracked by one person's memory. |
| **AI-assisted** | Not applicable to the QC decision itself — the actual judgment call on whether a deliverable is client-ready needs a human team-lead review given how much this first proof point matters for trust; automation's role is making sure that review happens on schedule and the client is notified the moment it clears, not skipping the review. |

**Required:** n8n scheduled reminders tied to the task-board creation date · Slack/Telegram for delivery-team and QC-reviewer alerts · client-notification trigger (email/portal update) on go-live.
**Expected output:** Phase 1 work starts on a predictable schedule with no manual date-tracking, and the client is notified the moment the first deliverable clears QC and goes live — consistently within the 7-day target, not "whenever someone remembers to check."
**Common errors:** 7-day deadline reminder fires but goes to the delivery specialist only, not the QC reviewer, so a bottleneck at review isn't visible until the deadline is already missed (recovery: reminders should go to both roles, and escalate to the delivery lead if QC hasn't happened within a defined window before the deadline); client notified of go-live before QC actually signed off, because the notification was tied to task-board status change rather than the explicit QC-approval field (recovery: gate the client-notification trigger strictly on the QC-approval event, never on a task simply being marked "done" by the specialist).

**n8n / integration flow:** `Stage 41 kickoff-complete webhook` → `n8n (duplicate service-specific SOP board)` → `LLM (flag customizations from kickoff notes)` → `Slack/Telegram (notify + brief delivery team)` → `Automated API/Playwright check (verify access + tracking firing correctly)` → `Phase 1 tasks auto-scheduled` → `7-day deadline reminder (delivery specialist + QC reviewer)` → `QC approval (human gate)` → `Client notification on go-live`

---

## Cross-Stage Automation Note

The task board created here (42A) should carry forward the exact scope/KPI fields established in Stage 41's project plan, and the access-verification results (42C) should be visible to Stage 43 (Account Management) so a recurring account-health check doesn't have to re-verify from scratch what this stage already confirmed once.

## Recovery Principles (General)

- **"Access collected" and "access verified" are not the same claim** — always re-check at the point of actual use, not just at initial collection, since credentials expire and permissions get revoked silently.
- **Never let a task-status change substitute for an explicit QC-approval gate** — the first deliverable is the highest-trust moment in the client relationship; the automation's job is enforcing that the human review actually happened, not working around it.
- **Deadline visibility should reach every role in the chain**, not just the person doing the work, so a bottleneck is caught before it becomes a missed deadline.

---

## Cross-References

- Stage README: [README.md](README.md)
- Sub-stages referenced above: [README.md § 2](README.md#2-complete-sub-stages)
- Tools referenced above: [tools.md](tools.md)
- Trigger source: [41 Kickoff and Expectation Setting](../41 Kickoff and Expectation Setting/automation.md)
- Feeds into: [43 Account Management](../43 Account Management/automation.md)
- Previous stage: [41 Kickoff and Expectation Setting](../41 Kickoff and Expectation Setting/README.md)
- Next stage: [43 Account Management](../43 Account Management/README.md)
