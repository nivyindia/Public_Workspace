# Templates — 21 Multi Channel Sequencing

[⬅ Back to README](README.md)

## Example Sequence Blueprint — SME Segment, Email-First

| Day | Channel | Action | Stop Condition |
|---|---|---|---|
| 1 | Email (Stage 16) | Opener email | Reply → pause all |
| 3 | LinkedIn (Stage 17) | Connection request referencing the email | Reply/Accept-then-reply → pause all |
| 6 | Email (Stage 16) | Value follow-up | Reply → pause all |
| 8 | Cold Call (Stage 18) | Call, referencing prior touches | Connect/Reply → pause all |
| 12 | Email (Stage 16) | Breakup email | — |
| 12 | (end) | Mark **Nurture — re-engage in 60 days** | — |

## Example Sequence Blueprint — India/UAE Segment, WhatsApp-First

| Day | Channel | Action | Stop Condition |
|---|---|---|---|
| 1 | WhatsApp (Stage 19) | First-contact message | Reply → pause all |
| 3 | WhatsApp (Stage 19) | Follow-up | Reply → pause all |
| 5 | LinkedIn (Stage 17) | Connection request | Reply/Accept-then-reply → pause all |
| 8 | Cold Call (Stage 18) | Call | Connect/Reply → pause all |
| 8 | (end) | Mark **Dead / Nurture** | — |

## Cross-Channel Continuity Line (example)
```
Hi [Name], following up on the email I sent Monday about [topic] — thought
I'd connect here too in case it's easier to reach you this way.
```

## Formatting Rules
- Every touch after the first should reference the prior touch, not repeat the same pitch verbatim
- Minimum 2 days between touches on different channels unless the blueprint explicitly calls for tighter spacing
- Blueprint stop conditions must be explicit, not left to inference
