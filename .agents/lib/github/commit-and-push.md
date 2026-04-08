# Commit and Push

Prepare the current branch for a PR by rebasing, squashing if needed, and
pushing safely.

## 1. Rebase Onto the Latest Base

```bash
BEFORE_REBASE=$(git rev-parse HEAD)
git fetch "$BASE_REMOTE"
git rebase "$BASE_REF"
AFTER_REBASE=$(git rev-parse HEAD)
```

If the rebase stops on conflicts, resolve them, stage the resolutions, and run
`git rebase --continue`. If the rebase should be abandoned, use
`git rebase --abort`.

## 2. Ensure a Single Reviewable Commit

```bash
COMMITS_AHEAD=$(git rev-list HEAD --not "$BASE_REF" --count 2>/dev/null || echo "0")
```

- `0`: stop, there is nothing to push
- `1`: continue
- `>1`: squash into one commit before pushing

Recommended squash flow:

```bash
CURRENT_USER_EMAIL=$(git config user.email)
OTHER_AUTHORS=$(git log "$BASE_REF"..HEAD --format='%aN <%aE>' \
  | grep -v -F "<$CURRENT_USER_EMAIL>" | sort -u)
git reset --soft "$BASE_REF"
```

Then create a new combined commit with the `git-commit` skill. Preserve other
human authors with `Co-authored-by:` trailers if needed.

## 3. Push

First push:

```bash
git push --set-upstream "$PUSH_REMOTE" "$BRANCH_NAME"
```

Update push after rebase:

```bash
git push --force-with-lease "$PUSH_REMOTE" "$BRANCH_NAME"
```

Use `--force-with-lease`, never plain `--force`.
