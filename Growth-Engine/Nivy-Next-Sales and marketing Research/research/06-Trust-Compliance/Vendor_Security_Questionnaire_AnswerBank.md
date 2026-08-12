# Vendor Security Questionnaire — Answer Bank

**Module:** 06 — Trust & Compliance (Deliverable 8) | **Status:** Draft v1 — pre-answered common questions, sourced from Information_Security_Policy_v1.md and Data_Handling_Policy_v1.md; **legal review recommended before formal submission on any client's official questionnaire** | **Last updated:** 2026-08-06 | **Dependency:** Task 46 (complete)

## Purpose
Mid-size and enterprise-leaning prospects (SaaS, professional services) frequently gate vendor onboarding behind a security questionnaire. Having pre-drafted, honest answers ready removes a multi-week sales-cycle delay. **Every answer below must be true as-of send date** — do not send a stale answer bank; confirm current state before each submission.

## Common Questions & Standing Answers

**Do you have a SOC 2 or ISO 27001 certification?**
No formal third-party certification at this time. Nivy Next follows documented internal information security and data handling policies (available on request) aligned with SOC 2-style control categories (access control, incident response, backup/continuity), but has not undergone formal audit. Certification is a roadmap item as the company scales past its current size — flag this honestly rather than imply certification exists.

**Is data encrypted in transit and at rest?**
Data is stored in cloud platforms (Google Workspace, CRM, Notion) that provide encryption in transit and at rest as part of their platform-level security — Nivy Next relies on and inherits these platform guarantees rather than operating separate custom infrastructure.

**Do you use multi-factor authentication?**
Yes — 2FA is mandatory on all company accounts (email, CRM, cloud storage, financial tools) per Information Security Policy §2, and enabled on client accounts wherever the client's platform supports it.

**Where is our data processed, and by whom?**
Primary delivery team is based in India (Lucknow); data may be accessed by team members there as part of normal delivery. Sub-processors (tools that touch client data) are limited to the minimum necessary and disclosed on request — see Data Handling Policy §7. For clients with cross-border transfer requirements (notably UK/EU under GDPR and UAE under its PDPL), this is addressed contractually in the MSA.

**What is your data retention and deletion policy?**
Active client data is retained for the engagement duration plus 12 months, then archived; deletion on request is honored within 30 days. Full detail in Data Handling Policy §4.

**Do you have an incident response plan? Have you had a breach?**
Yes, a documented incident response process exists (Information Security Policy §4): internal escalation within 1 hour of discovery, client notification as soon as scope is understood, and jurisdiction-appropriate breach-notification timelines (e.g., 72 hours to the ICO under UK GDPR where applicable). No breach to disclose as of this document's last-updated date — **confirm this is still accurate before each use.**

**Who has access to our data, and how is access controlled?**
Access is least-privilege and role-based — team members get access only to what their assigned task on the account requires, not blanket account access. Shared credentials are prohibited where the platform supports individual/delegated logins. Access is revoked within 24 hours of role change or offboarding.

**Do you carry cyber liability / errors & omissions insurance?**
**Not yet in place — genuine gap, not a drafting task.** This requires actually purchasing a policy, which is a founder/ops execution item, not something that can be pre-answered. Flag as an open item until resolved (see Decision Log).

**Can you sign our NDA / do you have your own NDA ready?**
Yes — Nivy Next's NDA template is drafted (Task 49) and can be countersigned or a client's own NDA reviewed and returned within 24 hours, consistent with the "signed NDA/MSA within 24 hours of request" standard in Deliverable 8.

## Sub-Processor List (living document)
| Tool | Purpose | Data Touched |
|---|---|---|
| Google Workspace | Email, file storage, calendar | Client comms, project files |
| Notion | Project/knowledge management | Project files, some client-shared content |
| CRM (tool TBD — Task 38) | Pipeline, contact records | Contact PII, deal/financial-adjacent info |
| Email outreach/automation platform (TBD — Task 41) | Cold outreach sending | Prospect contact info |

---
**Status flags:**
- The insurance gap (cyber liability/E&O) is real and unresolved — surfacing it here rather than glossing over it, per the standing "don't fabricate readiness" practice used throughout this research program.
- CRM and email-infra tool rows will need updating once Tasks 38 and 41 move from planning to actual tool selection.
