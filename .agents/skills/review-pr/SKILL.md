---
name: review-pr
description: Review a superproject PR using the correct merge-base diff and verify that code, submodule pointers, and in-progress docs are aligned. Use when the user asks for a PR review.
---

# Review PR Workflow

## 1. Setup

Read `.agents/lib/github/setup.md`.

If reviewing a PR by number:

```bash
gh pr view "$PR_NUMBER" --repo "$CANONICAL_REPO" \
  --json headRefName,baseRefName,commits
BASE_BRANCH=$(gh pr view "$PR_NUMBER" --repo "$CANONICAL_REPO" \
  --json baseRefName -q '.baseRefName')
git fetch "$BASE_REMOTE" "$BASE_BRANCH"
MERGE_BASE=$(git merge-base "$BASE_REMOTE/$BASE_BRANCH" HEAD)
```

If reviewing the current branch, diff against `BASE_REF`:

```bash
git fetch "$BASE_REMOTE" "$DEFAULT_BRANCH"
MERGE_BASE=$(git merge-base "$BASE_REF" HEAD)
```

## 2. Gather the Diff

```bash
git diff "$MERGE_BASE"...HEAD --stat
git diff "$MERGE_BASE"...HEAD --name-only
git diff "$MERGE_BASE"...HEAD
```

## 3. Check PR-Doc Consistency

If the diff includes `docs/in_progress/`:

- confirm `docs/in_progress/README.md` matches the branch scope
- confirm each in-progress doc has a clear destination or discard plan
- check whether any stable `docs/*.md` should already reflect merged decisions

## 4. Review by Area

Focus on:

- correctness of superproject docs and workflow guidance
- accidental or unexplained submodule pointer changes
- gaps between implementation and documentation
- missing validation or missing merge steps for `docs/in_progress`

## 5. Write the Review

Structure the review with:

- summary of what changed
- findings ordered by severity
- open questions or assumptions
- brief change summary only after findings
