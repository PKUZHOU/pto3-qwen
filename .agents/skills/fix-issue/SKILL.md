---
name: fix-issue
description: Fix a GitHub issue in the superproject or a touched submodule, then commit and open a PR with the right doc handling. Use when the user asks to work on a specific issue.
---

# Fix Issue Workflow

## 1. Setup

Read `.agents/lib/github/setup.md` and fetch the issue:

```bash
gh issue view "$ISSUE_NUMBER" --repo "$CANONICAL_REPO"
```

## 2. Create a Branch

Create a focused branch from `BASE_REF`.

## 3. Plan the Fix

Identify:

- whether the fix lives in the superproject or a submodule
- which docs must change
- whether `docs/in_progress/` should track the work

## 4. Implement and Validate

- follow the owning repository's local rules
- run the owning repository's validation
- update `docs/in_progress/` if the issue drives an active PR or design thread

## 5. Commit and Open the PR

Use `git-commit`, then `github-pr`. Reference the issue number in the commit
body or PR body when appropriate.
