---
name: atomic-execution
description: Break implementation plans into one verification-gated task block at a time.
target_agent: "Codex working inside Kira or the Kira Coding Anchor boot packet"
trigger_conditions:
  - "User says implement this plan, hit the next slice, execute roadmap, start building phase, or atomic execution"
  - "A task spans multiple files and needs progress preserved without context bloat"
  - "Codex needs to turn a roadmap, plan, or design into concrete verified work"
file_paths:
  - ".agent/boot/coding-anchor/bin/kira-coding-anchor-task"
  - ".agent/boot/coding-anchor/bin/athena-coding-anchor-task"
  - ".agent/boot/coding-anchor/tasks/"
  - ".agent/boot/coding-anchor/protocols/atomic-execution-loop.md"
  - "examples/skills/coding/atomic-execution/SKILL.md"
rationale: "Kira's source skill prevents long-context drift by forcing small task blocks with explicit verification. This adapted version makes that executable in the Coding Anchor boot packet."
invocation_example: |
  User: "hit the next slice"
  Codex: Pick one small slice, optionally run `bin/kira-coding-anchor-task "adopt atomic execution"`, execute only that task, run its verification, then update the result.
auto-invoke: false
model: default
---

# Atomic Execution

Use this skill when a plan needs to become concrete work without turning into a
large, blurry implementation pass.

## Command

Create a task template from the repository root:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-task "short task name"
```

Prefill the handhold when the files, action, verification, and done condition
are already known:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-task "short task name" \
  --files "path/to/file" \
  --action "Make the smallest useful change" \
  --verify "git diff --check" \
  --done "The slice is verified"
```

The generated task file is intentionally ignored by Git. Promote durable
decisions to `KIRA-USE-MAP.md`, `MISSION-CONTROL.md`, or `dashboards/TRUTH-LOG.md`
only when they help future sessions.

## Task Shape

```xml
<task type="auto">
  <name>Short descriptive name</name>
  <files>path/to/affected/file.ext</files>
  <action>Explicit, step-by-step instructions.</action>
  <verify>Command to run to verify correctness.</verify>
  <done>Definition of done.</done>
</task>
```

## Workflow

1. Pick exactly one slice.
2. Name affected files or surfaces.
3. Define the smallest meaningful verification command.
4. Execute only that task.
5. If verification fails, fix within the same task before moving on.
6. Record only durable outcomes.

## Adaptation Notes

- The source skill recommends immediate commits via `micro-commit`; this packet
  does not auto-commit unless Stephen asks.
- Use worktrees or subagents only when the task is genuinely independent.
- Do not use this skill for quick one-line edits where direct execution is
  clearer.
