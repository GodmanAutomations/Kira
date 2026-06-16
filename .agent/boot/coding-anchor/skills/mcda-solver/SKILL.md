---
name: mcda-solver
description: Athena-local multi-criteria decision matrix skill for tradeoff-heavy choices.
context_trigger: "decision matrix, multi-criteria, MCDA, weighted scoring, trade-off analysis, alternatives, prioritization, ranking"
source: "Adapted from examples/skills/decision/mcda-solver/SKILL.md and examples/protocols/decision/DEC-121-mcda-eev-framework.md"
---

# MCDA Solver

Use this skill when a decision has multiple real options and multiple criteria,
and a generic pros/cons list would hide the tradeoffs.

## Contract

- Require at least two real options.
- Use 3-7 criteria.
- Weights must sum to 100%.
- No single criterion should exceed 40% without a written reason.
- Score each option from 1-10 per criterion and justify important scores.
- Run a sensitivity check on the highest-weight criterion.
- Treat any ruin/dealbreaker criterion as a veto, not a weighted average.

## Default Flow

1. State the decision question.
2. List options.
3. Define criteria and weights.
4. Score options.
5. Calculate weighted totals.
6. Run a sensitivity check.
7. Convert the result into a recommendation or a decision-journal note.

## Helper

Use `bin/athena-coding-anchor-mcda "<decision>"` to create a local decision
matrix template. Generated matrices live under `decision-matrices/` and are
ignored by Git unless Stephen deliberately promotes one.
