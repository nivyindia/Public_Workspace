# 11 Lead Scoring and Prioritization — Checklists

[⬅ Back to README](README.md)

---

## Daily QC Gate (Before Scores Are Trusted for Outreach)

- [ ] Every lead with Status = Verified (Stage 10) has a non-null Total Score
- [ ] Fit score components (role, company size, geography, industry) match current CRM field values — not stale data from initial entry
- [ ] Behavior score reflects activity from the CRM's own tracking log, not manual guesswork
- [ ] Tier label matches the score band exactly (no manual override without a logged reason)
- [ ] Hot/Priority leads have a Slack/email alert timestamp within 24 hours of crossing threshold
- [ ] No lead shows a negative-signal disqualifier (spam complaint, opt-out) while still tagged Hot/Priority

## Weekly Audit

- [ ] Sample 10% of scored leads; manually recompute score against the rule table; confirm match
- [ ] Check score-to-outcome correlation — are Hot leads actually converting/booking at a higher rate than Warm? If not, flag rule weights for review
- [ ] Confirm score decay ran for leads inactive > 30 days
- [ ] Review any leads stuck at the same score for 60+ days with no re-engagement — candidates for re-qualification or archival

## Rule-Change Control

- [ ] Any change to point values in the rule table is dated and logged (who changed it, why, what changed)
- [ ] Rule changes are not applied retroactively to already-scored leads without an explicit batch re-score decision
- [ ] Major rule changes (e.g., adding a new negative signal) are tested on a small sample before full rollout

## Common Failure Points to Check

- [ ] Duplicate webhook events double-counting behavior points (see idempotency guard in [automation.md](automation.md))
- [ ] Leads missing company-size or title data defaulting to a mid-range fit score instead of being flagged incomplete
- [ ] Alert fatigue — threshold set so low that #sales is flooded and real Hot leads get lost in noise

[⬅ Back to README](README.md) · [Next: templates.md](templates.md)
