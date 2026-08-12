# Email Domain Warming & Infrastructure Setup (Task 41)

**Module:** 05 — Channels & Sales Systems | **Status:** v1, ready to execute | **Last updated:** 2026-08-06
**Feeds:** Cold_Email_Sequence_v1.md (Task 39) — this is the sending infrastructure that sequence runs on.

## Why This Can't Wait
Domain warming takes 2–4 weeks of real lead time before any cold email can go out safely. Starting outreach on an unwarmed domain gets flagged as spam within days and can burn the domain permanently. This is the actual bottleneck on Tasks 39-40 going live — the sequences are written, but nothing should send until this is done.

## 1. Domain Strategy — Don't Send From Your Primary Domain
Never send cold outreach from your main brand domain (nivynext.com or equivalent) — a spam-flag risk there damages inbox deliverability for real business email (invoices, replies, client comms) too.

**Recommended structure:**
- Buy 2-4 **look-alike sending domains** per brand doing outreach (e.g., `getnivynext.com`, `nivynext.io`, `trynivynext.com`) — cheap (~$10-15/yr each on Namecheap/GoDaddy).
- Given the 5-country VA outreach model (US/UK/Canada/Australia/UAE), consider splitting sending domains by region once volume justifies it — isolates any one region's reputation risk from the others. Not needed at pilot scale (Task 39's 100-contact batch); revisit after Batch 1.
- Each sending domain gets its own mailboxes (2-3 per domain) — never send 100+ emails/day from a single inbox.

## 2. DNS Records — Required Before Any Sending
For every sending domain, set:
- **SPF** — authorizes which servers can send on the domain's behalf
- **DKIM** — cryptographic signature proving the email wasn't tampered with
- **DMARC** — tells receiving servers what to do if SPF/DKIM fail (start with `p=none` for monitoring, tighten later)
- **MX records** — pointed at whatever mailbox provider you choose (below)

Most cold-email tools (below) auto-generate the exact DNS values to paste in — this isn't done by hand from scratch.

## 3. Tool Stack (OSS/free-tier-first, per Nivy's standing convention)
| Layer | Recommendation | Why |
|---|---|---|
| Mailbox hosting | Google Workspace or Microsoft 365 (cheapest per-mailbox tier) | Best inbox-placement reputation of any provider; non-negotiable for cold outreach |
| Warming automation | **Instantly.ai** (free tier limited; ~$30/mo paid) or **Mailwarm** | Automates the send/reply/mark-not-spam cycle that manually building reputation would take weeks of manual effort to replicate |
| Sequence execution | n8n (already the stack standard) triggering via SMTP/API, or the warming tool's built-in sender | Keeps this inside the existing automation stack instead of adding a new paid sequencer |
| Verification | **NeverBounce free tier** or **ZeroBounce** (pay-per-verify, cheap at pilot volume) | Bad/invalid emails hurt domain reputation fast — verify every list before first send |

## 4. Warming Timeline (2-4 weeks, before Task 39/40 go live)
| Week | Volume/day per mailbox | Activity |
|---|---|---|
| 1 | 5-10 | Automated warm-up only (tool sends/replies to itself) — no real prospects |
| 2 | 15-25 | Continue automated warm-up |
| 3 | 30-40, mix in real sends | Start Batch 1 pilot (Task 39, 100 contacts) at low daily volume |
| 4+ | Ramp to 50-80/mailbox/day | Full pilot batch running; monitor bounce/spam rates weekly |

**Hard rule:** if bounce rate exceeds 5% or spam-complaint rate exceeds 0.1% at any point, pause sending and fix the list/content before resuming — don't push through.

## Immediate Next Actions
- [ ] Register 2-3 sending domains (decide: brand-wide first, or split by country now)
- [ ] Set up Google Workspace/M365 mailboxes on those domains (2-3 mailboxes/domain to start)
- [ ] Configure SPF/DKIM/DMARC (tool-guided, not manual)
- [ ] Sign up for warming tool (Instantly.ai recommended — free tier to start)
- [ ] Start Week 1 warm-up cycle — do this before touching Task 39's pilot batch

---
*Once warming clears Week 2, this unblocks Task 39 (cold email pilot) and Task 40 (LinkedIn doesn't need this, but shares the same "don't burn reputation" logic for connection-request volume).*
