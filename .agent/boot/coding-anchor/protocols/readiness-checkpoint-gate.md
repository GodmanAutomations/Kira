# Readiness Checkpoint Gate

Use this gate before treating a long Athena Coding Anchor run as ready to
save, publish, hand off, or expand into a new workstream.

## Trigger

- Stephen asks to save, lock in, publish, push, checkpoint, or move on.
- A boot-packet transplant has accumulated multiple adopted skills or helpers.
- A new agent needs one current view of what is adopted, ignored, verified, and
  still source-only.

## Checks

1. Run the doctor.
2. Run the readiness helper:

   ```bash
   .agent/boot/coding-anchor/bin/athena-coding-anchor-readiness "<scope>"
   ```

3. Confirm generated readiness reports are ignored by git unless Stephen asks
   for a deliberate receipt artifact.
4. Confirm `SKILL-ROUTER.md` still names source-only and needs-repair skills.
5. Confirm `git status --short` contains only intentional files for the
   current slice.
6. If saving, stage only the current atomic unit.

## Output

Report in plain language:

- readiness verdict
- adopted skills and helper coverage
- generated artifact locations
- verification that passed
- files intentionally left uncommitted or source-only
- next safest handhold

