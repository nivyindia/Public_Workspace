# 5.1.1 + 5.1.2 — Qualification Depth (BANT/MEDDIC)

**Plan IDs:** 5.1.1 (BANT/MEDDIC extraction), 5.1.2 (Extracted fields → Odoo lead)
**Depends on:** nothing blocking — both were marked ⬜ (unblocked) in the tracker.
**Built against:** Stage 27's mandatory field list (Opportunity ID, Framework Used, Assessment Fields, Decision, Assessed Date, Assessed By — cited in §10A.5 item 8 of the master plan) and the `qualification_records` table (§16.5).

## Why extraction only, no scoring

Per the master plan's own rule (§0.4.5 / §16.1 item 1): **AI recommends, deterministic logic decides.** 5.1.1 only pulls the BANT/MEDDIC field values out of call notes — it does not score them or set a final `Decision`. `decision` is written as `'Pending Review'` and left for a human or a separately-defined rule (Stage 27's sub-stage 27E "decision rules," which isn't in this upload) to finalize. Do not wire anything downstream that treats `'Pending Review'` as `'Qualified'`.

## Flag — Odoo custom field names are placeholders

5.1.2 writes to `crm.lead` fields named `x_bant_budget`, `x_meddic_champion`, etc. **These are not confirmed.** Per the master plan's own known gap (§10A.5 item 4: "no single Odoo data-dictionary doc exists"), the exact custom field names on the live Odoo instance need to be confirmed via `fields_get` introspection before this goes to production. Run:

```json
{"method": "execute_kw", "args": [ODOO_DB, ODOO_UID, ODOO_API_KEY, "crm.lead", "fields_get", [], {"attributes": ["string","type"]}]}
```

against the real instance, check which `x_*` fields already exist, create the missing ones in Odoo Studio/backend, then update the field names in the `Map Fields to Odoo Custom Fields` node to match. This is flagged, not silently assumed.

## Test Checklist

1. Feed 5.1.1 a sample call-notes paragraph that mentions a budget figure and a rough timeline but nothing else → confirm `budget`/`timeline` populate and `authority`/`need` come back `"not mentioned"`, not hallucinated.
2. Confirm a `qualification_records` row is inserted with `decision = 'Pending Review'`.
3. Confirm 5.1.2 correctly resolves `odoo_lead_id` via the `clients_master` join and skips gracefully (logs, doesn't crash) for a `client_id` that was never synced to Odoo.
4. After confirming real Odoo field names, do one live `execute_kw write` test and verify in the Odoo UI that the fields actually landed.

---

**Next in the build order (per §9 dependency map):** 5.2.1 (rate-card database) — **blocked ⛔**, pricing data (`Package_Pricing_AllServiceLines_v1.md`) hasn't been confirmed in this upload. Per §77, do not stop the project for this — flagging it and stopping only 5.2.1/5.3.1, since 5.4.1 (Deal desk approval) is itself downstream of 5.3.1 and also blocked transitively.

Next genuinely unblocked session after 5.1.x: **6.1.1 — Account health** (Phase 6, no dependency listed). Say the word and I'll build that next.
