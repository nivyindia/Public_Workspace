# Tools — 37 Closing Techniques

[⬅ Back to README](README.md)

> Pricing is approximate and sourced from internal docs — **verify current pricing on the vendor site before purchase**, as B2B SaaS pricing changes frequently.

---

## Tier 1 — Proposal View/Open Tracking (Shared with Stage 33)

| Tool | Purpose | Pricing (approx.) | OSS/Free Alt | API |
|---|---|---|---|---|
| HubSpot Quotes | Proposal view/open tracking — surfaces buying-signal timing | Free–paid, verify current pricing | Free tier | Native |
| PandaDoc / Proposify | Same tracking function, shared pipeline with Stages 33/34 | Paid, verify current pricing | — | API |
| Documenso | If contracts are already routed through Documenso (Stage 36), its own view events can double as a late-stage signal | Free (self-hosted) | This *is* the OSS option | Yes |

---

## Tier 2 — CRM Deal-Stage Tracking

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| HubSpot CRM | Records Closed Won / Closed Lost and stage-transition timing | Free with HubSpot | Free tier | Native |
| Odoo CRM | Same function, OSS-native | Free (Community) | This *is* the OSS option | Yes |

---

## Tier 3 — Signal-Triggered Drafting & Routing

| Tool | Purpose | Pricing | OSS/Free Alt | API |
|---|---|---|---|---|
| Claude / GPT (API) | Draft signal-referencing nudges, one-line signal-strength summaries | Usage-based | Ollama (self-hosted, free) | Yes |
| n8n | Orchestrates tracking-event → signal check → nudge draft → deal-stage routing | Free (self-hosted) | This *is* the OSS option | Native |

---

## Selection Notes

- No dedicated "closing" tool exists separate from the proposal tracking and CRM already used in Stages 33/35/36 — this stage is a discipline layered on existing tooling, not a new tool category.
- The same view/open tracking data doubles as this stage's only meaningful automatable input — there's no separate "closing signal" data source to stand up.

---

## Cross-References

- Stage README: [README.md](README.md)
- Method-by-method usage: [methods.md](methods.md)
- Automation pipelines using these tools: [automation.md](automation.md)
- Shared tracking with: [33 Proposal Creation](../33 Proposal Creation/README.md)
- Follow-up cadence shared with: [24 Follow Up Systems](../24 Follow Up Systems/README.md)
