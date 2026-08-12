# Secondary VoC Research — SMB Outsourcing Survey Data (Second Pass)

**Module:** 03 — ICP & Buyer Research | **Status:** v1 | **Last updated:** 2026-08-06

## What this is and isn't

This is the second secondary-research pass called for in `20260806_Secondary_VoC_Research_PublicReviews_v1.md`. That file's source base skewed mid-market/SaaS-adjacent (Clutch/G2); this pass specifically targets **SMB-side, quantitative survey data** to better match Nivy Next's actual buyer profile. It is still a stand-in for primary VoC, not a replacement — see `Founding_Client_and_VoC_Bridge_Plan_v1.md`.

**What was attempted and didn't pan out:** targeted searches for r/smallbusiness and r/agency buyer-discussion threads, and Google-review complaint threads about local marketing agencies, were run again this pass. As in the first pass, search surfaced agency-authored marketing content (SEO articles, review-management service pages) rather than actual buyer discussion threads — this remains a real gap, not a skipped step. Flagging it again rather than papering over it with weak sources.

**What did pan out:** a dedicated SMB-agency-hiring survey report (Semrush, self-reported 100+ US businesses surveyed in 2021 plus 111 agencies) is a genuine primary-source dataset — direct percentages from real respondents, not aggregator sentiment summaries. It's the strongest source found across both passes for this specific question (why/how SMBs hire and fire agencies). One caveat: the survey is from 2021/2022, not 2026 — treat directional patterns (communication, referrals, trust) as durable, but treat exact percentages as dated.

## Source Log

| # | Source | Type | Sample | URL |
|---|---|---|---|---|
| 1 | Semrush — "How Businesses Hire Agencies" report | Original survey (client-side) | 100+ US SMBs, 2021 | static.semrush.com (Semrush blog asset) |
| 2 | Semrush — same report, Part 2 | Original survey (agency-side) | 111 US marketing agencies, 2021 | same report |

---

## Key Findings — Client Side (why/how SMBs hire and fire)

**Outsourcing is the norm, not the exception.** Nearly 60% of the businesses surveyed used an outside marketing partner in some form, and just over 41% didn't outsource at all — most of the rest ran a hybrid of in-house plus agency. Notably, none of the surveyed companies cited price as a standalone complaint; the report's own framing is that cost only becomes a deciding factor after trust is established, not before — directly echoing the "value over lowest bid" pattern from the first secondary pass.

**Top reasons businesses give for hiring an agency, in order:** not enough in-house expertise, not enough in-house resources/time, need to scale marketing activity, wanting an outside perspective, cost-effectiveness vs. hiring in-house, difficulty hiring good in-house marketers.

**Top 5 traits businesses want (ranked):**
1. Industry-specific experience — a generalist agency is a hard sell
2. A realistic, concrete action plan/strategy over vague promises
3. Accessible, responsive account managers
4. Affordability/flexible pricing (tied)
5. Referrals from other clients (tied)

**Top red flags (ranked):** poor communication, lack of transparency, overpromising results, inability to reach mutual understanding, forcing long-term contracts, rushing into work without a plan, lack of industry-specific expertise, bad reviews, vagueness about IP ownership, lack of testimonials/case studies.

**Why the 41% who don't outsource stay away:** "not financially viable," lack of control with outside marketers, difficulty explaining their product/service to an outsider, feeling the outside team isn't focused enough on their project, and — notably — a meaningful share who **tried outsourcing before and it didn't work out**. This is the first concrete SMB-side evidence (across both passes) that a prior-bad-experience objection is real and common, not just a Nivy Next hypothesis.

**Why clients picked their current agency (top 2 by a wide margin):** the agency was recommended to them, and/or the agency presented a genuinely convincing, tailored strategy. Word of mouth was the single largest channel by which businesses actually found their agency, well ahead of search, ads, or directory listings.

**Likes vs. dislikes, client-side:**
- Liked: takes time to genuinely understand the brand/positioning; reviews analytics proactively rather than waiting to be asked; shows clear ROI; helps refine the value proposition; helps the client better understand their own customers.
- Disliked: limited understanding of the brand; poor/inconsistent communication; can't integrate across channels/tools; can't track progress clearly; generic or impractical ideas; weak project management.

**How performance gets judged:** ROI and lead-conversion rate dominate as success metrics — vanity metrics (impressions, time-on-page) are explicitly dismissed by respondents in their own advice to agencies ("nobody cares about gross rating points").

**Pricing model reality:** project-based pricing was the most common (41%+), well ahead of pure hourly (14%) or pure retainer — useful signal that a flexible/tiered package structure (which Package_Pricing_AllServiceLines_v1.md already uses) matches how SMBs actually prefer to buy, rather than a rigid single-model offer.

**Decision-maker pattern:** the person who *initiates* the search for an agency (often a marketing director/manager) is frequently not the person who makes the *final* call (often the business owner or CEO) — relevant for the CRM setup and outreach sequences, which should account for a two-stage buyer.

## Key Findings — Agency Side (how agencies actually land clients — useful for Nivy Next's own funnel, not just messaging)

- Referrals were rated the most effective client-acquisition channel by agencies themselves (65.8% said so), ahead of SEO and paid channels — reinforcing that the Founding-Client Bridge Plan's network-first approach is the right sequencing, not a fallback.
- Lead-to-client conversion took one to four weeks for the majority of agencies; deals under a week were the minority — useful for setting realistic pipeline-velocity expectations in the CRM stages rather than assuming fast closes.
- One-to-one interaction was rated the most effective lead-nurturing method, ahead of email/content/retargeting — supports keeping the cold email and LinkedIn sequences conversational rather than broadcast-heavy (already the direction those sequences take).

---

## Mapping to Existing ICP Cards / Messaging / Objection Playbook

| Existing Claim / Asset | Survey Evidence | Status |
|---|---|---|
| Messaging House / ICP cards: "speed and responsiveness matter most" | Confirmed as a top-5 client-side trait *and* the #1 red flag when absent — now corroborated by two independent source sets (Clutch/G2 pass + this survey pass) | **Confirmed (2x)** |
| ICP objection: "we tried an offshore/outside agency before and it didn't work" | First pass marked this **Unconfirmed**. This survey shows a real (if unquantified in the source) share of non-outsourcers cite exactly this as their reason for staying in-house | **Partially confirmed** — real pattern exists; still needs primary VoC to learn Nivy-Next-specific "what went wrong" detail |
| Positioning: "value over lowest price" | Confirmed independently — report explicitly states no surveyed business complained about price as a standalone issue | **Confirmed (2x)** |
| Content/case-study strategy: prioritize industry-relevant proof | Confirmed — "industry-specific experience" ranks as the #1 client-side trait, ahead of affordability | **Confirmed (2x)** |
| Founding-Client Bridge Plan: network/referral-first client acquisition | Confirmed from the agency side too — referrals rated the single most effective acquisition channel by working agencies | **Confirmed, now with agency-side data** |
| CRM Pipeline Setup: stage assumptions | New input — two-stage buyer (initiator ≠ decision-maker) and 1-4 week typical conversion window should inform CRM fields/automation timing, not just messaging | **New — feeds CRM notes, not yet reflected there** |

---

## Feeds Into

- **Objection Playbook:** add "prior bad outsourcing experience" as a named objection with a direct counter (ask what specifically went wrong, don't assume it was capability — often it was communication/expectations per this data).
- **CRM_Pipeline_Setup_Notes.md:** consider adding an "initiator vs. decision-maker" contact-role field and setting default pipeline-velocity expectations (1-4 weeks typical) rather than leaving stage-aging assumptions unset.
- **Messaging_Language_Bank candidate phrases (adds to the first pass's list):** "we'll tell you what a realistic plan looks like, not just what you want to hear," "one point of contact who actually knows your industry."

## Limitations

- Single survey source for the quantitative claims in this pass — treat as one data point, not a consensus, until corroborated further.
- Survey is US-only and from 2021/2022; UK/Canada/Australia/UAE-specific buyer behavior is not covered here and country snapshots should not be assumed to match this data.
- The reddit/Google-review buyer-discussion gap flagged in the first pass is still open. If it matters enough to close before primary VoC starts, the more reliable next move is probably a manual, human-run search session (logged-in Reddit search, or a tool like Ahrefs/Semrush's own review-mining) rather than another blind web-search pass — this is worth a note to Nivy rather than a third automated attempt.

---
*Next action: log this file's key findings in the Decision Log (done — see entry below), fold the CRM and Objection Playbook feeds into their respective files, then prioritize primary VoC interviews per the Bridge Plan — this closes out the planned secondary-research passes.*
