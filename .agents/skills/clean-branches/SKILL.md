---
name: clean-branches
description: Remove merged local and fork branches after verifying they are safe to delete. Use when the user asks to clean up git branches.
---

# Clean Branches Workflow

## 1. Identify the Base and Push Remotes

Use `.agents/lib/github/setup.md`.

The canonical base remote must never have branches deleted by accident.

## 2. Gather Candidate Branches

```bash
git branch --merged "$BASE_REF"
git branch
git branch -r
```

If `gh` is available, also check for squash-merged branches by querying PRs in
the canonical repo.

## 3. Present Safe Candidates

Only propose deletion for branches whose work is already merged into the base
branch or merged through a PR.

## 4. Delete After Explicit Approval

Delete local branches with `git branch -d` or `-D` as appropriate. Delete fork
remote branches only on the chosen push remote, never on the canonical base
remote unless the user explicitly asks.
