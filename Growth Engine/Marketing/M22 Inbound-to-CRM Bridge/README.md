# 22 Inbound-to-CRM Bridge

> **Stage 22 of 22** in the Marketing / Demand-Generation Funnel (Track M).
> Status: 🟡 Built to pilot depth (Batch 7). Phase H — Measurement & Bridge.

---

## Navigation

- ⬅ Previous stage: [21 Marketing Analytics and Reporting](../M21%20Marketing%20Analytics%20and%20Reporting/README.md)
- 🏠 [Marketing Funnel home](../README.md)
- 🔗 Feeds into: [Sales Funnel — 06 Lead Extraction](../../Sales%20Funnel/06%20Lead%20Extraction/README.md)
- Files in this folder: [methods.md](methods.md) · [tools.md](tools.md) · [automation.md](automation.md) · [checklists.md](checklists.md) · [templates.md](templates.md) · [resources.md](resources.md) · [faq.md](faq.md) · [references.md](references.md)

---

## 1. Stage Overview

**Objective:** Take every inbound lead signal that Track M produces — a website form submission, a chatbot email capture, a WhatsApp enquiry, a Cal.com call booking, a LinkedIn DM, a newsletter reply — and land it in the CRM with the same field standard and status vocabulary the outbound Sales Funnel already uses, so it enters **Sales Funnel Stage 06 (Lead Extraction)** as a same-class record rather than a second, inconsistent lead pool.

**Purpose:** Track M's 21 upstream stages (Brand through Analytics) exist to generate attention and traffic. None of that has commercial value until a lead is captured, tagged with its true source, and handed to the same pipeline (Stage 07 Contact Discovery → close) that outbound leads already flow through. M22 is the only stage in Track M whose job is not to generate more inbound activity, but to make sure none of the activity the other 21 stages already generated leaks out of the CRM. A marketing funnel that drives traffic without a working bridge is producing noise, not leads.

**Inputs:**
- Website contact/lead forms (from M09 long-form content pages, M02-selected landing pages)
- Chatbot conversations with email captured (Tidio/Chatwoot widget on the website)
- WhatsApp Business enquiries (organic + from M16 Secondary Platforms WhatsApp Broadcast)
- Cal.com / booking-page call requests
- Newsletter reply-to responses and lead-magnet opt-ins (M17)
- Social DMs and comment-to-DM flows (M11–M16)
- UTM/source data from M21's tracking setup, so each of the above arrives with a true source tag, not a guess

**Outputs:**
- Every inbound lead entered in the CRM using the same field schema and Status vocabulary as SOP-VA-011 (see [methods.md](methods.md#field-standard)), with `Source` correctly tagged to its inbound channel
- The lead visible in Sales Funnel Stage 06's Lead Tracker / CRM view with Status = `New`, ready to be picked up by Stage 07 (Contact Discovery) or directly by the sales team if contact details are already complete
- A same-day "inbound leads captured" count, broken out by source channel, feeding M21's reporting

**Expected Result:** Zero inbound leads lost between the moment someone fills a form, messages on WhatsApp, or books a call, and the moment a human on the sales side sees them in the CRM with full context — matching the "if it's not in CRM, it doesn't exist" rule the outbound funnel already runs on.

---

## 2. Why This Stage Exists (and why it's built last)

The build order in `IMPLEMENTATION-PLAN.md` §4 puts M22 in the final batch deliberately: it depends on every upstream stage producing the traffic/leads it bridges, and it depends on M21's tracking setup to tag each lead with a real source. Building it earlier would mean building an integration for channels that don't have traffic yet.

**The gap this closes:** without M22, each inbound channel (chatbot, WhatsApp, forms, bookings) either has no CRM connection at all, or connects into a CRM record that doesn't match the outbound Status/field vocabulary — meaning the sales team has to manually reconcile two lead formats before Stage 07 can even start. M22's job is to make that reconciliation automatic.

---

## 3. Where Leads Land

**Production reality (as of the source docs, May 2026):** inbound leads are wired into **HubSpot CRM** via n8n, not the Odoo/SuiteCRM target named in `IMPLEMENTATION-PLAN.md` §2's free/OSS tool table. That table's Odoo/SuiteCRM entry describes a target for the separate commission-only aggregator build, not the agency's own inbound pipeline, which already runs on HubSpot's free tier. This file documents what's actually wired (HubSpot) and flags the free/OSS alternative path where it diverges — see [tools.md](tools.md).

Either way, the destination contract is the same: a lead record with the outbound funnel's required fields, entered with Status `New`, visible to whoever owns Sales Funnel Stage 06/07.

---

## 4. Sub-Bridges (per inbound channel)

| Sub-Bridge | Trigger | Destination | Detail |
|---|---|---|---|
| **22A** Website Form → CRM | Website/landing-page form submitted | Contact + Deal created, Source = Website | [automation.md](automation.md#22a) |
| **22B** Chatbot → CRM | Chatbot captures an email (Tidio/Chatwoot) | Contact + Deal created, Source = Website Chat | [automation.md](automation.md#22b) |
| **22C** Booking → CRM | Cal.com call booked | Contact updated, Deal stage = Meeting Booked, prep email sent | [automation.md](automation.md#22c) |
| **22D** WhatsApp → CRM | WhatsApp Business message received | Contact created, conversation logged as note, follow-up task created | [automation.md](automation.md#22d) |
| **22E** Social DM/Comment → CRM | LinkedIn/Instagram DM or comment-to-DM reply (M11/M12) | Manual/semi-auto entry — no native webhook on most platforms; see [methods.md](methods.md#social-dm) | |
| **22F** Newsletter Reply/Opt-in → CRM | Lead-magnet opt-in or reply-to response (M17) | Contact created/updated, Source = Email Newsletter | [methods.md](methods.md#newsletter) |

---

## 5. Field Standard

M22 does not invent a new schema. It maps every inbound channel's payload onto the exact field and Status standard already defined for the outbound funnel in SOP-VA-011, so Stage 06/07 never has to special-case an inbound lead. Full field table and the approved Status list are in [methods.md](methods.md#field-standard).

---

## 6. AI Section

**How AI can help:**
- Summarizing a chatbot or WhatsApp conversation thread into the CRM `Notes` field in the 1-2 line format SOP-VA-011 requires, instead of pasting the raw transcript
- Classifying inbound message intent (pricing question / support question / genuine sales enquiry) before a task is created, so low-intent chatbot chatter doesn't create noise tasks for the sales team
- Drafting the founder/sales-team notification message and the prospect-facing prep email (as already templated in the Cal.com workflow) from the raw booking payload
- Flagging likely-duplicate contacts (same company, different email/phone) for a human merge decision before two deals get created for one lead

**Prompt example:**
```
"Here is a raw WhatsApp conversation thread: [paste]. Summarize it into a
single CRM note of 1-2 lines covering: what they're asking for, any pain
signal, and any budget/timeline mentioned. Do not invent details not in
the thread."
```

**Agent workflows:** The n8n workflows in [automation.md](automation.md) already chain webhook → CRM search/create → notify without an LLM step; an LLM node can be inserted between "receive payload" and "write to CRM" purely for the note-summarization and intent-classification tasks above — never for inventing missing contact fields.

**Human-in-the-loop rule:** Per the standing QC rule in `IMPLEMENTATION-PLAN.md` §6, AI-drafted notes and intent classifications are reviewed, not auto-published — an incorrectly classified inbound lead that gets silently dropped is worse than one that takes a human a minute to triage.

---

## 7. Quality Control

Full checklist in [checklists.md](checklists.md). Summary gates before a batch of inbound leads is considered "bridged":
- [ ] Every inbound lead has a CRM record with Status populated (never blank)
- [ ] `Source` field uses the fixed enum, not free text
- [ ] No duplicate contact created for an existing lead (searched by email/phone first)
- [ ] WhatsApp/chatbot leads have a follow-up task created, not just a logged note
- [ ] Personal contact data (WhatsApp numbers, phone) used only for the enquiry's own follow-up, never auto-added to a marketing list without consent

---

## 8. KPIs

| Metric | Benchmark | Notes |
|---|---|---|
| Inbound lead capture rate | 100% of form/chat/booking/WhatsApp events produce a CRM record | Anything below 100% means a webhook or integration is broken |
| Time from inbound event to CRM record | < 5 minutes (automated channels) | Per the n8n workflows in automation.md |
| Time from WhatsApp/chatbot lead to founder notification | < 2 hours (SLA in the WhatsApp workflow) | Matches the "reply to WhatsApp" task due-time |
| Duplicate contact rate | < 5% | Checked via CRM search-by-email/phone before create |
| % of inbound leads with correct Source tag | 100% | Free-text or missing Source breaks M21 channel-attribution reporting |

---

## 9. Templates

See [templates.md](templates.md) for the CRM field template, the founder-notification message format, and the Cal.com prep-email template.

---

## 10. Resources & References

See [resources.md](resources.md) and [references.md](references.md).

---

## Cross-References

- **Previous stage:** [21 Marketing Analytics and Reporting](../M21%20Marketing%20Analytics%20and%20Reporting/README.md) — supplies the source/UTM tagging that makes M22's `Source` field accurate
- **Bridges into:** [Sales Funnel — 06 Lead Extraction](../../Sales%20Funnel/06%20Lead%20Extraction/README.md), then flows through Stage 07 (Contact Discovery) onward like any outbound lead
- **Also feeds from:** M09 (Long-Form Content Production, via website forms), M17 (Email Newsletter, via opt-ins), M11–M16 (Social Channels, via DMs), M16 (WhatsApp Broadcast)
- **Automation file:** [automation.md](automation.md)
- **Tools file:** [tools.md](tools.md)

> **Source note:** This stage was populated using operational material already in production at Nivy Digital — SOP-VA-011 (CRM Entry & Status Update), the "6. CRM & Tracking System" SOP, the HubSpot CRM Setup & Configuration Guide, and n8n Workflows 1, 2, 3, and 7 (Website Form, Chatbot, Cal.com Booking, and WhatsApp → CRM). Generalized here for the Track M context. Sub-Bridge 22E (Social DM/Comment) has no dedicated internal automation doc and is written fresh, marked as such in methods.md. Pricing and platform details are approximate as of the source docs' last update (May 2026) and should be verified before operational use.
