# 14 List Building and List Management — FAQ

[⬅ Back to README](README.md)

---

**Q: What's the difference between a segment (Stage 12) and a list (Stage 14)?**
A segment is a persistent category a lead belongs to (e.g., "Founder-CEO, US, Tier1"). A list is a bounded, campaign-specific set of leads pulled from one or more segments at a point in time, suppression-checked and deduplicated, ready to actually be contacted.

**Q: Why not just email the whole segment directly instead of building a list?**
Segments update continuously as new leads qualify; a list is a snapshot with defined ownership and suppression checks. Sending directly to a live segment risks emailing someone mid-onboarding into that segment who hasn't been suppression-checked yet, or double-sending to someone already on another active campaign.

**Q: How long can a static list be reused?**
Per the default expiry rules in [templates.md](templates.md) — typically 14 days for a one-off campaign list. Beyond that, contact data may have changed (new suppressions, updated scores) and the list should be rebuilt.

**Q: What if the same lead qualifies for two different campaigns at once?**
This is a deliberate exception, not an error — but it must be logged (see Section 8 Validation Rules in [README.md](README.md)) so the team is aware a lead is being touched by two campaigns simultaneously and can coordinate messaging/timing.

**Q: Who owns the suppression list?**
A single designated owner, same governance model as the CRM field dictionary in Stage 13 — uncontrolled edits to the suppression list are a compliance risk.

[⬅ Back to README](README.md) · [Next: references.md](references.md)
