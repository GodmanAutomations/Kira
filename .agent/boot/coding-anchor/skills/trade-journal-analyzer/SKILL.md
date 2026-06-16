---
name: trade-journal-analyzer
description: Kira-local post-action analytics, pattern extraction, drawdown classification, and edge review skill.
context_trigger: "analyze trades, journal patterns, win rate, edge audit, losing streak, drawdown, post-action review, campaign review, experiment review, performance review"
source: "Adapted from examples/skills/workflow/trade-journal-analyzer/SKILL.md."
---

# Trade Journal Analyzer

Use this skill when a record of repeated actions needs to become evidence:
trades, campaigns, sales calls, outreach, experiments, launches, or other
repeatable operating loops.

## Contract

- Analyze the record, not the story Stephen currently feels about the record.
- Separate noise, execution gap, structural flaw, and edge decay.
- Compare planned behavior against actual behavior.
- Classify drawdowns before changing the system.
- Treat tiny samples as weak evidence.
- Trigger circuit breaker when the record shows critical decay, compulsion, or
  repeated boundary breaks.

## Default Flow

1. Name the action system and period reviewed.
2. Ingest or summarize entries: date, setup/type, channel/instrument, planned
   action, actual action, outcome, notes.
3. Calculate or estimate performance by segment.
4. Compare planned vs actual reward, cost, effort, timing, or conversion.
5. Identify streaks, drawdowns, recovery time, and trend over the most recent
   window.
6. Classify:
   - noise: within expected variance
   - execution gap: plan was good, execution drifted
   - structural flaw: one setup/channel/type is failing
   - thesis-breaker: system-wide edge decay
7. Decide continue, reduce, quarantine, stop, or gather more data.

## Output Shape

Create a compact performance review with:

- scope
- entry schema
- segment performance
- planned vs actual gap
- streak/drawdown classification
- edge health
- prescribed action
- circuit-breaker trigger if needed
- next slice

## Helper

Use `bin/athena-coding-anchor-performance-review "<system>"` to create a local
post-action analytics template. Generated performance reviews live under
`performance-reviews/` and are ignored by Git unless Stephen deliberately
promotes one.
