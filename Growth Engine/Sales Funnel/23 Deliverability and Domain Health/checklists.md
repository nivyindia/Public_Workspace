# Checklists — 23 Deliverability and Domain Health

[⬅ Back to README](README.md)

## New Identity Setup QC
- [ ] SPF, DKIM, DMARC configured and verified (email) / number properly registered (calling/WhatsApp/SMS)
- [ ] Warm-up schedule applied from Day 1, not skipped for "just this once" volume
- [ ] Added to the centralized health-tracking dashboard before first send

## Ongoing Monitoring QC
- [ ] Bounce rate checked at least weekly per identity, daily during active high-volume campaigns
- [ ] Blacklist status checked at least weekly (MXToolbox or equivalent)
- [ ] Any identity in `warning` status paused from new sends pending review

## Incident Response QC
- [ ] Root cause investigated before resuming a paused identity (bad list data vs. content trigger vs. volume spike)
- [ ] Decision logged: resumed / rotated / retired, with reasoning
- [ ] If retired, all active campaigns using that identity reassigned to a healthy one

## Duplicate / Accuracy / Completeness Checks
- [ ] No identity double-counted across two dashboards with conflicting status
- [ ] Retired identities fully removed from active sending rotation, not just marked in the dashboard
