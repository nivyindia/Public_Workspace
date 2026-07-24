# Nivy — Complete AI Marketing & Sales Automation Playbook
## Build a Complete AI-Powered Marketing + Sales Engine (Free & Open-Source First)

This guide organizes your existing 76-stage Growth Engine (22 Marketing modules + 54 Sales stages) by department, the same way — table for tools, simple arrow-flow for how they connect, one big diagram at the end for the whole system.

---

# 1. AI Brain (Strategy, Content, Decisions)

| Tool | Free | Open Source | Best For |
|------|------|-------------|----------|
| Claude | ✅ (limits apply) | ❌ | Big-picture planning, long documents, structured writing |
| ChatGPT | ✅ (limits apply) | ❌ | Fast drafts, brainstorming |
| Ollama + Open WebUI | ✅ | ✅ | Fully private, no per-message cost, runs on your own server |

**Its job across your funnel:**
- Marketing Strategy, Content Calendar, Blog/SEO Articles, Captions, Ad Copy, Hooks, CTAs
- Sales Proposals, Follow-up emails, Personalization drafts, Call-summary → CRM fields

### Typical Flow
```
Knowledge Base (your SOPs/pricing/ICP)
        ↓
AI Brain (Claude/Ollama)
        ↓
Draft Content / Draft Reply / Draft Proposal
        ↓
Human Review (always — never auto-published)
        ↓
n8n takes it from here
```

---

# 2. Automation Layer

| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| n8n | ✅ | ✅ | Connects every tool below — the one constant across all 76 stages |
| Activepieces | ✅ | ✅ | Simpler no-code alternative if n8n feels heavy |

### Example: Blog → Social → Email in one chain
```
New Blog Topic (from M08 Editorial Calendar)
        ↓
AI writes article draft (M09)
        ↓
Human review gate
        ↓
Publish to WordPress
        ↓
Auto-repurpose into social posts (M10)
        ↓
Schedule Facebook / Instagram / LinkedIn (M11–M15)
        ↓
Send Email Newsletter (M17)
        ↓
Update CRM + Analytics (M21–M22)
```

### Example: Lead comes in → Sales takes over
```
Lead captured (M22 Inbound-to-CRM Bridge)
        ↓
n8n pushes into Odoo CRM (Sales Stage 06)
        ↓
Enrich + Verify + Score (Stages 07–11)
        ↓
Segment + Assign (Stages 12–15)
        ↓
Outreach sequence — Email/WhatsApp/LinkedIn (Stages 16–21)
        ↓
Reply triage + Follow-up reminders (Stages 24–25)
        ↓
Human takes the call / demo / negotiation (Stages 28–37) ← stays human
        ↓
Contract signed → Onboarding auto-triggers (Stage 40)
        ↓
Renewal/Upsell/Referral loop back to Marketing (Stages 47–53)
```

---

# 3. CRM & Business Management

| Tool | Free | Open Source | Best For |
|------|------|--------------|----------|
| Odoo Community | ✅ | ✅ | Full CRM + ERP + Accounting + Invoicing — your existing target stack |
| EspoCRM | ✅ | ✅ | Lighter alternative if Odoo feels heavy |

---

# 4. Marketing Department — 22 Modules by Group

## Group A: Foundation (M01–M03) — Strategy, not automation
```
Brand Positioning → Channel Selection → Content Pillars
        ↓
(stored as structured reference — feeds every module below)
```
No tool automates *this* — it's a one-time human decision layer.

## Group B: SEO Engine (M04–M08)
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Google Keyword Planner | ✅ | — | Keyword research |
| Google Trends | ✅ | — | Trend/demand signal |
| Ubersuggest (free tier) | ✅ | — | Secondary keyword source |
| Screaming Frog (free ≤500 URLs) | ✅ | — | Technical SEO crawl |
| Google Search Console | ✅ | — | Rank tracking, always free |

```
Keyword Research (M04)
        ↓
On-Page + Technical SEO Audit (M05–M06)
        ↓
Off-Page/Authority outreach list (M07)
        ↓
Editorial Calendar row created (M08)
        ↓
Triggers Group C below
```

## Group C: Content Engine (M09–M10)
```
Calendar row marked "Ready to Draft"
        ↓
AI drafts (Claude/Ollama) from the brief
        ↓
Human review + edit
        ↓
Publish (WordPress)
        ↓
Auto-repurpose into social formats, newsletter snippet, thread
```

## Group D: Social Channels (M11–M16)
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Postiz | ✅ | ✅ | Multi-platform scheduling, no channel cap (self-hosted) |
| Mixpost Community | ✅ | ✅ | Alternative OSS scheduler |
| Buffer / Publer / Metricool | ✅ (free tier) | — | Paid-tool fallback if you'd rather not self-host |

Covers: Facebook, Instagram, LinkedIn, X/Twitter, YouTube, Secondary platforms — same repurpose→schedule→publish pattern for all six.

## Group E: Nurture & Growth (M17–M20)
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Listmonk | ✅ | ✅ | Newsletter/ESP, no subscriber-count cliff |
| Mautic | ✅ | ✅ | Full marketing automation / drip sequences |
| WhatsApp Business App | ✅ | — | Community engagement |
| Discord | ✅ | — | Community hosting |
| Airtable / NocoDB (free tier) | ✅ | ✅ (NocoDB) | Growth-experiment tracker (Impact × Effort) |

```
Email Newsletter (M17) ──┐
Growth Experiments (M18) ─┼─→ tracked in NocoDB/Airtable → reviewed weekly
Community (M19) ──────────┤
Partnerships/PR (M20) ────┘   (research-assisted, relationship-led)
```

## Group F: Analytics + Bridge (M21–M22)
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Google Analytics 4 | ✅ | — | Traffic/conversion source of truth |
| Looker Studio | ✅ | — | Dashboards |
| Matomo | ✅ | ✅ | Self-hosted GA4 alternative if data-residency matters |
| Metabase | ✅ | ✅ | BI on top of your own Odoo/Postgres data |

```
GA4 + Search Console + Social platforms
        ↓
Looker Studio / Metabase dashboard
        ↓
AI-drafted weekly report
        ↓
M22 Bridge: qualified lead → pushed into Odoo (Sales Stage 06)
```

---

# 5. Sales Department — 54 Stages by Group

## Group A: Research & Targeting (01–05) — mostly human/strategic
```
Market Research → ICP → Persona → Competitor Research → Source Selection
```
AI-assisted (summarizing scraped data), not AI-run.

## Group B: Extraction & Verification (06–10) — fully automatable
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Apollo.io (free tier) | ✅ | — | Lead database |
| Hunter.io / Snov.io (free tier) | ✅ | — | Email finding |
| ZeroBounce / NeverBounce (free tier) | ✅ | — | Email verification |

```
Extract → Discover Contact → Enrich → Clean/Dedup → Verify
        ↓
Ready for CRM
```

## Group C: Scoring & CRM Foundation (11–15) — fully automatable
```
Lead Scoring (rule-based, n8n Code node)
        ↓
Segmentation (Odoo tags)
        ↓
CRM Setup (one-time) + ongoing sync (always-on)
        ↓
List Building (NocoDB/Odoo)
```

## Group D: Outreach Execution (16–21)
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Mailcow | ✅ | ✅ | Self-hosted email infra |
| Evolution API / Wuzapi | ✅ | ✅ | WhatsApp automation |
| Twilio (pay-as-you-go) | — | — | Transactional SMS only |

```
Email (Mailcow) ──┐
LinkedIn (human-in-loop) ─┼─→ n8n Multi-Channel Sequencer → Reply Triage
WhatsApp (Evolution API) ─┤
SMS (Twilio, transactional) ┘
```
⚠️ Cold calling and LinkedIn connection requests stay human — automation risk (bans, compliance) is real here.

## Group E: Qualification (22–27)
```
AI-drafted personalization → human review → send
        ↓
Deliverability check (automated, scheduled)
        ↓
Follow-up sequencing (automated)
        ↓
Reply triage (automated routing)
        ↓
Objection handling (human, AI serves reference doc)
        ↓
BANT/MEDDIC scoring (automated math, human-sourced inputs)
```

## Group F: Sales Cycle (28–37) — mostly human
```
Discovery Call Scheduling (Cal.com, automated)
        ↓
Discovery Call (human) → AI summarizes transcript → CRM
        ↓
Needs Analysis → Solution Mapping → Demo (all human-led)
        ↓
Proposal Creation (automated template-merge)
        ↓
Pricing / Negotiation / Closing (human — highest business risk to automate)
        ↓
Contract & Legal (Documenso e-sign, status auto-tracked)
```

## Group G: Deal-to-Delivery (38–46)
| Tool | Free | Open Source | Purpose |
|------|------|--------------|---------|
| Cal.com | ✅ | ✅ | Scheduling |
| Documenso | ✅ | ✅ | E-signature |
| Metabase | ✅ | ✅ | Account health dashboards |
| Chatwoot | ✅ | ✅ | Support inbox |

```
Deal Desk Approval (automated routing)
        ↓
Payment & Invoicing (Odoo + Stripe/Razorpay webhook)
        ↓
Client Onboarding ★ HIGHEST ROI AUTOMATION IN THE WHOLE FUNNEL ★
        ↓
Kickoff → Implementation → Account Management → CS Planning (mixed human/auto)
        ↓
Product Adoption + Support (automated triggers, Chatwoot routing)
```

## Group H: Retention & Growth (47–54)
```
Upsell trigger (usage/spend threshold)
        ↓
Renewal reminders (90/60/30/7-day cascade, fully automated)
        ↓
Churn risk score (usage+billing+ticket+NPS merge → alert)
        ↓
NPS survey (automated send + AI sentiment scoring)
        ↓
Case Studies / Advocacy (human — only the request-trigger automates)
        ↓
Referral Program (automated link + reward trigger)
        ↓
LOOPS BACK → Marketing Group D/E (social proof, community)
```

---

# 6. Automation Level — Every Group at a Glance

| Group | Automation Level |
|---|---|
| Marketing Foundation (M01-03) | ⭐☆☆☆☆ (strategic only) |
| SEO Engine (M04-08) | ⭐⭐⭐⭐☆ |
| Content Engine (M09-10) | ⭐⭐⭐⭐☆ (AI-assisted, human-reviewed) |
| Social Channels (M11-16) | ⭐⭐⭐⭐☆ |
| Nurture & Growth (M17-20) | ⭐⭐⭐☆☆ |
| Analytics + Bridge (M21-22) | ⭐⭐⭐⭐⭐ |
| Sales Research & Targeting (01-05) | ⭐⭐☆☆☆ |
| Sales Extraction & Verification (06-10) | ⭐⭐⭐⭐⭐ |
| Sales Scoring & CRM (11-15) | ⭐⭐⭐⭐⭐ |
| Sales Outreach Execution (16-21) | ⭐⭐⭐⭐☆ |
| Sales Qualification (22-27) | ⭐⭐⭐☆☆ |
| Sales Cycle — Discovery to Close (28-37) | ⭐⭐☆☆☆ (human-led by design) |
| Deal-to-Delivery (38-46) | ⭐⭐⭐⭐☆ |
| Retention & Growth (47-54) | ⭐⭐⭐⭐☆ |

---

# 7. Recommended Tech Stack (₹0 to start, fully OSS)

| Category | Tool |
|---|---|
| AI | Claude (planning) + Ollama/Open WebUI (private/high-volume tasks) |
| Automation | n8n |
| CRM/ERP | Odoo Community |
| Database | PostgreSQL |
| Marketing Automation | Mautic |
| Email Infra | Mailcow |
| Newsletter | Listmonk |
| Scheduling (meetings) | Cal.com |
| Social Scheduling | Postiz / Mixpost Community |
| Support Inbox | Chatwoot |
| E-Signature | Documenso |
| BI / Dashboards | Metabase |
| Lightweight DB / Lists | NocoDB / Baserow |
| WhatsApp | Evolution API / Wuzapi |
| Team Chat | Rocket.Chat |
| Web Analytics | Google Analytics 4 + Looker Studio (or Matomo if self-hosted preferred) |
| SEO | Screaming Frog Free + Google Search Console + Google Trends |
| File Storage | Nextcloud |
| Hosting | Docker + Portainer CE |
| Monitoring | Uptime Kuma |

---

# 8. Complete Nivy Automation Workflow (Full Picture)

```text
                              KNOWLEDGE BASE
                    (Notion / your existing docs / Nextcloud)
                                    │
                                    ▼
                          AI BRAIN (Claude / Ollama)
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        │                           │                            │
        ▼                           ▼                            ▼
  MARKETING CONTENT            SALES DRAFTS               ANALYTICS PREP
 (blogs, posts, email)    (proposals, follow-ups)      (report summaries)
        │                           │                            │
        └───────────────┬───────────┴────────────────────────────┘
                         ▼
                   n8n AUTOMATION
                         │
   ┌──────────┬──────────┼──────────┬──────────────┬─────────────┐
   ▼          ▼          ▼          ▼              ▼             ▼
WordPress  Postiz/    Mailcow/   Odoo CRM      Evolution API   Metabase
(blog)     Mixpost    Listmonk   (Sales 06-54)   (WhatsApp)    (dashboards)
           (social)   (email)
   │          │          │          │              │             │
   ▼          ▼          ▼          ▼              ▼             ▼
Facebook  Instagram  Newsletter  Lead → Score   Outreach      Weekly AI
LinkedIn  YouTube    Sequences   → Qualify      Sequences      Report
                                 → Close
                                 → Onboard
                                 → Renew
                                    │
                                    ▼
                        REFERRAL / ADVOCACY LOOP
                                    │
                                    ▼
                         back into MARKETING CONTENT
```

---

# 9. What Stays Human — No Matter How Good the Tools Get

| Activity | Why |
|---|---|
| Brand positioning, ICP, messaging pillars | Strategic judgment, not a data task |
| Negotiation, pricing decisions, closing | Legal/business risk if AI-run |
| Discovery calls, demos, objection handling | Relationship trust — the client is talking to a person |
| Case study writing, advocacy outreach | Narrative and relationship-driven |
| Cold calling, LinkedIn connection requests | Platform ban-risk + trust factor |

Automation's job around all five of these is identical: scheduling, reminding, logging, and drafting-assist — never replacing the human moment itself.

---

*Built from your existing Growth Engine repo (Sales Funnel `N8N-AUTOMATION-INDEX.md` + all 76 stages, `MARKETING-IMPLEMENTATION-PLAN.md`), restyled to match the department-table + arrow-flow format you shared.*
