---
name: code-review-subagent
description: Spawn or prepare a read-only code-review subagent before checkpointing meaningful Kira changes.
target_agent: "Codex working inside Kira or the Kira Coding Anchor boot packet"
trigger_conditions:
  - "Stephen asks for a subagent to review Codex's work"
  - "A meaningful code, workflow, script, schema, or boot-packet slice is about to be checkpointed"
  - "Codex needs an independent review before confidence"
file_paths:
  - ".agent/boot/coding-anchor/bin/kira-coding-anchor-code-review"
  - ".agent/boot/coding-anchor/bin/athena-coding-anchor-code-review"
  - ".agent/boot/coding-anchor/protocols/code-review-subagent-gate.md"
  - ".agent/boot/coding-anchor/reviews/"
rationale: "Codex should not be the only reviewer of its own durable changes. This skill creates a bounded, read-only handoff for an independent review subagent."
auto-invoke: false
model: default
---

# Code Review Subagent

Use this skill before treating a meaningful Kira change as ready to save,
publish, merge, or hand off.

## Command

Create a review-subagent prompt for pending work from the repository root:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-code-review "artifact name" --files "changed files" --checks "verification already run"
```

Create a review-subagent prompt for a clean committed HEAD review:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-code-review "HEAD commit review" --files "$(git show --name-only --format='' HEAD | tr '\n' ' ')" --checks "verification already run" --diff-cmd "git show --name-status --format=short HEAD && git show --check --format=short HEAD && git show --stat --format=short HEAD && git show --patch --format=short HEAD"
```

Generated prompts live under `reviews/` and are ignored by Git unless Stephen
deliberately promotes one.

## Runtime Use

When the Codex runtime exposes subagent tools:

1. Generate the prompt.
2. Spawn a read-only review subagent.
3. Give it the prompt.
4. Wait for findings before checkpointing when the review is on the critical
   path.
5. Fix Critical, High, or valid Medium findings before saving, or mark the
   slice Not Ready.

## Rules

- The review subagent is read-only by default.
- Do not delegate vague review requests. Name files, scope, and checks.
- Do not ask the subagent to redo implementation.
- Do not treat subagent review as a replacement for doctor, tests, syntax
  checks, schema checks, browser checks, or source citations.
- If no subagent tool is available, use the generated prompt as a manual review
  checklist and say the independent review was not run.
