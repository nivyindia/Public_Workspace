# 54 Advocacy

> **Stage 54 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 7, Session 9). This is the final stage of the 54-stage funnel.

---

## Navigation

- ⬅ Previous stage: [53 Referral Programs](../53 Referral Programs/README.md)
- 🔁 Feeds back to: [01 Market Research](../01 Market Research/README.md) (the funnel loop — advocates generate new-market signal and leads)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Cultivate the small set of highest-satisfaction clients (Stage 51 promoters, Stage 52 testimonial-givers, Stage 53 active referrers) into ongoing advocates — clients willing to serve as references, speak publicly about the relationship, or participate in co-marketing — closing the funnel loop by turning delivered results into the input for the next cycle of Stage 01-03 market research and positioning.

**Purpose:** Stages 51-53 each capture a specific advocacy behavior (feedback, testimonial, referral) as a one-off transaction. This stage is different: it's about nurturing an ongoing relationship with a small number of clients who are willing to actively vouch for the company over time — as a reference call for a hesitant prospect, a quoted voice in content, a co-marketing partner, or a public case study subject. This is the highest-trust, hardest-to-manufacture form of social proof, and it's also where the funnel becomes cyclical: advocate relationships and their feedback feed directly back into refining the ICP, persona, and value proposition (Stages 02-03) for the next cohort of prospects.

**Inputs:**
- Repeat promoters (Stage 51) with sustained high NPS over multiple cycles, not just a single high score
- Active referrers (Stage 53) and testimonial-givers (Stage 52)
- Ongoing account relationship context

**Outputs:**
- A small, curated advocate list with documented willingness/availability for reference calls, content participation, co-marketing
- Advocate-sourced content (quotes, interviews, joint case studies) feeding marketing and Stage 33 proposal proof points
- Advocate feedback and market insight feeding back into Stage 01-03 refinement

**Expected Result:** A durable, small group of genuine advocates who extend the company's credibility beyond what any outbound channel (Stages 16-20) or one-off testimonial (Stage 52) can achieve on its own — and whose ongoing feedback keeps the funnel's foundational research current rather than static.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **54A** Advocate Identification | Repeat promoters, active referrers, and testimonial-givers — sustained over time, not a single instance |
| **54B** Advocate Relationship Cultivation | Deliberate, ongoing relationship investment beyond standard account management |
| **54C** Reference Call Program | Willing advocates available for a hesitant prospect's reference-check request |
| **54D** Co-Marketing & Content Participation | Joint webinars, quoted interviews, guest content |
| **54E** Advocate Feedback Loop | Advocate insight and market signal feeding back into Stage 01-03 |
| **54F** Advocate Recognition | Acknowledging and thanking advocates — the relationship should feel reciprocal, not extractive |

---

## 3. Complete Methods

See [methods.md](methods.md).

---

## 4. Complete Website Library

No external website library — see [tools.md](tools.md) for advocate-relationship and content tooling.

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Drafting outreach for advocate-specific asks (reference call availability, content participation) in a tone appropriate to an established, high-trust relationship
- Synthesizing advocate feedback/market insight into a structured input for Stage 01-03 refinement

**Prompt examples:**
```
"Draft a message asking [advocate name] if they'd be open to a 15-minute
reference call with a prospect in a similar industry, referencing our
ongoing relationship."
```
```
"Here is feedback and market insight gathered from our advocate group
this quarter: [paste]. Summarize implications for our ICP and persona
definitions (Stage 02/03)."
```

**Agent workflows:** Identifying advocate candidates (sustained high NPS, repeat referrals/testimonials) can be automated as a scheduled report from Stage 51-53 data, but the relationship cultivation itself — and any specific ask (reference call, content participation) — should always be a genuine, human-led conversation given how much this stage depends on authentic trust.

**RAG / vector database considerations:** Not required at this stage's scale — this is inherently a small, curated list, not a bulk process.

**LLM recommendations:** Standard current-generation models are sufficient for drafting and synthesis support.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Advocate fields (mandatory)
`Advocate ID` · `Account ID` · `Advocacy Type` (Reference Call/Content/Co-Marketing/Multiple) · `Availability Status` · `Last Engaged Date` · `Notes`

### JSON schema
```json
{
  "advocate_id": "string",
  "account_id": "string",
  "advocacy_type": "reference_call|content|co_marketing|multiple",
  "availability_status": "available|limited|not_currently_available",
  "last_engaged_date": "ISO 8601 date",
  "notes": "string"
}
```

### Validation rules
- Advocate status requires sustained satisfaction (multiple positive NPS cycles or repeat referral/testimonial activity), not a single promoter score
- Any specific ask (reference call, content) requires the advocate's active, current consent — standing "advocate" status doesn't mean blanket pre-approval for every use
- Advocate list stays small and curated — this is not a bulk-marketing list

### Naming conventions
- `Advocacy Type` is a fixed enum so the team can quickly filter for the right kind of advocate for a specific need (e.g., a reference call vs. a content interview)

---

## 9. Quality Control

See [checklists.md](checklists.md). Summary gates:
- [ ] Advocate status based on sustained satisfaction, not a single data point
- [ ] Every specific ask has current, explicit advocate consent
- [ ] Advocate relationships actively maintained, not left dormant after initial identification

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Active advocates maintained | Track and trend | Quality over quantity — a small, genuine list outperforms a large, thin one |
| Reference-call-assisted deal conversion rate | Track and trend | Validates the value of the reference call program |
| Advocate feedback → Stage 01-03 refinement cycles completed | Track and trend | Confirms the funnel loop is actually closing, not just documented as a concept |

---

## 11. Templates

See [templates.md](templates.md).

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [53 Referral Programs](../53 Referral Programs/README.md)
- **Depends on:** [51 Customer Feedback and NPS](../51 Customer Feedback and NPS/README.md), [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md), [53 Referral Programs](../53 Referral Programs/README.md)
- **Closes the loop to:** [01 Market Research](../01 Market Research/README.md), [02 ICP Definition](../02 ICP Definition/README.md), [03 Buyer Persona](../03 Buyer Persona/README.md)

> **Source note:** No internal doc treats ongoing client advocacy as its own discrete stage separate from testimonials (Stage 52) or referrals (Stage 53); this stage was synthesized to close the 54-stage funnel loop, extending the relationship-investment philosophy already present in the internal "Customer Retention System" doc (which emphasizes relationship investment and growth conversations as part of retention) into a dedicated advocacy-cultivation stage, explicitly distinguished from the more transactional Stage 52/53 activities.

[⬅ Back to README](README.md)
