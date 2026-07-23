# M17 — Methods

## M17.1 — List Building & Signup Capture

- **Manual:** Add opt-in forms to high-intent locations — end of blog posts (M09 content), a dedicated lead-magnet landing page, exit-intent or scroll-triggered prompts where appropriate.
- **Free-tool:** Listmonk (self-hosted, fully OSS) or Mailchimp's free tier both support embeddable signup forms without additional cost.
- **Standing rule:** Every signup must be genuine double opt-in or clearly-consented single opt-in — no purchased lists, no adding contacts without explicit consent, both for deliverability reasons and because it's the correct standard regardless of local law specifics, which should be confirmed for each target market (US/UK/Canada/Australia/UAE) given differing consent requirements.

## M17.2 — Welcome / Onboarding Sequence

- **Manual:** Draft a short (3–5 email) sequence: (1) confirm/welcome + deliver any promised lead magnet, (2) introduce the brand's core value proposition, (3) share the single best/most representative piece of content, (4–5) a soft, non-pushy invitation to engage further (reply, book a call, etc., depending on the business's actual sales motion).
- **AI-assisted:** An LLM can draft sequence copy from the M01 positioning/M03 messaging docs; a human edits for authentic voice before it goes live — a generic AI-drafted welcome sequence reads as generic, and this is the first real touchpoint with a new subscriber, so it's worth the editing time.

## M17.3 — Nurture Sequence Design

- **Manual:** Build separate sequences per funnel-stage segment (per M04's tags) rather than one generic sequence for everyone — an awareness-stage lead needs different content than a decision-stage lead evaluating vendors.
- **Free-tool:** Listmonk supports basic automation/campaigns; Mailchimp's free tier includes limited automation — verify current feature caps on the free tier, since automation features are often gated behind paid tiers even on otherwise-generous free plans.

## M17.4 — Newsletter Cadence & Curation

- **Manual:** Pick a sustainable cadence (weekly or biweekly is common) and curate from the M08 editorial calendar's recently-published content — the newsletter's job is distribution of existing work, not a separate content-creation burden.
- **Checklist gate:** Every send reviewed for actual value to the reader, not purely promotional — a newsletter that's only sales pitches sees rising unsubscribe rates over time.

## M17.5 — Deliverability & List Hygiene

- **Manual:** Periodically remove or re-engage long-unopened contacts; a large list of disengaged addresses hurts sender reputation and inbox placement for the whole list, not just those contacts.
- **Free-tool:** Listmonk and Mailchimp both surface open/click data needed to identify disengaged segments; SPF/DKIM/DMARC setup (free, done once at the domain level) is essential for deliverability regardless of ESP choice.

## M17.6 — Sales-Readiness Handoff

- **Manual:** Define explicit intent signals (e.g., clicked a pricing/demo link, opened 3+ decision-stage emails, replied directly) that trigger a flag for sales follow-up via M22.
- **Automated:** Once defined, this becomes a rule-based trigger in the ESP or n8n — see `automation.md`.
