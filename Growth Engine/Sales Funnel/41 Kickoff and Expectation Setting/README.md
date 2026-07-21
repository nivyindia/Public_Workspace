# 41 Kickoff and Expectation Setting

> **Stage 41 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7).

---

## Navigation

- ⬅ Previous stage: [40 Client Onboarding](../40 Client Onboarding/README.md)
- ➡ Next stage: [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Run a structured kickoff call within 3 days of contract signing that explicitly aligns the client and the delivery team on scope, success metrics, communication cadence, timeline, and roles — converting the implicit expectations formed during the sales process into an explicit, documented agreement both sides can refer back to.

**Purpose:** Most early-stage client dissatisfaction traces back to a mismatch between what the client expected and what was actually agreed — not to poor delivery quality. This stage exists to close that gap deliberately, at the moment the relationship is most positive, rather than letting misaligned expectations surface later as complaints. It is also where the account manager builds the personal relationship that carries the account through its first, most fragile weeks.

**Inputs:**
- Completed onboarding questionnaire (Stage 40)
- Service package and standard deliverables from the signed contract (Stage 36)
- Scheduled kickoff call slot (Cal.com or equivalent)

**Outputs:**
- A completed, well-documented kickoff call with explicit agreement on scope, KPIs, timeline, and communication cadence
- A published project plan in the client portal
- A logged call-notes record and post-call recap email

**Expected Result:** A client who leaves the call with total clarity on what happens next, when, and how success will be measured — the foundation for a smooth Stage 42 delivery handoff and a strong long-term relationship.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **41A** Call Scheduling | Booked within 3 days of contract signing, after the onboarding questionnaire is complete |
| **41B** Agenda Preparation | Personalized discovery questions drafted from questionnaire answers |
| **41C** Scope Confirmation | Explicit walkthrough of what's included/not included in the purchased package |
| **41D** Success Metrics Agreement | Primary/secondary KPIs, baseline, and target trajectory agreed together with the client |
| **41E** Timeline & Role Clarity | Explicit statement of realistic timeline and what each side is responsible for |
| **41F** Communication Cadence Agreement | Which channel for what, and expected response times, agreed explicitly |
| **41G** Documentation & Handoff | Call notes logged, project plan published, recap sent, handoff to Stage 42 triggered |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for scheduling and call tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting a personalized kickoff agenda with industry-specific discovery questions from the Stage 40 questionnaire answers
- Turning raw call notes into a client-ready recap email and a structured week-by-week project plan
- Flagging any expectation stated on the call that conflicts with the standard service package (e.g., a client expecting weekly reports when the standard cadence is bi-weekly), so the account manager can correct it before it becomes a documented mismatch

**Prompt examples:**
```
"Here are this client's onboarding questionnaire answers: [paste]. Generate
a 45-minute kickoff call agenda following this structure: introductions,
discovery, scope confirmation, KPI agreement, communication cadence, access
confirmation, next steps. Include 3 specific discovery questions tailored to
their industry and stated goal."
```

**Agent workflows:** An agent can own agenda drafting, post-call recap drafting, and project-plan generation end to end, with the account manager reviewing before anything reaches the client. The call itself must remain fully human — this is the stage's core relationship-building moment.

**RAG / vector database considerations:** Not required; the questionnaire answers and standard service package are sufficient structured input for agenda and recap generation.

**LLM recommendations:** Any current-generation model is sufficient; this task benefits more from good prompting against the questionnaire data than from a larger reasoning model.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Kickoff record fields (mandatory)
`Client ID` · `Call Scheduled Date` · `Call Completed Date` · `Attendance` (boolean) · `Primary KPI Agreed` · `Secondary KPIs Agreed` · `Communication Cadence Agreed` · `Timeline Communicated` (boolean) · `Project Plan Published` (boolean) · `Recap Sent` (boolean)

### JSON schema
```json
{
  "client_id": "string",
  "call_scheduled_date": "ISO 8601 date",
  "call_completed_date": "ISO 8601 date|null",
  "attendance": false,
  "primary_kpi": "string",
  "secondary_kpis": ["string"],
  "communication_cadence": "string",
  "timeline_communicated": false,
  "project_plan_published": false,
  "recap_sent": false
}
```

### Validation rules
- A client cannot progress to Stage 42 (Implementation and Delivery Setup) without `attendance = true` and `project_plan_published = true`
- If the client no-shows, the call must be rebooked within 24 hours — a no-show is never left unaddressed
- Success metrics must be documented in the client portal, not only discussed verbally, or the agreement has no reference point for later disputes

### Naming conventions
- `attendance` and `project_plan_published` are boolean gates used directly in onboarding-completion reporting

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Call held within 3 days of contract signing
- [ ] All 7 agenda sections covered, not skipped for time
- [ ] Timeline and role clarity explicitly stated in plain language
- [ ] Project plan published and recap sent within the same day

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Time to kickoff call | < 3 days from signing | Per Stage 7 Onboarding Engine benchmark |
| Kickoff call attendance rate | 100% | Reschedule within 24 hours on no-show |
| Project plan published within 24 hours of call | 100% | Keeps momentum immediately after the call |
| Client-reported clarity (post-call pulse, if surveyed) | High | Optional but useful early signal alongside Day 7 CSAT (Stage 40) |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [40 Client Onboarding](../40 Client Onboarding/README.md)
- **Next stage:** [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)
- **Depends on:** [40 Client Onboarding](../40 Client Onboarding/README.md) — the questionnaire this stage's agenda is built from
- **Feeds:** [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md), [43 Account Management](../43 Account Management/README.md)

> **Source note:** This stage separates the kickoff-call and expectation-setting step out of the broader onboarding process documented in Stage 7 — Onboarding Engine and 10. Client Onboarding System, giving it a dedicated build given how heavily it determines early client trust and retention. The 45-minute agenda structure and AI agenda-generation prompt are carried over directly from Stage 7's source material; the expectation-setting language is carried over from 10. Client Onboarding System.

[⬅ Back to README](README.md)
