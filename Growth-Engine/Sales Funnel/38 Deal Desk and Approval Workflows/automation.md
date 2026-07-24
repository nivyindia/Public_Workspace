# Automation — 38 Deal Desk and Approval Workflows

> Part of Stage 38 (Deal Desk and Approval Workflows). See [README.md](README.md) for the stage overview.

For each sub-stage below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Deviation Identification & Request Submission (38A–38B)

| Level | Workflow |
|---|---|
| **Manual** | Rep recognizes the ask is outside standard terms and types up the request from memory into a Slack message to the AM/founder. |
| **Semi-automated** | Rep fills out a structured CRM field/form (per [templates.md](templates.md#deal-desk-request-template)); the deal value and standard-term fields auto-populate from the CRM deal record so the rep only enters the deviation and reason. |
| **Fully automated** | A CRM workflow (HubSpot workflow / n8n) triggers on a "Deal Desk Request" form submission, pulls the linked deal's standard pricing (Stage 34) and standard payment terms (Stage 39) automatically, and creates a timestamped request record without any manual data entry beyond the deviation itself. |
| **AI-assisted** | An LLM step reads the rep's free-text "reason" field and the deal's CRM history, then drafts a one-line context summary ("3rd discount request this quarter from this rep; prospect is a 40-person target-ICP account") so the approver isn't starting cold. |

**Required:** CRM form/field (HubSpot custom object or equivalent) · n8n or native CRM workflow for auto-population · optional LLM step for context summarization.
**Expected output:** a complete, timestamped Deal-Desk Request record with standard terms, requested deviation, deal value under both scenarios, and rep-supplied reason.
**Common errors:** rep submits without the "deal value under requested terms" field filled in, forcing the approver to calculate it (recovery: make that field a required, auto-calculated field, not free text); vague reason field ("client asked") that gives the approver nothing to evaluate (recovery: make reason a short dropdown — competitive pressure / cash-flow / strategic account / other — with a required free-text elaboration).

---

## 2. Tiered Routing (38C)

| Level | Workflow |
|---|---|
| **Manual** | Rep decides for themselves who to ping based on how big the ask feels. |
| **Semi-automated** | Rep picks a tier from a dropdown informed by the [Approval Tier Table](templates.md#approval-tier-table), and the CRM notifies the AM/founder accordingly; no verification the rep picked the right tier. |
| **Fully automated** | A rules engine (n8n/CRM workflow) reads the discount %, payment-term deviation, or scope-change type directly off the submitted request and classifies it against the Tier Table programmatically — the rep never chooses a tier, the system does. |
| **AI-assisted** | For ambiguous cases that don't map cleanly onto the Tier Table (e.g., a combined scope + timeline deviation), an LLM step flags "this request spans two tier categories — routing to the higher tier (Tier 3) by default" rather than silently under-routing it. |

**Required:** n8n or CRM native workflow with conditional logic mapped to [templates.md](templates.md#approval-tier-table) · Slack/Telegram/WhatsApp API for the routed notification.
**Expected output:** every request lands with exactly one correctly-tiered approver notified — never zero, never the wrong tier.
**Common errors:** a request that spans two deviation types (discount + payment terms) getting auto-routed on only the first-matched rule and under-classified (recovery: rule engine should evaluate all deviation types present and route to the *highest* tier triggered, not the first); stale tier thresholds after a pricing policy change (recovery: version the Tier Table and re-point the rule engine explicitly when it's updated, don't let the automation silently keep using old numbers).

---

## 3. Approver Review, Decision & Logging (38D–38E)

| Level | Workflow |
|---|---|
| **Manual** | Approver reads the request wherever it landed (email/Slack DM), thinks it over, and replies with a decision in the same thread — no structured record. |
| **Semi-automated** | Approver responds via a structured Slack/Telegram button (Approve / Reject / Modify) attached to the notification; the reply is captured but still requires someone to manually copy the decision into the CRM deal record. |
| **Fully automated** | Approver's button response writes directly back to the CRM deal record via the messaging platform's webhook → n8n → CRM API, with no manual copy step — approve/reject/modify, approver name, and timestamp all logged automatically. |
| **AI-assisted** | For "Approved with modification," an LLM step parses the approver's free-text modification note into structured fields (e.g., "15% instead of 20%, standard payment terms unchanged") so the modified terms are usable downstream in Stage 33/36 rather than sitting as an unstructured comment. |

**Required:** Slack/Telegram interactive buttons or CRM native approval workflow · webhook → n8n → CRM API write-back · optional LLM parsing step for modification notes.
**Expected output:** a decision record (approve/reject/modify), approver identity, timestamp, and — if modified — structured modified terms, all attached to the CRM deal record.
**Common errors:** approver replies in a side channel (DM instead of the structured thread) and the decision never reaches the CRM (recovery: the notification message itself should be the only place a decision can be recorded — structurally prevent side-channel replies from counting); an approval with modification logged as a plain "Approved" with the modification buried in a comment nobody reads before Stage 33/36 acts on it (recovery: modified terms must populate a distinct structured field, not a free-text comment, so downstream automation can't miss it).

---

## 4. Terms Reconciliation & Audit (38F–38G)

| Level | Workflow |
|---|---|
| **Manual** | Whoever owns the proposal or contract remembers to go back and manually edit it to match the approved deviation. |
| **Semi-automated** | The approved/modified terms populate a CRM field, and the rep is prompted (task/reminder) to update the proposal (Stage 33) or contract (Stage 36) — but the actual document edit is still manual. |
| **Fully automated** | Approved terms write directly into the proposal/contract generation template's variable fields via API, so the regenerated document reflects the exact approved deviation with no manual re-typing — the human only reviews before sending. |
| **AI-assisted** | An LLM step compares the final sent proposal/contract text against the logged approval record and flags any mismatch (e.g., document still shows the standard 10% discount cap when 15% was approved) before it goes to the prospect — a last-line-of-defense check, not the approval itself. |

**Required:** API connection between the Deal Desk record and the proposal/contract generation tool (Stage 33/36) · optional LLM verification step.
**Expected output:** every proposal/contract that had an approved deviation reflects that deviation exactly, verifiably, with zero silent drift back to standard terms.
**Common errors:** proposal regenerated from a stale template that reverts to standard pricing, silently undoing an approved discount (recovery: the reconciliation check above should run every time, not just be assumed); audit sampling never actually scheduled, so terms-vs-approval drift goes undetected for months (recovery: put the periodic sample-audit (38G) on a recurring calendar trigger, not "whenever someone remembers").

---

## Cross-Stage Automation Note

The Deal Desk request record (38B) and its resulting decision (38E) are the single source of truth that Stage 33 (Proposal Creation) and Stage 36 (Contract and Legal) must read from when a deal has any non-standard terms — never re-derive "what was approved" from a Slack thread or memory. Building this link once, at the CRM-field level, is what makes 38F reliable.

## Recovery Principles (General)

- **No decision is valid unless it lives in the CRM deal record** — a verbal or DM approval that never gets logged did not happen, as far as downstream automation (38F) is concerned. Treat "logged" as the actual definition of "approved."
- **Route on the worst-case tier when a request is ambiguous or spans categories** — under-routing a deviation to a lower approval tier is the single highest-risk failure mode in this stage.
- **Audit on a schedule, not on memory** — 38G exists specifically because manual "the process worked, probably" review doesn't catch drift; automate the sampling trigger even if the review itself stays human.

---

## Cross-References

- Stage README: [README.md](README.md)
- Sub-stages referenced above: [README.md § 2](README.md#2-complete-sub-stages)
- Approval Tier Table & templates: [templates.md](templates.md)
- Tools referenced above: [tools.md](tools.md)
- Feeds into: [33 Proposal Creation](../33 Proposal Creation/README.md) · [36 Contract and Legal](../36 Contract and Legal/README.md)
- Previous stage: [37 Closing Techniques](../37 Closing Techniques/README.md)
- Next stage: [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
