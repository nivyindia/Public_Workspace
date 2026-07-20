# 11 Lead Scoring and Prioritization

> **Stage 11 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 3, Session 5).

---

## Navigation

- ⬅ Previous stage: [10 Lead Verification](../10 Lead Verification/README.md)
- ➡ Next stage: [12 Lead Segmentation](../12 Lead Segmentation/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Assign every verified lead (Stage 10) a numeric score reflecting fit (who they are) and intent (what they've done), so the team always knows which leads deserve attention first.

**Purpose:** Not all verified leads are equal — a Founder who visited the pricing page twice is a different priority than a Marketing Assistant who opened one email. Without scoring, VAs work leads in whatever order they were entered, burning limited outreach hours on low-probability contacts while hot leads go stale. Scoring converts "list of leads" into "ranked queue," which is the input every outreach and follow-up stage after this one depends on.

**Inputs:**
- Verified lead list from Stage 10 (Status = Verified, valid contact anchor confirmed)
- ICP (Stage 02) and Buyer Persona (Stage 03) fit criteria
- Behavioral/engagement data where available (email opens/clicks, page visits, form fills, call bookings) from CRM tracking

**Outputs:**
- Every lead tagged with a numeric score and a tier label (Cold/Warm/Hot/Priority)
- A same-day "hot lead" alert list for immediate follow-up
- A scored, ranked queue feeding Stage 12 (Segmentation) and Stage 15 (Channel Strategy)

**Expected Result:** Every lead in the CRM carries an up-to-date score; outreach time is allocated in score order, not entry order; hot leads (score ≥ 50 on the 100-point model, or ≥8/10 on the fit-only model) are contacted within 24 hours.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **11A** Fit Scoring (Demographic) | Role, company size, geography, industry match against ICP — static, scored once at entry |
| **11B** Intent/Behavioral Scoring | Actions taken — form fills, email opens/clicks, page visits, call bookings, replies — scored continuously |
| **11C** Negative Scoring | Unsubscribes, spam marks, explicit "not interested," bounced contact — subtracts or disqualifies |
| **11D** Composite Score & Tiering | Combining fit + behavior into one number and mapping to Cold/Warm/Hot/Priority bands |
| **11E** Manual VA Scoring (No Paid Tooling) | Daily manual review process for teams on free-tier CRM without native scoring |
| **11F** Semi-Automated Scoring (n8n/Webhook) | Event-triggered score updates via automation platform, still writing to free-tier CRM fields |
| **11G** Native CRM Scoring (Paid Tier) | Built-in scoring engines (HubSpot Starter+, Salesforce, Pipedrive) once budget allows |
| **11H** Re-Scoring & Score Decay | Rules for lowering scores on inactivity so old "hot" leads don't stay falsely prioritized |
| **11I** Hot Lead Alerting | Real-time notification (Slack/email/WhatsApp) the moment a lead crosses a threshold |

---

## 3. Complete Methods

Full breakdown — manual, semi-automated, fully automated, and AI-assisted scoring approaches — is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

This stage has no external website library (scoring runs inside internal CRM/automation tooling, not third-party sites). See [tools.md](tools.md) for the relevant platforms.

---

## 5. Complete Tool Library

Full per-tool breakdown (purpose, pricing, OSS/free alternative, API/automation support) is in **[tools.md](tools.md)**.

---

## 6. Automation

Manual → semi-automated → fully automated → AI-assisted scoring workflows are in **[automation.md](automation.md)**.

---

## 7. AI Section

**How AI can help:**
- Reading unstructured signals (LinkedIn bio, recent posts, job postings) and outputting a fit sub-score an automation can consume, where CRM fields alone can't capture nuance
- Summarizing "why this lead scored X" in one line for the VA, instead of the VA reverse-engineering the score from raw activity logs
- Flagging scoring-rule drift — e.g., noticing that a source is producing leads that score high but never convert, suggesting the rule weights need adjusting
- Triaging a backlog of unscored leads in bulk from a CSV export, applying the documented scoring rules consistently instead of leaving it to inconsistent manual judgment

**Prompt examples:**
```
"Score each of these 30 leads (data below: title, company size, country,
industry, pages visited, emails opened) against this rule set: [paste
Section 2 of methods.md]. Output a table with Lead ID, Fit Score /10,
Behavior Score, Total, Tier."
```
```
"Given this lead's LinkedIn bio and last 5 posts [paste], does this person
show pain signals matching our ICP (no in-house marketing team, recently
hiring for growth roles, complaining about lead gen)? Answer yes/no with
a one-line reason."
```

**Agent workflows:** A webhook-driven pipeline can chain: (1) CRM event fires (form fill, page visit, email click) → (2) automation platform fetches current score → (3) applies rule-based delta → (4) writes updated score back to CRM → (5) if threshold crossed, an LLM drafts a one-line "why this is hot" summary attached to the Slack alert — see [automation.md](automation.md).

**RAG / vector database considerations:** Not required for rule-based scoring. Becomes relevant if the team wants semantic matching between a lead's stated pain points (from call notes or replies) and historical closed-won deal profiles — a later-stage enhancement, not a Stage 11 baseline requirement.

**LLM recommendations:** Any current-generation model is sufficient for rule application and summarization. Reserve larger/more careful models for judgment calls on ambiguous fit signals (e.g., unclear job titles, non-English profiles).

**Automation opportunities:** See [automation.md](automation.md) for n8n webhook-to-CRM scoring patterns.

---

## 8. Data Structure

### CRM fields (mandatory)
`Lead ID` · `Fit Score` (0-10 or component of 100-pt model) · `Behavior Score` · `Total Score` · `Tier` (Cold/Warm/Hot/Priority) · `Last Scored Date` · `Score Trend` (rising/flat/decaying)

### CRM fields (optional)
`Score Reason` (1-line note) · `Disqualified` (bool + reason) · `Alert Sent` (bool, timestamp)

### JSON schema
```json
{
  "lead_id": "string (uuid)",
  "fit_score": "number (0-10 or 0-100 depending on model)",
  "behavior_score": "number",
  "total_score": "number",
  "tier": "cold|warm|hot|priority",
  "last_scored": "ISO 8601 datetime",
  "score_trend": "rising|flat|decaying",
  "disqualified": "boolean",
  "disqualify_reason": "string|null"
}
```

### Validation rules
- Every lead entering this stage must already have Status = Verified from Stage 10 — unverified leads are not scored
- Fit score is recalculated only when ICP fields change (role, company size, geography); behavior score recalculates on every tracked event
- A lead crossing a hard negative-signal (spam complaint, explicit opt-out) is force-set to Disqualified regardless of numeric total

### Naming conventions
- Tier labels are a fixed four-value enum (`cold`, `warm`, `hot`, `priority`) — free text breaks the alerting automation
- Score Reason is a single short sentence, not a log — full history lives in the CRM's native activity timeline, not this field

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] Every verified lead has a non-null Total Score and Tier
- [ ] Hot/Priority leads have an Alert Sent timestamp within 24 hours of crossing threshold
- [ ] No lead scored using stale fit data (role/company size older than 90 days unrefreshed)
- [ ] Score components (fit + behavior) sum correctly to Total Score
- [ ] Weekly audit sample confirms scoring rules were applied consistently, not overridden ad hoc

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| % of verified leads scored same-day | 100% | Unscored leads are effectively unprioritized inventory |
| Hot-lead contact SLA | Within 24 hrs | Per Lead Scoring Rules Document threshold action table |
| Score-to-conversion correlation (QC audit) | Higher tiers convert at meaningfully higher rate | Sampled monthly; if Hot doesn't outconvert Warm, rule weights need revision |
| False-positive rate on Hot tier | < 15% | Hot leads that go completely cold within 2 weeks of contact attempt |
| Scoring rule staleness | Reviewed quarterly | Market/channel mix shifts change which signals actually predict conversion |

---

## 11. Templates

See [templates.md](templates.md) for the scoring rule tables, Slack alert message format, and daily VA scoring checklist.

---

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [10 Lead Verification](../10 Lead Verification/README.md) — supplies the verified lead pool this stage scores
- **Next stage:** [12 Lead Segmentation](../12 Lead Segmentation/README.md) — groups scored leads into campaign-ready segments
- **Also feeds:** [15 Outreach Channel Strategy](../15 Outreach Channel Strategy/README.md), [24 Follow Up Systems](../24 Follow Up Systems/README.md)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated using operational SOPs already in production at Nivy Digital (Lead Scoring Rules Document, Lead Qualification Framework, SOP-VA-004 — Lead Qualification Scoring), generalized here for a multi-vertical, multi-market B2B knowledge base. Pricing figures are approximate as of the source docs' last update (May 2026) and should be verified against vendor sites before operational use.
