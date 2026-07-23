# Follow-Up Automation System

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-04 Outbound Outreach

**Tags:** `follow-up` `automation` `sequence` `HubSpot` `n8n` `SD-04`

---

> 🎯 **Purpose:** Complete system for automating follow-up sequences across all outreach channels. No lead should ever fall through the cracks.
> 

---

# 📌 Quick Navigation

- [Follow-Up Philosophy](#philosophy)
- [LinkedIn Follow-Up Sequence](#linkedin)
- [Email Follow-Up Sequence](#email)
- [WhatsApp Follow-Up Sequence](#whatsapp)
- [HubSpot Automation Workflows](#hubspot)
- [Re-engagement Sequence](#re-engagement)

---

# 💡 Follow-Up Philosophy {#philosophy}

> **"The money is in the follow-up."** Most deals close on the 3rd–5th touchpoint. The biggest mistake is giving up after one message.
> 

**Rules:**

- Maximum 3 follow-ups per channel before marking cold
- Always add value in each follow-up (don’t just say "just checking in")
- Space follow-ups: Day 1 → Day 4 → Day 10 → Day 21 (final)
- After marking cold: add to 90-day re-engagement sequence
- Never follow up more than 4 times without a response — respect their time

---

# 💼 LinkedIn Follow-Up Sequence {#linkedin}

**Step 1 — Connection accepted, no reply (Day 2 after acceptance):**

> "Thanks for connecting, [Name]! I work with [their industry] businesses on [relevant service]. Would love to share what we do if there’s ever a fit. No pressure at all."
> 

**Step 2 — No reply (Day 7):**

> "Hey [Name], just following up briefly — we’ve been helping [industry] businesses save significantly on [pain point]. Happy to send a short overview if useful?"
> 

**Step 3 — Final (Day 14):**

> "[Name], I’ll leave it here — if the timing is ever right to explore how we could support your business, feel free to reach out. Wishing you a great [week/month]!"
> 

---

# 📧 Email Follow-Up Sequence {#email}

**Email 1 — Day 1 (initial outreach, see Cold Email SOP)**

**Email 2 — Day 4:**

> Subject: Re: [original subject]
> 

> "Hi [Name], just wanted to bump this to the top of your inbox in case it got buried. [One-sentence value reminder]. Worth a quick 15 minutes?"
> 

**Email 3 — Day 10:**

> Subject: Last one from me
> 

> "Hi [Name], I’ll keep this brief — I know your inbox is busy. We’ve recently helped [similar company type] with [specific result]. If you ever want to explore something similar, I’m one email away. Either way, I wish you well!"
> 

**Mark as cold after Email 3. Move to re-engagement at 90 days.**

---

# 📱 WhatsApp Follow-Up Sequence {#whatsapp}

**Message 1 — Day 1 (see WhatsApp SOP)**

**Message 2 — Day 5:**

> "Hey [Name], following up on my message earlier this week. Happy to share more or answer any questions. No pressure!"
> 

**Message 3 — Final (Day 12):**

> "Hi [Name], just wrapping up my outreach for now. The offer still stands if you ever need support with [service]. Take care!"
> 

---

# 🤖 HubSpot Automation Workflows {#hubspot}

## Workflow 1: No Activity Follow-Up

- **Trigger:** Contact has no activity logged for 5 days after first outreach
- **Action:** Create task for VA/salesperson: "Follow up with [Name]"

## Workflow 2: Proposal Sent → No Response

- **Trigger:** Deal stage = Proposal Sent + 3 days with no activity
- **Action:** Send automated email (personalised check-in) + create follow-up task

## Workflow 3: Cold Re-engagement

- **Trigger:** Contact marked cold + 90 days elapsed
- **Action:** Send re-engagement email (see below) + log touch in CRM

## Workflow 4: Meeting No-Show

- **Trigger:** Meeting was scheduled ([Cal.com](http://Cal.com)) + marked as no-show
- **Action:** Send "missed you" email + offer rebooking link automatically

---

# 🔄 Re-engagement Sequence (90-Day Cold Leads) {#re-engagement}

**Email 1 — Day 90 after going cold:**

> Subject: It’s been a while, [Name] — things may have changed
> 

> "Hi [Name], it’s been a few months since we last spoke. A lot can change in a quarter! We’ve recently [new case study / new service / new result]. Would it be worth reconnecting for a quick 15 minutes? No pressure if the timing still isn’t right."
> 

**Email 2 — Day 97:**

> Subject: One last reach out
> 

> "Hi [Name], just one more touchpoint before I close your file. If you’re ever looking for support with [service], we’re here. I wish you a brilliant [quarter/year] ahead."
> 

**After 2 re-engagement emails with no reply: archive permanently. Do not contact again unless they initiate.**

---

📋 **PAGE METADATA**

- **Section:** SD-04 — Outbound Outreach
- **Parent:** 📣 SD-04 Hub
- **Status:** 🟢 Complete | **Last Updated:** May 2026
- **Tags:** `follow-up` `automation` `sequences` `HubSpot` `SD-04`