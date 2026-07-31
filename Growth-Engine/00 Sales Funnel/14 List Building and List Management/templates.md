# 14 List Building and List Management — Templates

[⬅ Back to README](README.md)

---

## List Naming Convention

`[SegmentName]_[CampaignType]_[BuildDate]` e.g. `FounderCEO-Tier1_ColdEmail_2026-07-19`

## List Metadata Card (one per list)

```
List Name: ___
Source Segment: ___ (from Stage 12)
Build Date: ___
Owner: ___
Lead Count: ___
Suppression Check: [ ] Completed — Date: ___ — Removed: ___
Cross-List Dedup Check: [ ] Completed — Date: ___ — Removed: ___
Status: Draft / Active / Expired / Archived
Assigned Campaign: ___
Expiry Date: ___
```

## Suppression List Entry Format

| Contact/Email | Reason | Date Added | Source Stage |
|---|---|---|---|
| example@company.com | Unsubscribed | 2026-07-01 | Stage 24 Follow Up |
| example2@company.com | Bounced (hard) | 2026-07-05 | Stage 10 Verification |
| example3@company.com | Existing Customer | 2026-06-20 | Stage 40 Onboarding |

## Pre-Send Go/No-Go Summary Template (for AI-assisted or manual review)

```
List: [name]
Total leads: [n]
Suppression matches removed: [n]
Near-duplicate flags for review: [n] — [list or attach]
Segment composition: [persona/geo/tier breakdown]
Recommendation: GO / HOLD — [reason if HOLD]
```

## List Expiry Rule Template

| List Type | Default Expiry | Rebuild Trigger |
|---|---|---|
| Static, one-off campaign | 14 days from build | Campaign concludes or expiry reached |
| Dynamic/smart list | N/A (auto-refreshing) | N/A — always current |
| Event-triggered list (e.g., webinar attendees) | 30 days from event | Campaign concludes or expiry reached |

[⬅ Back to README](README.md) · [Next: resources.md](resources.md)
