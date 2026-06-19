---
description: Build a Kira execution plan from current repo truth, then convert it into one verified task slice
---

# /plan - Kira Planning Workflow

> **Latency Profile**: LOW for narrow work, MEDIUM for multi-file or high-risk work.
> **Philosophy**: Plan only enough to make execution safe and obvious.

## Phase 0: Establish The Boundary

// turbo

- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-status` when branch, sync, or dirty state matters
- [ ] Read the latest user request and identify the intended outcome in one sentence
- [ ] Identify the repo boundary, target files, and sources of truth
- [ ] Search Kira context with `.agent/boot/coding-anchor/bin/kira-coding-anchor-search "<topic>" --limit 5` when the relevant workflow, protocol, or skill is not obvious
- [ ] Check `.agent/boot/coding-anchor/KIRA-USE-MAP.md` and `.agent/boot/coding-anchor/SKILL-ROUTER.md` when choosing a gate

## Phase 1: Choose Planning Depth

Pick the lightest plan that fits the task:

| Depth | Use When | Output |
| :--- | :--- | :--- |
| Micro | One file, obvious edit, low risk | One sentence outcome and verification command |
| Standard | Multiple steps or files, but clear goal | Short plan with files, risks, and checks |
| Spec-first | Unclear feature, product decision, public surface, or more than three files | `.agent/boot/coding-anchor/bin/kira-coding-anchor-spec "<scope>"` |
| Diagnostic | Cleanup, refactor, stale-state, or messy ownership boundary | `.agent/boot/coding-anchor/bin/athena-coding-anchor-refactor-report "<scope>"` |
| High-risk | Destructive, paid, credential-sensitive, public launch, or irreversible action | Stop after one blocker question or create a review gate |

Do not create ceremony for a tiny edit. Do not skip the spec when the success
criteria are unclear.

## Phase 2: Build The Plan

For a standard plan, write:

1. **Goal**: what will be true when done.
2. **Inputs**: files, docs, commands, data, or external sources used.
3. **Scope**: what will change and what will not.
4. **Steps**: three to seven concrete actions.
5. **Risks**: failure modes worth preventing.
6. **Verification**: deterministic checks required before confidence.
7. **Next slice**: the first atomic unit to execute.

For spec-first work, generate the spec template, then fill it from repo truth:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-spec "<scope>"
```

Keep generated specs ignored unless Stephen explicitly asks to promote one into
durable project docs.

## Phase 3: Convert Plan To Execution

When the user asks to proceed, or the request already implies execution:

1. Create or mentally hold one atomic task.
2. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-task "<scope>"` when a durable task handhold helps.
3. Execute only the first verified slice.
4. Run the verification named in the plan.
5. If the check fails, fix inside the same slice before expanding scope.

Do not wait for approval when the plan has one safe interpretation and the user
already asked to make it happen. Ask only when materially different plans would
produce different outcomes.

## Phase 4: Checkpoint Or Hand Off

For a durable plan or completed slice:

1. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-readiness "<scope>"` when the plan is multi-slice, public, or ready to save.
2. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-checkpoint "<scope>"` before staging a verified atomic unit.
3. Stage only files that belong to the current slice.
4. Commit and push only when requested or when the ongoing slice pattern clearly calls for save/publish hygiene.
5. Leave the next handhold explicit.

## Phase 5: Response Shape

For planning-only requests, return:

1. Goal.
2. Plan.
3. Verification.
4. First execution slice.

For plan-plus-execution requests, return:

1. What changed.
2. What passed.
3. What remains unverified.
4. Next handhold.

**Confirm**: "Kira plan complete. Boundary found, route chosen, verification named, next slice clear."

---

# workflow #plan #spec #task #kira
