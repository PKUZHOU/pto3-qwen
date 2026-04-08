# In-Progress Docs Workflow

## Purpose

`docs/in_progress/` is the working area for the current PR. It should always
answer two questions quickly:

1. What is the active PR trying to do?
2. Which in-progress docs still need review, merging, or retirement?

## Required Files

- `docs/in_progress/README.md` tracks the active PR at a glance.
- `docs/in_progress/<topic>.md` files hold focused design, review, migration,
  or open-question material for that PR.

## `README.md` Requirements

Keep these sections current:

- PR title or placeholder
- Branch name
- Owners or reviewers
- Status
- Scope summary
- Active in-progress docs and their intended stable destination
- Open questions or risks
- Merge checklist

If there is no active PR yet, leave the placeholders in place instead of
deleting the file.

## Per-Doc Requirements

Each `docs/in_progress/*.md` file should state:

- What part of the PR it covers
- The expected stable destination (`docs/<name>.md`, an existing doc section,
  or "discard after merge")
- Whether it is design, review, investigation, or implementation notes
- The decision or question it currently records

## When Opening or Updating a WIP PR

- Refresh `docs/in_progress/README.md` first.
- Create or update the focused in-progress docs that explain the current design,
  review findings, or migration steps.
- Reference those docs in the PR body.

## Before Merging a PR

Every `docs/in_progress/*.md` file must be triaged:

- Merge its durable content into a stable doc under `docs/`
- Rename or move it into `docs/` if it should become a standalone stable doc
- Delete it if it only captured temporary review discussion

After that:

- Update `docs/in_progress/README.md` to reflect the new state
- Remove stale links and references to retired in-progress docs

## Review Expectations

PR review is not complete until both code and in-progress docs are reviewed.
Agents should look for:

- stale scope or status in `docs/in_progress/README.md`
- design notes that no longer match the implementation
- in-progress docs that should already have been merged into stable docs
