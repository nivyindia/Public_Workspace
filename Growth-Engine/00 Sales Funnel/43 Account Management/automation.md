# Automation — 43 Account Management

> Part of Stage 43 (Account Management). See [README.md](README.md) for the stage overview.

For each sub-stage below: manual → semi-automated → fully automated → AI-assisted workflow, required tools/APIs, expected output, common errors, recovery.

---

## 1. AM Assignment & Portfolio Capacity Management (43A, 43H)

| Level | Workflow |
|---|---|
| **Manual** | Founder/ops lead assigns a new client to an AM based on gut-feel current workload. |
| **Semi-automated** | A spreadsheet tracks each AM's active-account count, manually updated when accounts open/close. |
| **Fully automated** | A live dashboard (Metabase or CRM report) pulls active-account count per AM directly from the CRM in real time, and the assignment step on a new-client trigger checks each AM's current count against the capacity threshold before suggesting who gets the next assignment. |
| **AI-assisted** | Not required for the assignment logic itself (a simple threshold rule is sufficient and more auditable than an LLM judgment call here) — the value-add is the *dashboard summarization*: an LLM can turn the raw capacity numbers into a one-line weekly note ("2 AMs at or above threshold — hold new assignments to them") for the ops lead. |

**Required:** CRM with AM-assignment field · Metabase (or CRM-native reporting) for the live capacity dashboard · n8n to check capacity at assignment time.
**Expected output:** every new account is assigned to an AM with visible headroom, and capacity breaches are visible before they cause service-quality problems, not after a client complains.
**Common errors:** capacity count includes churned/closed accounts that were never removed from an AM's "active" tally, understating available headroom (recovery: capacity query must filter on current lifecycle status, not just "ever assigned to this AM"); assignment rule silently ignored under time pressure ("just give it to whoever's available right now") without updating the dashboard's expectation (recovery: if a threshold is knowingly overridden, log the override explicitly so the dashboard doesn't look wrong later).

---

## 2. Weekly Touchpoint & Internal KPI Check (43B–43C)

| Level | Workflow |
|---|---|
| **Manual** | AM manually checks each client's metrics before writing a personal update from scratch every week. |
| **Semi-automated** | Metrics are pulled into a shared dashboard manually reviewed weekly; the update message is still drafted from scratch. |
| **Fully automated** | A scheduled weekly n8n workflow pulls each client's metrics automatically from the relevant analytics/ad-platform APIs, with no manual export step. |
| **AI-assisted** | An LLM drafts the personal weekly update — framed around a specific win, per the stage's own definition of what makes this touchpoint valuable, not a generic status line — and separately flags any metric that's crossed below a defined threshold, so the AM's internal KPI check (43C) happens automatically *before* the client ever notices an issue. |

**Required:** Analytics/ad-platform APIs (GA4, Meta Ads, Google Ads, etc., matched to what each client's service involves) · n8n scheduled trigger · LLM step for update drafting + threshold-flagging.
**Expected output:** every active client gets a specific, non-generic weekly update, and every metric dip is caught internally before the client raises it — with the AM spending review/personalization time, not data-pulling time.
**Common errors:** the AI-drafted update reads as generic because the prompt only received raw numbers, not a "here's what's a genuine win vs. routine" framing (recovery: give the drafting step context on what counts as notable for that specific client/service, not just the latest metric snapshot); threshold flag fires on normal week-to-week noise rather than a real dip (recovery: flag against a rolling trend, not a single week-over-week delta, to avoid alert fatigue that makes the AM start ignoring flags).

---

## 3. Bi-Weekly/Monthly Reporting & Strategy Review (43D–43E)

| Level | Workflow |
|---|---|
| **Manual** | AM builds the formal report from scratch in a slide deck or doc each cycle. |
| **Semi-automated** | A report template exists and is manually populated with the latest metrics before each send. |
| **Fully automated** | The report auto-populates from the same metrics pull used for the weekly update (section 2), formatted into the client-facing report template, generated automatically on the bi-weekly/monthly schedule with no manual data entry. |
| **AI-assisted** | An LLM drafts the narrative sections (what happened, why, what's next) from the populated metrics, which the AM reviews and personalizes before sending — turning a data-formatting task into a review-and-refine task. The actual monthly strategy call itself stays fully human, as the stage's highest-relationship-value touchpoint. |

**Required:** Report template with data-binding fields · n8n/reporting tool (Metabase, Google Data Studio/Looker Studio, or native CRM reporting) for auto-population · LLM step for narrative drafting.
**Expected output:** a formal, accurate, on-schedule report generated with minimal manual assembly, freeing AM time for the strategy conversation itself rather than the report-building.
**Common errors:** report auto-generates and sends without AM review, missing context only the AM would know (a client-side event that explains a metric dip, say) — recovery: this is a required human-review checkpoint, never auto-send a formal report unreviewed, same principle as Stage 41's recap; report template silently breaks when a new metric source is added for a specific client and the binding isn't updated (recovery: version-control the report template and test after any change).

---

## 4. Relationship Health Monitoring & Renewal Pipeline (43F–43G)

| Level | Workflow |
|---|---|
| **Manual** | AM tracks renewal dates and CSAT scores in their head, remembering to reach out as a contract approaches expiry. |
| **Semi-automated** | Renewal dates live in a spreadsheet manually checked periodically. |
| **Fully automated** | A "renewal radar" scheduled workflow checks every active contract's end date daily and automatically flags accounts crossing the 60/45/30/14/7-day thresholds, notifying the AM at each milestone without anyone tracking dates manually. CSAT tracking and response-time SLA adherence are pulled automatically from the same signal sources used in Stage 44's churn-risk scoring. |
| **AI-assisted** | An LLM combines the renewal-radar flag with the account's CSAT/engagement trend (cross-referencing Stage 44's risk signals) to prep the AM with context before each renewal-sequence touchpoint — e.g., "60-day renewal flag; CSAT trending down over the last quarter — lead with a check-in, not a renewal pitch, at this milestone." |

**Required:** n8n scheduled daily check against CRM contract end-dates · CSAT/NPS data source (shared with Stage 44) · LLM step for context-aware renewal-sequence prep.
**Expected output:** every expiring contract gets the full 60/45/30/14/7-day proactive sequence with no account falling through because a date wasn't tracked, and each renewal touchpoint is informed by actual relationship-health context rather than treated as a generic reminder.
**Common errors:** renewal radar flags fire but land in a channel no one monitors closely (recovery: route to the specific assigned AM directly, not a general channel); a renewal-sequence touchpoint fires with a generic "time to renew" message even for an account with a known health problem, damaging trust right before the renewal conversation matters most (recovery: the context-check against CSAT/engagement trend should gate the *tone* of the automated prep, per the AI-assisted row above, not just the timing).

**n8n / integration flow:** `Scheduled weekly trigger` → `Pull metrics (analytics/ad APIs)` → `LLM (draft update + flag anomalies against rolling trend)` → `AM review + send` → `Bi-weekly/monthly: auto-populate report template + LLM narrative draft` → `AM review + send` → `Renewal-radar daily check (60/45/30/14/7-day flags)` → `LLM (context-aware prep from CSAT/engagement trend)` → `Notify AM at each renewal-sequence milestone` → `Portfolio dashboard (AM capacity tracking)`

---

## Cross-Stage Automation Note

This stage shares its CSAT/engagement signal source with Stage 44 (Customer Success Planning) — build the churn-risk/health-signal pipeline once and let both stages read from it, rather than Stage 43's relationship-health monitoring and Stage 44's churn-risk scoring independently re-deriving the same underlying signals from different queries.

## Recovery Principles (General)

- **The monthly strategy call and any renewal negotiation stay fully human** — automation's role throughout this stage is prep and reminder infrastructure, never the relationship conversation itself.
- **Never auto-send a formal, client-facing document without AM review** — a report or renewal message missing context the AM would have caught is a trust cost that outweighs the time saved.
- **Flag against trend, not single data points**, for both KPI dips and renewal-sequence tone, to avoid false alarms that erode confidence in the automation over time.

---

## Cross-References

- Stage README: [README.md](README.md)
- Sub-stages referenced above: [README.md § 2](README.md#2-complete-sub-stages)
- Tools referenced above: [tools.md](tools.md)
- Shared signal source with: [44 Customer Success Planning](../44 Customer Success Planning/automation.md)
- Trigger source: [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/automation.md)
- Previous stage: [42 Implementation and Delivery Setup](../42 Implementation and Delivery Setup/README.md)
- Next stage: [44 Customer Success Planning](../44 Customer Success Planning/README.md)
