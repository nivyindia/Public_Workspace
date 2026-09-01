# Module 6.7 — Case Study / Testimonial Auto-Request

## Kya karta hai
Promoter-flagged clients (Module 6.6 se) ko testimonial-ask email bhejta hai; jab client reply kare, Ollama unke raw words ko polished quote mein format karta hai, `case_studies` table mein `pending_client_approval` status ke saath store karta hai, aur Odoo Discuss par human-review alert deta hai. **Koi auto-publish nahi hai** — client ka final sign-off zaroori hai (KB ki requirement).

## ⚠️ Business assumptions
- **Sirf NPS-promoter trigger wired hai.** KB Stage 52 ek dusra trigger bhi mention karta hai — "milestone-completion event" (Odoo project stage = done). Wo is version mein nahi hai, kyunki Odoo project-stage-completion webhook abhi kahi wired nahi hai. Agar chahiye to add kar sakta hoon.
- **Reply-capture** existing Module 2.1 ke Postal inbound-reply pattern ko reuse karta hai — agar us pattern mein change ho, isko bhi update karna hoga.

## Naya DB table chahiye
```sql
CREATE TABLE IF NOT EXISTS case_studies (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  raw_reply TEXT,
  polished_quote TEXT,
  status TEXT DEFAULT 'pending_client_approval',
  created_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS testimonial_ask_sent_at TIMESTAMP;
```

## Known Limitations
- No client-approval webhook yet — approval is tracked manually (update `case_studies.status` by hand once client confirms). Could add a signed-link approval flow later, same HMAC pattern as Module 3.0.1, if needed.
- Milestone-completion trigger not wired (see assumption above).

## S6.8 — Star Topology rewiring (this update)

Plan ke S6.8 step ke hisab se:

1. **`Daily 10AM` schedule trigger hataya**, `Triggered by Hub (nps.promoter_flagged)` Execute Workflow Trigger se replace kiya. Ab Hub-Dispatcher is workflow ko Module 6.6 ke `nps.promoter_flagged` event par call karega — bulk daily poll ki zaroorat nahi, kyunki (6.5 ke uleat) ye ek single-shot ask hai, multi-day cadence nahi.
2. **`Fetch Un-Asked Promoters` bulk query → `Fetch Flagged Promoter by ID` single-row lookup.** Ab event ke `client_id` payload se seedha wahi client fetch hota hai; `testimonial_ask_sent_at IS NULL` guard idempotency ke liye rakha hai (agar Hub kabhi event dobara deliver kare to dobara ask na ho).
3. Baaki flow (email bhejna, mark-asked, reply-webhook, Ollama quote formatting, Odoo review alert) **bina badlaav** — inbound reply webhook plan ke §0.2 rule ke mutabik webhook hi rehta hai, Hub se replace nahi hota.
4. Is module se koi Hub-report wapas nahi jaata — plan ka S6.8 sirf trigger-side switch maangta hai, koi naya "Report to Hub" nahi.

### ⚠️ Same gap as 6.5
`Hub-Intake` sub-workflow aur `funnel_events` table (S0–S2) abhi bane nahi hain, isliye Dispatcher khud abhi exist nahi karta — ye module Dispatcher se call hone ke liye ready hai (Execute Workflow Trigger input laga hua hai), lekin end-to-end sirf Hub spine banne ke baad test ho payega.
