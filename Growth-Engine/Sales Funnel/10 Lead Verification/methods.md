# Methods — 10 Lead Verification

> Part of Stage 10 (Lead Verification). See [README.md](README.md) for the full stage overview.

---

## Email Verification Method

```
Raw email list
     ↓
Basic syntax/format check (free, no credits used)
     ↓
Bulk verification tool (Reoon / NeverBounce)
     ↓
Valid (✅) → keep → proceed to outreach
Risky (⚠️) → flag → manual review
Invalid (❌) → discard immediately
Disposable (🚫) → discard, blacklist domain
     ↓
Clean, deliverability-confirmed list
```

## Phone Verification Method

- Format check (country code present, valid length for the country)
- Carrier/line-status check via a phone verification API where cold-calling volume justifies the cost
- Manual spot-check for smaller campaigns where a dedicated tool isn't cost-justified

## Role/Company Currency Check

- Spot-check a sample of leads (especially from older batches) against current LinkedIn profile and company site to catch role changes or company closures that verification tools won't catch
- Prioritize this check for high-value/high-score leads where a stale role would waste a high-effort outreach attempt

## Verification Philosophy (adapted from Nivy's due-diligence framework)

- **Process-based, not assumption-based** — a lead is treated as unverified until it passes an explicit check, not assumed valid because it came from a reputable source
- **Layered checks** — syntax check, then bulk verification, then (for high-value leads) manual role/company currency check — cheaper checks first, expensive checks reserved for leads that clear the cheaper filters
- **Re-verification over time** — verification status has a shelf life; leads unused for an extended period should be re-verified before being reused, not assumed still valid

## AI-Assisted Methods

- LLM-assisted triage of "Risky" classified leads using supplementary signal (see [README.md §7](README.md#7-ai-section))

---

## Cross-References

- Stage README: [README.md](README.md)
- Feeds into: [11 Lead Scoring and Prioritization](../11 Lead Scoring and Prioritization/README.md), [16 Email Outreach](../16 Email Outreach/README.md)
