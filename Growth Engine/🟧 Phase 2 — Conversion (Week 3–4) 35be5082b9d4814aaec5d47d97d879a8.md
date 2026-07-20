# 🟧 Phase 2 — Conversion (Week 3–4)

← [Back to Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)

---

> **Week 3–4. You have leads in the CRM and calls starting. Now you convert. Goal: First 3 paying clients. Nurture sequence live. Sales process standardised. Close rate >20%.**
> 

---

## 🎯 Phase 2 Objectives

| Objective | Target | Measure |
| --- | --- | --- |
| Paying clients signed | 3+ | PandaDoc signed contracts |
| MRR generated | $3,000+ | HubSpot deal value |
| Nurture sequence live | Day 15 | Mautic active sequence |
| Discovery calls run | 5+ | [Cal.com](http://Cal.com)  • HubSpot logs |
| Close rate | >20% | Won ÷ Calls taken |
| Proposals sent | 3+ | PandaDoc dashboard |
| Retargeting ads live | Day 25 | Meta Ads Manager |

---

## 🗓️ Day-by-Day Execution

### DAY 15 — Nurture Sequence Live

**Morning (3 hrs):**

- [ ]  Create Mautic account (self-hosted or cloud) — OR use Brevo/MailerLite if Mautic is too heavy at this stage
- [ ]  Set up 3 email lists: HOT_LEADS, WARM_LEADS, COLD_LEADS
- [ ]  Load the 21-day nurture sequence (see [Email Sequences Library](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)) into your email tool
- [ ]  Set trigger: new contact added to WARM_LEADS → auto-enroll in 21-day sequence
- [ ]  Test sequence: send to yourself, check formatting, links, subject lines

**Afternoon (2 hrs):**

- [ ]  Enroll all WARM leads from Phase 1 into sequence manually
- [ ]  Log enrollment date in HubSpot custom property: `nurture_enrolled_date`
- [ ]  Set up trust score tracking in HubSpot (manual for now, automated in Phase 3):
    - Email opened → note in HubSpot (+5)
    - Link clicked → note (+10)
    - Services page visit (from Tally form) → note (+20)
    - Lead magnet downloaded → note (+25)
    - Audit requested → note (+40)

**Deliverable:** 21-day nurture sequence live. All WARM leads enrolled.

---

### DAY 16 — Discovery Call SOP

- [ ]  Write and save Discovery Call SOP in Notion with these sections:
    1. **Pre-call prep** (30 mins before)
    2. **Opening** (2 mins)
    3. **Discovery questions** (15 mins)
    4. **Pain diagnosis** (5 mins)
    5. **Solution presentation** (10 mins)
    6. **Pricing conversation** (5 mins)
    7. **Close / next step** (3 mins)
    8. **Post-call logging** (within 1 hour)
- [ ]  Build the Pre-Call AI Brief template in Notion:
    - Paste this prompt into a reusable note: *"You are a senior business development analyst. Before my call with [COMPANY], research them and prepare a brief with: (1) company overview and size, (2) likely pain points based on their industry, (3) recommended Nivy Digital package, (4) 3 anticipated objections with responses, (5) 5 discovery questions tailored to them, (6) any known competitors they may mention, (7) suggested deal structure. Company website: [URL]. Company industry: [INDUSTRY]. Contact name: [NAME]."*
    - [ ]  Run this prompt in Claude or GPT-4 before every call
    - [ ]  Save AI brief output in HubSpot contact notes
- [ ]  Write 5 core discovery questions and memorise them:
    1. What's your biggest revenue challenge right now?
    2. What have you tried before to fix this — and what happened?
    3. What does solving this problem mean for your business in the next 12 months?
    4. Who else is involved in making this decision?
    5. If we could get started next week, is there anything that would stop you?

**Deliverable:** Discovery call SOP written. Pre-call AI brief template ready.

---

### DAY 17 — PandaDoc Proposal Templates

- [ ]  Log into PandaDoc → create 3 proposal templates:

**Template 1 — Starter Package Proposal**

- Cover page with client name + Nivy Digital branding
- Section 1: What We Understood (their specific pain points from the call)
- Section 2: Our Recommended Approach
- Section 3: What's Included (Starter Package deliverables)
- Section 4: Investment (pricing with monthly/quarterly options)
- Section 5: Timeline (30-day onboarding + delivery)
- Section 6: Our Guarantee
- Section 7: Next Steps + e-signature block

**Template 2 — Growth Package Proposal** (same structure, different deliverables/pricing)

**Template 3 — Scale Package Proposal** (same structure, full service suite)

- [ ]  Add merge fields: `{{client_name}}`, `{{company_name}}`, `{{pain_point_1}}`, `{{recommended_service}}`, `{{monthly_price}}`
- [ ]  Set up e-signature block on final page
- [ ]  Test: send yourself a test proposal, sign it, confirm workflow

**Deliverable:** 3 PandaDoc proposal templates ready. E-signature live.

---

### DAY 18 — Objection Handling Prep

- [ ]  Read the full [Automated Objection Handling System](https://www.notion.so/35be5082b9d481f2ba11f8bac3bbc16d) page
- [ ]  Print or screen-save the top 10 objections with responses
- [ ]  Practice out loud: say each objection, then deliver the response. Time yourself.
- [ ]  Add to your pre-call prep: before every call, review 3 objections most likely for that client's profile
- [ ]  Write your personal "bridge" for each objection — a natural-sounding transition that fits your voice

**The 5 objections you will hear most in Phase 2:**

1. *"Your price is too high"* → Anchor to cost of inaction. Break it down per day. Ask what it costs them to NOT fix this.
2. *"I need to think about it"* → Ask: what specifically do you need to think about? Remove the hidden objection.
3. *"I need to speak to my partner/team"* → Ask: if they said yes, would you move forward? Offer to do a 3-way call.
4. *"We already have someone doing this"* → Ask: what results are they getting? Offer a free audit to show the gap.
5. *"Can you send me information first?"* → Send the proposal same day via PandaDoc. Don't let them go cold.

**Deliverable:** Objection responses memorised. Ready for first calls.

---

### DAY 19 — First Discovery Calls

- [ ]  Run all booked calls from Phase 1
- [ ]  Before each call (30 mins prior): run AI brief prompt → save output in HubSpot
- [ ]  During call: follow Discovery Call SOP exactly
- [ ]  After each call (within 1 hour): log in HubSpot:
    - Call outcome (Interested / Not Interested / Follow Up / Proposal)
    - Pain points discovered
    - Next step agreed
    - Move deal stage accordingly
- [ ]  If outcome = Interested: send PandaDoc proposal within 24 hours
- [ ]  If outcome = Not Now: enroll in WARM nurture sequence (if not already)
- [ ]  If outcome = Not Interested: invite to WhatsApp community (lost deal community invite)

**Deliverable:** First calls logged. Pipeline updated. First proposals in motion.

---

### DAY 20 — First Proposals Sent

- [ ]  For each Interested lead: customise PandaDoc proposal template
    - Replace all merge fields
    - Write a personalised 3-sentence cover note referencing their specific pain points
    - Select the right package (use AI brief recommendation as a starting point)
- [ ]  Send proposal via PandaDoc → set follow-up reminder for Day +2 (if no open) and Day +5 (if no response)
- [ ]  For large deals (Scale Package): record a personalised Loom video walking through the proposal. Send link with the proposal.
- [ ]  Update HubSpot deal stage: → Proposal Sent

**Deliverable:** First proposals sent. Loom videos recorded for large deals.

---

### DAY 21 — Follow-Up Sequence Loaded

- [ ]  For each proposal sent on Day 20: set manual follow-up tasks in HubSpot:
    - Day +2: WhatsApp or email — "Just checking you received the proposal — any questions?"
    - Day +5: Email — add a relevant case study or result
    - Day +8: Final "breakup" follow-up — create urgency, offer a quick call
- [ ]  Load post-call follow-up email template into Mautic/Brevo (for automated version in Phase 3)
- [ ]  Log all follow-up tasks in HubSpot with due dates
- [ ]  Continue enquiry method: 1 LinkedIn post + 1 Facebook Group post today
- [ ]  Continue cold email monitoring: any new HOT replies? Book calls same day.

**Deliverable:** All proposals have structured follow-up. Pipeline hygiene maintained.

---

### DAY 22–24 — Close First Clients

- [ ]  Run follow-up calls on proposals sent
- [ ]  For any Negotiation stage deals: use the 3-step negotiation framework:
    1. **Anchor high** — defend the original price first
    2. **Value stack** — add a bonus (extra report, extra month, onboarding session)
    3. **Adjust if necessary** — only discount on term, not price (offer quarterly prepay vs monthly)
- [ ]  When client says yes:
    - [ ]  Send contract via PandaDoc immediately (same session if possible)
    - [ ]  Ask for case study permission: *"Once we get you results, would you be open to being featured as a case study on our website?"*
    - [ ]  Confirm kickoff date
    - [ ]  Send WhatsApp message within 2 hours: welcome them, confirm next steps
- [ ]  Update HubSpot: → Contract Sent → Closed Won
- [ ]  For any lost deals: log reason in HubSpot. Invite to WhatsApp community.

**Deliverable:** First paying clients signed. MRR begins.

---

### DAY 25 — Retargeting Infrastructure

- [ ]  Install Meta Pixel on website (via Google Tag Manager or direct code)
- [ ]  Verify Pixel is firing: use Meta Pixel Helper Chrome extension
- [ ]  Create custom audiences in Meta Ads Manager:
    - Website visitors (all pages, last 30 days)
    - Website visitors (pricing page, last 14 days) — highest intent
    - Lead form openers who didn't submit (last 7 days)
- [ ]  Install Google Tag Manager + Google Analytics 4 (if not already)
- [ ]  Create Google Ads remarketing audience: website visitors last 30 days

**Deliverable:** Retargeting pixels live. Audiences building (need 7–14 days before ads can run).

---

### DAY 26 — Retargeting Ads Live

- [ ]  Build first Meta retargeting campaign:
    - Audience: All website visitors last 30 days
    - Ad format: Single image + short copy
    - Angle: Social proof — "X businesses trust Nivy Digital to grow their revenue"
    - CTA: Book a free audit → link to [Cal.com](http://Cal.com)
    - Budget: $5–10/day to start
- [ ]  Build second retargeting ad:
    - Audience: Pricing page visitors last 14 days
    - Angle: Urgency + guarantee — "Still thinking about it? Our results are guaranteed or we work for free."
    - CTA: Same booking link
- [ ]  Set up ad frequency cap: max 3 impressions/person/week

**Deliverable:** Retargeting ads live. Warming up audiences already captured in Phase 1.

---

### DAY 27 — Lead Magnet Landing Page

- [ ]  Build a dedicated landing page for the lead magnet created in Phase 1 (use [Carrd.co](http://Carrd.co) or Notion public page)
- [ ]  Page structure:
    - Headline: The specific result or insight they'll get
    - 3 bullet points: what's inside
    - Form: Name + Email only (Tally embed)
    - Trust signal: "Downloaded by 100+ business owners" (start at believable number)
- [ ]  Set up lead magnet auto-delivery: Tally form submit → Brevo/Mautic sends PDF via email immediately
- [ ]  Add UTM parameters to the landing page URL: `?utm_source=linkedin&utm_medium=post&utm_campaign=lead_magnet`
- [ ]  Share landing page on:
    - [ ]  LinkedIn post
    - [ ]  WhatsApp status
    - [ ]  WhatsApp community group
    - [ ]  Facebook Groups

**Deliverable:** Lead magnet funnel live. First email list signups with auto-delivery.

---

### DAY 28 — Phase 2 Review

**Check these numbers:**

- [ ]  Clients signed: target 3+
- [ ]  MRR: target $3,000+
- [ ]  Proposals sent: target 5+
- [ ]  Close rate (Proposals → Won): target >20%
- [ ]  Nurture sequence open rate: target >30%
- [ ]  Retargeting ads CTR: target >1.5%
- [ ]  Lead magnet downloads: target 20+

**If close rate <20%:** Review proposal personalisation. Are pain points specific enough? Is pricing anchored correctly?

**If no responses to proposals:** Shorten follow-up cycle to Day +1, +3, +6. Check if Loom was used for large deals.

**If nurture open rate <30%:** Rewrite subject lines. Test sender name (your first name vs company name).

---

## 🛠️ Tools to Set Up in Phase 2

| Tool | Purpose | Cost | Action |
| --- | --- | --- | --- |
| Mautic / Brevo | Email nurture sequences | Free tier | Create account Day 15 |
| PandaDoc | Proposals + e-signature | Free tier | Set up Day 17 |
| Loom | Personalised proposal videos | Free tier | Install Day 20 |
| Meta Ads Manager | Retargeting campaigns | $5–10/day budget | Set up Day 25 |
| Google Tag Manager | Pixel management | Free | Install Day 25 |
| [Carrd.co](http://Carrd.co) | Lead magnet landing page | Free | Build Day 27 |

**Total Phase 2 additional cost: ~$10–20/day (ads only)**

---

## 🔗 Navigation

**⬅️ [Phase 1 — Foundation](https://www.notion.so/35be5082b9d481f88bd3ebd6c89cad4c)** | **⚡ [Command Center](https://www.notion.so/35be5082b9d4819a9180c277db8b90cc)** | **➡️ Phase 3 — Automation**