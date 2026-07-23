# Checklists — 07 Contact Discovery

> Part of Stage 07 (Contact Discovery). See [README.md](README.md) for the full stage overview.

---

## Per-Lead Discovery Checklist

- [ ] Checked if a verified email/phone already exists in the source record (e.g. Apollo export) before running additional discovery
- [ ] Domain-pattern lookup attempted if no existing contact
- [ ] LinkedIn-to-email enrichment attempted if domain-pattern lookup fails
- [ ] Website contact-page fallback attempted if tool-based methods fail
- [ ] Any pattern-inferred email explicitly flagged as such, not marked verified
- [ ] Leads unresolved after all reasonable attempts tagged `Contact Unresolved`, not left ambiguous

## Batch-Level Checklist

- [ ] Discovery method logged for every resolved contact
- [ ] Resolution rate calculated for the batch and compared against the >80% benchmark
- [ ] Unresolved leads routed to Manager review, not silently dropped

## Quality Control Gates

- [ ] Every resolved email passes basic format validation before handoff to Stage 08
- [ ] No contact sourced from unauthorized data-breach sources or unknown-provenance purchased lists

---

## Cross-References

- Stage README: [README.md](README.md)
- Templates: [templates.md](templates.md)
