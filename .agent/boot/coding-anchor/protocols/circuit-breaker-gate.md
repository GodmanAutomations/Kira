# Circuit Breaker Gate

Use this gate when a lane shows repeated failure, fatigue, compulsive retrying,
or rising blast radius.

## Gate

1. Stop the current loop.
2. Name the domain: code, Git, auth, UI, research, decision, or operations.
3. Count the red flags.
4. Decide whether this is noise, missing information, systemic failure, or
   scope creep.
5. Resume only with a smaller next action or a better input.
6. If two breaker events hit the same lane, require external review or Stephen
   direction before continuing.

## Stop Phrases

- "one more try" after repeated failure
- "this should be easy" while evidence says otherwise
- repeated broad scans with no new information
- wanting to rewrite because a small fix is annoying
- skipped verification because the answer feels obvious

## Kira Boundary

Generated breaker notes live under `circuit-breakers/` and are ignored by Git.
They are working AARs, not public artifacts.
