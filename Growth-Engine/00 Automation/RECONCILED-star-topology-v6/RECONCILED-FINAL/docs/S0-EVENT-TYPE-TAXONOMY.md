# S0.2 / S0.3 — `event_type` Taxonomy (living reference)

One row per cross-module hand-off, current or planned. "Wired" = a Hub-Dispatcher
Switch branch actually exists for it as of this batch. Everything else falls
through to `flagged_events` + the Odoo Discuss alert (S2.4) until it's built.

| event_type | Reported by | Consumed by | Wired in Dispatcher? |
|---|---|---|---|
| `lead.captured` | 1.3 | *(nothing subscribes yet — logged for traceability)* | No — informational, harmless |
| `lead.qualified` | 1.4, 1.5 | 2.1 Outreach | **Yes** |
| `lead.booked` | 1.5 | 2.4 Proposal Generation | **Yes** |
| `proposal.ready` | 1.5 | 2.5 Contract E-sign | **Yes** |
| `proposal.sent` | 2.4 (built, predecessor session) | *(nothing subscribes yet — informational)* | No — falls to flagged_events, harmless |
| `client.won` | 1.5 | 2.7 Onboarding | **Yes (reverted back, this session — Option B)** |
| `lead.replied` | 2.1 | — | No — no consumer built yet |
| `contract.signed` | 2.5 | 2.6 Invoice Payment | **Yes** |
| `payment.received` | 2.6 | 2.7 Onboarding | **Yes** |
| `client.onboarded` | 2.7 | — (hook for future Phase 6 work) | No — no consumer built yet |
| `renewal.due` | 2.9 | 6.x churn/win-back | No — no consumer built yet |
| `renewal.overdue` | 2.9 | 6.5 Churn Win-back | No — no consumer built yet |
| `payment.failed` | 2.9 | — | No — no consumer built yet |
| `health.scored` | 6.1.1 | 6.2.2, 6.4.1 | **Yes (this batch)** |
| `qualification.written` | 5.1.2 (built, predecessor batch) | — | No — informational, no consumer built yet |
| `nps.promoter_flagged` | 6.6 | 6.7 Case Studies, 6.8 Referral Program | **Yes (this batch)** |
| `list_segment.refreshed` | 7.2 (built, predecessor batch — new event type, not in original S0.2 minimum set) | *(nothing subscribes yet — informational, aggregate-level)* | No — informational, harmless |
| `calllist.ready` | 4.2.1 (**built, this batch — new event type, S7a.1-fix**) | 4.2.2 Dialer Trigger | **Yes** |
| `deliverability.alert` | 7.1 | — | No — no consumer built yet |
| `advocate.flagged` | 6.9 | — | No — no consumer built yet |
| `winback.escalated` | 6.5 | — | No — no consumer built yet |

## Note on `lead.captured`

The plan's S0.2 minimum set didn't include this one, but S3.1 explicitly asks
1.3 to report `event_type: lead.captured` after `Insert into clients_master`.
It's wired into 1.3 and lands in `funnel_events` for traceability, but since
nothing currently needs to *react* to a raw capture, it isn't given a
Dispatcher branch yet — expected, not a bug.

## Note on `list_segment.refreshed` (new, this batch)

7.2 (List Auto-Refresh) is a **bulk, all-rows-at-once cron job** — it has no
single client/lead in scope, so it can't follow the usual `client_id` /
`odoo_lead_id` shape every other Report to Hub node uses. Its Report to Hub
call sends `client_id: null` and `odoo_lead_id: null` explicitly (Hub-Intake
already handles this via `client_id ?? null`, see S1.1's notes) with an
aggregate `payload.segment_counts` (per-segment row counts from the daily
refresh). Treat this the same as `lead.captured`: informational only, no
consumer expected, safe to leave un-wired in Dispatcher indefinitely unless
something concrete needs to react to segment-refresh completion.

## Note on `calllist.ready` (new, this batch — S7a.1 fix)

4.2.1 (DNC Filter + Call-List Prep) used to call 4.2.2 directly via
`Execute Workflow` — a genuine spoke→spoke link that the S7a.1 grep audit
caught. Fixed the same way as `list_segment.refreshed`: this is a **batch
hand-off** (the entire day's call-list array, not a single lead), so
`client_id`/`odoo_lead_id` are `null` and the array travels in
`payload.call_list`. Unlike `list_segment.refreshed`, this one **is** wired
in Dispatcher — 4.2.2 already existed as the natural consumer, so there was
no reason to leave it unrouted. 4.2.2's `Split Out Call List` node was
updated to read `payload.call_list` instead of a bare top-level `call_list`,
since Dispatcher passes the whole `funnel_events` row through, not just the
original payload shape 4.2.1 used to send directly.

## Note on `client.won` — Option B applied (revised)

Dispatcher used to route `client.won` straight to 2.7 Onboarding (a leftover
from S2, built before 2.6/2.7 existed, when "Won" was assumed to mean
"start onboarding immediately"). With 2.6 (billing) now sitting between Won
and Onboarded, an earlier pass removed this branch (Option A). **Reverted,
this session** — Abhi confirmed NET-30/unpaid onboarding is a real case, so
**both** `client.won → 2.7` and `payment.received → 2.7` are wired, each
via its own named Execute Workflow node in Hub-Dispatcher, both pointing at
the same 2.7 workflow.

Because either event can now independently trigger 2.7, **2.7 itself gained
a duplicate-onboarding guard** — an `IF Not Yet Onboarded` check right after
fetching the client record, keyed on whether `clients_master.odoo_project_id`
is already set. If a client is onboarded via `client.won` first and
`payment.received` fires later (or vice versa), the second trigger is a
safe no-op. Full detail in
`hub-dispatcher/README-S4b-DISPATCHER-UPDATE.md` and
`2.7-client-onboarding/README.md`.

## Note on `contract.signed`

2.5 Contract E-Sign reports `contract.signed` to the Hub instead of calling
2.6 directly. Dispatcher's `contract.signed` branch is **now wired** to
2.6 Invoice + Payment.

## Note on `proposal.sent` vs `proposal.ready`

These are two different signals, easy to conflate:
- `proposal.ready` (from 1.5) means "this lead is ready for a proposal to be
  generated" → triggers 2.4.
- `proposal.sent` (from 2.4) means "a proposal was actually emailed to the
  lead" → currently informational only, no consumer needs to react to it yet.

No Dispatcher branch was added for `proposal.sent` — there's nothing to
route it to.

## Status

This is the post-S4-gap-fill snapshot (5.1.2, 6.6, 7.2 star-migrated;
Hub-Dispatcher's `client.won → 2.7` open decision resolved). Every module
across phases 0, 1, 2, 4, 5, 6, 7 that exists as a built n8n workflow now
reports through the Hub where applicable. Remaining un-wired event types
above all share the same reason: **the downstream consumer module isn't
built yet**, not a wiring oversight — update this table the moment that
changes.

**Still open after this batch:**
- S7a.1 grep audit — done. Found and fixed one spoke→spoke violation
  (4.2.1 → 4.2.2, see `calllist.ready` note above). Re-run the grep after
  any future module changes; it's cheap and catches exactly this kind of
  drift.
- Merged reference file (`growth-engine-FULL-FUNNEL-merged.json`) — stale as
  of this batch, needs regenerating from the final tree before it's used for
  anything (Metabase dashboard, docs, etc).
