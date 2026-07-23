# M22 — Inbound-to-CRM Bridge: Methods

## Field Standard {#field-standard}

M22 reuses the CRM field and Status vocabulary already defined in **SOP-VA-011 (CRM Entry & Status Update)**, the live standard for the outbound Sales Funnel. Every inbound bridge writes into these same fields — no inbound-only schema is created.

### Required fields (every lead, inbound or outbound)

| Field | Rule |
|---|---|
| Lead Name | Full name if known; blank only if a company-only lead |
| Company Name | Exactly as given/found — no abbreviating |
| Email | Only if verified/given directly (never guessed) |
| Phone | With country code |
| Market | From the fixed list (India / US / UK / Canada / AU / UAE / Other) |
| Source | Fixed enum — see below, not free text |
| Date Added | yyyy-mm-dd |
| Assigned Owner | Whoever's queue the lead lands in |
| Status | From the approved list only |
| First Contact Date / Last Contact Date | Set on entry, updated after every touch |
| Follow-Up Stage | FU0 (not yet contacted) through FU4 |
| Notes | 1-2 lines of context — for inbound leads, this is the AI-assisted conversation summary described in the AI Section of README.md |

### Approved Status values (exact — no custom labels)

`New` → `Contacted` → `Following Up` → `Interested` → `Booked` → `Called` → `Closed Won` / `Closed Lost` / `Dead`

Every inbound lead enters at **Status = New**. A lead that already booked a call via Cal.com before ever being "contacted" by a human still enters at New and is moved to Booked by the same automation — it does not skip into a status a human hasn't verified.

### Source enum for inbound channels

`Website` · `Website Chat` · `WhatsApp` · `Cal.com Booking` · `Email Newsletter` · `Social DM` · `Referral` · `Other`

This extends (does not replace) the outbound Source enum already used in Sales Funnel Stage 06 (`linkedin`, `google_maps`, `apollo`, `job_portal`, `directory:<name>`, `event:<name>`) — the combined set is what Stage 06's CRM view actually contains once M22 is wired in.

---

## Per-Channel Method

### 22A/22B — Website Form & Chatbot

Both are webhook-triggered: the form or chat tool fires a payload the moment a visitor submits, no polling needed. See [automation.md](automation.md#22a) for the exact n8n node sequence. The only manual step is confirming the mapped field values (e.g., `service` dropdown value → correct `Service Interest` CRM property) match what M02/M03's messaging framework actually calls the services — a mismatch here silently breaks Stage 21 reporting's channel/service breakdown.

### 22C — Cal.com Booking

Booking automatically implies Status = Booked and Deal stage = "Meeting Booked" — this is the one inbound channel that starts a lead further down the funnel than New/Contacted, which is why the automation searches for an existing contact first (a prospect may have already been in the CRM at an earlier status from a prior form fill) rather than always creating new.

### 22D — WhatsApp

WhatsApp is treated differently from the others for one reason: phone numbers submitted for a specific enquiry are personal data by nature. The method here is: log the message as a CRM note for follow-up purposes only, create the reply task, and do **not** add the number to any broadcast/marketing list without the person's separate, explicit opt-in — this rule is carried directly from the source n8n workflow's own privacy note and is treated as non-negotiable, not a style preference.

### 22E — Social DM / Comment-to-DM {#social-dm}

No dedicated internal doc or n8n workflow exists yet for this sub-bridge (unlike 22A-22D, which are already wired) — this section is written fresh rather than mined. Most platforms (LinkedIn, Instagram) don't expose a DM-received webhook on the free/organic tier the way a website form does, so the realistic method at this stage is manual: whoever manages M11 (LinkedIn) or M12 (Instagram) copies a qualified DM conversation into the CRM using the same field standard above, tagging Source = Social DM, at least once per day rather than in real time. This is a QC gap worth flagging to the founder rather than papering over with a fabricated automation: a real-time bridge here would need either a paid inbox tool (e.g., a unified social inbox product) or a browser-automation agent watching the DM inbox, neither of which is confirmed in use.

### 22F — Newsletter Reply / Lead-Magnet Opt-in {#newsletter}

M17's newsletter platform (per the shared tool stack: Mailchimp free tier or self-hosted Listmonk) exports new-subscriber events. Where the ESP supports a webhook (Mailchimp does via its API; Listmonk requires a small custom webhook), the same create/update-contact node pattern from 22A applies, with Source = Email Newsletter. Where no webhook exists, a weekly manual export-and-import from the ESP's subscriber list is the fallback — written fresh, since no existing internal doc covers this specific export step.

---

## Duplicate Handling (all channels)

Every automation searches the CRM by email (or phone, for WhatsApp) **before** creating a new contact — this mirrors the existing HubSpot n8n workflows exactly ("If exists: update; if new: create"). A duplicate is never created "to be safe"; an existing contact is updated and its Status only ever moves forward, never backward, without a human override.
