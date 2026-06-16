---
name: red-team-review
description: Run an adversarial review gate before shipping significant boot, docs, code, or release artifacts.
target_agent: "Codex working inside Kira or the Kira Coding Anchor boot packet"
trigger_conditions:
  - "User asks for review, red team, QA, critique, stress test, pre-mortem, or readiness check"
  - "A significant artifact is about to be merged, committed, released, or treated as durable"
  - "Codex needs to find shared blind spots before closing a slice"
file_paths:
  - ".agent/boot/coding-anchor/bin/athena-coding-anchor-red-team"
  - ".agent/boot/coding-anchor/reviews/"
  - ".agent/boot/coding-anchor/protocols/red-team-review-gate.md"
  - "examples/skills/quality/red-team-review/SKILL.md"
rationale: "The boot packet is becoming a durable operating layer. Red-team review keeps confidence honest before shipping or merging it."
invocation_example: |
  User: "Is this ready?"
  Codex: Generate a review template, inspect the artifact through adversarial lenses, list severity-weighted findings, then fix only the clear issues.
auto-invoke: false
model: default
---

# Red-Team Review

Use this skill before treating a significant artifact as ready.

## Command

Create a review template from the repository root:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-red-team "artifact name"
```

Reviews are ignored by Git by default. Promote durable findings to
`dashboards/TRUTH-LOG.md`, `SKILL-ROUTER.md`, or an atomic task only when they
change future behavior.

## Review Lenses

- Skeptic: what would someone who disagrees say?
- User: who is harmed, confused, or disadvantaged?
- Regulator: what legal, ethical, privacy, or policy exposure exists?
- Cynic: what hidden incentive or vanity might be steering this?
- Future: how does this look after time, drift, or scale?

## Bias Checklist

- Sycophancy.
- Cherry-picking.
- False precision.
- Complexity bias.

## Severity

- Critical: immediate failure if shipped.
- High: significantly reduces value and should have a small fix.
- Medium: missed upside or important roughness.
- Low: polish.

## Rules

- Quote or point to the artifact directly.
- Do not invent findings to fill sections.
- Every high finding needs a practical fix.
- Convert accepted fixes into atomic execution slices.
