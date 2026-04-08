# Checkout Fork Branch

Create or refresh a local work branch for a PR whose head branch is not the
canonical base branch.

```bash
LOCAL_BRANCH="pr-$PR_NUMBER-work"

if git show-ref --verify --quiet "refs/heads/$LOCAL_BRANCH"; then
  git checkout "$LOCAL_BRANCH"
  git pull "$PUSH_REMOTE" "$HEAD_BRANCH"
else
  git fetch "$PUSH_REMOTE" "$HEAD_BRANCH:$LOCAL_BRANCH"
  git checkout "$LOCAL_BRANCH"
fi

git branch --set-upstream-to="$PUSH_REMOTE/$HEAD_BRANCH" "$LOCAL_BRANCH"
BRANCH_NAME="$LOCAL_BRANCH:$HEAD_BRANCH"
```

This lets later workflows push back to the correct remote branch with
`--force-with-lease`.
