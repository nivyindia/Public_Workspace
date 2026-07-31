# 40 Client Onboarding

> **Stage 40 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7).

---

## Navigation

- ⬅ Previous stage: [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
- ➡ Next stage: [41 Kickoff and Expectation Setting](../41 Kickoff and Expectation Setting/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Convert a paid, signed client into a fully onboarded account — questionnaire complete, required access and assets collected, client portal live, and internal team briefed — within 24-48 hours of payment, so delivery can begin on complete information rather than partial guesswork.

**Purpose:** The first 48 hours after signing determine the client's confidence in their decision. A fast, professional, well-organized onboarding eliminates buyer's remorse and sets up everything downstream (Stage 41 kickoff, Stage 42 delivery setup) to run smoothly; a slow or disorganized onboarding creates doubt right when the relationship is most fragile, and starting delivery work without complete access or information routinely causes rework later.

**Inputs:**
- Signed contract and confirmed payment (Stage 36/39)
- Client billing/contact details already on file from the sales process

**Outputs:**
- Completed onboarding questionnaire with business context, goals, and key contacts
- All required platform/account access collected and securely stored
- Brand assets and past-work materials collected
- Client portal (Notion or equivalent) and asset folder structure live
- Internal team briefed and account manager/team assigned
- Day 7 client satisfaction check completed

**Expected Result:** A client who feels immediately taken care of, a delivery team with everything it needs to start on time, and zero delivery delays caused by missing access or information.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **40A** Onboarding Trigger | Contract signed + payment confirmed fires the onboarding process automatically |
| **40B** Welcome Sequence | Instant welcome email + personal WhatsApp message from the assigned account manager |
| **40C** Onboarding Questionnaire | Structured form collecting business basics, service-specific detail, and key contacts |
| **40D** Business Information Collection | Products/services, target customers, competitors, current marketing setup |
| **40E** Access Collection | Platform/account access (analytics, ad accounts, CMS, social) relevant to the service purchased |
| **40F** Asset Collection | Logo, brand guidelines, past work/testimonials, past performance reports |
| **40G** Client Portal & Workspace Setup | Notion portal and Google Drive folder structure created |
| **40H** Internal Team Briefing | Account manager and delivery team assigned and briefed before the client's first question |
| **40I** Day 7 Satisfaction Check | Early CSAT pulse to catch any dissatisfaction before it compounds |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for onboarding/portal/automation tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Personalizing the welcome email body from client name, company, service, and country while keeping it fast to generate at scale
- Drafting a 1-page internal team brief from the questionnaire answers so the delivery team has context without reading a raw form dump
- Detecting gaps in a submitted questionnaire (missing assets, incomplete access) and generating the specific follow-up message needed to close them

**Prompt examples:**
```
"Here are this client's onboarding questionnaire answers: [paste]. Write a
1-page internal team brief covering: business context, primary goal, key
challenge, and anything the delivery team should know before starting.
Flag any fields that are missing or incomplete."
```

**Agent workflows:** An agent can own the entire mechanical sequence — trigger detection, welcome sequence send, portal/folder creation, questionnaire dispatch and reminder, team notification — end to end. The account manager's personal welcome message and the eventual kickoff call (Stage 41) remain human touchpoints specifically because they're where the relationship is actually built.

**RAG / vector database considerations:** Not required at this stage's scale; questionnaire answers are structured form data, not unstructured knowledge requiring retrieval.

**LLM recommendations:** Any current-generation model is sufficient for welcome-email personalization and brief generation; this task does not require frontier reasoning capability.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Onboarding record fields (mandatory)
`Client ID` · `Contract Signed Date` · `Payment Confirmed Date` · `Questionnaire Status` (Not Sent/Sent/Reminded/Complete) · `Access Collected` (checklist, per-item boolean) · `Assets Collected` (checklist, per-item boolean) · `Portal Created` (boolean) · `Account Manager Assigned` · `Team Briefed` (boolean) · `Day 7 CSAT Score`

### JSON schema
```json
{
  "client_id": "string",
  "contract_signed_date": "ISO 8601 date",
  "payment_confirmed_date": "ISO 8601 date",
  "questionnaire_status": "not_sent|sent|reminded|complete",
  "access_collected": {"analytics": false, "ad_accounts": false, "cms": false, "social": false},
  "assets_collected": {"logo": false, "brand_guide": false, "past_work": false},
  "portal_created": false,
  "account_manager": "string",
  "team_briefed": false,
  "day7_csat_score": null
}
```

### Validation rules
- Delivery work does not begin until Access Collected and Questionnaire Status = Complete — this is a hard gate, not a soft recommendation
- Onboarding is considered late if not fully complete within 48 hours of payment confirmation, and this should trigger an internal flag, not go unnoticed
- Day 7 CSAT below the defined threshold routes to immediate account-manager escalation, per the same logic used in Stage 46 (Support and Issue Resolution)

### Naming conventions
- `questionnaire_status` uses a fixed enum so onboarding-completion-rate reporting stays consistent across all clients

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Welcome sequence sent within hours of payment confirmation
- [ ] Questionnaire completed and all required access/assets collected within 48 hours
- [ ] Delivery work never starts on incomplete access or information
- [ ] Day 7 CSAT check sent and any low score escalated immediately

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Onboarding form completion rate | > 95% within 48 hours | Per Stage 7 Onboarding Engine benchmark |
| Time to fully onboarded (access + questionnaire complete) | < 48 hours from payment | Standard company policy |
| Day 7 CSAT score | > 8.5/10 | Early warning signal for retention risk |
| Welcome email/WhatsApp sent within 2 hours | 100% | First-impression SLA |
| Time to first deliverable | < 7 days from payment | Validates the client's decision to hire fast |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
- **Next stage:** [41 Kickoff and Expectation Setting](../41 Kickoff and Expectation Setting/README.md)
- **Depends on:** [36 Contract and Legal](../36 Contract and Legal/README.md), [39 Payment and Invoicing](../39 Payment and Invoicing/README.md)
- **Feeds:** [41 Kickoff and Expectation Setting](../41 Kickoff and Expectation Setting/README.md), [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)

> **Source note:** This stage combines three internal documents describing the same process at different levels of detail — 10. Client Onboarding System (simple checklist version), the Client Onboarding Kit — Template (client-facing packaged version), and Stage 7 — Onboarding Engine (fully automated systems version with n8n workflow code), cross-checked against the simpler Phase 15 — Client Onboarding doc. All agree on the core sequence and the 24-48 hour timing discipline; specific SLA hours and tool names should be verified against current company policy.

[⬅ Back to README](README.md)
