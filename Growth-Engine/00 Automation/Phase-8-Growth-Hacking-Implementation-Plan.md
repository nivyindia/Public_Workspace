# Phase 8 — Growth Hacking Implementation Plan
*(RECONCILED-star-topology-v6 ke upar banega — Hub wahi rahega, sirf naye spokes add honge)*

---

## 0. Kahan se kahan tak (recap, taaki context clear rahe)

**Jo already ban chuka hai (v6, aapke paas hai):**
- Hub-Intake + Hub-Dispatcher — 1 Hub
- Phase 0–7: **36 spokes**, sab star-topology me migrated, sab `funnel_events`/`flagged_events` se guzarte hain, koi spoke→spoke direct link nahi bacha (S7a.1 grep se confirm)
- `docs/S0-EVENT-TYPE-TAXONOMY.md` — event types ki living list
- Import order fix hai: Hub-Intake pehle → spokes kisi bhi order me → Hub-Dispatcher sabse aakhir me activate

**Ab kya banana hai (Phase 8):**
- Growth-hacking brainstorm doc (`Growth-Hacking-with-n8n.md`, ChatGPT ke saath 250+ ideas) ko **7 reusable "Growth Engines"** me consolidate karke, unhi ko is Hub ke naye spokes (8.1–8.7) ke roop me banana
- **Koi naya Hub nahi.** Same Hub-Intake, same Hub-Dispatcher — bas naye event branches add honge, jaisa Phase 6/7 ke time hua tha
- 3 engines (8.1, 8.2, 8.3) ke actual `workflow.json` already ban chuke hain — is plan me unka bhi exact status hai

---

## 1. 250+ techniques → 7 Growth Engines (mapping)

Source doc ki har lettered category (A–T, ~250 named techniques: Founder Spotlight, Country-Specific Competitions, White-label Agency Network, News-jacking, Nivy Top 100, Business Awards, etc.) is table ke hisab se 7 engines me map hoti hai. **Koi bhi naya campaign in 7 engines me se kisi ek ka hi ek "config" hoga — naya workflow nahi banana padega.**

| # | Engine | Source doc categories jo isme aati hain | Kya karta hai (generic pattern) | Status |
|---|---|---|---|---|
| **8.1** | **Reward / Contest Engine** | E. Competition & Gamification, R. Recognition, part of T's "Gamification Engine" | Entry webhook → dedupe → fraud score → human-approved winner selection → reward | ✅ **Built** (`8.1-Reward-Contest-Engine.json`, 22 nodes) |
| **8.2** | **Referral Engine** | A. Viral & Sharing, L. Customer Expansion (referral parts), T's "Referral Engine" | Unique code → track → 2-stage reward (meeting booked / converted) → payout task | ✅ **Built** (`8.2-Referral-Engine-Universal.json`, 21 nodes) |
| **8.3** | **Free-Value Engine** | B. Free Product/Service, C. Powered-By, P. Give-First-Sell-Later, part of I (free tools/audits) | Free audit / free tool / free template → deliver value → capture lead → nurture | ✅ **Built (audit sub-type only)** (`8.3-Free-Audit-Engine.json`, 11 nodes) — baaki free-value types (free toolkit, free micro-tools, free design/video/website) *isi engine ke config-driven variants honge, naya workflow nahi* |
| **8.4** | **UGC / Share Engine** | A (sharing loops), J. Content Growth Loops, Q. "Show-Off" Growth | User content submit (reel/post/screenshot proof) → AI/manual verify → points → leaderboard → referral link generate | ❌ Not built yet |
| **8.5** | **Community Engine** | D. Community-Led Growth, G/H. Partnership + Agency-to-Agency | Community/partner signup → membership tracking → event/content drip → advocacy trigger | ❌ Not built yet |
| **8.6** | **Signal-Based Outreach Engine** | I. Data & Trigger-Based Growth, F. Free Exposure, N. Reactivation, O. AI-Powered Growth | External trigger (hiring/funding/news signal, or internal reactivation trigger) → AI-scored → auto-outreach sequence | ❌ Not built yet |
| **8.7** | **Growth Dashboard / Analytics** | (cross-cutting — S/K/M: Network Effects, SEO, Review growth reporting) | Metabase/Postgres views ke upar ek rollup: kaunsa campaign/engine kitna perform kar raha hai | ❌ Not built yet |

> **Naming convention:** jaise Phase 6 me `6.1.1`, `6.2.1` sub-modules the, waise hi Phase 8 me har engine ke andar sub-variants honge: e.g. `8.4.1` UGC-reel, `8.4.2` UGC-testimonial-screenshot. Lekin ye workflow-level split nahi hai — sub-variant sirf ek **config row** hai (Section 3 dekho).

---

## 2. Har engine ka trigger → steps → Report-to-Hub pattern

Sabhi 6 spoke-engines (8.7 Dashboard chhod ke, wo consumer-only hai) isi shape ko follow karte hain — bilkul Phase 1–7 ke README pattern jaisa:

```
[Entry point: Webhook (external form/landing page) OR From Hub-Dispatcher trigger]
        ↓
Normalize input (Set node)
        ↓
Dedupe / fraud check (Postgres lookup + Code node scoring)
        ↓
Core action (insert record, calculate score, generate code/link)
        ↓
[Human-approval gate — sirf jahan payout/winner involved ho, 8.1 aur 8.2 me]
        ↓
Reward/response (email/webhook response)
        ↓
Report to Hub (event_type: <engine>.<action>) → REPLACE_WITH_HUB_INTAKE_WORKFLOW_ID
```

**Naye event types jo Dispatcher me add honge:**

| event_type | Kaun report karta hai | Kaun consume karta hai | Fan-out? |
|---|---|---|---|
| `contest.entry_submitted` | 8.1 | 8.7 Dashboard | No |
| `contest.winner_selected` | 8.1 | 8.5 Community (winner spotlight), 8.7 | Yes (2) |
| `referral.submitted` | 8.2 | 8.7 | No |
| `referral.reward_earned` | 8.2 | 8.7 | No |
| `lead.qualified` *(existing)* | 1.4/1.5 | **8.2** (reward Stage 1: meeting booked) | already wired — 8.2 subscribes to existing `lead.booked`/`client.won`, koi naya event nahi |
| `audit.completed` | 8.3 | 2.1 Outreach (nurture into main funnel), 8.7 | Yes (2) |
| `ugc.submission_verified` | 8.4 | 8.2 (referral-link auto-generate), 8.7 | Yes (2) |
| `community.member_joined` | 8.5 | 8.7 | No |
| `signal.lead_flagged` | 8.6 | 2.1 Outreach | Yes |
| `winback.escalated` *(existing, abhi unconsumed)* | 6.5 | **8.6** naya consumer bane | already produced, sirf Dispatcher branch add karni hai |

> Pattern wahi hai jo v6 me use hua: naya event type add karo, Dispatcher me ek Switch branch, placeholder workflow ID, tab tak `flagged_events` me safe fallback.

---

## 3. Multi-Campaign Architecture — "ek saath 2-3 campaigns kaise chalenge"

**Yahi sabse important design decision hai, isliye pehle samjho:**

Abhi jo 8.1/8.2/8.3 files bani hain unme ek `Set - Reward Config (EDIT ME)` / `Set - Which Contest (EDIT BEFORE RUN)` node hai — **matlab abhi ek waqt me sirf ek config hardcoded chal sakta hai.** Isko waise hi chhod diya to 2-3 campaigns ek saath chalane ke liye alag-alag workflow copies banani padengi — jo star-topology ke poore maqsad (ek jagah maintain karna) ke khilaaf hai.

**Fix — ek chhoti si architectural addition, sabhi engines ke liye same pattern:**

### 3.1 Ek naya table: `campaigns`

```sql
CREATE TABLE IF NOT EXISTS campaigns (
  id SERIAL PRIMARY KEY,
  campaign_slug TEXT UNIQUE NOT NULL,     -- e.g. 'diwali-referral-2026', 'nivy-top-100'
  engine TEXT NOT NULL,                   -- '8.1', '8.2', '8.3', ...
  campaign_type TEXT,                     -- e.g. 'contest', 'referral', 'free_audit'
  status TEXT DEFAULT 'draft',            -- draft / active / paused / ended
  config JSONB NOT NULL,                  -- reward amount, copy, thresholds, channel list — sab yahan
  channels TEXT[],                        -- ['whatsapp','telegram','email','linkedin']
  starts_at TIMESTAMP,
  ends_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT now()
);
```

Har `contest_entries` / `referral_ledger` / `ugc_submissions` / `audit_requests` row me ek `campaign_id INTEGER REFERENCES campaigns(id)` column add hoga.

### 3.2 Har engine workflow "campaign-aware" banega

Har entry point (webhook ya form) ab ek `campaign_slug` bhi le ke aayega (URL query param `?c=diwali-referral-2026`, ya landing page ka hidden field). Workflow ke sabse pehle node ke baad ek **`Postgres - Lookup Active Campaign`** node lagta hai jo `campaigns` table se us slug ka config nikalta hai:

```
Webhook (receives ?c=<campaign_slug>)
   ↓
Postgres - Lookup Active Campaign (WHERE campaign_slug=... AND status='active')
   ↓
IF - Campaign Active? → No → Respond "campaign not active/expired"
                       → Yes → continue, config JSONB se reward amount / copy / channel nikaalo
   ↓
... baaki wahi pattern jo abhi hai, bas hardcoded `Set` node ki jagah
    ab har jagah `{{$json.config.reward_amount}}` jaisa dynamic reference ...
```

**Isse kya milta hai:**
- Ek hi `8.1 Reward/Contest Engine` workflow **N contests** ek saath handle kar sakta hai — bas `campaigns` table me N rows daalni hain, workflow ek hi rehta hai
- 2-3 alag engines (referral + contest + audit) toh already independent spokes hain, wo automatically parallel chal sakte hain — koi extra kaam nahi
- Ek hi engine ke andar bhi (jaise 2 alag referral campaigns — "general" aur "Diwali special") ab bina naya workflow banaye chalta hai
- **On/off control** sirf `campaigns.status` update karke — koi n8n edit nahi chahiye rozana campaign band/chalu karne ke liye

### 3.3 Kitne campaigns ek saath chalao (aapka direct sawal)

- **Shuru me 2–3 campaigns** — jaise 1 referral + 1 contest + 1 free-audit — best hai. Team/budget manage hota hai, aur data clean milta hai ye samajhne ke liye kaunsa kaam kar raha hai.
- 1 se shuru mat karo (slow), aur ek saath 10+ mat karo (fraud-review load + support load + budget tracking sab manual hai abhi, khud bottleneck ban jaayega)
- Har engine independently multiple campaigns handle kar sakta hai (Section 3.2 ki wajah se), isliye "zyada campaigns" ka scaling issue **engine ki limit nahi hai — aapki operational bandwidth (winner review, payout approval, support replies) ki limit hai**. Isliye number wahi rakho jo aap khud manually track kar sakte ho, engine khud scale karega.

---

## 4. Global multi-channel reach — priority order

Source doc me 10+ channels the (WhatsApp, Telegram, LinkedIn, Instagram/FB, X, YouTube/TikTok, Discord, SMS, Reddit/Quora, WeChat/LINE/KakaoTalk). International audience ke hisab se rollout order:

| Priority | Channel | Kyun pehle | Setup complexity |
|---|---|---|---|
| **1** | Email | Har region me kaam karta hai, koi review/approval nahi chahiye | Sabse kam |
| **1** | WhatsApp (Waha/Business API) | Asia/LatAm/Africa me dominant | Kam — self-hosted Waha ya official API |
| **1** | Telegram Bot API | Global, free, koi app-review nahi | Sabse kam |
| **2** | LinkedIn | B2B outreach ke liye zaroori (already 4.3.2 me integrate hai) | Medium (rate limits, safety review already 7.3 me flagged) |
| **3** | Instagram/Facebook | US/EU/LatAm consumer reach | High (Meta app review, ads API) |
| **3** | SMS (Twilio-type) | Universal fallback, lekin cost-per-message | Medium |
| **4** | X (Twitter) | Niche audience, news-jacking use-case (Category J) | Medium |
| **4** | Discord | Community engine (8.5) ke liye specifically | Medium |
| **5** | YouTube/TikTok, Reddit/Quora, WeChat/LINE/KakaoTalk | Region/format-specific, baad me | High/Regional |

**Har engine ke `channels` array** (Section 3.1) me multiple channels ek saath ho sakte hain — same campaign WhatsApp + Telegram + Email teeno pe simultaneously bhej sakta hai, workflow me ek `Split In Batches` per-channel node se.

---

## 5. Naye DB objects (sab, ek jagah)

> ✅ **Ye migration ab ek ready-to-run file me hai — separately diya hai: `01-PHASE-8-MIGRATIONS.sql`.**
> Isko us Postgres instance/database par run karo jahan v6 ka `00-MASTER-MIGRATIONS.sql` pehle se chal chuka hai (Phase 8 tables `clients_master` ko reference karte hain aur same `funnel_events`/`flagged_events` share karte hain). Neeche wahi content reference ke liye hai.

```sql
-- Campaign control (Section 3.1)
CREATE TABLE IF NOT EXISTS campaigns ( ... );  -- see above

-- 8.1 Reward/Contest
CREATE TABLE IF NOT EXISTS contest_entries (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  entry_data JSONB,
  fraud_score INTEGER DEFAULT 0,
  status TEXT DEFAULT 'pending',
  submitted_at TIMESTAMP DEFAULT now()
);

-- 8.2 Referral (referral_ledger — separate from existing 6.8 `referrals` table,
-- kyunki 6.8 client-referral hai, 8.2 universal/multi-campaign hai)
CREATE TABLE IF NOT EXISTS referral_ledger (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  referrer_client_id INTEGER REFERENCES clients_master(id),
  referral_code TEXT UNIQUE,
  referred_client_id INTEGER REFERENCES clients_master(id),
  reward_stage TEXT DEFAULT 'submitted',   -- submitted / meeting_booked / converted / paid
  reward_amount NUMERIC,
  created_at TIMESTAMP DEFAULT now()
);

-- 8.3 Free-Value
CREATE TABLE IF NOT EXISTS audit_requests (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  url TEXT,
  score INTEGER,
  report_data JSONB,
  created_at TIMESTAMP DEFAULT now()
);

-- 8.4 UGC
CREATE TABLE IF NOT EXISTS ugc_submissions (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  proof_url TEXT,
  verification_status TEXT DEFAULT 'pending',
  points_awarded INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT now()
);

-- 8.5 Community
CREATE TABLE IF NOT EXISTS community_members (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  role TEXT DEFAULT 'member',
  joined_at TIMESTAMP DEFAULT now()
);

-- 8.6 Signal-Based Outreach
CREATE TABLE IF NOT EXISTS signal_leads (
  id SERIAL PRIMARY KEY,
  signal_type TEXT,          -- 'hiring','funding','news','reactivation'
  raw_signal JSONB,
  ai_score INTEGER,
  outreach_status TEXT DEFAULT 'new',
  created_at TIMESTAMP DEFAULT now()
);
```

Ye sab ek `01-PHASE-8-MIGRATIONS.sql` file me combine hoga — same pattern jo `00-MASTER-MIGRATIONS.sql` me hai.

---

## 6. Build order (phases)

**Phase 8a — Foundation (sabse pehle, baaki sab isi pe depend karta hai)**
1. `campaigns` table + har engine table migrate karo (Section 5)
2. 8.1, 8.2, 8.3 me hardcoded `Set` nodes ko "Lookup Active Campaign" pattern se replace karo (Section 3.2) — isse existing 3 files campaign-aware ban jaayengi

**Phase 8b — Existing 3 engines finalize**
3. 8.1, 8.2, 8.3 ke placeholder `REPLACE_WITH_0.0_HUB_INTAKE_WORKFLOW_ID` bharo (import ke baad)
4. WhatsApp/Telegram/Email NoOp nodes ko real credentials se wire karo
5. Dispatcher me naye branches add karo (Section 2 ki table)

**Phase 8c — Baaki 4 engines banao**
6. 8.4 UGC/Share Engine
7. 8.5 Community Engine
8. 8.6 Signal-Based Outreach Engine
9. 8.7 Dashboard (Metabase views — koi naya n8n workflow nahi, existing `funnel_events` + naye tables ke upar SQL views)

**Phase 8d — Import + activate (jaisa N8N-Import-Order-Guide.md me hai)**
10. Har naya spoke same n8n instance me import → Hub-Intake ID bharo → test → activate
11. Sabse aakhir me Dispatcher me sab naye IDs bharo, activate

**Phase 8e — Rollout**
12. Pehle 2-3 campaigns live karo (Section 3.3) — 1 referral + 1 contest + 1 free-audit suggested
13. 2 hafte data dekho, jo kaam kare usko scale karo, jo na kare band karo
14. Dhire-dhire baaki engines (8.4–8.6) ke campaigns add karo

---

## 7. Fraud-prevention & legal guardrails (source doc ne khud flag kiya tha)

- **Koi bhi payout auto nahi hai** — 8.1 (winner) aur 8.2 (referral payout) dono me human-approval gate hai (Odoo Discuss flag), yehi pattern 8.4 UGC me bhi rahega
- Fraud score threshold (abhi 50, 8.1 me) — disposable-email check + duplicate-entry check + proof-URL heuristic. UGC (8.4) aur Referral (8.2) dono isi scoring code ko reuse karenge
- Contest/reward terms — region-specific legal disclaimer required (lottery laws country se country vary karte hain) — **ye business/legal decision hai, main draft nahi kar sakta, lawyer se review karwana**
- WhatsApp/Telegram bulk messaging — platform ToS ke against spam na ho, opt-in tracking `clients_master` me already hai

---

## 8. Jo main bana sakta hoon vs jo aapko dena hoga

| Kaam | Kaun karega |
|---|---|
| Sab n8n `workflow.json` files (8.1–8.7, campaign-aware) | ✅ Main |
| DB migrations SQL | ✅ Main |
| Hub-Dispatcher naye branches | ✅ Main |
| READMEs (Test-Kaise-Kare pattern, jaisa Phase 1-7 me hai) | ✅ Main |
| Reward amounts, contest copy/theme, legal terms | ❌ Aap (business decision) |
| WhatsApp/Telegram/Email/LinkedIn real credentials wiring | ❌ Aap (aapke actual accounts) |
| Firecrawl/PageSpeed/Ollama API keys (8.3 ke liye already flagged) | ❌ Aap |
| Kaunsa campaign pehle live karna hai, kitna budget | ❌ Aap |

---

## 9. Progress Tracker

> Isko manually update karte rehna — jab bhi koi row complete ho, ✅ kar dena. Ye poore Phase 8 ka single source-of-truth checklist hai. (`⬜ Not started` / `🔶 In progress` / `✅ Done`)

### 8a — Foundation
| # | Task | Status | Note |
|---|---|---|---|
| 1 | `01-PHASE-8-MIGRATIONS.sql` Postgres par run karo | ⬜ | file separately diya hai |
| 2 | 8.1 me hardcoded `Set - Reward Config` → "Lookup Active Campaign" pattern | ⬜ | |
| 3 | 8.2 me hardcoded config → campaign-aware | ⬜ | |
| 4 | 8.3 me hardcoded config → campaign-aware | ⬜ | |

### 8b — Existing 3 engines finalize
| # | Task | Status | Note |
|---|---|---|---|
| 5 | 8.1 import + Hub-Intake ID bharo | ⬜ | |
| 6 | 8.2 import + Hub-Intake ID bharo | ⬜ | |
| 7 | 8.3 import + Hub-Intake ID bharo | ⬜ | |
| 8 | WhatsApp/Telegram/Email NoOp nodes → real credentials (8.1, 8.2, 8.3) | ⬜ | aapka kaam |
| 9 | Firecrawl + PageSpeed API keys (8.3) | ⬜ | aapka kaam |
| 10 | Hub-Dispatcher: `contest.*`, `referral.*`, `audit.completed` branches add karo | ⬜ | |

### 8c — Baaki engines banao
| # | Task | Status | Note |
|---|---|---|---|
| 11 | 8.4 UGC/Share Engine — build | ⬜ | |
| 12 | 8.5 Community Engine — build | ⬜ | |
| 13 | 8.6 Signal-Based Outreach Engine — build | ⬜ | |
| 14 | 8.7 Dashboard views (Metabase/SQL) — build | ⬜ | |

### 8d — Import + activate
| # | Task | Status | Note |
|---|---|---|---|
| 15 | 8.4 import + test + activate | ⬜ | |
| 16 | 8.5 import + test + activate | ⬜ | |
| 17 | 8.6 import + test + activate | ⬜ | |
| 18 | Dispatcher — baaki sab naye event IDs bharo | ⬜ | |
| 19 | Dispatcher activate (sabse aakhir me) | ⬜ | |

### 8e — Rollout (business side)
| # | Task | Status | Note |
|---|---|---|---|
| 20 | Reward amounts / contest copy / legal terms finalize | ⬜ | aapka kaam |
| 21 | Pehle 2-3 campaigns ke `campaigns` table rows daalo (status='active') | ⬜ | |
| 22 | 2 hafte data monitor karo | ⬜ | |
| 23 | Jo kaam kare usko scale, jo na kare band | ⬜ | |

---

## 10. Agla step

Bolo konsa order me chalna hai — main suggest karunga:
**Phase 8a (campaign-aware fix on 8.1/8.2/8.3) → 8b (finalize existing 3) → phir ek-ek karke 8.4 → 8.5 → 8.6 → 8.7**, exactly jaise Phase 1-7 me ek-ek module hua tha.
