# Automation — 41 Kickoff and Expectation Setting

> Part of Stage 41 (Kickoff and Expectation Setting). See [README.md](README.md) for the stage overview.

For each sub-stage below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Call Scheduling & Agenda Preparation (41A–41B)

| Level | Workflow |
|---|---|
| **Manual** | AM emails back and forth to find a time, then writes the agenda from scratch after re-reading the questionnaire. |
| **Semi-automated** | A scheduling link (Cal.com/Calendly) is sent manually once the questionnaire is back; agenda is AI-drafted but from a generic template not tied to the specific answers. |
| **Fully automated** | Stage 40's questionnaire-complete event triggers an automatic scheduling-link send (gated to only fire once the questionnaire is actually done, honoring the "within 3 days, after questionnaire complete" rule) and an LLM drafts a personalized agenda directly from the structured questionnaire fields. |
| **AI-assisted** | The LLM agenda draft includes industry-specific discovery questions pulled from the client's stated business type/competitors (not a generic checklist), so the AM's review step is refining detail, not writing from a blank page. |

**Required:** Cal.com/Calendly with API/webhook · n8n to gate the scheduling-link send on questionnaire completion · LLM step for agenda drafting from structured questionnaire data.
**Expected output:** a call booked within the 3-day target, with a genuinely client-specific agenda ready before the AM's review, not a copy-paste starting point.
**Common errors:** scheduling link sent before the questionnaire is actually complete, forcing a kickoff call with no prep data (recovery: gate the send strictly on the questionnaire-complete webhook, not a fixed day-count from contract signature); agenda draft ignores questionnaire answers and produces a generic list because the LLM prompt wasn't actually passed the structured fields (recovery: verify the prompt template pulls live questionnaire data, not a placeholder).

---

## 2. Scope, Success Metrics & Timeline Clarity (41C–41F)

| Level | Workflow |
|---|---|
| **Manual** | AM explains scope/KPIs/timeline/communication cadence verbally on the call from memory of the package sold. |
| **Semi-automated** | A scope-summary one-pager exists per package tier and is manually pulled up during the call. |
| **Fully automated** | The correct package-tier scope summary, KPI-baseline template, and communication-cadence policy auto-attach to the agenda document based on the client's purchased package (pulled from the CRM deal record), so the AM never has to remember which tier includes what. |
| **AI-assisted** | Not applicable to the live conversation itself — this content is genuinely a human, real-time discussion (reading the client's confidence level, negotiating realistic expectations); automation's role here is making sure the *right reference material* is in front of the AM, not conducting the conversation. |

**Required:** Package-tier scope-summary templates linked to CRM deal-record package field · KPI-baseline template per service line.
**Expected output:** the AM walks into every call with the exact right scope/KPI/cadence reference material for that specific client's package — no guessing, no outdated material from a different tier.
**Common errors:** scope summary pulled for the wrong package tier because the CRM deal record's package field wasn't updated after a mid-sale upgrade/downgrade (recovery: the auto-attach step should re-verify the current package field at trigger time, not rely on a value set weeks earlier at proposal stage).

---

## 3. Documentation & Handoff (41G)

| Level | Workflow |
|---|---|
| **Manual** | AM writes call notes from memory after the call, drafts a recap email, and manually builds a project plan document. |
| **Semi-automated** | An AI notetaker transcribes/summarizes the call, but the recap email and project plan are still drafted by hand from that summary. |
| **Fully automated** | Call-notes/transcript automatically feeds an LLM step that drafts both the client-facing recap email and the week-by-week project plan in the same pass; both publish to the client portal (Stage 40's Notion setup) once the AM approves — no manual re-typing of either document. |
| **AI-assisted** | Beyond drafting, the LLM cross-checks the recap against the agreed KPIs/scope from section 2 above to make sure nothing discussed on the call (a verbal scope addition, say) is silently missing from the written recap — a consistency check, not just a summarization pass. |

**Required:** AI notetaker (Fireflies/Fathom/Otter, human-reviewed for accuracy) · LLM step for recap + project-plan drafting · Notion API to publish to the client portal · CRM field update to trigger Stage 42 handoff.
**Expected output:** a client-facing recap and a week-by-week project plan published to the portal within the same day as the call, plus a CRM status update that reliably triggers Stage 42 — with no step depending on the AM remembering to do it manually days later.
**Common errors:** recap email sent without AM review, and the AI notetaker mis-transcribed a key commitment (recovery: this is a genuinely required human-review checkpoint — never auto-send the recap unreviewed, since it's the client's first written record of what was promised); CRM handoff flag never gets flipped because it's a separate manual step from "recap sent" (recovery: tie the Stage 42 trigger to the same publish action, not a second checkbox someone has to remember).

**n8n / integration flow:** `Stage 40 questionnaire complete` → `n8n (gate + send scheduling link)` → `LLM (draft personalized agenda)` → `AM review` → `Cal.com (call scheduled)` → `Call happens (AI notetaker + human-reviewed notes)` → `LLM (draft recap + project plan, cross-check against agreed scope/KPIs)` → `AM review + approve` → `Notion (publish recap + project plan)` → `CRM (kickoff complete → trigger Stage 42)`

---

## Cross-Stage Automation Note

This stage's output (the published project plan and the "kickoff complete" CRM flag) is what Stage 42 (Implementation and Delivery Setup) uses to auto-create its task board from the correct service-specific SOP template — so the project plan's structure should match the field names Stage 42's automation expects, not be a free-form document that has to be manually re-interpreted at the next stage boundary.

## Recovery Principles (General)

- **The call itself stays fully human** — reading a client's confidence level and calibrating tone in real time is exactly the kind of judgment this system should never try to automate; automation's job is making sure the AM has the right material, not replacing the conversation.
- **Never auto-send the written record of a live conversation without human review** — a recap or project plan is the client's reference point for what was promised; a transcription error here compounds into every later stage.
- **Tie stage-handoff triggers to the actual completion action**, not a separate manual flag, so handoffs can't silently stall on a forgotten checkbox.

---

## Cross-References

- Stage README: [README.md](README.md)
- Sub-stages referenced above: [README.md § 2](README.md#2-complete-sub-stages)
- Tools referenced above: [tools.md](tools.md)
- Trigger source: [40 Client Onboarding](../40 Client Onboarding/automation.md)
- Feeds into: [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/automation.md)
- Previous stage: [40 Client Onboarding](../40 Client Onboarding/README.md)
- Next stage: [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)
