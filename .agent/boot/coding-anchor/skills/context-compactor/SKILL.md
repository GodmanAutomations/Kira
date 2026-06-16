---
name: context-compactor
description: Kira-local continuation handoff skill for long sessions and context pressure.
context_trigger: "context window, running low, compress, compact, too long, token limit, summarize context, handoff, resume, next slice"
source: "Adapted from examples/skills/workflow/context-compactor/SKILL.md and examples/protocols/architecture/ARC-502-context-lifecycle.md"
---

# Context Compactor

Use this skill when a session is getting long, context is at risk, Stephen says
to summarize/compact, or the next agent needs a reliable continuation handhold.

## Contract

- Preserve current objective, branch/worktree, touched files, verification, and
  next slice.
- Preserve Stephen corrections and wording preferences.
- Drop redundant tool output, chatter, and superseded plans.
- Do not overwrite Kira's public memory bank from this boot packet.
- Write local continuation handholds under `context-handoffs/`, which is ignored
  by Git unless Stephen deliberately promotes one.

## Default Flow

1. Generate a handoff template with `bin/athena-coding-anchor-compact`.
2. Fill it with the current objective, changed files, verification, blockers,
   and next slice.
3. Keep it short enough to boot from quickly.
4. Resume work from the newest concrete request, not an older completed thread.

## Preserve

- explicit user requests
- latest branch/worktree status
- files created or edited
- verification commands and outcomes
- known generated/ignored artifacts
- next checkpoint language or user preference

## Drop Or Compress

- full command output
- repeated status chatter
- obsolete paths and rejected plans
- implementation details that are already visible in committed files
