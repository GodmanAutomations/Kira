# Kira Landing Note

This is the current landing state for the Kira Coding Anchor boot packet.

## Current Truth

- Repository: `GodmanAutomations/Kira`
- Primary remote: `kira`
- Current default branch: `codex/kira-coding-anchor-boot`
- Current local worktree:
  `/Users/stephengodman/000_AI/agent-frameworks/Athena-Public-codex-boot`
- Boot packet root: `.agent/boot/coding-anchor/`
- Boot command:
  `.agent/boot/coding-anchor/bin/athena-coding-anchor-boot`
- Doctor command:
  `.agent/boot/coding-anchor/bin/athena-coding-anchor-doctor`

## Naming Decisions

- Kira is the live repository identity for this packet.
- `Athena-Public` remains historical provenance and may appear in source
  paths, upstream lineage notes, and the current worktree path.
- Keep `ATHENA-USE-MAP.md` and `athena-coding-anchor-*` helper names stable
  for now. They are compatibility names, not identity claims.
- Keep the old remote branch `codex/athena-coding-anchor-boot` for now as a
  compatibility pointer. Do not delete it until downstream references are
  checked.
- Do not rename the local worktree folder during ordinary boot work. Treat that
  as a separate low-risk cleanup slice.

## Remote State

- `kira` points to `https://github.com/GodmanAutomations/Kira.git`.
- `origin` still points to the upstream Athena public source:
  `https://github.com/winstonkoh87/Athena-Public.git`.
- Use `kira` for Kira work. Use `origin` only for upstream comparison or
  deliberate source-framework review.

## Safe Next Moves

1. Use the packet on real Kira work before renaming paths or helpers.
2. If renaming helpers, add compatibility wrappers first.
3. If deleting old remote branches, confirm no active agents, automations, or
   docs still reference them.
4. If renaming the local worktree folder, close running sessions that depend on
   the old path first.

## Do Not Do Casually

- Do not delete the old Athena-named remote branch without a reference check.
- Do not rename every `athena-coding-anchor-*` helper in one unverified sweep.
- Do not treat the source CodeX packet as a runtime dependency.
- Do not import private CodeX room state into Kira.

