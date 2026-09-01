-- ============================================================
-- Combined Postgres schema addendum for Modules 6.5 -> 7.2
-- Run once, in this order, before importing/activating the
-- corresponding workflow.json files.
-- Matches this build's existing convention: ALTER TABLE ...
-- ADD COLUMN IF NOT EXISTS on clients_master; new tables only
-- for genuinely separate entities (nps_responses, referrals,
-- case_studies) per the master plan's own §11 exceptions.
-- ============================================================

-- Module 6.5 — Churn Win-back
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS winback_step INTEGER DEFAULT 0;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_winback_sent_at TIMESTAMP;

-- Module 6.6 — NPS
CREATE TABLE IF NOT EXISTS nps_responses (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  score INTEGER,
  feedback_text TEXT,
  submitted_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_nps_sent_at TIMESTAMP;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS promoter_flag BOOLEAN DEFAULT false;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS promoter_flagged_at TIMESTAMP;
-- Only needed if using the token-lookup approach noted in 6.6's README:
CREATE TABLE IF NOT EXISTS nps_survey_tokens (
  token TEXT PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  created_at TIMESTAMP DEFAULT now()
);

-- Module 6.7 — Case Studies
CREATE TABLE IF NOT EXISTS case_studies (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  raw_reply TEXT,
  polished_quote TEXT,
  status TEXT DEFAULT 'pending_client_approval',
  created_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS testimonial_ask_sent_at TIMESTAMP;

-- Module 6.8 — Referral Program
CREATE TABLE IF NOT EXISTS referrals (
  id SERIAL PRIMARY KEY,
  referrer_client_id INTEGER REFERENCES clients_master(id),
  referral_code TEXT UNIQUE,
  status TEXT DEFAULT 'link_generated',
  converted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS referral_code_used TEXT;
-- ⚠️ Not populated by any workflow yet — needs a small patch in
-- Module 1.3/1.4 to capture ?ref=<code> from the inbound lead
-- source. Flagged in 6.8's README; tell me and I'll patch it.

-- Module 6.9 — Advocacy
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS advocate_flag BOOLEAN DEFAULT false;
-- Not auto-set by any workflow yet (see 6.9's README) — set manually
-- after human review, or tell me and I'll wire an auto-set-on-approval step.

-- Module 7.2 — List Segmentation
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS list_segment TEXT;
-- (7.2's workflow.json also issues this ALTER itself on first run,
--  included here too so the full schema is visible in one place.)
