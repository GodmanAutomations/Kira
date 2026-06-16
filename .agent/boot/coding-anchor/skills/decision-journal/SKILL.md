---
name: decision-journal
description: Kira-local decision, tradeoff, and post-mortem logging skill.
context_trigger: "decision, should I, trade-off, regret, post-mortem, what went wrong, calibration, prediction, hindsight, journal, decided"
source: "Adapted from examples/skills/decision/decision-journal/SKILL.md"
---

# Decision Journal

Use this skill when Stephen or Codex makes a meaningful decision whose
rationale should survive the session.

## Contract

- Record the decision before the outcome is known when possible.
- Capture alternatives, assumptions, confidence, and what would change the
  decision.
- Separate decision quality from outcome luck.
- Use post-mortems to classify process, execution, information, and luck
  failures.
- Keep generated decision notes local and ignored unless Stephen promotes one.

## Default Flow

1. State the decision.
2. List the real alternatives.
3. Record assumptions and confidence.
4. Define observable evidence that would change the decision.
5. Add expected outcomes or review timing when useful.
6. For failures, write facts first, then root cause, then classification.

## Helper

Use `bin/athena-coding-anchor-decision "<decision>"` when a durable local
decision handhold helps. Generated notes live under `decisions/` and are
ignored by Git unless Stephen deliberately promotes one.
