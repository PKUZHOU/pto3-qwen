# Lookup PR

Find a PR in the canonical repository.

## By PR Number

```bash
gh pr view "$PR_NUMBER" --repo "$CANONICAL_REPO" \
  --json number,title,headRefName,baseRefName,state
```

## By Local Branch

If the branch is on the canonical repo:

```bash
gh pr list --repo "$CANONICAL_REPO" --head "$BRANCH_NAME" \
  --json number,title,state
```

If the branch is pushed through a fork remote:

```bash
gh pr list --repo "$CANONICAL_REPO" --head "$PR_HEAD_PREFIX$BRANCH_NAME" \
  --json number,title,state
```

## By Cross-Fork Tracking Branch

When a local work branch tracks a remote fork branch, search by
`owner:branch-name`:

```bash
gh pr list --repo "$CANONICAL_REPO" --head "$FORK_OWNER:$HEAD_BRANCH" \
  --json number,title,state
```
