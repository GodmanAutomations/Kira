---
name: trading-risk-gate
description: Kira-local ruin, ergodicity, sequence-risk, and win-rate/reward-risk gate.
context_trigger: "ruin, is this safe, should I risk, veto, ergodic, sequence risk, WR vs RR, position size, bankruptcy, absorbing barrier"
source: "Adapted from examples/skills/decision/trading-risk-gate/SKILL.md, examples/protocols/safety/SAF-001-law-of-ruin.md, and examples/protocols/decision/DEC-193-ergodicity-check.md."
---

# Trading Risk Gate

Use this skill before repeated financial, operational, reputational, or
trading-like risks where ruin, absorbing barriers, or sequence risk matter.

## Contract

- Veto any action with more than 5% probability of irreversible ruin.
- Treat survival across repeated trials as the relevant metric, not one-shot
  expected value.
- If risk cannot be quantified, sandbox or abstain before scaling exposure.
- Do not use ensemble averages when Stephen has to live one timeline.
- Run this before sizing or execution; sizing cannot rescue a ruin-class setup.
- Keep trading outputs advisory and preparatory; this packet does not execute
  trades or financial transactions.

## Three-Gate Pipeline

1. Ruin class check across biological, legal, financial, social, and
   psychological domains.
2. Ergodicity audit: absorbing barrier, repeated-trial count, and survival
   probability.
3. Win-rate/reward-risk check: breakeven rate, variance drag, and whether the
   edge is real enough to survive a losing sequence.

## Output Shape

Create a compact risk review with:

- proposed action
- ruin classes
- per-trial risk
- planned repetitions
- survival probability
- WR/RR assumptions
- veto/warn/pass verdict
- required mitigations
- next slice

## Helper

Use `bin/athena-coding-anchor-risk-gate "<action>"` to create a local risk
review. Generated risk reviews live under `risk-reviews/` and are ignored by
Git unless Stephen deliberately promotes one.
