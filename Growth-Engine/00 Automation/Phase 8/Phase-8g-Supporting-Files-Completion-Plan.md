# Phase 8g — Supporting Files: Final Completion & Go-Live Implementation Plan
*(Sirf non-`workflow.json` files — T&C, contest rules, privacy, cookie notice, landing pages, SQL, aur ab web-compliance pages. Scope: 8a → 8f tak jo bacha tha, sab yahan close kiya gaya hai.)*

---

## 0. Method — ye plan kaise banaya

Maine 10 uploaded zips (8a, 8b, 8c, 8d, 8e, 8f, `8_4-8_7_supporting_files`, `00_Marketing`, `00_Automation`) fully extract karke:
1. Phase-8f ke apne audit table (Section 2, `PHASE-8f-README.md`) ko baseline liya — usme har engine (8.1–8.7) ke T&C/Rules/Privacy/Landing/SQL/Cookie status already ✅ mark tha.
2. Us claim ko **verify** kiya — sabhi `.md`/`.html`/`.sql` files me `grep` chala ke har `{{placeholder}}`, `REPLACE_WITH_*`, `EDIT ME` token dhoonda, taaki pata chale kya **genuinely content-complete** hai vs kya **structurally present but value-incomplete** hai.
3. Jo cheezein poore package me kahin bhi nahi milin (na kisi README me mention, na koi file) — wahi "genuinely naye gaps" hain, in-progress ✅ items se alag.

**Result: 3 category ka status hai, ek jaisa nahi maan sakte:**

| Category | Matlab | Kaun banayega |
|---|---|---|
| **A — Content-complete** | T&C/Rules/Privacy/Cookie/Landing/SQL — sab already likhe hue hain, international-level pe (6-country contest eligibility, USD ARV, CAN-SPAM/CASL/PECR/GDPR sab cover) | ✅ Kaam khatam, sirf review baaki |
| **B — Structurally-complete, value-incomplete** | File ban chuki hai, lekin usme `{{legal_entity_name}}`, `{{support_email}}` jaise placeholder hain jo **real business info** maangte hain — main invent nahi kar sakta kyunki ye real identifiable business detail hai | ⬜ Aapka kaam (Section 2) |
| **C — Genuinely missing (naye files)** | Pura Phase 8 package me kahin bhi nahi bana — web-compliance ke standard docs jo international launch ke liye zaroori hain | ✅ Maine is package me bana diya (Section 3) |

---

## 1. Category A — Content-complete inventory (verification pass)

Sabhi 7 engines cross-check kiye. Koi content gap nahi mila.

| Engine | T&C/Rules doc | Privacy | Landing page(s) | SQL | Cookie notice |
|---|---|---|---|---|---|
| 8.1 Contest | `01-Terms-and-Conditions.md` + `02-Official-Contest-Rules-nivy-top-100-2026.md` (eligibility, categories, judging criteria, prize table, ARV, dispute-resolution) | `03-Privacy-Notice-Contest-Data.md` | `04-landing-page-contest-entry.html` (patched, 8f) + `05-winner-announcement-page.html` | migrations + seed | ✅ |
| 8.2 Referral | `01-Referral-Program-Terms.md` | shared | `02-landing-page-referral.html` (patched, 8f) | ✅ | ✅ |
| 8.3 Free-Audit | `01-Free-Audit-Terms.md` | shared | `02-landing-page-free-audit.html` | ✅ | ✅ |
| 8.4 UGC | `01-UGC-Submission-Terms.md` (content license + points table) | `03-Privacy-Notice-UGC-Community-Signal-Data.md` (8f) | `02-landing-page-showcase.html` | ✅ | ✅ |
| 8.5 Community | `01-Community-Guidelines-Partner-Terms.md` | shared (8f) | `02-landing-page-founders-circle.html` | ✅ | ✅ |
| 8.6 Signal-Outreach | `01-Outbound-Compliance-Notes.md` (CAN-SPAM/CASL/PECR/Spam-Act) | shared (8f) | `02-opt-out-confirmation-page.html` | N/A (not campaign-scoped, correct) | ✅ |
| Cross-cutting | `03-Country-Specific-Legal-Notes.md` (US/UK/CA/AU/AE/IN) | — | — | activation + weekly-review SQL | `00-Cookie-and-Tracking-Notice.md` |

Contest rules/prizes international-level check: **✅ confirmed** — 6-country eligibility list, USD-denominated ARV table, no-purchase-necessary clause, region exclusions (Quebec), merit-judged (not chance-based, so no lottery-registration trigger in most markets), service-based prizes (avoids sweepstakes-bonding requirement in NY/FL/RI). Nothing to add here — koi naya prize-structure ya rules doc banane ki zaroorat nahi thi.

**Action needed on Category A: none.** Sirf periodic legal review (Section 4).

---

## 2. Category B — Value-incomplete (business info placeholders)

`{{...}}` tokens jo poore package me repeat hote hain — ye **real company info** hain, isliye main fill nahi kar sakta (fake legal entity name ya fake contact email daalna khud ek compliance risk hai). Ek hi find-replace pass se sab fix ho jaate hain:

| Placeholder | Kitni jagah | Kya daalna hai |
|---|---|---|
| `{{legal_entity_name}}` | 10 | Registered company name (jaise contest rules me already use hua "Billion Dreams United" — confirm same use karna hai ya alag) |
| `{{support_email}}` | 12 | Real support inbox |
| `{{privacy_contact_email}}` | 7 | Real DPO/privacy inbox (data-protection@... ya legal@...) |
| `{{support_whatsapp}}` | 6 | Real WhatsApp Business number |
| `{{last_updated_date}}` | 10 | Publish date jab har doc live hoga |
| `{{starts_at}}`, `{{entry_deadline}}` | 2 | Nivy Top 100 contest ki real dates |
| `{{campaign_slug}}`, `{{referral_code}}` | 2 | Runtime-injected, code se aayenge, edit nahi karni |

Plus environment-wiring placeholders (separate category, JSON/infra-level, docs me sirf reference hain):
`WEBHOOK_URL` (×38), `CONTEST_ID` (×11), `LEAD_WEBHOOK_URL` (×5), `REPLACE_WITH_HUB_INTAKE_WORKFLOW_ID` and friends — ye **8a/8b/8d ke import steps** ka hissa hain, non-JSON-supporting-files scope ke bahar (already Phase 8f Section 4 me "aapka kaam" flag kiya gaya tha).

**Recommended fix method:** ek single `find . -type f \( -name "*.md" -o -name "*.html" \) -exec sed -i 's/{{legal_entity_name}}/Actual Name Pvt Ltd/g' {} +` jaisi script, saari 6 placeholder-keys ke liye — 10 minute ka kaam ek baar real values mil jaayein.

---

## 3. Category C — Genuinely missing files (naye bana diye is package me)

Poore 10-zip package me kahin bhi ye nahi milte, lekin international public-facing landing pages + contest ke liye standard-practice hain. Maine international-level content ke saath bana diye hain (`Phase-8g-New-Supporting-Files/` folder):

| # | File | Kyun zaroori | Kaunse jurisdiction ka requirement |
|---|---|---|---|
| 1 | `00-Impressum-Legal-Notice.md` | Company identity disclosure (legal name, address, registration, authorized rep, VAT/GST) | EU/Germany-Austria "Impressum" is mandatory for any commercial site targeting EU visitors (§5 TMG-style); good-practice everywhere else too |
| 2 | `01-Website-Terms-of-Use.md` | Overall site ToU — separate from contest-specific T&C, covers IP, liability, governing law, for **all 6 landing pages combined**, not just one campaign | Generic international requirement — every commercial site needs a general ToU, contest T&C alone doesn't cover it |
| 3 | `02-Accessibility-Statement.md` | WCAG 2.1 AA conformance statement + feedback channel | US (ADA + Section 508 practice), EU (EN 301 549 / European Accessibility Act, effective **June 2025**), UK (Equality Act) |
| 4 | `03-DSAR-Request-Page.html` | Self-serve "exercise your data rights" form (access/delete/correct/portability) — referenced by every privacy notice but no actual page existed | GDPR Art. 15-20, CCPA/CPRA (California), PIPEDA (Canada) |
| 5 | `sitemap.xml` | All 6 live landing pages + 4 new legal pages listed for search engines | Not legal, but part of "web pages" launch checklist |
| 6 | `robots.txt` | Standard crawl rules + sitemap pointer | Same |

Sab files `{{legal_entity_name}}` / `{{support_email}}` / `{{privacy_contact_email}}` / `{{last_updated_date}}` conventions follow karte hain — same Category-B find-replace pass inhe bhi cover karega.

---

## 4. Build order (Phase 8g — is package ka apna sequence)

1. Agar 8a–8f abhi tak activate/deploy nahi kiye, unka order pehle follow karo (already har phase ke apne README me hai).
2. **Category B find-replace** — ek baar real business info decide karke, saari `{{...}}` keys sabhi `.md`/`.html` files me replace karo (Category A + Category C dono cover ho jaayenge isi pass me).
3. **Category C files ko wire karo:**
   - `00-Impressum-Legal-Notice.md` aur `01-Website-Terms-of-Use.md` ko footer link se sabhi 6 landing pages pe add karo (jaise Privacy Notice already linked hai).
   - `02-Accessibility-Statement.md` — footer link, sabhi pages.
   - `03-DSAR-Request-Page.html` — Privacy Notice ke "Your Rights" section se link karo; iska form-submit ek naya lightweight intake webhook chahiye (ya temporarily `mailto:{{privacy_contact_email}}` se bhi chal sakta hai launch ke liye — n8n workflow baad me).
   - `sitemap.xml` + `robots.txt` — domain root pe deploy, `sitemap.xml` ko Google Search Console / Bing Webmaster me submit karo.
4. Environment wiring (CONTEST_ID, WEBHOOK_URL, workflow IDs) — jaisa Phase 8a/8d me already documented hai, ye is package ke scope ke bahar hai.
5. **Legal review** (Section 5) — go-live se pehle.

---

## 5. Legal review checklist (jo lawyer ko dena hai — main draft nahi kar sakta)

| Item | Kyun |
|---|---|
| GDPR legitimate-interest balancing test (8.6 signal-outreach data) | Phase 8f me already flagged |
| Cookie banner ka "fraud-signal necessary" classification | Phase 8f me already flagged |
| Contest/lottery-law sign-off per country | `03-Country-Specific-Legal-Notes.md` me already flagged |
| Impressum: registration number, authorized representative name (naya, is package se) | Company-specific legal detail, main invent nahi kar sakta |
| Accessibility Statement: actual conformance testing (automated scan + manual audit) before publishing "AA conformant" claim | Statement banaya hai, lekin real testing legal/compliance team karegi |
| DSAR page: response-time SLA confirm karo (GDPR = 30 din, CCPA = 45 din) — dono already statement me likhe hain, verify actual ops capability | Ops commitment |

---

## 6. Progress tracker addition (Phase 8 master tracker, Section 9 ke aage append karo)

| # | Task | Status |
|---|---|---|
| 30 | Impressum / Legal Notice | ✅ Done (this package) |
| 31 | Website Terms of Use (site-wide) | ✅ Done (this package) |
| 32 | Accessibility Statement | ✅ Done (this package) |
| 33 | DSAR Request page | ✅ Done (this package) |
| 34 | sitemap.xml + robots.txt | ✅ Done (this package) |
| 35 | All `{{...}}` placeholders (Category A + B + C, all files) replaced with real values | ⬜ Aapka kaam |
| 36 | New pages footer-linked on all 6 live landing pages | ⬜ Aapka kaam |
| 37 | DSAR page wired to real intake (webhook or mailto interim) | ⬜ Aapka kaam |
| 38 | Legal review (Section 5, full list) | ⬜ Aapka/lawyer ka kaam |

---

## 7. Bottom line

- **Contest rules, prizes, eligibility, currency** — already international-level pe fully bane hue the (Phase 8f ne khud confirm kiya, maine independently verify kiya). Koi naya prize-structure nahi banana pada.
- **Genuine content gap jo mila** — 4 standard web-compliance documents (Impressum, site-wide ToU, Accessibility Statement, DSAR page) jo poore package me kahin nahi the, + sitemap/robots. Sab 5 is response ke saath bana diye.
- **Baaki jo "incomplete" dikhta hai** — wo content gap nahi hai, business-info placeholder hai (company name, emails, dates) jo genuinely aapki taraf se aana chahiye, fake nahi daal sakta.
