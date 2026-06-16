# Credential Prompt Handling

Use this when Codex hits an API key, password, login, token, or auth prompt
while working for Stephen.

## Default Move

Do not hand the task back just because a credential prompt appears. Try the
approved local sources first:

1. Existing environment variables.
2. Configured secret managers or password managers.
3. Approved local operator credential stores outside the repository.
4. Existing browser/session auth when appropriate.
5. Computer or browser automation to fill the prompt directly.

## Boundaries

- Never paste secrets into chat, docs, receipts, logs, screenshots, or commits.
- Never write secrets into tracked files.
- Prefer ignored local secret surfaces such as `.env.local`, project-specific
  ignored config, or the configured secret manager.
- Verify the target file or destination is ignored before writing any secret.
- Do not change or rotate credentials unless Stephen explicitly asks.
- Do not widen into unrelated accounts or rooms just because auth exists.

## Escalate Only For

- fresh one-time codes
- phone approval taps
- biometric approval
- CAPTCHA or human-presence checks
- wet signature or physical-world actions
- ambiguous payment or account-risk decisions

## Report Shape

Report the source category and outcome, not the secret:

- "Used configured secret manager; auth succeeded."
- "Used existing browser session; login succeeded."
- "Blocked on phone approval."
