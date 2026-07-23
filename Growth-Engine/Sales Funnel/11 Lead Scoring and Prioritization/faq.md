# 11 Lead Scoring and Prioritization — FAQ

[⬅ Back to README](README.md)

---

**Q: Do we need a paid CRM tier to do lead scoring?**
No. The manual VA process and the n8n semi-automated workflow both run on free-tier CRM. A paid tier removes the maintenance overhead of the automation but isn't required to start scoring.

**Q: What's the difference between fit score and behavior score?**
Fit score reflects *who the lead is* (role, company size, geography) — mostly static, recalculated when profile data changes. Behavior score reflects *what the lead has done* (opens, clicks, bookings) — cumulative, updates on every tracked event.

**Q: A lead scores high on fit but has done nothing (no opens, no visits) — is it Hot?**
No. Fit alone doesn't cross the Hot threshold under the 100-point model — behavior points are what push a fit-qualified lead into Hot/Priority territory. A high-fit, zero-behavior lead should sit in a nurture sequence, not active outreach.

**Q: Should scores ever decrease over time?**
Yes — score decay for inactivity (see [checklists.md](checklists.md) weekly audit) prevents a lead that was Hot 60 days ago but has gone silent from continuing to consume priority outreach time.

**Q: Who owns changing the scoring rule weights?**
The founder/senior stakeholder owns rule changes, logged per the Rule-Change Control section in [checklists.md](checklists.md). VAs apply the rules; they don't modify point values ad hoc.

**Q: What if a lead has incomplete data (no company size found)?**
Flag as "Fit Score Incomplete" rather than assigning a default score — see [automation.md](automation.md) error recovery. An incomplete score silently distorts prioritization if treated as a real number.

**Q: How does this stage relate to Stage 27 (Qualification — BANT/MEDDIC)?**
Stage 11 scoring is a lightweight, ongoing, largely automatable ranking signal used *before* a conversation happens. Stage 27's BANT/MEDDIC qualification is a deeper, conversation-based framework applied *after* a discovery call. Stage 11 decides who gets contacted first; Stage 27 decides whether a contacted lead is a real opportunity.

[⬅ Back to README](README.md) · [Next: references.md](references.md)
