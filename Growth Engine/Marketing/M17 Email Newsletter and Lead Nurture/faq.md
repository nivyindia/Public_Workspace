# M17 — FAQ

**Q: Listmonk (self-hosted) or Mailchimp (free tier) — which should we actually use?**
Listmonk avoids Mailchimp's free-tier subscriber/send caps and gives full control over deliverability infrastructure, at the cost of needing basic self-hosting setup (which the business already does for n8n, so the operational overhead is incremental, not new). Mailchimp is faster to set up if self-hosting isn't feasible right now. Either is a valid starting choice — the decision matters less than actually building the sequences well.

**Q: How is the newsletter (M17.4) different from the nurture sequences (M17.3)?**
Nurture sequences are triggered, segmented, and time-bound — they run once per subscriber based on where they entered the funnel. The newsletter is an ongoing, recurring send to the whole active list, not tied to a specific entry trigger. A subscriber typically finishes their nurture sequence and then transitions into receiving the regular newsletter.

**Q: What counts as "sales-ready" for the M17.6 handoff?**
Defined explicitly per `templates.md`'s signal definitions — not a vague sense that someone "seems interested." Explicit, observable signals (specific link clicks, reply, engagement threshold) keep the handoff to M22 consistent and avoid flooding sales with unqualified leads.

**Q: Do consent requirements really differ across the US/UK/Canada/Australia/UAE markets this business targets?**
Yes, in meaningful ways (e.g., differing opt-in/opt-out defaults and disclosure requirements across jurisdictions) — this is flagged as something to confirm per-market in `checklists.md` rather than assumed uniform, since email compliance rules are genuinely not identical across these five markets and getting this wrong has real deliverability and legal consequences.
