# M22 — Inbound-to-CRM Bridge: FAQ

**Q: Does an inbound lead go into a separate "marketing leads" table, or the same CRM as outbound leads?**
The same one. M22's entire purpose is to avoid a second lead pool — every inbound lead lands with the same fields and Status vocabulary as an outbound lead in Sales Funnel Stage 06.

**Q: We use HubSpot in production, but the plan's tool table says Odoo/SuiteCRM. Which is correct?**
Both, for different things. HubSpot is what's actually wired via n8n today for the agency's own inbound pipeline. The Odoo/SuiteCRM recommendation in the plan's free/OSS tool table is aimed at the separate commission-only aggregator build, or at a future migration off HubSpot if its free-tier limits are hit. See README.md §3.

**Q: What happens if a lead messages on WhatsApp and later also fills out a website form?**
Every workflow searches for an existing contact by email or phone before creating a new one. The existing record is updated (not duplicated), and Status only moves forward, not backward.

**Q: Can we add a WhatsApp enquiry's number to our broadcast/newsletter list?**
Not without that person's separate, explicit opt-in. The number was given for one enquiry — using it for anything beyond replying to that enquiry is a privacy rule carried directly from the production workflow, not optional.

**Q: Why isn't Social DM (22E) automated like the other four channels?**
Because no such automation exists yet in the source material, and most platforms don't expose a DM-received webhook on their free/organic tiers. Rather than invent a tool or workflow that isn't confirmed, this is flagged as a manual process and a known gap.

**Q: Who owns following up on an inbound lead once it's in the CRM?**
Whoever's queue Stage 07 (Contact Discovery) normally assigns to — M22's job ends at getting the lead into the CRM correctly tagged; it does not change who works the lead next.
