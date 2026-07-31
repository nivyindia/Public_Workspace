# Automation — 36 Contract and Legal

[⬅ Back to README](README.md)

> **Flag: 🟡 (partially automatable)** — per [N8N-AUTOMATION-INDEX.md](../N8N-AUTOMATION-INDEX.md): contract *drafting and terms* stay human/legal-reviewed, but signature-status tracking automates fully. Of the four Batch 6 stages (34–37), this is the most automatable — the depth below reflects that, building out the Documenso webhook → CRM status-update pattern the index already calls out.

For each component below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Contract Generation from Template

| Level | Workflow |
|---|---|
| **Manual** | Rep or founder writes the contract from scratch for every deal. |
| **Semi-automated** | Rep pulls the standard contract template and manually fills in the negotiated price/terms from [35 Negotiation](../35 Negotiation/README.md). |
| **Fully automated** | The standard template (scope, pricing, payment terms, notice period, confidentiality) is auto-populated from the CRM's negotiated-terms fields the moment a deal is marked "terms agreed" — no manual re-typing of price or scope. |
| **AI-assisted** | LLM drafts the SOW-specific deliverables/timeline section from the approved solution map ([31 Solution Mapping](../31 Solution Mapping/README.md)) and the agreed scope — draft only, reviewed before the contract is finalized. |

**Required:** a standard contract template with merge fields · read access to the CRM's negotiated-terms data · the same document-merge pipeline used in Stages 33/34.
**Expected output:** a contract draft with price, scope, and terms already correctly populated, requiring review rather than data entry.
**Common errors:** the auto-populated scope section not reflecting a last-minute negotiation change (recovery: the merge should always pull the CRM's *current* negotiated-terms value at generation time, never a value cached earlier in the deal).

---

## 2. E-Signature Routing

| Level | Workflow |
|---|---|
| **Manual** | Contract emailed as a PDF attachment for the client to print, sign, and scan back. |
| **Semi-automated** | Rep manually uploads the finished contract to an e-signature tool (DocuSign/Dropbox Sign/Documenso) and sends it. |
| **Fully automated** | Once the contract draft (§1) is reviewed and approved internally, it's routed to the e-signature tool automatically — no manual upload step. |
| **AI-assisted** | None appropriate — routing a document for signature is a mechanical step, not a generative one. |

**Required:** an e-signature tool with an API (DocuSign, Dropbox Sign, Documenso) · the reviewed contract draft from §1.
**Expected output:** the contract in the client's inbox for signature within minutes of internal approval, with no manual send step.
**Common errors:** sending an unreviewed draft because the internal-approval gate was skipped (recovery: the routing step should require an explicit "approved" flag from the internal reviewer, not fire automatically the moment the draft exists).

---

## 3. Signed-Status Webhook → CRM Stage Update

| Level | Workflow |
|---|---|
| **Manual** | Rep checks the e-signature tool periodically and manually updates the CRM once they notice a contract is signed. |
| **Semi-automated** | Rep receives an email notification from the e-signature tool and manually updates the CRM deal stage. |
| **Fully automated** | The e-signature tool's signed/unsigned status webhook (Documenso's webhook, or DocuSign/Dropbox Sign's equivalent) fires into n8n the moment a contract is signed, which updates the CRM deal stage to Closed Won automatically — this is the specific pattern flagged in the automation index, built out here to real depth rather than left as a conceptual description. |
| **AI-assisted** | None — this is a status-sync function; there's nothing here for a model to generate. |

**Required:** Documenso (OSS) or DocuSign/Dropbox Sign webhook access · n8n (or Zapier/Make) as the orchestration layer · CRM API write access.
**Expected output:** CRM deal stage reflecting Closed Won within moments of the actual signature event, with zero manual status-checking.
**Common errors:** a webhook silently failing to fire (recovery: add a daily reconciliation check — n8n polls the e-signature tool's signed-documents list once a day and flags any signed contract whose CRM stage wasn't updated, catching a missed webhook rather than assuming the automation is working); duplicate webhook firings creating duplicate CRM updates (recovery: make the CRM update idempotent — check current stage before writing, don't blindly overwrite).

---

## 4. Post-Signature Trigger Chain

| Level | Workflow |
|---|---|
| **Manual** | Rep manually notifies finance to send an invoice and manually notifies the delivery team to start onboarding. |
| **Semi-automated** | Rep updates a shared tracker that finance and delivery check periodically. |
| **Fully automated** | The same signed-status webhook from §3 triggers both the invoice/payment-link send ([39 Payment and Invoicing](../39 Payment and Invoicing/README.md)) and the onboarding kickoff ([40 Client Onboarding](../40 Client Onboarding/README.md)) in parallel, from a single signature event — no separate manual handoff to either team. |
| **AI-assisted** | None — this is a trigger-fanout step, not a generative one. |

**Required:** the same n8n webhook flow from §3, extended with two additional branches (invoice send, onboarding trigger) · Stage 39/40's own systems as the receiving end.
**Expected output:** finance and delivery both notified and starting their respective workflows within the same automation run that updated the CRM, with no coordination lag between teams.
**Common errors:** the invoice branch firing before the onboarding branch (or vice versa) in a way that confuses the client if they receive one before the other (recovery: sequence or batch the two notifications so the client experience feels coordinated, not fragmented).

---

## What Does NOT Automate Here (and Why)

- **Legal review of any non-standard clause, custom Enterprise-tier term, or client-requested redline.** A contract's actual legal terms carry real liability — an LLM or workflow tool approving a redline is exactly the kind of risk the automation index's 🔴/🟡 framing exists to prevent.

---

## Suggested n8n / Integration Flow

`Negotiation agreed (Stage 35) → Contract template auto-populated from CRM terms → Internal review + approval flag → E-signature tool (Documenso/DocuSign, auto-routed) → Signed webhook → n8n → [CRM stage: Closed Won] + [Invoice send trigger: Stage 39] + [Onboarding trigger: Stage 40] (parallel) → Daily reconciliation check for any missed webhook`

## Recovery Principles (General)

- **Trust the webhook, but verify daily.** A signature webhook that silently fails is the single biggest risk in this stage — a daily reconciliation poll against the e-signature tool's own signed-documents list catches what the webhook missed.
- **Never auto-fire an e-signature send without an explicit internal-approval flag** — the mechanical send should be fast, but it should never bypass the human review the draft still needs.
- **Keep the CRM update idempotent** so a duplicate webhook firing doesn't create confusing duplicate state changes.

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods referenced above: [methods.md](methods.md)
- Tools referenced above: [tools.md](tools.md)
- Negotiated terms sourced from: [35 Negotiation](../35 Negotiation/README.md)
- Triggers on signature: [39 Payment and Invoicing](../39 Payment and Invoicing/README.md), [40 Client Onboarding](../40 Client Onboarding/README.md)
