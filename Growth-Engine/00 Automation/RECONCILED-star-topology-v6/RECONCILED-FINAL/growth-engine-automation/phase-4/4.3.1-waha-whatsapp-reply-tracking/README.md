# Module 4.3.1 — Waha WhatsApp Reply Tracking

**Plan ID:** 4.3.1 (Phase 4 — Missing Channels + Reply Tracking, master tracker §7)
**Status:** Built, not yet activated (needs `WAHA_WEBHOOK_SECRET` decision + one-time migration — see below)
**File:** `4.3.1-Waha-WhatsApp-Reply-Tracking.json`

## What it does

Waha calls this webhook on every WhatsApp session event (inbound message, outbound echo,
delivery ack, etc.). This workflow:

1. Validates a shared-secret header (if `WAHA_WEBHOOK_SECRET` is configured).
2. Parses the Waha payload and normalizes the sender's phone number.
3. Filters for genuine **inbound** replies only (`event = message`, `fromMe = false`).
4. Matches the phone number against `clients_master` (digit-only comparison, so formatting
   differences between how Waha reports numbers and how the number is stored don't break the match).
5. If matched: updates `clients_master.last_reply_channel = 'whatsapp'` and `last_reply_at`.
6. If not matched, or not an inbound reply, or auth fails: responds 200/401 without writing anything,
   and logs the outcome to the execution log.

## Trigger

Webhook — `POST /webhook/waha-whatsapp-reply`. Point Waha's session webhook config at this URL.

## Postgres schema — ONE-TIME SETUP REQUIRED

This module writes to two columns that Phase 3 reserved but did not create yet
(master tracker §10A.1 / §11 both list `last_reply_channel` / `last_reply_at` as still ⬜):

```sql
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_reply_channel TEXT;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_reply_at TIMESTAMP;
```

The workflow JSON includes this exact statement as a **disconnected** Postgres node
("ONE-TIME SETUP - Add Reply Tracking Columns") — open it in the n8n editor and click
"Execute Node" once before activating the workflow. Safe to re-run (`IF NOT EXISTS`).

## Environment variables / credentials used

* `WAHA_WEBHOOK_SECRET` — **new**, not in the existing §10A.2 list. Optional but strongly
  recommended before go-live (see Known Limitations). Set the same value in n8n and in
  Waha's webhook config as a custom header (`X-Webhook-Secret`).
* `Odoo Postgres` credential (existing, reused — same one every other module uses).
* No new Waha env vars needed — reuses the existing `WAHA_URL` / `WAHA_API_KEY` session,
  this workflow only *receives* webhooks, it doesn't call the Waha API.

## Test kaise kare

1. Run the ONE-TIME SETUP node manually (see above).
2. Import and activate the workflow.
3. In Waha, point the session's webhook URL at this workflow's production webhook URL.
4. From a WhatsApp number that matches an existing `clients_master.phone` value, send a message
   to the connected WhatsApp Business number.
5. Check `clients_master` — `last_reply_channel` should be `whatsapp` and `last_reply_at` should
   be close to the current time.
6. Send from a number NOT in `clients_master` — confirm the workflow responds 200 but does not
   write anything (check n8n execution log for "Log Unmatched Number").

## S5.1 — Star topology patch (this batch)

Per the Star-Topology Integration Plan (§S5a), a **"Report to Hub"** node has been added,
wired in parallel off the *success* output of `4.3.1.3 - Update last_reply_channel/at` —
same branch as `Respond 200 - Updated`, so the Hub round trip never delays the webhook
response back to Waha.

* **event_type:** `reply.received`
* **source_module:** `4.3.1`
* **client_id:** `$json.clientId` (set upstream by `Compute Client Found Flag`; this branch
  only runs after `Client Found?` is true, so it's never null here)
* **odoo_lead_id:** `$json.odoo_lead_id` — resolves to null/undefined, since `Find Client By
  Phone` only selects `id, name, phone`. Not invented — `funnel_events.odoo_lead_id` is
  nullable, and this follows the same pattern as the 2.5 Report to Hub node.
- **payload:** `{ channel: 'whatsapp', message_text, wa_message_id, reply_at, phone }`

**Still uses the placeholder `workflowId`:** `REPLACE_WITH_0.0_HUB_INTAKE_WORKFLOW_ID` — swap
in Hub-Intake's real workflow ID once it's deployed, same as every other spoke migrated so far.

**Hub-Dispatcher does not yet have a `reply.received` Switch branch** — that's S5.4 (5.1.1
BANT/MEDDIC Extraction), which consumes this event. Until then, events land in
`funnel_events` and fall through to `flagged_events` on the dispatcher side — same safety
net every other not-yet-wired event type currently gets. Nothing breaks by deploying this
node ahead of the consumer; it's just inert until S5.4 wires the other end.

**Unmatched-number and auth-failure paths are unchanged** — no Hub report fires when the
webhook responds 401 or 200-Ignored/200-Unmatched, matching the plan's spec ("at the point
it currently updates `clients_master`" — i.e. only on an actual write).

## Known limitations (flagged, not silently fixed)

* **No signature verification scheme confirmed for Waha.** Unlike the Phase 3.0 webhooks
  (Documenso, Cal.com, payment), the source material doesn't document a native HMAC signing
  option for Waha's webhook. This module uses a shared-secret header as the minimum viable
  auth check, and **auth is skipped entirely if `WAHA_WEBHOOK_SECRET` is left unset** — same
  category of gap as the still-open items in §10A.5 (2.5/2.6/2.9 unauthenticated webhooks).
  If Nivy confirms Waha does support real signing on the deployed version, this should be
  upgraded to match the 3.0.1.3/3.0.1.4 verify-signature pattern.
* **Phone matching is digit-only, not full E.164 validation.** Works for the current
  free-text `phone TEXT` schema but will mis-match if two different leads share the same
  local number with different country codes. Not a new gap — `clients_master.phone` has
  never had a strict format constraint.
* **No retry/alert on DB write failure.** Same known-gap pattern already present in Modules
  1.1, 1.3, and 2.3 (see master tracker §10A.3) — a failed Postgres update is logged to the
  execution log only, not queued or alerted.
* **Does not yet suppress nurture sends on reply.** That's explicitly scoped to **4.3.3**
  ("Merge reply channels + nurture filter patch"), not this module — 4.3.3 is what will add
  the `AND status != 'Replied'`-style condition into Module 2.2.

## Next

**4.3.2 — LinkedIn reply-check polling** (cron polling trigger → LinkedIn inbox-check
workaround → parse new replies → same `last_reply_channel`/`last_reply_at` Postgres update
pattern as this module).

4.1.x (SMS) and 4.2.x (dialer/calling) remain ⛔ blocked pending your SMS gateway and
dialer/VoiceAgent tool decisions (master tracker §6) — flag those decisions whenever you're
ready and I'll build those next instead.
