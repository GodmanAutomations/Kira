---
name: diagnostic-refactor
description: Generate a read-only refactor bill of materials before changing code, docs, scripts, or workflows.
target_agent: "Codex working inside Kira or the Kira Coding Anchor boot packet"
trigger_conditions:
  - "User asks to refactor, clean up, tighten, reorganize, fix tech debt, or reduce code smell"
  - "A file or workflow looks stale, duplicated, overly complex, or risky to edit directly"
  - "Codex needs a diagnosis before deciding which repair slice to take"
file_paths:
  - ".agent/boot/coding-anchor/bin/athena-coding-anchor-refactor-report"
  - ".agent/boot/coding-anchor/reports/"
  - ".agent/boot/coding-anchor/protocols/diagnostic-refactor-scan.md"
  - "examples/skills/coding/diagnostic-refactor/SKILL.md"
rationale: "Kira has many stale paths and overlapping docs. This skill prevents blind rewrites by forcing a non-destructive report before edits."
invocation_example: |
  User: "Clean up the stale workflow scripts"
  Codex: Run or draft a diagnostic report first, list dead paths and risks, then implement only the smallest verified fix.
auto-invoke: false
model: default
---

# Diagnostic Refactor

Use this skill before changing a messy, stale, duplicated, or high-blast-radius
surface.

## Command

Create a report template from the repository root:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-refactor-report "target name"
```

Reports are ignored by Git by default. Promote durable findings to
`SKILL-ROUTER.md`, `ATHENA-USE-MAP.md`, or `dashboards/TRUTH-LOG.md` only when
they improve future routing.

## Scan Focus

- Dead or unreachable code and stale paths.
- Cognitive complexity and confusing branching.
- Duplicated logic or conflicting documentation.
- Heavy or unnecessary runtime work.
- Modernization opportunities that reduce risk or simplify verification.

## Rules

- Diagnose before editing.
- Do not rewrite the full target during the scan.
- Quantify likely impact as low, medium, or high.
- Name regression risks before recommending a fix.
- Convert accepted recommendations into atomic execution slices.

## Report Shape

```markdown
# Refactoring And Optimization Report: target

## Summary
- Est. LOC reduction: TBD
- Complexity reduction: TBD
- Critical issues: TBD

## Issue Matrix
| Issue Category | Description | Proposed Solution | Est. LOC Reduction | Complexity Impact |
| :--- | :--- | :--- | :--- | :--- |
| TBD | TBD | TBD | TBD | TBD |

## Critical Recommendations
- TBD

## Risks And Regressions
- TBD

## Verification Plan
- TBD
```
