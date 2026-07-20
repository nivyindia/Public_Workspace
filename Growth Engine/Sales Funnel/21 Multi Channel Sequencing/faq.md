# FAQ — 21 Multi Channel Sequencing

[⬅ Back to README](README.md)

**Q: How is this different from Stage 15 Outreach Channel Strategy?**
Stage 15 decides *which* channels to use for a segment. This stage decides the *order, timing, and coordination logic* once more than one channel is in play.

**Q: What happens if a contact replies on LinkedIn while an email follow-up is scheduled for tomorrow?**
The reply should halt all remaining automated steps across every channel for that contact immediately — the email follow-up should not fire. This is the single most important QC gate for this stage.

**Q: Does every segment need a multi-channel sequence?**
No — Stage 15 may decide some segments are single-channel. This stage only applies where Stage 15 has called for a coordinated multi-channel approach.

**Q: How much time should there be between touches on different channels?**
There's no universal figure — the example blueprints in [templates.md](templates.md) use 2-3 day spacing as a starting point, but this should be tuned per segment based on performance data, not treated as fixed.

**Q: What if two channels are run by different tools that don't talk to each other?**
Use a CRM-centered orchestration layer (e.g., n8n) as the coordination point, as described in [automation.md](automation.md), rather than relying on each tool's own siloed sequence logic.
