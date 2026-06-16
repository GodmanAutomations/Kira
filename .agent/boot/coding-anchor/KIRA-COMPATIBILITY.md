# Kira Compatibility Map

This file names the compatibility surfaces that intentionally remain after the
Kira rename. Treat these as stable handholds until a later cleanup slice proves
they are safe to retire.

## Canonical Surfaces

| Surface | Canonical value |
| :--- | :--- |
| Repository identity | `GodmanAutomations/Kira` |
| Primary remote | `kira` |
| Current branch | `codex/kira-coding-anchor-boot` |
| Boot packet root | `.agent/boot/coding-anchor/` |
| Human boot helper | `bin/kira-coding-anchor-boot` |
| Human doctor helper | `bin/kira-coding-anchor-doctor` |
| Human search helper | `bin/kira-coding-anchor-search` |
| Human readiness helper | `bin/kira-coding-anchor-readiness` |
| Human checkpoint helper | `bin/kira-coding-anchor-checkpoint` |
| Use map | `KIRA-USE-MAP.md` |
| Landing note | `KIRA-LANDING.md` |

## Compatibility Surfaces

| Surface | Compatibility value | Status |
| :--- | :--- | :--- |
| Historical worktree path | `/Users/stephengodman/000_AI/agent-frameworks/Athena-Public-codex-boot` | Keep during active sessions. Rename only as a separate slice. |
| Upstream source remote | `origin` -> `https://github.com/winstonkoh87/Athena-Public.git` | Keep for source-framework comparison only. Do not push Kira work here. |
| Historical remote branch | `codex/athena-coding-anchor-boot` | Keep as a compatibility pointer until references are checked. Current observed ref: `4aca0a7`. |
| Legacy use map path | `ATHENA-USE-MAP.md` | Compatibility pointer to `KIRA-USE-MAP.md`; do not add new routing there. |
| Legacy helper prefix | `bin/athena-coding-anchor-*` | Keep as executable targets. Kira wrappers call these helpers. |

## Cleanup Rules

1. Add a Kira-facing wrapper before renaming a helper.
2. Update this map, `KIRA-LANDING.md`, `README.md`, and the doctor in the same
   slice when a compatibility surface changes.
3. Run `bin/kira-coding-anchor-doctor` after any compatibility edit.
4. Do not delete the historical branch, remote, path, or helper names without a
   reference scan across docs, scripts, automations, and active worktrees.
5. Do not move the local worktree while an active Codex session is using it.

## Verification Handhold

Before retiring any surface above, run a focused reference scan for the exact
old name, update the replacement docs in the same change, and leave the old
surface in place if any active agent, workflow, or remote branch still depends
on it.
