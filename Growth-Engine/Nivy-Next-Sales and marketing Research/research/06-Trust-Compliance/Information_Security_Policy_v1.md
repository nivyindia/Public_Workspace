# Information Security Policy — v1 (Draft)

**Module:** 06 — Trust & Compliance (Deliverable 8) | **Status:** Draft v1 — desk-drafted from standard SMB-agency practice; **requires legal review before external use** | **Last updated:** 2026-08-06

## Purpose
This policy states how Nivy Empires (operating as Nivy Next and its sister brands) protects client, employee, and business data across delivery, sales, and internal operations. It is written to be simple enough to hand to a prospective client during vendor onboarding review, and specific enough to actually be followed.

## Scope
Applies to all Nivy Next team members, contractors, and VAs who access client systems, client data, or company infrastructure — regardless of employment type or location.

## 1. Access Control
- Access to any client system, account, or dataset is granted on a **least-privilege, need-to-role** basis — team members get access to what their assigned task requires, not blanket access to client environments.
- Shared credentials are prohibited wherever the client platform supports individual logins or delegated access (e.g., Google Workspace delegated access, CRM seat-based logins, agency-mode ad accounts).
- Access is revoked within 24 hours of a team member's role change or offboarding.
- A password manager with unique, generated passwords is mandatory for any credential a team member holds on behalf of a client; credentials are never sent over email or chat in plaintext.

## 2. Device & Account Security
- Two-factor authentication (2FA) is required on all company accounts (email, CRM, cloud storage, financial tools) and strongly required on any client account where the client platform supports it.
- Company and client work is not conducted on shared/family devices where avoidable; where a personal device is used (early-stage reality for a small team), it must be password/PIN-locked and have disk encryption enabled.

## 3. Data Classification (see Data Handling Policy for full detail)
- **Client-Confidential**: financial-adjacent data, credentials, PII, unpublished business plans — highest protection tier.
- **Internal**: project files, drafts, internal comms — standard protection.
- **Public**: published content, marketing materials — no special handling required.

## 4. Incident Response
- Any suspected security incident (lost device, credential exposure, suspected unauthorized access) is reported to the Founder/Ops lead **within 1 hour of discovery**, not at the next standup.
- Affected clients are notified as soon as the scope of an incident is understood, consistent with applicable breach-notification law in their jurisdiction (see compliance notes in Data Handling Policy) — Nivy Next does not delay notification pending full root-cause analysis.
- A short written incident summary (what happened, what was affected, what was done) is logged in the Governance Decision Log regardless of severity.

## 5. Backup & Business Continuity
- Client deliverables and working files are stored in cloud storage with native version history (Google Drive/Notion), not solely on local devices.
- Critical business systems (CRM, project tracker, financial records) have automated cloud backup via the platform's native retention, supplemented by a monthly manual export for the CRM and financial records specifically.
- A single-point-of-failure check is run quarterly: could the business continue delivery if any one team member were unexpectedly unavailable for 2 weeks? Gaps are logged and addressed.

## 6. Vendor & Sub-Processor Security
- Any third-party tool that touches client data (CRM, automation platform, email-sending infrastructure) is vetted for baseline security posture (encryption in transit/at rest, published security page) before adoption.
- A running list of sub-processors that touch client data is maintained and disclosed to clients on request (feeds the Vendor Security Questionnaire Answer Bank).

## 7. Review Cadence
This policy is reviewed at minimum annually, or immediately following any security incident, and revised as the team scales beyond its current size (several controls above — e.g., password manager mandate, quarterly continuity check — are calibrated for a small team and will need tightening at headcount growth).

---
**Status flags:**
- This is a desk-drafted v1 based on standard SMB digital-agency security practice, not a certified or audited policy (no SOC 2/ISO 27001 claim is made or implied).
- **Legal review required** before this is presented as a binding external-facing policy, particularly the incident-notification timing language, which should be checked against jurisdiction-specific breach-notification law (see Data Handling Policy compliance section) before finalization.
- Feeds Task 48 (Vendor Security Questionnaire Answer Bank) and the "Trust & Security" section standard for every proposal (Deliverable 8).
