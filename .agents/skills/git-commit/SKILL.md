---
name: git-commit
description: Prepare a superproject commit with the right validation level, staging discipline, and message format. Use when creating commits or preparing changes for commit.
---

# Git Commit Workflow

## 1. Inspect What Changed

```bash
git diff --name-only
git diff --cached --name-only
git status --short
```

Classify the change:

- docs and agent metadata only: `docs/`, `docs/in_progress/`, `.agents/`,
  `AGENTS.md`
- superproject metadata: submodule pointers, `.gitmodules`, root config
- submodule-local code changes: files changed inside `pypto/`, `simpler/`, or
  another submodule checkout

## 2. Decide Validation

- docs and agent metadata only: review content carefully; tests usually skip
- submodule pointer updates: confirm the pointed commit was validated in that
  submodule
- submodule-local code changes: run the touched submodule's local validation and
  follow its own agent guidance before committing here

## 3. Stage Carefully

Stage related changes together. Be especially careful with submodule pointers.

```bash
git add AGENTS.md .agents docs/in_progress
git diff --staged
```

Do not accidentally stage:

- unrelated dirty submodule pointers
- build outputs
- local logs or scratch files

## 4. Commit Message Format

Use conventional commits:

```text
type(scope): description
```

Examples:

- `docs(agents): add superproject wip pr workflow`
- `fix(superproject): update simpler pointer for distributed runtime`
- `chore(docs): merge in-progress runtime notes`

For multi-file or non-obvious changes, add a body that explains what changed
and why.

## 5. Commit

```bash
git commit -m "docs(agents): add superproject wip pr workflow"
```

Never add AI co-author trailers.

## 6. Verify

```bash
git show --stat HEAD
git log -1 --format=%B
```
