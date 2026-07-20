# Checklists — 21 Multi Channel Sequencing

[⬅ Back to README](README.md)

## Pre-Launch Blueprint QC
- [ ] Sequence blueprint documented with channel order, day-offsets, and stop conditions
- [ ] Timing between channel touches respects a sensible minimum spacing (avoids same-day multi-channel bombardment)
- [ ] Each individual channel step still respects that channel's own daily volume limit (Stages 16-20)

## Reply-Stop Logic QC
- [ ] Reply-anywhere halt logic tested on a small batch before scaling
- [ ] Halted contacts correctly routed to Stage 25 Reply Handling, not left in limbo
- [ ] No further automated touch fires on a paused/replied contact

## Ongoing QC
- [ ] Cross-channel contact timeline reviewed periodically for duplicate/contradictory touches
- [ ] Sequence performance tracked per blueprint and reviewed for refinement

## Duplicate / Accuracy / Completeness Checks
- [ ] No contact enrolled in two active multi-channel sequences simultaneously
- [ ] Every step's channel-specific record (Stage 16-20 CRM fields) matches the sequence's expected step index
