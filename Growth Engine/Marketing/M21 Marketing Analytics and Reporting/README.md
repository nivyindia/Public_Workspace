# 21 Marketing Analytics and Reporting

> **Stage 21 of 22** in the Marketing / Demand-Generation Funnel (Track M).
> Status: 🟡 Built to pilot depth (Batch 7). Phase H — Measurement & Bridge.

---

## Navigation

- ⬅ Previous stage: [20 Partnerships, Co-Marketing and PR](../M20%20Partnerships%2C%20Co-Marketing%20and%20PR/README.md)
- ➡ Next stage: [22 Inbound-to-CRM Bridge](../M22%20Inbound-to-CRM%20Bridge/README.md)
- 🏠 [Marketing Funnel home](../README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Install and maintain the tracking infrastructure (GA4, Search Console, conversion/pixel tracking) and the reporting layer (dashboards, weekly/monthly rollups) that tells the business which of the 20 upstream Track M stages are actually producing traffic, engagement, and leads — and tag every resulting lead with an accurate source, so M22 can bridge it into the CRM correctly attributed.

**Purpose:** M01-M20 generate activity across brand, SEO, content, social, email, growth experiments, community, and partnerships. Without M21, that activity is invisible as a set of numbers — decisions about which channel to double down on, which to cut, and which experiment worked get made on instinct instead of evidence. M21 exists to close that gap, and its output (accurate source tagging) is the direct input M22 depends on to tag inbound leads correctly.

**Inputs:**
- Live website/pages produced across M04-M10 (SEO + content stages)
- Social channel activity from M11-M16
- Email campaigns from M17
- Growth experiments from M18 needing an Impact × Effort read on real results, not guesses
- Partnership/PR placements from M20 needing referral-traffic attribution

**Outputs:**
- A working GA4 property + Google Search Console + conversion tracking, so every session and conversion is captured
- UTM-tagged links across every channel that produces one, so M21's traffic reports and M22's Source field agree
- A recurring (weekly/monthly) reporting dashboard summarizing traffic, engagement, and lead-generation by channel
- Accurately source-tagged lead events, ready to be picked up by M22

**Expected Result:** Nobody on the team has to ask "where are our leads actually coming from" — the dashboard already answers it, and every inbound lead M22 bridges carries a Source tag that matches the channel that actually produced it.

---

## 2. Complete Sub-Stages

| Sub-Stage | Description |
|---|---|
| **21A** Analytics Infrastructure Setup | GA4 property setup, Google Search Console setup/verification, goal & conversion tracking |
| **21B** Ad & Pixel Tracking | Meta Pixel, Google Ads conversion tracking, Google Tag Manager container, retargeting audiences (only relevant once paid channels are running — see [faq.md](faq.md)) |
| **21C** UTM & Source Tagging Standard | A fixed UTM naming convention applied across every channel (M09-M20) so traffic sources are comparable and match M22's Source enum |
| **21D** Dashboarding | Looker Studio (or equivalent) dashboard pulling from GA4 + Search Console + the shared free/OSS Experiment Tracker (M18) |
| **21E** Recurring Reporting Cadence | Weekly channel-performance snapshot + monthly business-level rollup, mirroring the daily/weekly/monthly cadence already used on the sales side |
| **21F** Experiment Result Tracking | Feeding M18's Impact × Effort tracker with real traffic/conversion numbers per experiment, not just qualitative "it seemed to work" |

Full detail per sub-stage is in [methods.md](methods.md).

---

## 3. AI Section

**How AI can help:**
- Turning a raw GA4/Search Console export into a plain-language weekly summary ("organic sessions up 12%, driven mostly by the M09 long-form post on [topic]") instead of a human reading a spreadsheet cold
- Drafting the monthly rollup narrative from the dashboard's numbers, for stakeholders who want the story, not the raw table
- Spotting UTM-tagging inconsistencies (e.g., a channel using `linkedin` in one campaign and `Linkedin` in another) that would otherwise silently split one channel's numbers into two rows in the dashboard
- Suggesting which M18 growth experiments to keep running vs. kill, based on the actual traffic/conversion numbers rather than gut feel — still a human decision, AI only surfaces the read

**Prompt example:**
```
"Here is this week's GA4 traffic-by-source export [paste/attach]. Summarize
in 4-5 bullet points: which channel grew or dropped the most, any single
page driving an outsized share of traffic, and any source with unusually
high bounce rate worth investigating. Do not speculate on causes not
visible in the data."
```

**Human-in-the-loop rule:** Per the standing QC rule in `IMPLEMENTATION-PLAN.md` §6, AI-drafted summaries and experiment-kill/keep suggestions are reviewed before being acted on — this stage feeds business decisions (channel budget, experiment continuation), so a wrong AI read here has more downstream cost than a wrong read in, say, a content draft.

---

## 4. Quality Control

Full checklist in [checklists.md](checklists.md). Summary gates:
- [ ] GA4 + Search Console reporting with zero data gaps (per the source package's own 30-day validation standard)
- [ ] Every channel-produced link carries a UTM tag matching the fixed naming convention
- [ ] Weekly/monthly dashboard actually reviewed, not just auto-generated and ignored
- [ ] Every KPI benchmark below is checked against real numbers, not estimated

---

## 5. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Goal/conversion tracking accuracy | 100% of defined goals firing within 7 days of setup | Per the Analytics Setup package's own KPI standard |
| Data gaps in tracking | 0 within 30 days of setup | Same source |
| Dashboard coverage | ≥ 5 key business metrics visible on one dashboard | Traffic, leads, top channel, top content, conversion rate as a minimum set |
| UTM tagging compliance | 100% of trackable outbound links tagged | Untagged links show up as "(direct)" or "(not set)" in GA4, corrupting the whole report |
| Reporting cadence adherence | Weekly snapshot + monthly rollup delivered on schedule, no skipped weeks | Mirrors the sales-side daily/weekly/monthly reporting discipline |

---

## 6. Templates & Resources

See [templates.md](templates.md) for the weekly/monthly reporting formats and [resources.md](resources.md) / [tools.md](tools.md) for the tool stack.

---

## Cross-References

- **Previous stage:** [20 Partnerships, Co-Marketing and PR](../M20%20Partnerships%2C%20Co-Marketing%20and%20PR/README.md) — its referral/PR placements need attribution here
- **Next stage:** [22 Inbound-to-CRM Bridge](../M22%20Inbound-to-CRM%20Bridge/README.md) — depends directly on this stage's UTM/source tagging accuracy
- **Also feeds from:** every stage M04-M20 (all upstream traffic/engagement activity)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)

> **Source note:** This stage was populated using operational material already in the repo — the "Analytics Setup & Dashboard System" and "Tracking & Pixel Setup Package" service packages (NIVY Level 4 add-ons, describing the exact GA4/Search Console/GTM/Meta Pixel setup already used to deliver this to clients), and the "16. Performance Metrics & KPIs" SOP, adapted from its sales-activity framing to a marketing-traffic framing. The UTM-tagging standard (21C) and the recurring-reporting-cadence structure (21E) have no dedicated internal doc and are written fresh, marked as such in methods.md. Pricing figures are approximate as of the source docs' last update (May 2026) and should be verified before operational or client-facing use.
