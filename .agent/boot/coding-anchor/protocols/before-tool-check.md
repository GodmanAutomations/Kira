# Before Tool Check

Use this before meaningful reads, edits, tests, or automation.

1. What exact question am I answering?
2. What is the narrowest surface that can answer it?
3. Could this expose secrets, private material, or unrelated rooms?
4. What result would change my next move?

For edits, also state the intended change to Stephen before touching files.

For credential prompts, use `credential-prompt-handling.md`: try approved local
secret sources first, never echo secrets, and escalate only for human-presence
or one-time approval blockers.
