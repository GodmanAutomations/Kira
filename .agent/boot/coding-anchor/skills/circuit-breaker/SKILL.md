---
name: circuit-breaker
description: Kira-local stop rule for repeated failures, fatigue, compulsive loops, or cumulative red flags.
context_trigger: "losing streak, tilt, red flag, burnout, keep going, one more try, repeated failure, fatigue, emergency stop, circuit breaker"
source: "Adapted from examples/skills/quality/circuit-breaker/SKILL.md and examples/protocols/safety/SAF-48-circuit-breaker-systemic.md"
---

# Circuit Breaker

Use this skill when continued execution is more likely to compound damage than
produce useful work.

## Trigger Signals

- repeated failed tool attempts
- tired or late-night work with widening scope
- "one more try" after several failures
- ignored verification failures
- context degradation or contradictory state
- user frustration signals around the same blocker
- two consecutive failed autonomous loops

## Contract

- Stop the current lane before adding more complexity.
- Name the red flags plainly.
- Create an after-action review when a durable handhold helps.
- Resume only with a smaller scope, better information, or a clear verdict.
- Do not treat a pause as failure; it is damage control.

## Default Flow

1. Stop the active loop.
2. Name the domain and red flags.
3. Pause or reduce intensity.
4. Diagnose: noise, systemic failure, edge degradation, or missing information.
5. Choose: resume smaller, adjust system, exit lane, or ask Stephen.

## Helper

Use `bin/athena-coding-anchor-circuit-breaker "<domain>"` to create a local
AAR template. Generated notes live under `circuit-breakers/` and are ignored by
Git unless Stephen deliberately promotes one.
