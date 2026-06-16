# Atomic Execution Loop

Use this when Stephen says to take the next slice or when a plan needs
implementation.

1. Convert the next slice into one task block.
2. Keep the task small enough to verify with one command or one direct check.
3. Touch only the files named by the task unless verification proves another
   file must change.
4. Run the verification before starting another task.
5. If a task creates durable knowledge, update the smallest durable surface.
6. If a verified slice changed durable repo files, surface a checkpoint option
   in plain language before stacking more work.

Stop when:

- the verification target is unclear
- the next task would widen into unrelated repo areas
- the task needs a push, destructive operation, payment, credential change, or
  external contact that Stephen has not requested
