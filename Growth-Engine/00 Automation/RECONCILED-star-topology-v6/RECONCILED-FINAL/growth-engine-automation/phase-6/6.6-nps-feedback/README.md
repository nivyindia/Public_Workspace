# Module 6.6 — NPS Survey + Detractor/Promoter Routing

## Kya karta hai
Active/Onboarded clients ko periodic NPS survey bhejta hai, response ko `nps_responses` table mein store karta hai, detractor (0-6) ko Odoo Discuss alert deta hai, promoter (9-10) ko `promoter_flag = true` karta hai jo Module 6.7 (Case Studies) aur 6.8 (Referral) dono consume karte hain.

## ⚠️ Business assumptions (Nivy sign-off chahiye)
- **Cadence: Quarterly assume kiya hai.** KB (Stage 51) monthly aur quarterly dono mention karta hai, final decide nahi kiya — cron `0 9 1 */3 *` hai, agar monthly chahiye to `0 9 1 * *` kar dena.
- **Survey delivery mechanism:** is workflow ne assume kiya hai ki tumhare paas ek simple self-hosted response-webhook ho sakta hai (`nps-response`), na ki Typeform/Delighted jaisa third-party tool — agar third-party survey tool use karna hai (KB Stage 51 Delighted/Survicate suggest karta hai), to survey-send node aur response-parsing dono replace karne honge us tool ke actual webhook format se.
- **Token→client mapping:** `nps_survey_tokens` lookup table ka reference diya hai README mein flagged — simpler alternative bhi note kiya hai (base64 token khud decode karna, extra table ke bina).

## Naye DB objects chahiye
```sql
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
-- If using the token-lookup approach (see note above):
CREATE TABLE IF NOT EXISTS nps_survey_tokens (
  token TEXT PRIMARY KEY,
  client_id INTEGER REFERENCES clients_master(id),
  created_at TIMESTAMP DEFAULT now()
);
```

## Known Limitations
- Survey-tool choice not finalized (see assumption above) — this workflow's webhook shape will need adjusting once a specific tool (or self-hosted form) is chosen.
- No reminder/re-send if a client doesn't respond to the survey.
