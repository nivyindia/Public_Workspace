# 03 Buyer Persona

> **Stage 3 of 54** in the International B2B Sales Funnel Knowledge Base.
> Status: ✅ **Populated to pilot depth** (Batch 1, Session 3).

---

## Navigation

- ⬅ Previous stage: [02 ICP Definition](../02 ICP Definition/README.md)
- ➡ Next stage: [04 Competitor Research](../04 Competitor Research/README.md)
- 🏠 [Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Add the individual-human layer — demographics, media habits, tone, day-in-the-life context — on top of each firmographic ICP (Stage 02) so copy, content, and sales conversation can speak to a specific person rather than a generic "target market."

**Purpose:** ICP answers *which companies and roles* to target. Persona answers *how to talk to the human in that role* — what they read, where they spend time online, what tone lands, what a normal day looks like for them. Outreach copy (Stage 22) and content built directly from an ICP alone tends to read as generic corporate messaging; copy built from a persona reads as written by someone who understands the reader.

**Inputs:**
- Finalized ICP profile cards from Stage 02 (role, size, geography, pain points, goals, budget)
- Any available demographic/behavioral signal from existing clients (age range, tools used, media consumed) — often already partially captured in the ICP document itself
- Direct buyer interviews where available

**Outputs:**
- One persona narrative per active ICP: name, age range, daily context, tech/tool stack, media habits (podcasts, communities, publications), tone preferences, and a "day in the life" paragraph
- A messaging/tone guide per persona for content and copywriting teams

**Expected Result:** Every content and outreach asset can be written "for [Persona Name]" instead of "for our target market," producing more specific, less generic messaging.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **3A** Persona Naming & Framing | Give each ICP a memorable persona name/label to anchor team communication |
| **3B** Demographic Layer | Age range, typical career stage, household/work context relevant to buying behavior |
| **3C** Tech & Tool Stack Mapping | What software/platforms the persona already uses daily (signals both messaging references and integration expectations) |
| **3D** Media & Community Habits | What they read, watch, and listen to (podcasts, newsletters, communities) — informs where content should be placed and referenced |
| **3E** Tone & Communication Style | How the persona prefers to be communicated with (formal vs. casual, data-heavy vs. story-driven) |
| **3F** Day-in-the-Life Narrative | A short narrative capturing a representative day, surfacing when/where the pain point actually bites |
| **3G** Objection & Skepticism Mapping | What this specific persona is likely to be skeptical about or push back on (distinct from generic ICP objections — feeds Stage 26) |
| **3H** Persona Validation | Sense-check the draft persona against real client conversations/interviews before finalizing |

---

## 3. Complete Methods

Full breakdown of persona-derivation methods is in **[methods.md](methods.md)**.

---

## 4. Complete Website Library

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 5. Complete Tool Library

See [tools.md](tools.md).

---

## 6. Automation

See [automation.md](automation.md).

---

## 7. AI Section

**How AI can help:**
- Expanding a firmographic ICP card into a full persona narrative (demographics, media habits, day-in-the-life) as a first draft for human review and correction
- Drafting tone/style guides per persona for the copywriting team to reference (Stage 22)
- Generating persona-specific objection lists by simulating "what would this specific person be skeptical about" rather than generic sales objections

**Prompt examples:**
```
"Using this ICP profile [paste Stage 02 ICP card], draft a buyer persona
narrative: a plausible first name, age range, a realistic 'day in the life'
paragraph showing where their top pain point actually shows up during the
day, likely tech stack, and 3 podcasts/newsletters/communities this type
of person would realistically follow. Do not invent specific real people,
companies, or publications you're not confident exist — flag anything
you're unsure of."
```
```
"Given this persona [paste], list 5 objections or sources of skepticism
specific to how this person thinks, distinct from generic pricing
objections — e.g. 'has been burned by an unreliable freelancer before.'"
```

**Agent workflows:** An agent can take a finalized ICP → draft the persona narrative → flag any claim about specific real publications/communities for a human fact-check before publishing (to avoid citing a real named community inaccurately).

**RAG / vector database considerations:** Not essential at 3-5 personas; becomes useful once personas multiply across many verticals and copywriters need quick retrieval of "what tone does this persona expect" without re-reading the full narrative each time.

**LLM recommendations:** A capable general-purpose model is sufficient; the risk here is not reasoning depth but confident fabrication of specific real-world details (naming a podcast or community that doesn't actually exist) — always mark such details for human verification rather than presenting them as fact.

**Automation opportunities:** See [automation.md](automation.md).

---

## 8. Data Structure

### Persona Card — mandatory fields
`Persona Name` · `Linked ICP` · `Age Range` · `Tech/Tool Stack` · `Media & Community Habits` · `Tone Preference` · `Day-in-the-Life Narrative` · `Persona-Specific Objections`

### JSON schema
```json
{
  "persona_id": "string",
  "name": "string (first-name label, e.g. 'Alex the Overwhelmed Founder')",
  "linked_icp_id": "string",
  "age_range": "string",
  "tech_stack": ["string"],
  "media_habits": ["string"],
  "tone_preference": "string",
  "day_in_life": "string",
  "specific_objections": ["string"],
  "confidence": "verified|unverified-draft",
  "status": "draft|active"
}
```

### Validation rules
- Every persona must link to exactly one active ICP from Stage 02 — a persona with no ICP link is not usable downstream
- Any named real-world publication, podcast, or community referenced in a persona must be flagged and verified before the persona is marked `active` — unverified specific claims stay `unverified-draft`
- Day-in-the-life narrative should surface at least one moment where the ICP's top pain point actually occurs, not just generic biography

### Naming conventions
- Persona name is a first name + short descriptor tied to the ICP label (e.g. "Alex the Overwhelmed Founder") so it's instantly recognizable in team conversation

---

## 9. Quality Control

Full checklist in **[checklists.md](checklists.md)**. Summary gates:
- [ ] Persona links to a specific active ICP
- [ ] Day-in-the-life narrative includes the pain point moment, not just generic detail
- [ ] Any named specific real-world publication/community/tool is verified, not assumed
- [ ] Tone guide is specific enough that two different copywriters would produce similarly-toned output from it

---

## 10. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Personas defined | 1 per active ICP | Should track 1:1 with Stage 02's active ICP count |
| Persona reference rate in copy (Stage 22 QC sample) | 100% of outreach copy references a named persona | Sampled during Stage 22 QC |
| Persona refresh cadence | Every 2 quarters, alongside ICP refresh | Keep in sync with Stage 02 |

---

## 11. Templates

See [templates.md](templates.md) for the persona narrative template.

---

## 12. Resources

See [resources.md](resources.md) and [tools.md](tools.md).

---

## 13. References

See [references.md](references.md).

---

## Cross-References

- **Previous stage:** [02 ICP Definition](../02 ICP Definition/README.md) — supplies the firmographic base each persona is built on
- **Next stage:** [04 Competitor Research](../04 Competitor Research/README.md)
- **Also feeds:** [22 Personalization and Copywriting](../22 Personalization and Copywriting/README.md), [26 Objection Handling](../26 Objection Handling/README.md)
- **Automation file:** [automation.md](automation.md)
- **Templates file:** [templates.md](templates.md)

> **Source note:** This stage was populated by expanding the demographic/psychographic detail already embedded in Nivy's existing "Ideal Client Profile (ICP) — Full Document" (age ranges, tools used, podcasts followed, communication preferences per ICP) into standalone persona narratives. Any specific named publication or community carried over from that source should be re-verified as still active/relevant before use in external-facing content.
