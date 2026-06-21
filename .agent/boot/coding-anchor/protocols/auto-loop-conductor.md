# Auto-Loop Conductor

Use this protocol when Stephen asks Kira to keep moving, loop through the work,
or make the next slices efficient.

The loop is a conductor, not a blind autopilot. It should make the next action
obvious, run the available safety gates, and stop before destructive,
credential-sensitive, paid, public, or ambiguous work.

## Loop Shape

1. **Land**: run status, read current mission/open loops, and name the scope.
2. **Health gate**: run doctor unless a narrower check is the whole task.
3. **Inventory**: find dirty files, open loops, existing tasks, and relevant
   Kira routing surfaces.
4. **Prioritize**: choose the smallest useful slice by this order:
   - repair failing doctor or broken boot surface
   - preserve or verify existing dirty work
   - execute the user-requested scope
   - close an active open loop
   - improve the packet only when the next move is concrete
5. **Task**: create or hold one atomic task block with files, action, verify,
   and done conditions. Use `--task` when the loop should create an ignored
   XML task handhold for pass 1.
6. **Verify**: run the smallest deterministic check for that slice.
7. **Checkpoint gate**: create readiness/checkpoint artifacts only after a
   verified durable change.
8. **Continue**: take another pass only when the next slice is still in the
   same scope and the stop gates are clear.

## Stop Gates

Stop and report the next handhold when:

- doctor fails and the fix is not local or obvious
- the next action would touch unrelated repo areas
- a destructive, paid, public, credential, or external-contact action is needed
- more than one interpretation would materially change the implementation
- verification for the next slice is unclear
- continuing would create unreviewed generated artifacts in tracked files

## Report Shape

An auto-loop report should include:

- scope
- pass count
- status snapshot
- doctor result
- prioritized queue
- optional task handhold
- per-pass action, files, verification, and stop condition
- next handhold

Generated reports live under `autoloops/` and are ignored by default.
