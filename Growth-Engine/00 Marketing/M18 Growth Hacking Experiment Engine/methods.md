# M18 — Methods

## The Core Method: Impact × Effort Scoring

This is the scoring method already defined in your existing Growth Hacking Master List doc, carried forward here as the stage's standing method rather than rewritten:

1. Browse the tactic bank by category (`resources.md`).
2. Score each candidate tactic: **Impact (1–5) × Effort (1–5) = Priority Score.** High impact, low effort scores highest and gets picked first.
3. Pick 3–5 tactics per month to test.
4. Log results in the Experiment Tracker (`templates.md`).
5. Scale what works; kill what doesn't after a fixed test window (default 30 days — see `checklists.md`).

## Method 1 — Manual Tactic Selection (Founder-Led)

- Founder or a senior team member browses the tactic bank monthly, scores candidates by hand, and picks the month's 3–5 tactics.
- Best for: early-stage use, before enough historical experiment data exists to automate scoring priorities.
- No tooling required beyond the tracker spreadsheet.

## Method 2 — Structured Hypothesis Testing

- Every selected tactic is reframed as a hypothesis before execution: *"If we [tactic], then [metric] will [change] within [window], because [reasoning]."*
- This forces a defined success metric up front, rather than judging success after the fact against a vague sense of "did it work."
- Best for: any tactic where the result will be used to justify scaling spend or reallocating time — the hypothesis framing makes the scale/kill decision defensible rather than a gut call.

## Method 3 — Portfolio Testing (Parallel Low-Effort Tactics)

- Instead of one tactic at a time, run 3–5 low-effort tactics (score 1–2 on Effort) in parallel within the same month, since they don't compete for the same execution capacity.
- Best for: burning through the low-effort end of the tactic bank quickly, since these tactics rarely need dedicated blocked time (e.g., "comment on 10 posts by ideal clients every day" can run alongside a higher-effort tactic like a pillar page launch).
- High-effort tactics (score 4–5) still run one at a time, since they typically require the same person's focused time.

## Method 4 — Semi-Automated Scoring & Tracking (n8n)

- The scoring and tracking mechanics (not the tactics themselves) get semi-automated: monthly reminder to score the next batch, auto-populated tracker rows, auto-flag for tactics approaching their 30-day decision date.
- See `automation.md` for the workflow. This method automates the *process*, not the judgment — a human still scores Impact/Effort and makes the scale/kill call.

## Choosing a Method

| Situation | Recommended method |
|---|---|
| Just starting the experiment engine, no historical data yet | Method 1 |
| Tactic result will justify a resourcing decision | Method 2 |
| Clearing a backlog of low-effort tactics | Method 3 |
| Experiment cadence is established and volume justifies tooling | Method 4 |

All four methods still terminate in the same Experiment Tracker and the same scale/kill decision point in `checklists.md` — they differ only in how tactics get selected and how much of the logging is automated.
