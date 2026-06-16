---
name: spec-driven-dev
description: Build a compact design spec before implementing unclear or multi-file features.
target_agent: "Codex working inside Athena-Public or the Athena Coding Anchor boot packet"
trigger_conditions:
  - "User asks to build an app, create a feature, start a project, spec out, or design something"
  - "A change touches more than three files or has unclear success criteria"
  - "Codex catches itself thinking it will figure out requirements as it goes"
file_paths:
  - ".agent/boot/coding-anchor/bin/athena-coding-anchor-spec"
  - ".agent/boot/coding-anchor/specs/"
  - ".agent/boot/coding-anchor/protocols/spec-first-gate.md"
  - "examples/skills/coding/spec-driven-dev/SKILL.md"
rationale: "Athena has enough machinery to build fast. This skill prevents building the wrong thing by pinning goal, requirements, non-requirements, architecture, edge cases, and acceptance checks first."
invocation_example: |
  User: "Build a dashboard"
  Codex: Create or draft a spec first, confirm success criteria when needed, then implement against that spec with atomic execution.
auto-invoke: false
model: default
---

# Spec-Driven Development

Use this skill before implementing unclear, multi-file, or durable features.

## Command

Create a spec template from the repository root:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-spec "feature name"
```

Specs are ignored by Git by default. Promote durable requirements into project
docs only when the spec becomes a real project contract.

## Minimum Spec

- Goal: one sentence.
- Requirements: what must happen.
- Non-requirements: what is explicitly out of scope.
- Architecture: how the pieces connect.
- Edge cases: what could go wrong.
- Acceptance criteria: how to verify success.

## Rules

- Use this before feature work that touches more than three files.
- Keep the spec compact; do not create ceremony for tiny edits.
- If requirements are discoverable from the repo, inspect before asking.
- If product intent is ambiguous and materially changes the build, ask one
  direct question.
- Convert approved acceptance criteria into atomic execution verification.
