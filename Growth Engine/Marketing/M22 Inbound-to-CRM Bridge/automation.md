# M22 — Inbound-to-CRM Bridge: Automation

All four confirmed workflows below are n8n workflows already running in production (per the source docs, Section SD-08 Automation, last updated May 2026). They are reproduced here in the Track M structure so this stage links to the exact node sequence rather than restating it as new work.

## 22A — Website Form → CRM {#22a}

**Trigger:** Website form submitted (HubSpot form, Typeform, or custom form)

1. n8n Webhook trigger node receives the form payload
2. HubSpot: Create/Update Contact — email is the unique identifier
3. HubSpot: Create Deal — linked to the contact, stage = "New Lead"
4. Send email/Slack notification to the founder with lead details
5. (Optional) HubSpot: Enrol contact in a welcome email sequence

**Field mapping:** `form.first_name → firstName`, `form.email → email`, `form.company → company`, `form.service → serviceInterest`, `form.country → country`

**Setup:** create the webhook trigger in n8n, paste its URL into the form tool's submission-action/webhook setting, authenticate the HubSpot node, map fields, add the deal-creation and notification nodes, test with a live submission, activate.

## 22B — Chatbot → CRM {#22b}

**Trigger:** New chat conversation / email captured (Tidio or Chatwoot)

1. Chatbot tool's webhook fires on new-visitor-email-captured (Tidio) or `conversation_created` (Chatwoot)
2. n8n receives: name, email, conversation snippet
3. HubSpot: Create/update contact, set `Lead Source = Website Chat`
4. HubSpot: Create deal in "New Lead" stage
5. Notify founder

**Field mapping:** `contact.email → email`, `contact.name → firstName`, `conversation.summary → notes`, hardcoded `"Website Chat" → lead_source`

## 22C — Cal.com Booking → CRM {#22c}

**Trigger:** `BOOKING_CREATED` webhook from Cal.com

1. Webhook receives attendee name, email, booking time, intake-form answers
2. HubSpot: search contact by email
3. If exists: update contact, move deal to "Meeting Booked"
4. If new: create contact + deal directly in "Meeting Booked" stage
5. Send a prep email to the prospect (confirmation, meeting link, 2-3 pre-call questions — template in [templates.md](templates.md))
6. Create a CRM task: "Prep for call with [Name]", due 30 minutes before the meeting

## 22D — WhatsApp → CRM {#22d}

**Trigger:** New WhatsApp message (via Chatwoot's WhatsApp Business API inbox)

**Prerequisites:** Chatwoot set up with a WhatsApp Business API inbox; WhatsApp Business API approved (via 360Dialog or Meta directly); n8n connected to Chatwoot via webhook.

1. Chatwoot webhook fires on `conversation_created`
2. n8n extracts phone number, name (if given), initial message
3. HubSpot: search by phone
4. If new: create contact with phone + `Source: WhatsApp`
5. HubSpot: create a note logging the message
6. HubSpot: create task "Reply to WhatsApp from [phone/name]" — due in 2 hours
7. Notify founder (SMS or email) with a message preview

**Privacy rule (non-negotiable, carried from the source workflow):** WhatsApp numbers are personal data. Use only for replying to that enquiry. Never add to a marketing list without explicit separate consent.

## 22E — Social DM/Comment → CRM (manual, no automation yet)

No webhook-based automation exists for this sub-bridge. Current method is manual daily entry by the M11/M12 channel owner — see [methods.md](methods.md#social-dm) for why, and for the two realistic paths (paid unified social inbox, or a browser-automation agent) if this needs to move to semi-automated later.

## 22F — Newsletter Reply/Opt-in → CRM (semi-automated, written fresh)

Where the ESP (Mailchimp or Listmonk, per the shared free/OSS stack) supports a subscribe webhook, apply the same create/update-contact node pattern as 22A/22B with `Source = Email Newsletter`. Where it doesn't, a weekly manual export/import from the ESP's subscriber list is the fallback until a webhook path is confirmed.

---

## Error Recovery (all channels)

- If a HubSpot API call fails mid-workflow, n8n's built-in retry (with backoff) is used before falling back to a founder-notification of the failure — a silently-dropped webhook is worse than a delayed one
- Webhook URLs are treated as semi-secrets — regenerate and re-paste into the source tool if a workflow shows unexplained duplicate/spam entries
