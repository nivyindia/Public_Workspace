# Module 7.2 — Segmented List Auto-Refresh

## Kya karta hai
Daily `clients_master.list_segment` column ko refresh karta hai (fresh_lead, hot_active_outreach, long_term_nurture, active_client, churn_risk, promoter) — existing status/score fields se derive karta hai, alag table nahi banata (existing convention follow kiya: `ALTER TABLE ... ADD COLUMN IF NOT EXISTS`).

## Known Limitations
- Segment list starter-set hai — jaise-jaise Stage 14 (List Building) ke naye use-cases aayenge, CASE branches add karne honge.
