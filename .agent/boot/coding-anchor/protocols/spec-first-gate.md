# Spec-First Gate

Use this before building unclear, multi-file, or durable features.

1. State the goal in one sentence.
2. List requirements and non-requirements.
3. Identify touched systems and data flow.
4. Name edge cases and failure modes.
5. Define acceptance criteria that can be verified.
6. Convert the first accepted criterion into an atomic execution slice.

Skip this only when:

- the change is a narrow one-file fix
- the user already supplied a decision-complete plan
- the task is exploratory diagnosis rather than implementation
