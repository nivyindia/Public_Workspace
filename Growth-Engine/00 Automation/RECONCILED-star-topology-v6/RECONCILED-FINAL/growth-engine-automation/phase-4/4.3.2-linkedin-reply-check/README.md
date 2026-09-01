# Module 4.3.2 — LinkedIn Reply-Check Polling

**Plan ID:** 4.3.2 (Phase 4 — Missing Channels + Reply Tracking, master tracker §7)
**Status:** Built, not yet activated (needs a provider decision + one-time migration — see below)
**File:** `4.3.2-LinkedIn-Reply-Check-Polling.json`

## ⚠️ Two things flagged before this can go live

1. **LinkedIn-inbox-reading tool is not a confirmed decision.** The master tracker's §0.3
   canonical tool-stack table covers WhatsApp/Email/E-sign/social-scheduling/DB — it does not
   name a tool for reading a LinkedIn inbox. 4.3.2.2 is explicitly labelled "(workaround)" in
   the plan itself, same as it labels 4.1/4.2 "⛔ pending gateway/dialer decision" — the
   difference is 4.3.2 isn't marked ⛔ in the tracker's own status table, so it's meant to be
   buildable now, just against a placeholder. This build uses **PhantomBuster** (the one
   LinkedIn-scraping tool the tracker's reinstated free-tier list, §19.2, actually names) as
   that placeholder. Swap the HTTP Request node if Nivy picks something else — GrowChief is
   mentioned once elsewhere in the source material as another option.
2. **Built against a newer part of the master tracker (§16.4/§16.5) that 4.3.1 didn't use.**
   See "Note on 4.3.1" below — this is a real gap in what was already delivered, flagged here
   rather than silently left inconsistent.

## What it does

1. Polls every 30 minutes (assumption — no cadence specified in the source plan).
2. Checks a LinkedIn-inbox-reading provider is configured; exits cleanly if not.
3. Calls the provider (PhantomBuster placeholder) to fetch new inbox messages.
4. Parses the result into one item per message.
5. Skips anything already processed (dedup control table, same pattern as Module 1.1's
   `n8n_processed_posts`).
6. Matches the sender against `clients_master` — **strong match** on exact
   `linkedin_profile_url`, **weak match** on name-only (flagged as such, see Known Limitations).
7. On match: updates `last_reply_channel`/`last_reply_at`, sets `active_sequence_suppressed = true`,
   opportunistically backfills `linkedin_profile_url` if it was empty, and logs the reply to
   `communication_events`.
8. On no match: still logs to `communication_events` with `client_id = NULL` so nothing is lost,
   for manual review.
9. Marks the message processed — **except** on a DB-update failure, where it deliberately does
   NOT mark it processed, so the next poll cycle retries automatically (per the master tracker's
   §16.3 error-handling standard: "leave event unmarked-complete on failure so a legitimate retry
   can still succeed").

## Trigger

Schedule Trigger — every 30 minutes. Adjust freely; not a business rule, just a default.

## Postgres schema — ONE-TIME SETUP REQUIRED

```sql
CREATE TABLE IF NOT EXISTS communication_events (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  channel TEXT,
  direction TEXT,
  content TEXT,
  occurred_at TIMESTAMP DEFAULT now(),
  workflow_source TEXT
);

ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS active_sequence_suppressed BOOLEAN DEFAULT false;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS linkedin_profile_url TEXT;

CREATE TABLE IF NOT EXISTS linkedin_processed_messages (
  message_id TEXT PRIMARY KEY,
  processed_at TIMESTAMP DEFAULT now()
);
```

This module is the **first to actually create `communication_events`** — it's defined in the
master tracker's §16.5 as the canonical shared event-history table (channel values:
`email | whatsapp | sms | linkedin | call`), meant to be used by all reply/communication-logging
work from here on, not just this module. Run the disconnected "ONE-TIME SETUP" node manually
before activating.

## Environment variables / credentials used

* `PHANTOMBUSTER_API_KEY`, `PHANTOMBUSTER_LINKEDIN_INBOX_AGENT_ID` — **new**, not in the
  existing §10A.2 list, and not yet a confirmed decision (see flag above).
* `Odoo Postgres` credential (existing, reused).

## Note on 4.3.1 (Waha WhatsApp Reply Tracking) — flagged inconsistency

4.3.1 was built before I had pulled the master tracker's §16.4/§16.5 section into context. It
only updates `clients_master.last_reply_channel`/`last_reply_at` — it does **not** write to
`communication_events` and does **not** set `active_sequence_suppressed`. Per §16.8's corrected
build order, the consent/suppression engine (§16.4) is supposed to underlie all of Phase 4, so
4.3.1 is now inconsistent with 4.3.2 and with the canonical spec.

**Recommended fix (not applied — flagging per the "don't modify business logic silently" rule):**
add two nodes to 4.3.1 — an `INSERT INTO communication_events (..., channel='whatsapp', ...)`
and an extra `SET active_sequence_suppressed = true` clause on its existing UPDATE. Say the word
and I'll build that patch next, or fold it into whichever workflow you want it in.

## Test kaise kare

1. Run the ONE-TIME SETUP node manually.
2. Set `PHANTOMBUSTER_API_KEY` / `PHANTOMBUSTER_LINKEDIN_INBOX_AGENT_ID` (or point the HTTP
   Request node at whatever provider you've actually chosen).
3. Import and activate the workflow.
4. Have a test LinkedIn account (ideally one already stored with a matching
   `linkedin_profile_url` on a `clients_master` test row) send a reply.
5. Wait for the next poll (or manually execute the workflow).
6. Confirm: `clients_master` row updated (`last_reply_channel='linkedin'`,
   `active_sequence_suppressed=true`), and a matching row appears in `communication_events`.
7. Re-run the workflow manually again with the same fetched data — confirm the message is
   skipped ("Skip - Already Processed") and no duplicate `communication_events` row is created.

## S5.2 — Star topology patch (this batch)

Per the Star-Topology Integration Plan (§S5a), a **"Report to Hub"** node has been added,
wired in parallel off the *success* output of `4.3.2.4 - Update Reply Tracking + Suppress` —
same branch as `Insert communication_events (matched)`, so the Hub round trip never delays
the comms-log write or the poll cycle finishing.

* **event_type:** `reply.received`
* **source_module:** `4.3.2`
* **client_id:** `$json.clientId` (set upstream by `Compute Client Found Flag`; this branch
  only runs after `Client Found?` is true, so it's never null here)
* **odoo_lead_id:** `$json.odoo_lead_id` — resolves to null/undefined, since `Match Lead`
  only selects `id, name, linkedin_profile_url, match_type`. Same not-invented pattern as
  4.3.1's and 2.5's Report to Hub nodes.
* **payload:** `{ channel: 'linkedin', message_text, linkedin_message_id, reply_at,
  profile_url, match_type }` — `match_type` is carried through so a weak (name-only) match
  stays visible in `funnel_events`, same audit trail `communication_events` already keeps.

**Still uses the placeholder `workflowId`:** `REPLACE_WITH_0.0_HUB_INTAKE_WORKFLOW_ID` — swap
in Hub-Intake's real workflow ID once it's deployed, same as 4.3.1 and every other migrated
spoke so far.

**Hub-Dispatcher does not yet have a `reply.received` Switch branch** — that's S5.4 (5.1.1
BANT/MEDDIC Extraction), the actual consumer of this event. Until then, events land in
`funnel_events` and fall through to `flagged_events` — same safety net every other
not-yet-wired event type currently gets. Both 4.3.1 and 4.3.2 now emit the same event type
into the same table, so S5.4 has one merged stream to trigger off, not two separate ones.

**Unmatched-lead path is unchanged** — no Hub report fires on the `Insert
communication_events (unmatched)` branch, matching the plan's spec ("at the point it
currently updates `clients_master`" — the unmatched branch never touches `clients_master`).

## Known limitations (flagged, not silently fixed)

* **Name-only matching is weak.** Two different leads with the same name will collide. Every
  name-matched reply is still logged and still updates the record (current design choice — see
  code above), but the `communication_events.content` is prefixed `[weak match - name only]` so
  it's auditable. Recommend tightening this once `linkedin_profile_url` starts getting populated
  consistently (e.g. by having Module 2.1's semi-manual LinkedIn task also capture the profile
  URL back into `clients_master` — a natural follow-on, not built here).
* **PhantomBuster payload shape is assumed, not confirmed** — the parse code reads a few common
  field-name variants defensively, but this will likely need a real adjustment pass once an
  actual PhantomBuster (or alternative) agent is wired up and its real output shape is known.
* **No retry/alert on fetch failure** beyond the execution log (same known-gap category as
  1.1/1.3/2.3/4.3.1).
* **Still within scope of the Phase 7.3.1 LinkedIn automation safety review** (ToS/rate-limit
  audit) — this module only reads, doesn't send, so it's lower-risk than Module 2.1's outreach
  leg, but not exempt from that future review.
* **Does not yet suppress nurture sends.** Setting `active_sequence_suppressed = true` here is
  necessary but not sufficient — Module 2.2 (Nurture) still needs to be patched to actually check
  that flag in its WHERE clause. That patch is still tracked as **4.3.3**.

## Next

**4.3.3 — Merge reply channels + nurture filter patch**: combine email/WhatsApp/LinkedIn reply
signals and patch Module 2.2's query to respect `active_sequence_suppressed` (and ideally
`status != 'Replied'` as the tracker's original note said) so a lead who replies on any channel
actually stops getting drip messages. This is the natural close-out for the reply-tracking work
4.3.1 and 4.3.2 both feed into.
