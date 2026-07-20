# Templates — 23 Deliverability and Domain Health

[⬅ Back to README](README.md)

## Health Status Thresholds (starting point — verify current)

| Metric | Healthy | Warning | Suspended |
|---|---|---|---|
| Bounce rate (email) | < 2% | 2-5% | > 5% |
| Spam complaint rate (email) | < 0.05% | 0.05-0.1% | > 0.1% |
| Blacklist status | Clear | — | Listed on any major DNSBL |
| WhatsApp/number ban signal | None | Warning received | Number restricted/banned |

## Incident Response Checklist Template
```
Identity: [mailbox/number]
Date flagged: [date]
Metric that triggered flag: [bounce/complaint/blacklist/ban]
Suspected cause: [bad list data / content trigger / volume spike / other]
Action taken: [paused / rotated / retired]
Resolution date: [date]
```

## Weekly Health Report Format
```
Identities checked: [N]
Healthy: [N] | Warning: [N] | Suspended: [N]
New warnings this week: [list]
Actions taken: [list]
```
