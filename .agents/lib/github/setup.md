# Setup

Initialize a GitHub workflow for the canonical superproject repository.

## 1. Authenticate

```bash
gh auth status
```

If authentication fails, stop and tell the user to run `gh auth login`.

## 2. Canonical Repository

The canonical repo for this superproject is:

```bash
CANONICAL_OWNER="PKUZHOU"
CANONICAL_NAME="pto3-qwen"
CANONICAL_REPO="$CANONICAL_OWNER/$CANONICAL_NAME"
```

## 3. Determine the Default Branch

Prefer GitHub metadata:

```bash
DEFAULT_BRANCH=$(gh repo view "$CANONICAL_REPO" \
  --json defaultBranchRef -q '.defaultBranchRef.name')
```

Fallbacks:

```bash
[ -z "$DEFAULT_BRANCH" ] && \
  DEFAULT_BRANCH=$(git remote show origin 2>/dev/null \
    | sed -n 's/.*HEAD branch: //p' | head -n1)
[ -z "$DEFAULT_BRANCH" ] && DEFAULT_BRANCH=main
```

## 4. Ensure a Canonical Remote Exists

If `origin` already points to the canonical repo, use it as the base remote.
Otherwise add or reuse a `canonical` remote.

```bash
ORIGIN_URL=$(git remote get-url origin 2>/dev/null || echo "")

if echo "$ORIGIN_URL" | grep -Eq 'PKUZHOU/pto3-qwen(\.git)?$'; then
  BASE_REMOTE="origin"
else
  BASE_REMOTE="canonical"
  if ! git remote | grep -qx "$BASE_REMOTE"; then
    git remote add "$BASE_REMOTE" "git@github.com:$CANONICAL_REPO.git"
  fi
fi

git fetch "$BASE_REMOTE"
BASE_REF="$BASE_REMOTE/$DEFAULT_BRANCH"
```

## 5. Detect Current State

```bash
BRANCH_NAME=$(git branch --show-current 2>/dev/null || echo "")
UNCOMMITTED=$(git status --porcelain)

if [ -n "$BRANCH_NAME" ]; then
  COMMITS_AHEAD=$(git rev-list HEAD --not "$BASE_REF" --count 2>/dev/null || echo "0")
else
  COMMITS_AHEAD="0"
fi
```

## 6. Choose the Push Remote

Preferred order:

1. the current branch's upstream remote, if it is not the canonical base remote
2. a writable fork remote such as `uv`
3. the canonical base remote

```bash
UPSTREAM_REF=$(git rev-parse --abbrev-ref "@{upstream}" 2>/dev/null || echo "")
UPSTREAM_REMOTE=$(echo "$UPSTREAM_REF" | cut -d'/' -f1)

if [ -n "$UPSTREAM_REMOTE" ] && [ "$UPSTREAM_REMOTE" != "$BASE_REMOTE" ]; then
  PUSH_REMOTE="$UPSTREAM_REMOTE"
elif git remote | grep -qx "uv"; then
  PUSH_REMOTE="uv"
else
  PUSH_REMOTE="$BASE_REMOTE"
fi
```

## 7. Derive PR Head Prefix

```bash
PUSH_URL=$(git remote get-url "$PUSH_REMOTE" 2>/dev/null || echo "")
PUSH_OWNER=$(echo "$PUSH_URL" | sed -n 's#.*[:/]\([^/]*\)/\([^/]*\)\(.git\)\{0,1\}$#\1#p')

if [ "$PUSH_REMOTE" = "$BASE_REMOTE" ] || [ "$PUSH_OWNER" = "$CANONICAL_OWNER" ]; then
  PR_HEAD_PREFIX=""
else
  PR_HEAD_PREFIX="$PUSH_OWNER:"
fi
```

## Variables Set

- `CANONICAL_OWNER`
- `CANONICAL_NAME`
- `CANONICAL_REPO`
- `DEFAULT_BRANCH`
- `BASE_REMOTE`
- `BASE_REF`
- `PUSH_REMOTE`
- `PR_HEAD_PREFIX`
- `BRANCH_NAME`
- `COMMITS_AHEAD`
- `UNCOMMITTED`
