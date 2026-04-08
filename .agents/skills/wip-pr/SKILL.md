---
name: wip-pr
description: Open or update a draft/WIP PR while keeping docs/in_progress current. Use when a PR is still evolving, under review, or design decisions are still being documented.
---

# WIP PR Workflow

## 1. Refresh In-Progress Docs First

Update `docs/in_progress/README.md` so it records:

- PR title
- branch
- owners or reviewers
- current status
- active in-progress docs
- open questions and merge checklist

Then create or update focused docs in `docs/in_progress/*.md`.

## 2. Verify Each In-Progress Doc Has a Job

Every active file should clearly be one of:

- design notes to be merged into a stable doc
- review findings to be folded into a stable doc or discarded later
- investigation notes that justify a pending implementation choice

## 3. Commit the Current State

Use `git-commit`.

## 4. Open or Update a Draft PR

Use `github-pr`, but keep the PR as a draft until:

- the implementation is reviewable
- the active in-progress docs are synchronized with the code
- the intended stable doc destinations are clear

Suggested PR body additions:

```markdown
## In-Progress Docs
- docs/in_progress/README.md
- docs/in_progress/<topic>.md

## Open Questions
- question 1
- question 2
```

## 5. During Review

Whenever the branch scope changes:

- update `docs/in_progress/README.md`
- update the relevant in-progress docs
- update the PR body if the tracked docs or open questions changed

## 6. Before Marking Ready or Merging

Run `doc-merge` to move durable content out of `docs/in_progress/`.
