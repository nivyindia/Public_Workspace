# Data Handling Policy — v1 (Draft)

**Module:** 06 — Trust & Compliance (Deliverable 8) | **Status:** Draft v1 — desk-drafted; **requires legal review before external use, especially the regional compliance statements below** | **Last updated:** 2026-08-06

## Purpose
States how Nivy Next collects, stores, retains, and deletes client and prospect data, and what each of the 5 target countries' privacy/anti-spam law requires of that handling.

## 1. Data Classification
| Tier | Examples | Handling |
|---|---|---|
| Client-Confidential | Login credentials, financial-adjacent records, unpublished business/strategy docs, PII of client's own customers | Least-privilege access only (see Information Security Policy §1); never stored outside approved company tools; not forwarded to personal accounts |
| Internal | Project files, internal comms, drafts | Standard access controls; company tools only |
| Public | Published marketing content, case studies (once approved) | No special restriction |

## 2. Collection
- Data is collected only for the stated purpose it was gathered for (e.g., a discovery-call intake form is used for scoping the engagement, not repurposed for a separate marketing list without consent).
- Prospect/lead data collected via outreach (cold email, LinkedIn, forms) is sourced from public professional information (company websites, LinkedIn) or opt-in channels — not purchased scraped-consumer-data lists.

## 3. Storage
- All client data is stored in the company's approved cloud tools (Google Workspace, CRM, Notion) with 2FA enabled — never on personal, unmanaged devices as the system of record.
- Data is not stored longer in a given tool than that tool's role requires (e.g., a completed project's working files are archived out of active project-management views on a quarterly cycle, not left indefinitely in active workspaces).

## 4. Retention & Deletion
- **Active client data**: retained for the duration of the engagement plus 12 months (standard reference/dispute-resolution window), then archived.
- **Prospect/lead data (non-converting)**: retained for 24 months from last contact, then deleted unless the contact has explicitly opted into longer-term nurture communication.
- **Deletion on request**: any client or prospect can request deletion of their data; Nivy Next will confirm deletion within 30 days, consistent with the strictest applicable regional requirement (GDPR's "without undue delay," generally interpreted as ≤30 days for straightforward requests).

## 5. Regional Compliance Statements
*Desk-drafted summary of applicable-law obligations per target country — each statement below is a starting point for legal review, not a substitute for it.*

| Jurisdiction | Applicable Law | Key Obligation Nivy Next Must Meet |
|---|---|---|
| UK / EU-facing clients | UK GDPR (and EU GDPR where an EU entity is involved) | Lawful basis for processing, data subject access/deletion rights honored within statutory timelines, breach notification to the ICO within 72 hours of becoming aware (for notifiable breaches) |
| Canada | CASL (Canada's Anti-Spam Legislation) | Express or implied consent required before commercial electronic messages (cold email/LinkedIn outreach into Canada must track consent basis — implied consent from an existing business relationship is time-limited) |
| United States | CAN-SPAM Act (federal) + state-level privacy law (e.g., CCPA/CPRA for California contacts) | Accurate sender identification, functioning unsubscribe honored within 10 business days, no deceptive subject lines; CCPA rights (access/deletion) apply if California residents' data is processed at qualifying volume |
| Australia | Spam Act 2003 + Australian Privacy Principles (APP) | Consent (express or inferred from existing relationship) before commercial electronic messages; APP-aligned handling for any Australian personal information collected |
| UAE | UAE Federal Decree-Law No. 45 of 2021 (Personal Data Protection Law) | Consent-based processing, data subject rights, and — notably — data localization/cross-border transfer restrictions that most other target-country laws do not impose; this is the one jurisdiction where infrastructure location may itself be a compliance question, not just a policy one |

## 6. Cross-Border Transfer
Client data may be accessed by team members located in India (Nivy Next's delivery base). This is disclosed proactively to clients, particularly UK/EU clients (GDPR international-transfer rules) and UAE clients (localization considerations above) — flagged here as a standing item for the MSA template (Task 49) to address contractually, not just in this policy.

## 7. Third-Party Sharing
Client data is not sold. It is shared only with sub-processors necessary to deliver the engagement (e.g., a project-management tool, an automation platform) and only the minimum data those tools need — tracked in the Vendor Security Questionnaire Answer Bank's sub-processor list.

---
**Status flags:**
- The Regional Compliance Statements section is the highest-priority item for legal review in this entire document — it is a plain-English summary assembled from public regulatory-body guidance, not a legal opinion, and the UAE cross-border point in particular has real infrastructure implications if Nivy Next takes on UAE clients before it's resolved.
- Feeds the MSA/SOW/NDA templates (Task 49) and the standard "Trust & Security" proposal section (Deliverable 8).
