# Diagnostic Refactor Scan

Use this before modifying a stale, duplicated, or high-risk surface.

1. Select the exact target file, directory, workflow, or script.
2. Read the target and its nearest docs or callers.
3. Produce a bill-of-materials report before editing.
4. Classify each finding by category, fix, impact, and regression risk.
5. Convert only accepted fixes into atomic execution slices.

Do not:

- rewrite the target during the scan
- include vague findings without a concrete fix
- use the report as a dumping ground for unrelated cleanup
