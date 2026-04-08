# Detect Permission

Determine whether the current user can push to the PR branch.

## Fetch PR Metadata

```bash
PR_DATA=$(gh pr view "$PR_NUMBER" --repo "$CANONICAL_REPO" --json \
  number,title,headRefName,headRepository,headRepositoryOwner,\
  baseRefName,state,maintainerCanModify,author)

HEAD_BRANCH=$(echo "$PR_DATA" | jq -r '.headRefName')
HEAD_REPO_OWNER=$(echo "$PR_DATA" | jq -r '.headRepositoryOwner.login')
HEAD_REPO_NAME=$(echo "$PR_DATA" | jq -r '.headRepository.name')
PR_AUTHOR=$(echo "$PR_DATA" | jq -r '.author.login')
MAINTAINER_CAN_MODIFY=$(echo "$PR_DATA" | jq -r '.maintainerCanModify')
CURRENT_USER=$(gh api user -q '.login')
```

## Decide Permission

```bash
if [ "$PR_AUTHOR" = "$CURRENT_USER" ]; then
  PERMISSION="owner"
elif [ "$HEAD_REPO_OWNER" = "$CANONICAL_OWNER" ]; then
  PERMISSION="write"
elif [ "$MAINTAINER_CAN_MODIFY" = "true" ]; then
  PERMISSION="maintainer"
else
  echo "Error: No push access to PR #$PR_NUMBER"
  exit 1
fi
```

## Set the Push Remote

```bash
case "$PERMISSION" in
  owner|write)
    if [ "$HEAD_REPO_OWNER" = "$CANONICAL_OWNER" ]; then
      PUSH_REMOTE="$BASE_REMOTE"
    else
      PUSH_REMOTE="$HEAD_REPO_OWNER"
    fi
    ;;
  maintainer)
    PUSH_REMOTE="$HEAD_REPO_OWNER"
    if ! git remote | grep -qx "$PUSH_REMOTE"; then
      git remote add "$PUSH_REMOTE" \
        "git@github.com:$HEAD_REPO_OWNER/$HEAD_REPO_NAME.git"
    fi
    git fetch "$PUSH_REMOTE" "$HEAD_BRANCH"
    ;;
esac
```
