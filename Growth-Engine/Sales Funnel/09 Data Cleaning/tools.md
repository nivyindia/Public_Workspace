# Tools — 09 Data Cleaning

> Part of Stage 09 (Data Cleaning). See [README.md](README.md) for the full stage overview.
> Pricing is approximate — verify current pricing before purchase.

---

| Tool | Purpose | Pricing (approx.) | Free/OSS Alt | API | Notes |
|---|---|---|---|---|---|
| CRM native dedup tools (HubSpot, etc.) | Built-in duplicate detection | Included in CRM tier | Odoo Community (CRM module, self-hosted, free) | Yes | First line of defense before manual review |
| Google Sheets / Excel | Manual sort-and-scan cleaning workflow | Free | LibreOffice Calc (free) | Limited | Sufficient for smaller CRMs or manual SOP execution |
| OpenRefine | Bulk data-cleaning and formatting standardization | Free, open-source | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | No | Strong for large-scale formatting fixes |
| Claude / ChatGPT (with CSV upload) | AI-assisted fuzzy duplicate flagging and formatting-violation scan | Subscription, ~$20/mo | Ollama / Open WebUI (self-hosted LLM — avoids sending data to a paid API) | API available | See [README.md §7](README.md#7-ai-section) |
| Reoon / NeverBounce | Email format/deliverability check feeding into cleaning flags | ~$10/mo+ | check-if-email-exists (OSS CLI/API, self-hosted SMTP verification) | Yes | Shared with Stage 10 verification tooling |

---

## Cross-References

- Stage README: [README.md](README.md)
- Methods file: [methods.md](methods.md)
