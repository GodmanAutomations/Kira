# Zenith Execution Gate

Use this gate after a risk gate passes and before sizing a trade, allocating
capital, committing repeated capacity, or setting execution constraints.

## Gate

1. Confirm `trading-risk-gate` or equivalent ruin review passed.
2. Name the setup and objective.
3. Define capital, bankroll, runway, or capacity at risk.
4. Record edge inputs:
   - win rate
   - reward/risk
   - sample size
   - confidence
5. Calculate sizing:
   - Full Kelly: `p - (q / b)`
   - Half-Kelly: Full Kelly / 2
   - hard cap
   - chosen exposure
6. Define structural invalidation:
   - what must become false?
   - where is the stop condition?
   - is the stop outside ordinary noise?
7. Simulate sequence:
   - expected repetitions
   - max acceptable drawdown
   - 5th percentile outcome
   - ruin probability
8. Define rebalance, pause, and exit rules before execution.
9. Decide: execute, reduce, wait, simulate more, or abstain.

## Red Flags

- sizing before ruin gate
- stop condition based only on how much loss feels tolerable
- edge estimate without sample size
- Full Kelly used with uncertain inputs
- ordinary volatility treated as invalidation
- no drawdown pause rule
- execution plan cannot name when it will stop

## Kira Boundary

Generated execution plans live under `execution-plans/` and are ignored by Git.
This gate prepares sizing and execution constraints; it does not place trades,
move money, rebalance accounts, or take live-world risk unless Stephen
explicitly asks for that separate action.
