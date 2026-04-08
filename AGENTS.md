# Superproject Codex Instructions

This repository keeps superproject-level agent policy in `.agents/`. Treat
`.agents/` as the authoritative source of truth for top-level work. When you
touch a submodule, also read and follow that submodule's local instructions.

## Read First

Before changing code, docs, submodule pointers, or PR metadata:

- Read `.agents/README.md`
- Read the relevant files in `.agents/rules/`
- Follow `.agents/skills/*/SKILL.md` when the task matches a documented
  workflow

Submodule-specific guidance:

- `pypto/`: read `pypto/AGENTS.md`
- `simpler/`: read the relevant files under `simpler/.claude/rules/`,
  `simpler/.claude/skills/`, and `simpler/.claude/lib/`
- Other submodules: inspect local docs and existing workflow files before
  changing project-specific behavior

## Working Agreements

- Keep superproject guidance focused on cross-repo coordination, docs, PRs,
  submodule pointers, and integration behavior. Do not copy submodule-specific
  architecture or test commands into the top level.
- Stable markdown belongs in `docs/`. Ongoing PR notes belong in
  `docs/in_progress/`. The only non-`docs/` markdown exception is agent
  metadata under `.agents/`.
- `docs/in_progress/README.md` is the canonical status page for the active PR.
  Update it whenever the current PR scope, branch, open questions, or tracked
  in-progress docs change.
- For a PR that introduces or changes design decisions, keep the working notes
  in `docs/in_progress/*.md` until review converges. Merge or retire those docs
  before the PR lands.
- Build and test from the current checkout of the affected repository or
  submodule. Never copy generated artifacts between worktrees, branches, or
  submodules.
- If a task edits files inside a submodule, validate from that submodule's root
  and follow its local conventions. If the superproject only updates a submodule
  pointer, do not invent top-level build steps that bypass the submodule.
- Never add AI co-author trailers to commits or PR text.

## Preferred Skills

- Commit workflow: `.agents/skills/git-commit/SKILL.md`
- PR workflow: `.agents/skills/github-pr/SKILL.md`
- PR review: `.agents/skills/review-pr/SKILL.md`
- WIP PR docs workflow: `.agents/skills/wip-pr/SKILL.md`
- In-progress doc merge: `.agents/skills/doc-merge/SKILL.md`
- Issue workflows: `.agents/skills/create-issue/SKILL.md`,
  `.agents/skills/fix-issue/SKILL.md`, `.agents/skills/fix-pr/SKILL.md`
- Branch maintenance: `.agents/skills/clean-branches/SKILL.md`,
  `.agents/skills/checkout-pr/SKILL.md`

## Repository Map

- `docs/`: superproject design docs, integration notes, review docs
- `docs/in_progress/`: active PR tracking and working design notes
- `pypto/`: compiler, DSL, and runtime integration
- `pypto-lib/`: examples and delivery-facing integration material
- `simpler/`: runtime, communication, execution backends, scripts
- `PTOAS/`, `pto-isa/`: assembler and ISA dependencies used by upper layers

## Remember

Top-level guidance is intentionally thin. If the task becomes submodule-local,
switch to that submodule's rules instead of growing superproject policy with
repo-specific details.
