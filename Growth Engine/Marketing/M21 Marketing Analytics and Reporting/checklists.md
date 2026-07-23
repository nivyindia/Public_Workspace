# M21 — Marketing Analytics and Reporting: Checklists

## Setup QC (21A/21B — do once per property, then re-check after any site change)

- [ ] GA4 property created per brand/domain (not one shared property across Nivy Academy, Nivy Next, etc.)
- [ ] Search Console verified and linked to the GA4 property
- [ ] All defined goals/conversions firing correctly — tested with a live submission, not assumed
- [ ] GTM container installed, holding all tags (no tag installed directly in the page code outside GTM)
- [ ] Zero data gaps confirmed after 30 days

## Ongoing QC (21C — UTM standard)

- [ ] Every channel's trackable links use the fixed `utm_source`/`utm_medium`/`utm_campaign` casing — spot-checked weekly
- [ ] No source showing as "(not set)" or "(direct)" in GA4 that should have a UTM tag
- [ ] New channels/campaigns (e.g. a new M20 partnership placement) get a UTM tag before launch, not retrofitted after

## Reporting QC (21D/21E)

- [ ] Dashboard shows at minimum: traffic by source, top content, conversion rate, leads by source
- [ ] Weekly snapshot actually sent/reviewed — not generated and ignored
- [ ] Monthly rollup includes an experiment keep/kill recommendation for any M18 test that completed that month
- [ ] Lead counts by source in the dashboard reconciled against M22's CRM entry counts for the same period — a mismatch signals a broken bridge or a broken tag
