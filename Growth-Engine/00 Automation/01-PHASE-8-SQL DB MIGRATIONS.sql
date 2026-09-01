-- ============================================================
-- Phase 8 — Growth Hacking Engines: Postgres migrations
-- Run once, in this order, BEFORE importing/activating any
-- 8.x workflow.json file into n8n.
-- Matches existing convention from 00-MASTER-MIGRATIONS.sql /
-- 00-COMBINED-DB-SCHEMA-ADDENDUM.sql (v6): CREATE TABLE IF NOT
-- EXISTS + ALTER TABLE ... ADD COLUMN IF NOT EXISTS, safe to
-- re-run.
-- ============================================================

-- ------------------------------------------------------------
-- 0. Campaign control table — THE key piece that makes
--    multiple campaigns run simultaneously through the same
--    engine workflow (see Section 3 of the Implementation Plan).
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS campaigns (
  id SERIAL PRIMARY KEY,
  campaign_slug TEXT UNIQUE NOT NULL,      -- e.g. 'diwali-referral-2026', 'nivy-top-100'
  engine TEXT NOT NULL,                    -- '8.1', '8.2', '8.3', '8.4', '8.5', '8.6'
  campaign_type TEXT,                      -- e.g. 'contest', 'referral', 'free_audit', 'ugc', 'community'
  status TEXT DEFAULT 'draft',             -- draft / active / paused / ended
  config JSONB NOT NULL DEFAULT '{}'::jsonb, -- reward amount, copy, thresholds, etc. — everything variable lives here
  channels TEXT[] DEFAULT '{}',            -- e.g. ARRAY['whatsapp','telegram','email']
  starts_at TIMESTAMP,
  ends_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);

-- Fast lookup path used by every engine's "Lookup Active Campaign" node
CREATE INDEX IF NOT EXISTS idx_campaigns_slug_status
  ON campaigns (campaign_slug, status);

-- ------------------------------------------------------------
-- 1. Module 8.1 — Reward / Contest Engine
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS contest_entries (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  entry_data JSONB,
  fraud_score INTEGER DEFAULT 0,
  status TEXT DEFAULT 'pending',           -- pending / verified / needs_review / winner_pending_approval / winner_confirmed / rejected
  submitted_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_contest_entries_campaign ON contest_entries (campaign_id);

-- ------------------------------------------------------------
-- 2. Module 8.2 — Referral Engine (universal / multi-campaign)
--    NOTE: separate from the existing `referrals` table added
--    for 6.8 Client Referral Program in v6 — that one is
--    single-purpose client-to-client; this one is
--    campaign-driven and reusable across any referral push.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS referral_ledger (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  referrer_client_id INTEGER REFERENCES clients_master(id),
  referral_code TEXT UNIQUE,
  referred_client_id INTEGER REFERENCES clients_master(id),
  reward_stage TEXT DEFAULT 'submitted',   -- submitted / meeting_booked / converted / paid
  reward_amount NUMERIC,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_referral_ledger_campaign ON referral_ledger (campaign_id);
CREATE INDEX IF NOT EXISTS idx_referral_ledger_code ON referral_ledger (referral_code);

-- ------------------------------------------------------------
-- 3. Module 8.3 — Free-Value Engine (audit sub-type built first;
--    other free-value sub-types — free toolkit, free micro-tool,
--    free design/video/website — reuse this same table with a
--    different campaign_type value on the linked campaign row)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS audit_requests (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  url TEXT,
  score INTEGER,
  report_data JSONB,
  created_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_audit_requests_campaign ON audit_requests (campaign_id);

-- ------------------------------------------------------------
-- 4. Module 8.4 — UGC / Share Engine
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ugc_submissions (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  proof_url TEXT,
  verification_status TEXT DEFAULT 'pending', -- pending / verified / rejected
  points_awarded INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_ugc_submissions_campaign ON ugc_submissions (campaign_id);

-- ------------------------------------------------------------
-- 5. Module 8.5 — Community Engine
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS community_members (
  id SERIAL PRIMARY KEY,
  campaign_id INTEGER REFERENCES campaigns(id),
  client_id INTEGER REFERENCES clients_master(id),
  role TEXT DEFAULT 'member',              -- member / moderator / partner
  joined_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_community_members_campaign ON community_members (campaign_id);

-- ------------------------------------------------------------
-- 6. Module 8.6 — Signal-Based Outreach Engine
--    (not campaign_id-scoped by design — signals are continuous,
--    not tied to a single campaign window; outreach sequences
--    triggered off it can still reference a campaign in `payload`)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS signal_leads (
  id SERIAL PRIMARY KEY,
  signal_type TEXT,                        -- 'hiring' / 'funding' / 'news' / 'reactivation'
  raw_signal JSONB,
  ai_score INTEGER,
  outreach_status TEXT DEFAULT 'new',      -- new / queued / sent / replied / ignored
  created_at TIMESTAMP DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_signal_leads_status ON signal_leads (outreach_status);

-- ------------------------------------------------------------
-- 7. Module 8.7 — Dashboard (no new tables; reporting views only,
--    built on top of funnel_events + the tables above once at
--    least one engine has live data. Placeholder below —
--    uncomment/extend once 8.1-8.6 are live.)
-- ------------------------------------------------------------
-- CREATE OR REPLACE VIEW growth_campaign_performance AS
-- SELECT c.id, c.campaign_slug, c.engine, c.status,
--        COUNT(fe.id) AS total_events
-- FROM campaigns c
-- LEFT JOIN funnel_events fe ON fe.payload->>'campaign_id' = c.id::text
-- GROUP BY c.id;

-- ============================================================
-- End of Phase 8 migrations.
-- Safe to re-run (all IF NOT EXISTS). Run this on the same
-- Postgres instance/database that v6's master-migrations
-- already ran on — Phase 8 tables reference clients_master
-- and share funnel_events/flagged_events with the rest of
-- the star topology.
-- ============================================================
