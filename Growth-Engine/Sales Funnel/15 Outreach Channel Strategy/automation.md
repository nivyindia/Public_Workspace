# 15 Outreach Channel Strategy — Automation

[⬅ Back to README](README.md)

---

## Manual Workflow

1. Campaign owner reviews persona + market for the segment/list being planned
2. Consults the channel fit table and compliance notes ([templates.md](templates.md))
3. Decides primary/secondary channel and sequencing
4. Logs the decision in the channel plan (Section 8 schema in [README.md](README.md))
5. Hands off to the relevant Stage 16-21 execution stage

## Semi-Automated Performance Feedback Loop

**Trigger:** A campaign using a given channel plan concludes (list status set to Archived per Stage 14).

**Steps:**
1. n8n pulls campaign outcome data (replies, bookings, opt-outs) tied to that list/channel plan
2. Appends the results to the channel-performance log (by segment + market + channel)
3. On the next campaign for the same segment/market, the campaign owner (or the AI-assisted draft step) references this log before repeating or changing the channel decision

**Required tools/APIs:** CRM API, n8n instance, channel-performance log (sheet or CRM custom object).

**Error recovery:** If outcome data can't be automatically attributed to a specific channel plan (e.g., multi-channel campaign where a reply's originating channel is ambiguous), the event is logged as "Unattributed" rather than guessed — false attribution corrupts the performance log's usefulness.

## AI-Assisted Step

1. Before finalizing a new channel plan, an LLM reviews the persona, market, and channel-performance log and drafts a recommendation with reasoning
2. Campaign owner approves, overrides, or requests a revised recommendation before logging the final decision

[⬅ Back to README](README.md) · [Next: checklists.md](checklists.md)
