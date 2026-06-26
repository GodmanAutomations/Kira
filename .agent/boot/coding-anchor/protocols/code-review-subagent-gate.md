# Code Review Subagent Gate

Use this gate before saving, publishing, or handing off a meaningful code,
workflow, script, schema, or boot-packet change.

## Trigger

- A slice changed executable code, scripts, schemas, workflows, or shared boot
  behavior.
- A change is about to be committed, pushed, merged, released, or treated as
  durable.
- Stephen asks for another agent to review the work.
- The author is likely to miss their own mistake because they just wrote the
  change.

## Gate

1. Confirm the artifact and changed files.
2. Generate a review prompt:

   ```bash
   .agent/boot/coding-anchor/bin/kira-coding-anchor-code-review "<artifact>" --files "<changed files>" --checks "<verification already run>"
   ```

   For a clean committed HEAD review, use the committed-review command in
   `.agent/boot/coding-anchor/skills/code-review-subagent/SKILL.md`.

3. Spawn a read-only review subagent when the current Codex runtime supports
   subagents.
4. Give the subagent the generated prompt.
5. Continue only after reading the subagent findings, unless the review is
   intentionally asynchronous and the handoff records that fact.
6. Fix Critical, High, or valid Medium findings before checkpointing, or
   explicitly mark the slice Not Ready.
7. Convert accepted fixes into atomic task slices.

## Subagent Contract

The review subagent is read-only unless explicitly told otherwise.

It must:

- inspect the diff and directly referenced files
- prioritize bugs, regressions, missing verification, stale references, and
  security or secret exposure
- list findings first, ordered by severity
- cite file paths and line numbers when possible
- avoid inventing findings to look useful
- name residual risk if there are no findings

## Output Shape

```markdown
## Findings
| Severity | File/Line | Finding | Fix |
| :--- | :--- | :--- | :--- |

## Verification Gaps

## Verdict
Ready / Ready with follow-up / Not ready / Needs scoping
```

## Boundary

This gate does not replace deterministic verification. It sits after local
checks and before durable checkpoint/publish decisions.
