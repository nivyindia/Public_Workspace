# Templates — 08 Lead Enrichment

> Part of Stage 08 (Lead Enrichment). See [README.md](README.md) for the full stage overview.

---

## Enrichment Record Template

```markdown
**Lead ID:**
**Company Size:**
**Industry / Sub-Industry:**
**Tech Stack:**
**Annual Revenue Estimate:**
**Founding Year:**
**LinkedIn Company URL:**
**Recent Signal (funding/news/hiring):**
**Enrichment Confidence:** Tool-Confirmed / AI-Inferred / Missing
```

## Segmentation Tag Taxonomy (fixed enum — reuse exactly)

```markdown
| Tag Type | Example Values |
|---|---|
| Country | country:uk, country:us, country:uae, country:au, country:in, country:ca |
| Industry | ind:ecommerce, ind:realestate, ind:tech, ind:accounting, ind:legal, ind:healthcare |
| Company size | size:solo, size:small (2-10), size:mid (11-50), size:large (50+) |
| Service interest | svc:va, svc:accounting, svc:marketing, svc:webdev, svc:automation |
| Lead source | src:apollo, src:linkedin, src:website, src:referral, src:maps, src:social |
| Lead status | status:cold, status:warm, status:hot, status:client, status:lost, status:partner |
```

---

## Cross-References

- Stage README: [README.md](README.md)
- Checklists: [checklists.md](checklists.md)
