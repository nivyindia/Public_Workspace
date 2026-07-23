# M22 — Inbound-to-CRM Bridge: Checklists

## Per-Lead QC (any channel)

- [ ] CRM record exists — searched by email/phone first, no duplicate created
- [ ] All SOP-VA-011 required fields filled (no blank required field)
- [ ] `Source` set from the fixed enum — never free text
- [ ] `Status` set from the approved list only, starting at New unless the channel legitimately starts further along (Cal.com → Booked)
- [ ] `Notes` has at least 1-2 lines of real context, not a placeholder
- [ ] `Last Contact Date` set on entry

## Channel-Specific Gates

**22A/22B (Form/Chatbot):**
- [ ] Deal created and linked to the contact in "New Lead" stage
- [ ] Founder notification received

**22C (Cal.com):**
- [ ] Deal stage = "Meeting Booked", not left at "New Lead"
- [ ] Prep email sent to the prospect
- [ ] Prep task created, due 30 minutes before the call

**22D (WhatsApp):**
- [ ] Conversation logged as a note (not just the raw thread)
- [ ] Follow-up task created, due within 2 hours
- [ ] Number NOT added to any marketing/broadcast list without separate explicit consent

**22E (Social DM):**
- [ ] Entered manually at least once per business day — not left for a "whenever" backlog
- [ ] Flagged to the founder if daily entry is being skipped (early warning that this sub-bridge needs to move to semi-automated)

**22F (Newsletter):**
- [ ] Opt-in captured with `Source = Email Newsletter`, not lumped into "Website"

## Weekly Review

- [ ] Duplicate-contact rate sampled and under 5%
- [ ] Every automated channel's webhook still firing (spot-check one test event per channel)
- [ ] Inbound lead counts by Source cross-checked against M21's traffic/engagement numbers for the same period — a mismatch usually means a webhook silently broke
