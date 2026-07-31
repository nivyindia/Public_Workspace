# FAQ — 10 Lead Verification

> Part of Stage 10 (Lead Verification). See [README.md](README.md) for the full stage overview.

---

**Q: Should "Risky" leads just be excluded automatically to be safe?**
A: Not automatically — that discards genuinely reachable leads unnecessarily. Route them to manual review instead; a quick supplementary check (domain legitimacy, LinkedIn activity) often resolves the ambiguity.

**Q: How long is a "valid" verification result good for?**
A: Contact data decays. A list unused for more than ~90 days should be re-verified before being reused for a new campaign rather than assumed still valid.

**Q: Do we need phone verification for every campaign?**
A: Only where cold-calling is part of the campaign. Email-only campaigns don't need the added cost of phone verification.

**Q: What's the difference between this stage and Stage 09 (Data Cleaning)?**
A: Data Cleaning fixes formatting and removes duplicates/dead records — it's about internal CRM hygiene. Verification confirms external deliverability — whether the contact channel will actually reach a real, current person. A record can be perfectly clean and formatted and still fail verification.

**Q: What happens if bounce rate creeps up despite verification?**
A: Pause sending, audit the source (Stage 05) and verification tool accuracy, and re-clean the active list — a rising bounce rate despite verification often signals either a stale list being reused past its shelf life or a verification tool whose accuracy has degraded.

---

## Cross-References

- Stage README: [README.md](README.md)
