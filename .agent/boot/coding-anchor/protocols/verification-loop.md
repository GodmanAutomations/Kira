# Verification Loop

Use the smallest meaningful check available.

1. File change: inspect the changed file and run syntax or schema checks.
2. Script change: run shell syntax checks and the script itself.
3. App change: run tests, then open or smoke-test the relevant route.
4. Config change: run the tool's native validation command when available.
5. Documentation change: verify paths, commands, and dates are true.

Close with:

- What changed.
- What passed.
- What remains unverified, if anything.
