# FAQ — 23 Deliverability and Domain Health

[⬅ Back to README](README.md)

**Q: How often should we check domain/number health?**
At least weekly for all identities; daily during any active high-volume campaign. See [checklists.md](checklists.md).

**Q: What's the difference between this stage and Stage 16's mailbox setup?**
Stage 16 covers setting up a single mailbox correctly the first time. This stage covers the ongoing, cross-channel monitoring discipline once multiple identities are running simultaneously across a team.

**Q: Can a blacklisted domain be rehabilitated?**
Sometimes, but it takes time and reduced volume — the decision to attempt rehabilitation vs. retire and start fresh should weigh how business-critical that specific domain is against the time cost of rehabilitation.

**Q: Should we spread volume across multiple mailboxes/numbers by default?**
Yes — identity rotation (Sub-Stage 23E) reduces the blast radius if any single identity gets flagged, and is standard practice once volume justifies more than one sending identity.

**Q: Who decides whether to pause a flagged identity?**
A named team member per the incident-response workflow — this should not be left to automation alone, since pausing affects live campaigns.
