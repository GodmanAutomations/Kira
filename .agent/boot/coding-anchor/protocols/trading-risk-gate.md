# Trading Risk Gate

Use this gate before repeated risk, trading-style decisions, leveraged
decisions, or any action where ruin, sequence risk, or absorbing barriers could
dominate the upside.

## Gate

1. Name the proposed action and the repeated-trial count.
2. Check ruin classes:
   - biological
   - legal
   - financial
   - social
   - psychological
3. Estimate per-trial ruin probability.
4. If per-trial ruin probability is greater than 5%, veto.
5. If risk cannot be quantified, sandbox, reduce exposure, or abstain.
6. Check ergodicity:
   - absorbing barrier exists?
   - ensemble average differs from Stephen's time average?
   - survival probability across planned repetitions?
7. If survival probability is below 80%, veto or redesign.
8. Check WR/RR assumptions:
   - win rate
   - reward/risk
   - breakeven win rate
   - variance drag
   - losing-streak tolerance
9. Decide: pass, warn, veto, sandbox, or gather evidence.

## Red Flags

- "It worked last time" as proof of safety
- small ruin probability repeated many times
- all-in, margin, leverage, or fixed-cost exposure without stop conditions
- risk described emotionally but not numerically
- upside is reversible but downside is irreversible
- sizing or optimism used to bypass a ruin veto

## Athena Boundary

Generated risk reviews live under `risk-reviews/` and are ignored by Git.
This gate prepares risk judgment; it does not place trades, move money, enter
orders, sign contracts, or take live-world risk unless Stephen explicitly asks
for that separate action.
