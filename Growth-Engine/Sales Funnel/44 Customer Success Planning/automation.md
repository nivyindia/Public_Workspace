# Automation — 44 Customer Success Planning

> Part of Stage 44 (Customer Success Planning). See [README.md](README.md) for the stage overview.

For each sub-stage below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. Lifecycle Touchpoint Mapping & NPS Measurement (44A–44B)

| Level | Workflow |
|---|---|
| **Manual** | Someone tracks each client's Day 1/7/30/quarterly/annual milestones in a spreadsheet and manually sends each touchpoint. |
| **Semi-automated** | A calendar reminder exists per client for each milestone, manually actioned when it comes up. |
| **Fully automated** | Scheduled triggers, anchored to each client's actual onboarding-trigger date (Stage 40), fire every lifecycle touchpoint automatically — Day 1 welcome-follow-up, Day 7 check-in, Day 30 review, quarterly review scheduling, annual review reminder — with no manual date tracking. Monthly NPS survey dispatch runs the same way, to every active client, on a fixed monthly schedule. |
| **AI-assisted** | Not required for the dispatch mechanics themselves (these are deterministic, date-driven sends); the AI value in this stage lives in the scoring step below (44C), not in triggering the touchpoints. |

**Required:** n8n scheduled triggers anchored to the Stage 40 onboarding-trigger timestamp per client · NPS survey tool (Typeform/native CRM survey) with a standardized 3-question format.
**Expected output:** every active client receives every lifecycle touchpoint and monthly NPS survey with 100% reliability, with zero touchpoints missed because a date wasn't tracked.
**Common errors:** touchpoint timers anchored to contract-signed date instead of the actual onboarding-trigger date, drifting the whole sequence out of sync with when the client actually started experiencing the service (recovery: anchor consistently to the same trigger event Stage 40 uses, matching the cross-stage note in that stage's automation.md); NPS survey sent to a churned/paused client, producing confusing or skewed data (recovery: gate survey dispatch on current active lifecycle status, checked at send time, not at list-build time).

---

## 2. Churn-Risk Scoring & Warning-Sign Detection (44C–44D)

| Level | Workflow |
|---|---|
| **Manual** | AM periodically reviews a client's recent CSAT/NPS scores and general vibe, deciding informally whether they're "at risk." |
| **Semi-automated** | NPS/CSAT scores are visible on a dashboard; a human still has to notice a downward trend and connect it to other signals themselves. |
| **Fully automated** | Combined signal collection — NPS trend, CSAT trend, response-time data, delivery-performance data (from Stage 42/43) — feeds a scoring workflow on a continuous basis, not just at scheduled review points, so warning signs (7+ days of client silence, reduced task volume, a negative feedback comment) are caught the moment they occur rather than at the next scheduled check. |
| **AI-assisted** | An LLM combines the above signals into a Low/Medium/High risk classification with a recommended action, reasoning across signal types the way a human reviewer would ("NPS stable but response time has doubled and task volume dropped 40% — flag Medium despite the score looking fine") rather than relying on any single metric in isolation. The AM still owns the actual response decision — the model proposes a classification and rationale, not a final call. |

**Required:** Combined data pipeline pulling NPS/CSAT (this stage), delivery performance (Stage 42), and engagement data (Stage 43) into one signal source · LLM scoring step with access to all combined signals · continuous (not just scheduled) monitoring for behavioral warning signs.
**Expected output:** every client has a current, multi-signal risk classification that updates as new signals arrive, catching combination-of-signals risk that no single metric would flag on its own.
**Common errors:** risk score relies on NPS/CSAT alone because the delivery-performance and engagement data pipelines (Stage 42/43) were never actually connected, producing a scoring system that misses exactly the kind of risk this sub-stage is meant to catch (recovery: verify the combined pipeline is genuinely combined, not scoring off a single available source while treating it as "combined"); warning-sign detection checked only at the next scheduled review instead of continuously, defeating the purpose of catching signals as they occur (recovery: behavioral triggers like "7+ days silence" need an event-driven or frequent-poll check, not a monthly batch job).

---

## 3. Severity-Tiered Response & Save-a-Client Process (44E–44F)

| Level | Workflow |
|---|---|
| **Manual** | Whoever notices a risk signal decides on their own whether and how to respond. |
| **Semi-automated** | Risk classification (44C) is visible on a dashboard, but routing to the right responder (AM vs. founder) is still a manual judgment call each time. |
| **Fully automated** | Risk severity from 44C automatically routes the response: Medium risk triggers an AM proactive check-in task, High/critical risk triggers a same-day founder alert — with no manual triage step deciding who should respond. |
| **AI-assisted** | An LLM can draft the AM's proactive check-in outreach for Medium-risk accounts, referencing the specific signal that triggered it (e.g., delivery delays, not a generic "checking in") so the outreach feels targeted rather than templated. The actual save-a-client conversation for a client who raises cancellation stays entirely human, run from the structured script — this is explicitly the point where automation stops. |

**Required:** Routing logic tied directly to the 44C risk-classification output · Slack/phone alert for founder-level critical flags · LLM step for Medium-risk outreach drafting only.
**Expected output:** every risk signal gets a response calibrated to its actual severity, automatically routed to the right person, with no risk signal sitting unaddressed because no one happened to check the dashboard that day.
**Common errors:** severity routing miscalibrated so Medium and High-risk accounts get the same response cadence, either alarming the AM unnecessarily or under-responding to a genuinely critical account (recovery: keep the tier thresholds explicit and reviewed periodically, same discipline as Stage 38's approval-tier table); founder alert fires but with no context on *why* — just "client X is high risk" — forcing the founder to dig through dashboards before the same-day call (recovery: the alert should carry the specific triggering signal(s), not just the risk label).

---

## 4. NPS-Driven Action (44G)

| Level | Workflow |
|---|---|
| **Manual** | Someone reads each NPS response and decides case-by-case whether to ask for a review, follow up, or escalate. |
| **Semi-automated** | NPS score triggers a category (promoter/passive/detractor) automatically, but the actual outreach for each category is manually written each time. |
| **Fully automated** | Score-based routing runs automatically: promoters get an automatic review/referral request, passives get an automatic "what would make this a 10" follow-up, and detractors trigger an immediate founder alert — no manual sorting of responses by score band. |
| **AI-assisted** | An LLM personalizes each automated message using the client's specific NPS comment (not just the numeric score) — a promoter who mentioned a specific team member by name gets a review-request that references that, a detractor's stated reason routes directly into the founder alert as context, not just the raw number. |

**Required:** NPS tool with score + comment capture · n8n routing on score band · LLM step for comment-aware personalization · founder-alert channel for detractor routing.
**Expected output:** every NPS response gets an appropriate, timely, and personalized next action with no response sitting unactioned in a spreadsheet — promoters converted to advocacy (feeds [Stage 52](../52 Case Studies and Testimonials/README.md)/[Stage 53](../53 Referral Programs/README.md)), detractors caught and escalated same-day.
**Common errors:** review/referral request sent to a promoter automatically with no comment personalization, reading as a generic ask right after they gave a specific compliment (recovery: always route the comment text into the message-drafting step, not just the score); detractor alert delayed because it's bundled into a weekly digest instead of firing immediately (recovery: detractor routing should be the one NPS-driven action that's never batched — same-day, every time).

**n8n / integration flow:** `Scheduled lifecycle triggers (anchored to Stage 40 onboarding date)` → `Touchpoint reminders (Day 1/7/30, quarterly, annual)` → `NPS survey dispatch (monthly, active-status gated)` → `Combined signal pipeline (NPS + CSAT + delivery + engagement)` → `LLM (churn-risk scoring, Low/Medium/High + rationale)` → `n8n (route by severity: AM check-in task / founder same-day alert)` → `NPS-based action (LLM-personalized review request / gap follow-up / immediate founder alert)`

---

## Cross-Stage Automation Note

The churn-risk signal pipeline (44C) should be the same shared pipeline referenced in Stage 43's cross-stage note — build it once, feed both stages, and make sure Stage 42's delivery-performance data and Stage 43's engagement data are genuinely wired into it rather than scored in isolation, since combination-of-signals is the entire value of this sub-stage over a simple NPS dashboard.

## Recovery Principles (General)

- **The save-a-client conversation and any founder-level detractor call stay entirely human** — this stage's automation exists to make sure the right signal reaches the right person fast, never to run the actual relationship-repair conversation.
- **Detractor and critical-risk routing should never be batched or delayed** — same-day response is the whole point of catching these signals early; a digest defeats the purpose.
- **A risk score or alert without the underlying "why" forces manual re-investigation before anyone can act** — always carry the triggering signal(s) forward into whatever the classification produces.

---

## Cross-References

- Stage README: [README.md](README.md)
- Sub-stages referenced above: [README.md § 2](README.md#2-complete-sub-stages)
- Tools referenced above: [tools.md](tools.md)
- Shared signal source with: [43 Account Management](../43 Account Management/automation.md)
- Feeds advocacy actions into: [52 Case Studies and Testimonials](../52 Case Studies and Testimonials/README.md) · [53 Referral Programs](../53 Referral Programs/README.md)
- Previous stage: [43 Account Management](../43 Account Management/README.md)
- Next stage: [45 Product and Service Adoption](../45 Product and Service Adoption/README.md)
