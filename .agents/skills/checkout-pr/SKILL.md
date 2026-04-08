---
name: checkout-pr
description: Fetch a PR head branch and create a local work branch for it. Use when the user wants to work on an existing PR locally.
---

# Checkout PR Workflow

## 1. Setup

Read `.agents/lib/github/setup.md`.

## 2. Fetch PR Metadata

```bash
gh pr view "$PR_NUMBER" --repo "$CANONICAL_REPO" --json \
  number,title,headRefName,headRepository,headRepositoryOwner,state
```

## 3. Add the Correct Remote

If the PR head repo is the canonical repo, use `BASE_REMOTE`. Otherwise add a
remote named after the fork owner.

## 4. Create the Local Work Branch

Follow `.agents/lib/github/checkout-fork-branch.md`.
