# Automation — 37 Closing Techniques

[⬅ Back to README](README.md)

> **Flag: 🔴 (N/A — human skill)** — per [N8N-AUTOMATION-INDEX.md](../N8N-AUTOMATION-INDEX.md). Recognizing and acting on a genuine buying signal is a human skill; what automates is the *signal detection and routing* that surrounds it, not the closing conversation itself.

For each component below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Buying-Signal Detection via Proposal Tracking

| Level | Workflow |
|---|---|
| **Manual** | Rep has to directly ask the client whether they've reviewed the proposal to find out if there's engagement. |
| **Semi-automated** | Rep periodically checks the proposal tool's view/open dashboard for activity. |
| **Fully automated** | Proposal-tool view/open/forward events (from the same tool used in [33 Proposal Creation](../33 Proposal Creation/README.md)) log automatically to the CRM the moment they happen, so buying signals are visible without a rep having to ask. |
| **AI-assisted** | LLM classifies a raw sequence of tracking events (e.g., "opened 3 times over 2 days, forwarded internally") into a plain-language signal strength note on the deal, so a rep scanning their pipeline doesn't have to interpret raw event logs themselves. |

**Required:** proposal-tool tracking (HubSpot Quotes/PandaDoc/Proposify — shared with Stage 33) · CRM write access for event logging.
**Expected output:** every proposal view/open/forward event visible on the deal record without the rep having to ask the client or check a separate dashboard.
**Common errors:** tracking pixels blocked by the client's email client, producing false "no activity" signals (recovery: treat absence of tracked activity as inconclusive, not as a negative signal — pair with the standard follow-up cadence rather than reading silence as disinterest).

---

## 2. Standard Follow-Up Cadence Continuation

| Level | Workflow |
|---|---|
| **Manual** | Rep manually remembers to check back in on a set schedule. |
| **Semi-automated** | Rep sets a manual reminder/task after sending the proposal. |
| **Fully automated** | The standard follow-up cadence already built in [24 Follow Up Systems](../24 Follow Up Systems/automation.md) continues automatically regardless of whether a buying signal has fired — the two systems run in parallel, not as substitutes for each other. |
| **AI-assisted** | None beyond what Stage 24 already provides — this component is a direct reuse, not a new build. |

**Required:** the existing Stage 24 follow-up sequencing (Wait + IF no-reply-after-X-days pattern).
**Expected output:** every deal continuing to receive scheduled follow-up regardless of signal activity, so a quiet-but-still-live deal isn't dropped.
**Common errors:** a rep manually pausing the standard cadence because they assume a detected buying signal means the deal will close itself (recovery: keep the cadence running until the deal reaches Closed Won/Closed Lost — a detected signal adds a nudge, it doesn't replace the baseline cadence).

---

## 3. Signal-Triggered Nudge Drafting

| Level | Workflow |
|---|---|
| **Manual** | Rep composes a fresh follow-up message with no reference to the specific tracked signal. |
| **Semi-automated** | Rep manually checks the tracking dashboard, notices a signal, and writes a nudge referencing it by hand. |
| **Fully automated** | None — sending a nudge always requires human review; only the *drafting* is automated (see next row). |
| **AI-assisted** | Once a genuine buying signal is detected (§1) — a re-opened proposal after silence, or an internal forward — LLM drafts a short, low-pressure nudge referencing the specific signal (e.g., "saw you had a chance to look this over again") rather than a generic check-in. |

**Required:** the signal-detection data from §1 · LLM access for drafting · a mandatory rep-review-before-send gate.
**Expected output:** a nudge draft that's specific to the actual tracked signal, ready for a rep to review and personalize further before sending.
**Common errors:** an LLM draft that reads as presumptuous about the client's intent based on a single ambiguous signal (recovery: keep the draft tone deliberately low-pressure and let the rep soften or hold it if the signal turns out to be a false positive, e.g., a colleague opening the proposal rather than the decision-maker).

---

## 4. Closed-Won / Closed-Lost Routing

| Level | Workflow |
|---|---|
| **Manual** | Rep manually updates the CRM deal stage and manually decides what happens next. |
| **Semi-automated** | Rep updates the deal stage; downstream teams check the CRM periodically to notice the change. |
| **Fully automated** | A Closed Won deal stage automatically triggers [36 Contract and Legal](../36 Contract and Legal/README.md)'s flow if not already in motion; a Closed Lost deal automatically routes into the 90-day re-engagement nurture already built in [24 Follow Up Systems](../24 Follow Up Systems/README.md), rather than the deal simply going cold with no next step. |
| **AI-assisted** | None — this is a routing function based on an already-human-made decision, not a generative one. |

**Required:** CRM deal-stage change trigger · n8n (or equivalent) to fan out to Stage 36 or Stage 24's nurture flow.
**Expected output:** no deal left in limbo after a rep marks it won or lost — both outcomes have a defined automated next step.
**Common errors:** a deal marked Closed Lost with no reason code, making the eventual re-engagement nurture generic instead of tailored to why it was lost (recovery: require a reason field on Closed Lost, and let the 90-day nurture message reference it where appropriate).

---

## What Does NOT Automate Here (and Why)

- **Recognizing which detected signal is genuine and deciding whether a nudge is warranted at all.** A view/open event is data, not certainty — reading whether it represents real buying intent (versus a colleague forwarding the doc, or a client re-checking pricing for an unrelated reason) is exactly the human judgment this stage's name refers to, and forcing it into a rules engine would generate more false-positive nudges than it prevents.

---

## Suggested n8n / Integration Flow

`Proposal sent (Stage 33) → Standard follow-up cadence active (Stage 24) → Proposal-tool tracking event → Log to CRM → If signal suggests active consideration: LLM drafts referencing-nudge → Rep review + send → [Signed → Contract (Stage 36)] | [No response → cadence continues] → Deal closed → (Won: Stage 36 trigger if not already fired | Lost: reason code → 90-day nurture, Stage 24)`

## Recovery Principles (General)

- **Treat tracking silence as inconclusive, not negative** — a blocked pixel looks identical to genuine disinterest; don't let the automation quietly deprioritize a deal on that basis alone.
- **Never let a detected signal skip the human review-before-send gate** — the entire value of this stage's automation is surfacing signals faster, not removing the judgment about what to do with them.
- **Give every closed deal, won or lost, a defined automated next step** — a deal that just stops moving after the stage change is a bigger data-quality and follow-through risk than the closing conversation itself.

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods referenced above: [methods.md](methods.md)
- Tools referenced above: [tools.md](tools.md)
- Shared tracking/cadence with: [33 Proposal Creation](../33 Proposal Creation/README.md), [24 Follow Up Systems](../24 Follow Up Systems/README.md)
- Routes into: [36 Contract and Legal](../36 Contract and Legal/README.md)
