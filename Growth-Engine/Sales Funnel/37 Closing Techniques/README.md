# 37 Closing Techniques

> **Stage 37 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 6, Session 9). Batch 6 (Stages 28-37, 90 files) is now complete.

---

## Navigation

- ⬅ Previous stage: [36 Contract and Legal](../36 Contract and Legal/README.md)
- ➡ Next stage: [38 Deal Desk and Approval Workflows](../38 Deal Desk and Approval Workflows/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Recognize genuine buying signals on a sent, tracked proposal and execute a clear, consultative close — moving a signed "yes" into contract (Stage 36) without delay, and routing anything that doesn't close to nurture rather than being force-closed or abandoned.

**Purpose:** A proposal can be sent, tracked, and followed up on schedule and still stall if no one is watching for the moment a prospect is actually ready — or, in the opposite failure mode, a rep pushes too hard with artificial urgency and damages trust. This stage exists to formalize signal recognition and a single, honest CTA discipline so closing is deliberate rather than either neglected or forced.

**Inputs:**
- Sent proposal with tracking (Stage 33) and standard follow-up cadence
- Consultative response tone established in negotiation (Stage 35)

**Outputs:**
- A signed deal handed immediately to contract (Stage 36), or
- A deal routed to 90-day nurture (Stage 24) after the full cadence completes without a close

**Expected Result:** Buying signals are noticed and acted on promptly with a low-pressure nudge; CTAs stay clear and singular; no deal is either pressured into a false close or left to go stale after real interest was shown.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **37A** Recognizing Buying Signals | Re-opened proposal, direct start-date question, internal forwarding |
| **37B** Standard Closing CTA | The single, clear "sign below / reply / book a call" ask with honest validity window |
| **37C** Buying-Signal-Triggered Nudge | Low-pressure, signal-specific follow-up when a genuine signal is observed |
| **37D** Outcome Routing | Signed → contract (Stage 36); unresponsive after full cadence → 90-day nurture (Stage 24) |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting a short, signal-specific nudge message once a genuine buying signal is observed (see [templates.md](templates.md))
- Classifying whether a tracked proposal-tool event (re-open, forward) constitutes a genuine buying signal worth acting on

**Prompt examples:**
```
"The proposal was re-opened after 6 days of no activity, no reply
received. Draft a short, low-pressure nudge referencing this signal,
using the tone from templates.md — no artificial urgency."
```

**Agent workflows:** An agent can monitor proposal-tracking events and draft signal-triggered nudges, but sending remains a human decision — closing communication carries real relationship weight and should not be sent unreviewed.

**RAG / vector database considerations:** Not required at this scale.

**LLM recommendations:** Standard current-generation models are sufficient for nudge drafting; signal classification benefits from human confirmation given the judgment involved.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Close-attempt record fields (mandatory)
`Opportunity ID` · `Signal Observed` (Re-opened/Start-Date Question/Forwarded/None) · `Nudge Sent` (Y/N) · `Outcome` (Signed/Declined/Nurture) · `Outcome Date`

### JSON schema
```json
{
  "opportunity_id": "string",
  "signal_observed": "reopened|start_date_question|forwarded|none",
  "nudge_sent": false,
  "outcome": "signed|declined|nurture",
  "outcome_date": "ISO 8601 date"
}
```

### Validation rules
- `outcome: signed` hands off immediately to Stage 36 (Contract and Legal) — no delay logged between signal and contract send
- `outcome: nurture` requires the standard follow-up cadence (Stage 24/33) to have completed first, not triggered early
- Nudge messages must avoid fabricated urgency language (see [checklists.md](checklists.md))

### Naming conventions
- `signal_observed` is a fixed enum so close-attempt reporting stays consistent across reps

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Close attempt tied to an actual observed signal, not a fixed day-count alone
- [ ] CTA clear and singular, no fabricated urgency
- [ ] Signed deals move to contract without delay
- [ ] Unresponsive deals routed to nurture after full cadence, not abandoned or force-closed

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Signal-to-nudge response time | Same business day | Buying signals are time-sensitive |
| Nudge-to-signed conversion rate | Track and trend | Measures whether signal recognition is actually improving close rate |
| Deals routed to nurture vs. force-closed | Track — nurture should be used, not bypassed under pressure | Guards against short-term close-rate gaming that damages long-term trust |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [36 Contract and Legal](../36 Contract and Legal/README.md)
- **Next stage:** [38 Deal Desk and Approval Workflows](../38 Deal Desk and Approval Workflows/README.md)
- **Depends on:** [33 Proposal Creation](../33 Proposal Creation/README.md), [35 Negotiation](../35 Negotiation/README.md)
- **Feeds:** [36 Contract and Legal](../36 Contract and Legal/README.md), [24 Follow Up Systems](../24 Follow Up Systems/README.md) (on nurture)

> **Source note:** No dedicated internal "closing techniques" SOP exists separate from the proposal/contract sign-off process — this stage synthesizes standard consultative-closing practice onto the existing "Next Steps" CTA structure and follow-up cadence from the "Proposal & Deal Closing SOP," consistent with how earlier stages without a standalone internal doc (e.g., 12, 14, 15, 18, 20, 30-32) were handled in this build.

[⬅ Back to README](README.md)
