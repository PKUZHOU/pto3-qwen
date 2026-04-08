# Superproject Agent Guidance

This directory contains only the rules, skills, and reusable GitHub workflow
notes that are worth promoting from submodule-local setups into the
superproject.

## Selection Policy

- Move generic workflow guidance that still makes sense at the repository root.
- Adapt guidance when the original assumed a different repo layout, remote
  naming scheme, or docs structure.
- Leave architecture, device, benchmark, and submodule-internal test guidance
  in the submodules that own that behavior.

## Imported and Adapted

### From `pypto/.claude`

- `rules/documentation.md` -> `.agents/rules/documentation.md`
- `rules/language-policy.md` -> `.agents/rules/language-policy.md`
- `rules/worktree-builds.md` -> `.agents/rules/worktree-builds.md`
- `rules/plans-and-proposals.md` -> `.agents/rules/plans-and-proposals.md`
- `rules/problem-handling.md` -> `.agents/rules/known-issues-tracking.md`
- `skills/git-commit/SKILL.md` -> `.agents/skills/git-commit/SKILL.md`
- `skills/github-pr/SKILL.md` -> `.agents/skills/github-pr/SKILL.md`

### From `simpler/.claude`

- `skills/review-pr/SKILL.md` -> `.agents/skills/review-pr/SKILL.md`
- `skills/create-issue/SKILL.md` -> `.agents/skills/create-issue/SKILL.md`
- `skills/fix-issue/SKILL.md` -> `.agents/skills/fix-issue/SKILL.md`
- `skills/fix-pr/SKILL.md` -> `.agents/skills/fix-pr/SKILL.md`
- `skills/clean-branches/SKILL.md` -> `.agents/skills/clean-branches/SKILL.md`
- `skills/checkout-pr/SKILL.md` -> `.agents/skills/checkout-pr/SKILL.md`
- `lib/github/*.md` -> `.agents/lib/github/*.md`

## New Superproject-Only Additions

- `.agents/rules/in-progress-docs.md`
- `.agents/skills/wip-pr/SKILL.md`
- `.agents/skills/doc-merge/SKILL.md`
- `docs/in_progress/README.md`

These files codify the active-PR workflow that did not exist in either source
repo.

## Kept Submodule-Local

### `pypto/.claude` content not promoted

- `core-development`, `cross-layer-sync`, `error-checking`
- `first-principles`
- `pass-*`
- `python-style`
- `testing-and-examples`
- `documentation-length`
- `compare-codegen`
- `testing`

Reason: these are specific to PyPTO architecture, APIs, passes, language
surface, or local test layout.

### `simpler/.claude` content not promoted

- `rules/architecture.md`
- `rules/ascend-device.md`
- `rules/codestyle.md`
- `skills/testing/SKILL.md`
- `skills/benchmark/SKILL.md`
- all files under `commands/`

Reason: these depend on Simpler runtime internals, hardware setup, or
repo-specific command wrappers.

## Notes for Future Updates

- If a new workflow is clearly cross-repo and not owned by a single submodule,
  add it here.
- If a rule starts naming concrete files, tests, APIs, or architectures inside
  one submodule, move that guidance back down to the owning repository.
