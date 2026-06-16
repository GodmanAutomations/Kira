---
name: zenith-execution
description: Kira-local sizing, stop-condition, simulation, and execution-constraint planning skill.
context_trigger: "position sizing, Kelly, stop loss, Monte Carlo, simulate, rebalance, trade execution, portfolio optimization, execution constraints"
source: "Adapted from examples/skills/decision/zenith-execution/SKILL.md and examples/protocols/decision/DEC-330-economic-expected-value.md."
---

# Zenith Execution

Use this skill after a risk gate passes and the remaining question is sizing,
stop conditions, simulation, allocation, or execution constraints.

## Contract

- Never size an action that failed the ruin or ergodicity gate.
- Define invalidation structurally, not by arbitrary pain tolerance.
- Use Half-Kelly or lower when edge estimates are uncertain.
- Hard-cap exposure when psychological variance, data quality, or execution
  reliability is weak.
- Simulate the sequence, not just the single outcome.
- Keep outputs as planning artifacts; this packet does not execute trades,
  transfer funds, or rebalance portfolios.

## Default Flow

1. Confirm the risk gate passed.
2. Define capital, bankroll, runway, or capacity at risk.
3. Record win rate, reward/risk, confidence, and evidence quality.
4. Calculate full Kelly and Half-Kelly where applicable.
5. Define structural invalidation and stop conditions.
6. Fit position size or exposure inside the invalidation distance.
7. Simulate expected sequence, drawdown, 5th percentile, and ruin probability.
8. Define rebalance, pause, or circuit-breaker conditions.

## Output Shape

Create a compact execution plan with:

- setup
- risk-gate status
- sizing inputs
- Half-Kelly guardrail
- invalidation/stop condition
- sequence simulation assumptions
- drawdown and ruin thresholds
- rebalance/pause rules
- verdict
- next slice

## Helper

Use `bin/athena-coding-anchor-execution-plan "<setup>"` to create a local
execution plan. Generated execution plans live under `execution-plans/` and are
ignored by Git unless Stephen deliberately promotes one.
