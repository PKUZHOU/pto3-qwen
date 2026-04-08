---
name: github-pr
description: Create or update a GitHub PR for the superproject after rebasing, pushing, and syncing PR docs. Use when the user asks to open, update, or submit a PR.
---

# GitHub Pull Request Workflow

## Setup

1. Read `.agents/lib/github/setup.md`
2. Read `.agents/lib/github/lookup-pr.md`
3. If the PR is documentation-heavy or still under review, also follow
   `.agents/skills/wip-pr/SKILL.md`

## Path A: Create a New PR

### A1. Prepare the Branch

If you are on the default branch or have zero commits ahead of `BASE_REF`,
create a new branch using `.agents/lib/github/branch-naming.md`.

If uncommitted changes exist, commit them first with `git-commit`.

### A2. Rebase and Push

Follow `.agents/lib/github/commit-and-push.md`.

### A3. Create the PR

Use `gh pr create` against `CANONICAL_REPO`. Prefer a draft PR when:

- the implementation is incomplete
- `docs/in_progress/*.md` still contain open design questions
- review feedback is expected to change the stable docs significantly

Suggested body:

```markdown
## Summary
- change 1
- change 2

## Validation
- check 1
- check 2

## Docs
- docs/in_progress/README.md
- docs/in_progress/<topic>.md
```

## Path B: Update an Existing PR

### B1. Find the Existing PR

Use `.agents/lib/github/lookup-pr.md`.

### B2. Refresh Docs Before Pushing

If the PR uses `docs/in_progress/`, update:

- `docs/in_progress/README.md`
- each active `docs/in_progress/*.md`
- the PR body if tracked docs or scope changed materially

### B3. Rebase, Push, and Edit the PR

Follow `.agents/lib/github/commit-and-push.md`, then use `gh pr edit` when the
title, summary, or docs links need updating.

## Important

- Use `--force-with-lease`, not `--force`
- Do not add AI attribution footers
- If the PR is ready to merge and still has in-progress docs, run
  `doc-merge` before calling it complete
