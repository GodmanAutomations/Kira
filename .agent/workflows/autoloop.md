---
description: Run Kira's bounded auto-loop conductor for efficient multi-slice work
---

# /autoloop - Kira Auto-Loop Conductor

> **Latency Profile**: LOW for one pass, MEDIUM for multi-pass work.
> **Philosophy**: Keep moving in verified slices without becoming a blind autopilot.

Use this workflow when Stephen asks Kira to keep going, hit repeated slices, or
loop through the work efficiently.

## Phase 0: Establish Scope

// turbo

- [ ] Name the requested outcome in one sentence.
- [ ] Keep the loop inside the current Kira worktree unless Stephen explicitly widens scope.
- [ ] Decide the pass count. Default to one pass; use two to five only when the next slices are already obvious and same-scope.

## Phase 1: Run The Conductor

Create the ignored loop report:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-autoloop "<scope>" --passes 1
```

Create the report plus an ignored XML task handhold for pass 1:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-autoloop "<scope>" --passes 1 --task
```

Use a larger pass count only when the task is clear:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-autoloop "<scope>" --passes 3
```

The report must include status, doctor result, inventory, priority queue,
optional task handhold, per-pass action shape, verification, stop gates, and
next handhold.

## Phase 2: Execute One Pass

For each pass:

1. Read the priority queue item.
2. Search only the relevant files.
3. Convert the slice into one task block when a durable handhold helps:

   ```bash
   .agent/boot/coding-anchor/bin/kira-coding-anchor-task "<slice>"
   ```

4. Make the smallest useful change.
5. Run the named verification before another pass.

## Phase 3: Stop Or Continue

Continue only when:

- the previous pass verified
- the next pass stays inside the same scope
- no public, paid, credential, destructive, or external-contact gate appeared
- generated artifacts remain ignored unless deliberately promoted

Stop and report when any gate is hit.

## Phase 4: Closeout

For verified durable changes:

1. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-readiness "<scope>"`.
2. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-checkpoint "<scope>"`.
3. Stage only intentional files when a save point is requested or clearly due.
4. Report what changed, what passed, what remains unverified, and the next handhold.

**Confirm**: "Kira auto-loop pass complete. Report generated, slice verified, next handhold clear."

---

# workflow #autoloop #kira #execution
