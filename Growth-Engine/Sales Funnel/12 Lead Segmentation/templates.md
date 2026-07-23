# 12 Lead Segmentation — Templates

[⬅ Back to README](README.md)

---

## Segment Tagging Rule Table (Template)

| Field Checked | Rule | Assigned Segment Component |
|---|---|---|
| Job Title | Matches Persona A title list (Stage 03) | Persona = A |
| Job Title | Matches Persona B title list | Persona = B |
| Company Size | 1-10 employees | Size Band = Micro |
| Company Size | 11-50 employees | Size Band = Small |
| Company Size | 51-200 employees | Size Band = Mid |
| Country | In Tier-1 market list (Stage 02) | Geo Tier = 1 |
| Country | In Tier-2 market list | Geo Tier = 2 |
| Industry | Matches best-fit niche list (Stage 02) | Industry = [niche name] |
| No confident match on Persona | — | Segment = "Needs Manual Review" |

_Replace the placeholder rows with the actual Persona names, size bands, and market tiers defined in Stage 02/03 before use._

## Segment Naming Convention

`[Persona]-[Industry]-[GeoTier]` e.g. `FounderCEO-AgencyServices-Tier1`

Keeps segment names both human-readable and filterable/sortable in CRM list views.

## Segment Definition Card (one per active segment)

```
Segment Name: [name]
Primary Persona: [from Stage 03]
Industry filter: [from Stage 02]
Geography filter: [countries]
Company size band: [range]
Current lifecycle stages included: [cold / nurture / active]
Approx. size: [lead count]
Owner: [who manages campaigns to this segment]
Last reviewed: [date]
```

## Monthly Segment Review Sheet Columns

`Segment Name` · `Lead Count` · `New Leads This Month` · `Emails Sent` · `Reply Rate` · `Meetings Booked` · `Notes`

[⬅ Back to README](README.md) · [Next: resources.md](resources.md)
