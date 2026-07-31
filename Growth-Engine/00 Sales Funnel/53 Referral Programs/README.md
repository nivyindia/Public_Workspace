# 53 Referral Programs

> **Stage 53 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7, Session 9).

---

## Navigation

- ⬅ Previous stage: [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md)
- ➡ Next stage: [54 Advocacy](../54 Advocacy/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Build and run a formal referral program — structure, incentives, tracking, and a scheduled ask — that turns satisfied clients (identified in Stage 51) into a repeatable, low-cost acquisition channel instead of relying on referrals happening only by accident.

**Purpose:** Referrals are consistently the highest-converting lead source in B2B — a warm introduction from a trusted peer carries credibility no cold outreach channel (Stages 16-20) can replicate. But without a formal program with clear incentives and a defined ask process, referrals happen sporadically and go untracked, meaning the business can't tell how big this channel really is or intentionally grow it. This stage exists to turn word-of-mouth into a structured, trackable acquisition channel.

**Inputs:**
- Promoter accounts flagged by Stage 51 (NPS)
- Program structure decisions: commission/incentive rates, tiers, payout rules
- A tracking platform or built-in tracking mechanism

**Outputs:**
- A documented referral program structure with clear incentive terms
- Referral tracking links/codes per client
- Referred leads entering the funnel at Stage 07 (Contact Discovery) or directly to Stage 25/28 depending on how warm the introduction is
- Referral-channel revenue attribution reporting

**Expected Result:** A steady, trackable stream of warm-introduction leads that convert at a meaningfully higher rate than cold outreach, with clients actively incentivized to refer rather than doing so only when they happen to think of it.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **53A** Program Structure Design | Commission rates, tiers, payout rules — what a referrer actually gets |
| **53B** Platform Setup | Referral/affiliate tracking platform or built-in CRM tracking |
| **53C** Referral Ask Timing | Tied to Stage 51's promoter flagging and natural milestone moments |
| **53D** Referral Landing Page & Materials | Where a referrer sends their contact, tracking link generation |
| **53E** Referred-Lead Fast-Track | How a referred lead enters the funnel — often warmer than cold, may skip early stages |
| **53F** Payout & Reporting | Tracking referrals, conversions, and payouts; revenue attribution |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for referral/affiliate tracking tools.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting the referral-ask message personalized to a specific promoter client's context
- Drafting onboarding/launch email copy for the referral program itself

**Prompt examples:**
```
"Draft a referral-ask message for [client name], a promoter (NPS [score])
who works in [industry]. Reference their specific positive feedback:
[paste feedback]."
```

**Agent workflows:** The referral-ask trigger can fire automatically off a Stage 51 promoter flag, and tracking-link generation/reporting can run fully automated via the chosen platform, but the initial program structure design and any payout decisions should remain human-owned given the financial commitment involved.

**RAG / vector database considerations:** Not required at this stage's scale.

**LLM recommendations:** Standard current-generation models are sufficient for drafting ask messages and program materials.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Referral tracking fields (mandatory)
`Referrer Account ID` · `Referral Tracking Code` · `Referred Contact ID` · `Referral Date` · `Status` (Introduced/Contacted/Qualified/Closed Won/Closed Lost) · `Payout Amount` · `Payout Status`

### JSON schema
```json
{
  "referrer_account_id": "string",
  "referral_tracking_code": "string",
  "referred_contact_id": "string",
  "referral_date": "ISO 8601 date",
  "status": "introduced|contacted|qualified|closed_won|closed_lost",
  "payout_amount": 0.0,
  "payout_status": "pending|paid|not_applicable"
}
```

### Validation rules
- Every referred contact must be tagged with the referring account's tracking code so attribution is never lost
- Payout only triggers on `closed_won` status per the program's defined commission structure
- Program commission/incentive rates must be documented and consistent, not negotiated ad hoc per referrer

### Naming conventions
- Tracking codes are unique per referrer account, generated at program enrollment, not reused across clients

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Every referred lead correctly attributed to its referrer via tracking code
- [ ] Payouts processed accurately per the documented commission structure
- [ ] Referral asks made to genuinely satisfied (promoter) clients, not blanket-sent regardless of satisfaction

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Referrers enrolled in first 30 days (per new program launch) | Track and trend | Per internal source SOP's KPI framing for this type of program |
| Referral leads generated in first 60 days | Track and trend | Per internal source SOP |
| Referred-lead conversion rate | Track and trend, expect higher than cold-outreach baseline | Referrals typically convert meaningfully better than cold channels |
| Revenue attributed to the referral channel | Track and trend | Validates program ROI against payout costs |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md)
- **Next stage:** [54 Advocacy](../54 Advocacy/README.md)
- **Depends on:** [51 Customer Feedback and NPS](../51 Customer Feedback and NPS/README.md)
- **Feeds:** [07 Contact Discovery](../07 Contact Discovery/README.md) (referred leads re-entering the funnel)

> **Source note:** Built from the internal "Affiliate & Referral Program Setup" doc in this repo's Growth Engine folder — note this internal doc primarily describes a *client-facing service package* Nivy sells to its own clients (helping them build referral programs), not Nivy's own internal referral program. This stage adapts that doc's structure (program design, platform setup, tracking, launch sequence, KPIs) to Nivy's own client-referral context, since the underlying mechanics are the same regardless of who the program is built for.

[⬅ Back to README](README.md)
