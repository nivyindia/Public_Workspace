-- ============================================================
-- 00-MASTER-MIGRATIONS.sql
-- Growth Engine — ONE file, run once, in this order, before
-- importing/activating ANY workflow (Phase 1 through Phase 7).
-- Replaces the previously scattered migration steps:
--   - DEPLOYMENT-GUIDE.md §7 (base clients_master table)
--   - 00-COMBINED-DB-SCHEMA-ADDENDUM.sql (Modules 6.5 -> 7.2)
--   - 001_phase4_sms_calling_schema.sql (Modules 4.1.3 -> 4.2.2)
--   - automation_errors (new — needed by the 0.0 Shared Error
--     Handler workflow introduced in the audit's Phase F1 fix)
-- Safe to re-run: every statement is idempotent
-- (CREATE TABLE IF NOT EXISTS / ADD COLUMN IF NOT EXISTS).
-- ============================================================

-- ------------------------------------------------------------
-- SECTION 1 — Base Control Table (was DEPLOYMENT-GUIDE.md §7)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS clients_master (
  id SERIAL PRIMARY KEY,
  odoo_lead_id INTEGER UNIQUE,
  name TEXT,
  email TEXT,
  phone TEXT,
  company TEXT,
  service_type TEXT,
  intent_summary TEXT,
  urgency TEXT,
  score TEXT,
  score_reason TEXT,
  source TEXT,
  status TEXT DEFAULT 'New',
  odoo_partner_id INTEGER,
  odoo_invoice_id INTEGER,
  nextcloud_folder_url TEXT,
  odoo_project_id INTEGER,
  odoo_discuss_channel_id INTEGER,
  last_report_sent_at TIMESTAMP,
  renewal_date DATE,
  renewal_reminder_sent_at TIMESTAMP,
  dunning_attempts INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);

-- ------------------------------------------------------------
-- SECTION 2 — NEW: automation_errors (for the 0.0 Shared Error
-- Handler workflow — every module's settings.errorWorkflow now
-- points at that workflow, and it writes failures here)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS automation_errors (
  id SERIAL PRIMARY KEY,
  workflow_id TEXT,
  workflow_name TEXT,
  failed_node_name TEXT,
  failed_node_type TEXT,
  error_message TEXT,
  execution_id TEXT,
  execution_url TEXT,
  occurred_at TIMESTAMP DEFAULT now(),
  reviewed BOOLEAN DEFAULT false
);
CREATE INDEX IF NOT EXISTS idx_automation_errors_unreviewed
  ON automation_errors (reviewed, occurred_at) WHERE reviewed = false;

-- ------------------------------------------------------------
-- SECTION 3 — Phase 4.1.3 / 4.2 (SMS + Cold Calling)
-- (was 001_phase4_sms_calling_schema.sql)
-- ------------------------------------------------------------
-- Consent / suppression columns (needed by 4.1.3 to scope to consented leads only)
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS sms_opt_out BOOLEAN DEFAULT false;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS call_dnc BOOLEAN DEFAULT false;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS active_sequence_suppressed BOOLEAN DEFAULT false;

-- 4.1.3 SMS Re-engagement
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_sms_sent_at TIMESTAMP;

-- 4.2.1 / 4.2.2 Cold Calling
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_call_at TIMESTAMP;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS call_attempts INTEGER DEFAULT 0;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_call_outcome TEXT;

-- Shared idempotency table (also reused by 4.2.2's Call Outcome Webhook
-- and by the Phase 3.0.1 HMAC patches, if/when those get built for real)
CREATE TABLE IF NOT EXISTS webhook_events (
  event_id TEXT PRIMARY KEY,
  source TEXT NOT NULL,
  received_at TIMESTAMP DEFAULT now(),
  processed_at TIMESTAMP,
  status TEXT DEFAULT 'received',
  attempts INTEGER DEFAULT 0,
  last_error TEXT,
  raw_payload JSONB
);

-- ------------------------------------------------------------
-- SECTION 4 — Phase 6.5 -> 7.2 (Retention/Advocacy/Deliverability)
-- (was 00-COMBINED-DB-SCHEMA-ADDENDUM.sql)
-- ------------------------------------------------------------

-- 6.1.1 Account Health Rollup + 6.3.1 Support Ticketing Wiring
-- (F6.1 closure: 6.1.1 reads this column that 6.3.1 writes — must exist before either
-- module's FIRST run, so it's here instead of only inline in 6.3.1's own query.)
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS support_ticket_count INTEGER DEFAULT 0;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS health_score INTEGER;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS health_score_snapshot_at TIMESTAMP;

-- 6.5 Churn Win-back
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS winback_step INTEGER DEFAULT 0;
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS last_winback_sent_at TIMESTAMP;

-- 6.6 NPS
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

-- 6.7 Case Studies
CREATE TABLE IF NOT EXISTS case_studies (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  raw_reply TEXT,
  polished_quote TEXT,
  status TEXT DEFAULT 'pending_client_approval',
  created_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS testimonial_ask_sent_at TIMESTAMP;

-- 6.8 Referral Program
CREATE TABLE IF NOT EXISTS referrals (
  id SERIAL PRIMARY KEY,
  referrer_client_id INTEGER REFERENCES clients_master(id),
  referral_code TEXT UNIQUE,
  status TEXT DEFAULT 'link_generated',
  converted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT now()
);
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS referral_code_used TEXT;
-- Still open per the original module README: referral_code_used isn't
-- populated by any workflow yet — needs a small patch in Module 1.3/1.4
-- to capture ?ref=<code> from the inbound lead source.

-- 6.9 Advocacy
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS advocate_flag BOOLEAN DEFAULT false;
-- Still open per the original module README: not auto-set by any
-- workflow yet — set manually after human review for now.

-- 7.2 List Segmentation
ALTER TABLE clients_master ADD COLUMN IF NOT EXISTS list_segment TEXT;

-- ------------------------------------------------------------
-- SECTION 5 — F3 fix: unmatched-stage / unwired-branch logging
-- (needed by the 1.5 Central CRM Sync fix — see F3.1)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS unmatched_stage_events (
  id SERIAL PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  odoo_lead_id INTEGER,
  detected_stage TEXT,
  source_workflow TEXT DEFAULT '1.5-central-crm-sync',
  detected_at TIMESTAMP DEFAULT now(),
  reviewed BOOLEAN DEFAULT false
);

-- ============================================================
-- END — after running this once, every module in the zip can be
-- imported and activated without hitting "column does not exist".
-- ============================================================
