---
name: fix-pr
description: Address PR review comments and failing checks, then update the PR and its in-progress docs until it is clean. Use when fixing review feedback or CI problems on an existing PR.
---

# Fix PR Workflow

## 1. Setup

Read:

- `.agents/lib/github/setup.md`
- `.agents/lib/github/lookup-pr.md`
- `.agents/lib/github/detect-permission.md`

## 2. Collect the Problems

For review comments:

- use `.agents/lib/github/fetch-comments.md`

For PR checks:

```bash
gh pr checks "$PR_NUMBER" --repo "$CANONICAL_REPO"
```

## 3. Classify the Work

Separate:

- actionable code or doc fixes
- discussable comments that may not require changes
- temporary or resolved issues

If the PR uses `docs/in_progress/`, include stale or missing PR-doc updates in
the fix list.

## 4. Update the Branch

- checkout the correct PR branch
- make the changes
- update `docs/in_progress/README.md` and related docs when the PR scope or
  design notes changed
- commit with `git-commit`
- rebase and push with `.agents/lib/github/commit-and-push.md`

## 5. Reply and Resolve

For each addressed thread, follow `.agents/lib/github/reply-and-resolve.md`.

## 6. Re-check

Repeat until the remaining comments and checks are either resolved or explicitly
deferred by the user.
