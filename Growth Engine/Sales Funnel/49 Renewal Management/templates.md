# Templates — 49 Renewal Management

[⬅ Back to README](README.md)

## Renewal Sequence (Standard Cadence)

| Timing | Action | Owner |
|---|---|---|
| 60 days before expiry | Book retention call; review client LTV and wins | Account Manager |
| 45 days before expiry | Send ROI-summary email (AI-drafted, AM-personalized) | Account Manager |
| 30 days before expiry | Automated renewal email with incentive offer | Automation (n8n) |
| 30 days before expiry | Personal WhatsApp renewal message | Account Manager |
| 14 days before expiry | Direct call if not yet renewed | Account Manager |
| 7 days before expiry | Final retention offer / escalate to founder if high-value | Account Manager / Founder |

## Renewal Reminder Email Template
```
Subject: Your [Company] contract renews soon — let's keep your growth going!

Hi [Name],

Your current plan with us renews in 30 days. Here's what we've
achieved together:
- [X] leads generated
- [Y]% ROI improvement
- [Z] campaigns delivered

Renew now and lock in your current rate. We're also offering a free
strategy upgrade for early renewals!

[Renew My Plan]
```

## Renewal Radar Alert Template (internal)
```
🔔 RENEWAL ALERT: [Client Name] contract expires in 60/30/14 days.
Email: [client email]
Package: [package]
Value: $[contract value]

Schedule a retention call NOW.
```

## Renewal KPIs

| Metric | Target (verify current) |
|---|---|
| Renewal rate | >75% |
| Monthly churn rate | <5% (verify against Stage 50's target) |
| Client LTV | Growing quarter-over-quarter |

## Renewal Objection: Price Resistance
Show ROI clearly (the 45-day ROI-summary email) before the renewal price is discussed — per the source system, this is the primary mitigation for renewal price resistance.

## Renewal Incentive Optimizer (AI-assisted framing)
Best renewal offer (discount vs. bonus service vs. upgrade) should be chosen based on the client's LTV, package, and history — not a single default discount applied uniformly to every renewal.
