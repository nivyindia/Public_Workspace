# 13 CRM Setup and Data Structuring — FAQ

[⬅ Back to README](README.md)

---

**Q: Which CRM should we start with?**
HubSpot Free is the documented default for this funnel at early stage — it's free, has the core contact/deal structure needed, and every gap (like native scoring) can be filled with n8n until an upgrade is justified. See [tools.md](tools.md) for alternatives.

**Q: When should we upgrade to a paid tier?**
When native automation/scoring becomes cheaper than maintaining n8n workflows, or when API rate limits on the free tier start blocking legitimate volume — not on a fixed schedule.

**Q: Who is allowed to create new CRM fields?**
One designated owner, via the New Field Request process in [templates.md](templates.md). Unmanaged field creation is the single biggest cause of CRM schema drift and broken automations.

**Q: What happens if a downstream stage needs a field this stage didn't anticipate?**
It goes through the same New Field Request process — this stage's field dictionary is a living document, updated whenever a legitimate new requirement surfaces, not a one-time artifact.

**Q: How does this stage relate to Stage 09 (Data Cleaning)?**
Stage 09 cleans data *within* leads (deduping, normalizing values). Stage 13 defines the *structure* those values live in. A clean dataset poured into a badly structured CRM is still unusable; a well-structured CRM with dirty data still needs Stage 09.

[⬅ Back to README](README.md) · [Next: references.md](references.md)
