# N8N Full-Funnel Automation — Build Plan
**Base:** `Funnel-Automation-Gap-Audit_11-8-26.md` ke 7 gaps + 54-stage coverage map
**Existing build convention (reuse hoga, naya nahi banega):** Postgres `clients_master` (single source of truth), Odoo Community (CRM/Sales/Project/Accounting via JSON-RPC), Ollama (`qwen2.5:7b`), Cal.com, Waha (WhatsApp), Documenso (e-sign), Postal (SMTP), Metabase, har module apna `workflow.json` + `README.md` (Kya karta hai → Import → Setup → Test → Known Limitations)
**Naming convention:** Existing modules 1.1–1.5 (Phase 1) aur 2.1–2.9 (Phase 2) already bane hain. Naye kaam ko **Phase 3 se aage** number diya hai, taaki existing build ke saath conflict na ho aur import order clear rahe.

---

## Design Principles (sab naye modules is par follow karenge)

1. **`clients_master` hi single lead/client record rahega** — koi bhi naya channel (SMS, cold call, outbound scrape) apna alag table nahi banayega, sirf naye columns/status-values add karega.
2. **Har naya entry point ek "Normalize & Upsert" node se guzrega** pehle `clients_master` ko touch karne se pehle — taaki duplicate leads na banein (Gap 1 ka root cause yahi tha: har source apna alag silo tha).
3. **Security-by-default** — koi bhi naya public webhook (payment, contract-accept, form) HMAC/signature check ya signed-token check ke bina nahi banega. Ye Phase 3.0 mein retrofit + har naye module mein by-default.
4. **No fabricated data** — rate cards, NPS thresholds, BANT weights jahan tumhara actual business input chahiye hoga, wahan main placeholder ke saath clearly "⚠️ INPUT NEEDED" flag karunga, fake numbers nahi bharunga.
5. **Har module standalone importable** — jaisa ab tak hai, taaki tum ek-ek karke test kar sako, pura funnel break kiye bina.

---

## Phase 3.0 — Security & Data-Integrity Patch Set (naya module nahi, EXISTING modules ke patches)

**Kyun sabse pehle:** Ye "launch-blockers" hain jo audit mein khud dev-flagged hain (Section 3, Gap 6). Inko fix karne mein naya architecture nahi chahiye — existing 8 modules mein targeted node-additions hain. Sabse kam effort, sabse zyada risk-reduction — isliye plan ka opening move.

| # | Patch | Module jisme lagega | Kya add hoga |
|---|---|---|---|
| 3.0.1 | Contract accept-link security | 2.5 Contract e-sign | `lead_id` ke saath ek signed HMAC token (`accept_token`) generate + verify node |
| 3.0.2 | Payment webhook signature verify | 2.6 Invoice/Payment | Gateway ke signature header ko verify karne wala node (fail → reject + alert, na ki silently accept) |
| 3.0.3 | Failed-payment webhook signature verify | 2.9 Renewal/Dunning | Same as 3.0.2, dunning webhook ke liye |
| 3.0.4 | 2.6 → 2.7 auto-trigger wiring | 2.6 Invoice/Payment | "Execute Workflow" node add karke 2.7 (Onboarding) ko payment-success par automatically call karna |
| 3.0.5 | `odoo_partner_id` proper linking | 2.4, 2.6, 2.7 | Generic fallback contact hatao — proposal/invoice/onboarding generate hone se pehle real Odoo `res.partner` lookup/create node |
| 3.0.6 | `renewal_date` auto-populate | 2.5 Contract e-sign (ya 2.7 Onboarding) | Contract-sign hote hi `renewal_date = contract_start + contract_term_months` calculate karke `clients_master` mein likhna |
| 3.0.7 | Metabase secure sharing | 2.8 Delivery/Reporting | Public unauthenticated link ki jagah authenticated dashboard-user ya signed/expiring link |

**Output:** Koi naya workflow.json nahi — 8 existing modules ke updated `workflow.json` + updated README "Known Limitations" section (jo fix ho gaya wo list se hat jayega).

---

## Phase 3 — Outbound Lead Ingestion Wiring (Gap 1 — sabse bada structural gap)

**Kyun ye phase 1 ke baad turant:** Audit ke mutabik baaki sab (scoring, outreach, nurture) inbound-only leads par kaam kar raha hai. Jab tak outbound `clients_master` mein nahi aata, downstream automation ka full value unlock nahi hota.

| Module | Naam | Kya karta hai | Source templates jo reuse honge |
|---|---|---|---|
| **3.1** | Outbound Lead Orchestrator | Cron/manual-trigger se apne standalone scraper templates ko sequence mein call karta hai (Google Maps → LinkedIn hiring posts → Digital Footprints), raw output ko ek common schema mein normalize karta hai | `Google_Map_Scraper.json`, `Scrape LinkedIn hiring posts...json`, `Lead Generation from Digital Footprints.json`, `Lead generation agent.json` (in sabko is orchestrator ke sub-workflows ke roop mein wire karega) |
| **3.2** | Enrichment + Dedup Gateway | Har outbound lead ko enrich karta hai (existing `Automate lead enrichment...` template ka logic reuse), phir `clients_master` mein email/phone/domain-fuzzy-match se check karta hai ki already exists to nahi — agar hai to merge, nahi to naya insert | `Automate lead enrichment with web scraping, GPT-4o, Airtable...json` (Airtable → Postgres port karna hoga) |
| **3.3** | Unified Lead Router | 3.2 ka output ko Module 1.4 (Inbound Form Qualification) ke same Ollama-scoring path mein feed karta hai, taaki outbound leads bhi same hot/warm/cold pipeline se guzrein — do alag scoring logic nahi banani | Reuses 1.4's Ollama node pattern |

**Naya Postgres column:** `clients_master.lead_source_channel` (values: `Inbound-Chatbot`, `Inbound-Form`, `Outbound-GoogleMaps`, `Outbound-LinkedIn`, `Outbound-DigitalFootprint`) — abhi ye column missing hai, isliye reporting mein channel-wise attribution possible hi nahi hai.

**Stages cover honge:** 06 (Lead Extraction), 07-10 (Contact Discovery, Enrichment, Cleaning, Verification), 12 (Segmentation ka base data)

---

## Phase 4 — Missing Channels + Unified Reply Tracking (Gap 2 + Gap 3)

| Module | Naam | Kya karta hai |
|---|---|---|
| **4.1** | SMS Outreach | Booking-confirmation (Cal.com se trigger), reminder (24hr/1hr before), aur re-engagement SMS — Twilio/SMS-gateway node. Module 2.3 (Booking Sync) se hook lagega jaisa KB automation.md already expect karta hai |
| **4.2** | Cold Calling Orchestration | Standalone VoiceAgent/call-logger template ko wire karta hai: DNC-list filter → call-list prep from `clients_master` → dialer trigger → call outcome webhook → `clients_master` update |
| **4.3** | Unified Reply/Inbox Tracker | Waha (WhatsApp) inbound webhook + LinkedIn reply-check (polling, since LinkedIn API restricted) ko add karta hai Module 2.1's email-only (Postal) reply tracking ke saath — ek common `last_reply_channel` + `last_reply_at` field `clients_master` mein. Module 2.2 (Nurture) ko is field ke against filter lagana hoga taaki already-replied leads dobara nurture na milein |
| **4.4** | Objection Handling Assist | Reply text ko Ollama se classify karta hai (price/timing/trust/competitor/not-interested), matching response-template library se suggest karta hai — human sales rep ko Odoo Discuss mein ek "suggested reply" milta hai, auto-send nahi karta (compliance/tone risk kam karne ke liye) |

**⚠️ Input needed:** 4.4 ke liye objection→response template library tumhare paas already kahin hai (sales playbook), ya banani padegi? Ye Phase 4 shuru karte waqt confirm karna hoga.

**Stages cover honge:** 18 (Cold Calling), 20 (SMS), 21 (Sequencing — ab true multi-channel), 24 (Follow-up fix), 25 (Reply Handling — sab channels), 26 (Objection Handling)

---

## Phase 5 — Qualification Depth + Deal Governance (Gap 4 + Gap 7 + pricing part of Gap 6)

| Module | Naam | Kya karta hai |
|---|---|---|
| **5.1** | BANT/MEDDIC Scoring Layer | Module 1.4/3.3 ke basic hot/warm/cold ke upar ek deeper layer — discovery-call notes/transcript (agar Fireflies-type template wire karein — optional) ya manual CRM-entry se Budget/Authority/Need/Timeline (ya MEDDIC fields) ko Ollama se extract + score karta hai, Odoo lead par structured fields likhta hai |
| **5.2** | Rate Card Database | `rate_card` naam ki nayi Postgres table (service-line, tier, price-range, valid-from/to) — **⚠️ INPUT NEEDED: tumhara actual pricing/rate card data.** Iske bina ye module khaali schema hi hoga |
| **5.3** | Proposal Pricing Guardrail | Module 2.4 (Proposal Generation) ka patch — ab Ollama free-text price generate nahi karega, balki 5.2 ke rate card se lookup karega aur sirf "adjust within X% range" ke liye AI use hoga. Ye Gap 6 ka sabse critical fix hai (AI-hallucinated pricing risk) |
| **5.4** | Deal Desk / Approval Gate | Jab proposal ka discount ya custom price ek threshold cross kare (5.2 rate card ke against), Odoo Discuss/email approval-request jaata hai manager ko; approval milne tak proposal client ko nahi jaata |

**Stages cover honge:** 27 (Qualification BANT/MEDDIC), 29-31 (Needs Analysis/Solution Mapping — partial, via 5.1 notes-capture), 34 (Pricing/Packaging), 38 (Deal Desk)

---

## Phase 6 — Post-Sale Growth Loop (Gap 5 — sabse bada stage-count gap: 8/8 unbuilt)

Ye phase Module 2.7 (Onboarding) ke baad ka lifecycle hai. Audit khud kehta hai "~80% deals follow-ups se aate hain" — isliye ye phase revenue-impact ke hisaab se low-priority nahi hai, sirf build-order mein baad mein isliye kyunki isse pehle wale funnel ko fix karna zaroori tha.

| Module | Naam | Kya karta hai |
|---|---|---|
| **6.1** | Account Management Dashboard Sync | Har active client ka health-snapshot (usage, tickets, last-contact) Metabase/Odoo mein rollup — cron-based |
| **6.2** | CS Planning + Adoption Tracking | Onboarding-complete ke X din baad "adoption checklist" auto-created Odoo Project mein, milestones missed hone par alert |
| **6.3** | Support/Ticketing Wiring | Standalone Slack+Linear template ko `clients_master` se jodta hai — ticket open/close `clients_master.support_ticket_count` update karta hai |
| **6.4** | Upsell/Cross-sell Trigger | Rule-based (usage threshold, tenure, adoption-score se) + Ollama-suggested next-service, sales rep ko Odoo activity ke roop mein milta hai |
| **6.5** | Churn Win-back Sequence | Module 2.9 ka "Churn Risk" tag consume karta hai — auto win-back email/WhatsApp sequence (3-touch), agar no response to sales rep escalation |
| **6.6** | NPS/Feedback Survey | Post-delivery milestone ya quarterly cron se survey trigger (Typeform/simple webhook), response `clients_master`-linked `nps_responses` table mein, detractors ko turant alert |
| **6.7** | Case Studies/Testimonials | Audit khud "trivial 2-node build" kehta hai — high-NPS client ko auto-request email, response ko draft case-study template mein populate (human review gate) |
| **6.8** | Referral Program | Unique referral-link generation per client, tracking table `referrals`, reward-trigger on converted referral |
| **6.9** | Advocacy Loop | High-NPS + referred/case-study clients ko ek "advocate" tag + curated ask-list (review, LinkedIn testimonial, speaking ref) — mostly manual-trigger with tracking |

**Naya Postgres tables:** `nps_responses`, `referrals`, `support_tickets_sync` (ya existing `clients_master` mein hi counters)

**Stages cover honge:** 43-54 (poora block)

---

## Phase 7 — Cleanup Items (chhoti cheezein jo kisi bade phase mein fit nahi hui)

| Module | Naam | Stage |
|---|---|---|
| 7.1 | Deliverability/Domain Health Monitor | Stage 23 — Postal domain health (SPF/DKIM/bounce-rate) daily check + alert |
| 7.2 | List Building/Management | Stage 14 — segmented list auto-refresh from `clients_master` filters |
| 7.3 | LinkedIn Outreach — full automation review | Stage 17 — audit ne "intentionally semi-auto (compliance risk)" bola hai; is phase mein sirf review karenge ki kya safe automation possible hai, full-auto shayad nahi karenge (LinkedIn ToS risk) |

---

## Build Order Summary

```
3.0 (Security patches — 8 existing modules)
  ↓
3.1 → 3.2 → 3.3 (Outbound ingestion wired)
  ↓
4.1, 4.2, 4.3, 4.4 (Channels + reply unification — parallel-buildable)
  ↓
5.2 (Rate card — needs your input) → 5.3 → 5.4, 5.1 (parallel-buildable)
  ↓
6.1 → 6.2/6.3 → 6.4/6.5 → 6.6 → 6.7/6.8/6.9
  ↓
7.1, 7.2, 7.3 (cleanup, anytime after 3.1)
```

**Rationale ye order kyun:** Audit ke apne "Suggested next step order" (Section 5) ko follow karta hai — outbound wiring pehle (sabse bada structural gap, sab kuch isi par depend karta hai), fir security (fast, high-risk-reduction), fir 2.6→2.7 wiring (3.0.4 mein hi cover), fir rate card, tab post-sale loop.

---

## Jo Ab Chahiye Tumse (build shuru karne se pehle)

1. **Phase 3.2 (Enrichment):** Existing enrichment template Airtable use karta hai — Postgres `clients_master` mein port karna hai, koi objection?
2. **Phase 4.1 (SMS):** Kaunsa SMS gateway — Twilio, ya koi India-specific provider (better deliverability/cost for Indian numbers)?
3. **Phase 4.2 (Cold Calling):** VoiceAgent/dialer tool already decide hai, ya wahi standalone template ka provider use karna hai?
4. **Phase 5.2 (Rate Card):** Actual pricing/rate-card data chahiye — bina iske ye module sirf empty schema banega.
5. **Phase 4.4 (Objection Handling):** Objection→response template library ready hai kahin, ya fresh banani hai?

Baaki sab modules maujooda tech-stack (Postgres/Odoo/Ollama/Waha/Cal.com/Postal) ke andar hi ban sakte hain, koi naya external decision nahi chahiye.

---

## Next Step

Bolo kis phase se shuru karein — main recommend karunga **Phase 3.0 (Security Patches)** se, kyunki:
- Sabse kam effort (patches, naye modules nahi)
- Sabse zyada risk-reduction (fraud/data-integrity gaps band)
- Existing modules ko touch karega, koi naya dependency nahi

Uske baad **Phase 3 (Outbound Ingestion)** — jo sabse bada structural gap hai.

Confirm kar do, main us phase ke actual `workflow.json` files banana shuru kar dunga, ek module ek karke, jaisa existing build ka pattern hai (workflow.json + README.md har module ke liye).
