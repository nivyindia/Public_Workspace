# Tools — 23 Deliverability and Domain Health

[⬅ Back to README](README.md)

_Pricing figures are approximate — verify current pricing before purchase._

| Tool | Purpose | Pricing (approx., verify) | OSS/Free Alt | API/Automation |
|---|---|---|---|---|
| Google Postmaster Tools | Gmail-side domain reputation/spam-rate data | Free | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Limited API |
| MXToolbox | SPF/DKIM/DMARC verification and blacklist checks | Free tier + paid | check-if-email-exists (OSS CLI/API, self-hosted SMTP verification) | Limited |
| Instantly / Apollo native deliverability dashboards | Per-mailbox bounce/complaint tracking bundled with sequencer tools | Bundled with Stage 16 tool cost | Metabase (OSS BI/dashboards) | API |
| Mailwarm / Warmup Inbox | Ongoing warm-up maintenance for existing mailboxes | ~$15-30/mo | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | Limited |
| Twilio number health / carrier lookup | Phone number reputation checks | Usage-based | No direct match in the declared OSS stack (Odoo/Mautic/Documenso/NocoDB-Baserow/Ollama) — evaluate case-by-case rather than force-fit | API |

## Selection Notes
- Google Postmaster Tools is free and gives the most authoritative Gmail-side reputation signal; it should be set up for every sending domain regardless of what other paid tools are in use.
