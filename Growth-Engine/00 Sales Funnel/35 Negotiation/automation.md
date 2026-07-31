# Automation — 35 Negotiation

[⬅ Back to README](README.md)

> **Flag: 🔴 (N/A — human judgment, high stakes)** — per [N8N-AUTOMATION-INDEX.md](../N8N-AUTOMATION-INDEX.md). Automating the actual negotiated language here risks a legally or commercially binding mistake reaching a client. This file's depth is deliberately in the *logging, matching, and approval-routing* layer that surrounds the human conversation — not in pretending the conversation itself can be automated.

For each component below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Objection/Ask Categorization

| Level | Workflow |
|---|---|
| **Manual** | Rep reads the prospect's price/term pushback and decides which standard category it falls into (price, scope, hesitation, competitor comparison) purely from memory. |
| **Semi-automated** | Rep checks the raised ask against the categorized objection library ([templates.md](templates.md)) before drafting a reply. |
| **Fully automated** | Incoming reply text (from [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md)) is auto-matched by keyword/pattern to a category and the matching standard-response template is surfaced to the rep automatically — no manual library lookup. |
| **AI-assisted** | LLM classifies ambiguous or multi-part pushback (e.g., a message that mixes a price objection with a scope question) into its component categories, so the rep gets the right template(s) even when the ask doesn't match a single clean pattern. |

**Required:** the categorized objection/ask library ([templates.md](templates.md)) · a triage/classification step (reuses the pattern already built in [25 Reply Handling and Triage](../25 Reply Handling and Triage/automation.md)).
**Expected output:** every negotiation ask routed to a matched category and its standard response template, with no rep having to search a doc mid-conversation.
**Common errors:** an ask that genuinely doesn't fit any existing category (recovery: log it as "uncategorized" and route to the founder for a manual response — never force-fit a novel ask into the nearest template).

---

## 2. Personalized Response Drafting

| Level | Workflow |
|---|---|
| **Manual** | Rep writes a fresh reply to each ask from scratch. |
| **Semi-automated** | Rep copies the matched standard template and edits it by hand to fit the prospect's exact wording. |
| **Fully automated** | None — a fully automated *send* of a negotiation response is deliberately not built; every response needs a human decision to send, even when the drafting is automated (see AI-assisted row). |
| **AI-assisted** | LLM personalizes the standard scripted response to the prospect's exact wording and specific numbers, without changing the underlying policy (discount limits, term boundaries) baked into the template — draft only, never auto-sent. |

**Required:** LLM access (Claude/GPT/Ollama) with the standard-response templates as its only source of policy · a mandatory human-send gate.
**Expected output:** a ready-to-review draft that matches the prospect's specific wording while staying within pre-approved policy limits.
**Common errors:** an LLM draft that quietly loosens a stated term or discount limit while personalizing (recovery: the human review step must explicitly re-check the number/term against policy, not just the tone, before sending).

---

## 3. Discount-Request Logging & Audit Trail

| Level | Workflow |
|---|---|
| **Manual** | Rep mentions a discount request verbally or in a side chat with no structured record. |
| **Semi-automated** | Rep manually creates a CRM note after a discount is discussed. |
| **Fully automated** | Any discount request — approved or not yet approved — is logged in the CRM the moment a rep enters it, with amount, reason, and requesting rep captured automatically as a structured field (extends [34 Pricing and Packaging](../34 Pricing and Packaging/automation.md)'s threshold guardrail into the negotiation stage specifically). |
| **AI-assisted** | None — this is a logging/audit function, not a generative one; adding an LLM here would only introduce risk with no benefit. |

**Required:** CRM discount-request field (same as Stage 34) · deal-level negotiation history log.
**Expected output:** a complete, timestamped record of every discount ask raised during negotiation, independent of outcome.
**Common errors:** a verbal or chat-only approval that never makes it into the CRM (recovery: treat the CRM entry, not the approval message, as the source of truth — a Slack "yes" is not a substitute for a logged record).

---

## 4. Above-Threshold Approval Routing

| Level | Workflow |
|---|---|
| **Manual** | Rep calls or messages the founder informally and waits for a reply with no defined SLA. |
| **Semi-automated** | Rep sends a structured Slack/WhatsApp message with deal name, requested discount, and reason. |
| **Fully automated** | The moment a discount request exceeds the configured threshold, an approval request is auto-generated and routed to the named approver (Slack/WhatsApp/Telegram) with the deal context pre-filled, and the approver's yes/no response is written back to the CRM log automatically. |
| **AI-assisted** | LLM drafts a one-line justification summary of *why* the discount is being requested (deal size, competitive pressure, timing) to speed up the approver's decision — summary only, the decision itself stays human. |

**Required:** n8n (or Zapier/Make) webhook connecting the CRM discount field to a messaging channel · a named approver with a defined response SLA.
**Expected output:** every above-threshold request reaching the approver within minutes of being raised, with a logged yes/no outcome.
**Common errors:** approval requests sent to a channel the approver doesn't check promptly (recovery: route to whichever channel — Slack, WhatsApp, or a call — the approver has explicitly confirmed as fastest, and escalate automatically if no response within a defined window).

---

## What Does NOT Automate Here (and Why)

- **The negotiation conversation itself** — reading the prospect's tone, deciding how hard to hold a line, when to concede, and how to frame a counter-offer is relationship judgment that carries real commercial and (occasionally) legal weight if handled by a script or a model instead of a person.
- **Setting discount thresholds and policy** — this is a periodic founder-level decision, not a per-deal workflow.

---

## Suggested n8n / Integration Flow

`Objection/ask logged in CRM (from Stage 25 triage) → Match to standard category → Draft personalized response (LLM) → Human review → If discount requested: threshold check → (above threshold: approval request via Slack/WhatsApp → approver response → CRM log) → Agreed terms → Contract draft (Stage 36)`

## Recovery Principles (General)

- **The CRM log is the single source of truth for every discount request**, regardless of what channel the actual approval conversation happened in.
- **Never let response drafting bypass the human-send gate** — the value of AI-assisted drafting here is speed of wording, not speed of sending; sending stays a deliberate human action every time.
- **Route uncategorized asks to a person, not the nearest-fit template** — force-fitting a novel objection into the wrong script creates more cleanup than the time it saves.

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods referenced above: [methods.md](methods.md)
- Tools referenced above: [tools.md](tools.md)
- Objection/ask templates: [templates.md](templates.md)
- Feeds from: [25 Reply Handling and Triage](../25 Reply Handling and Triage/README.md), [33 Proposal Creation](../33 Proposal Creation/README.md)
- Agreed terms flow into: [36 Contract and Legal](../36 Contract and Legal/README.md)
