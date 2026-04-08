# Documentation Workflow

## Core Principle

Keep stable documentation in `docs/` and keep active PR discussion in
`docs/in_progress/`.

## Placement Rules

- Do not create standalone markdown files outside `docs/` unless the file is
  agent metadata under `.agents/`.
- Use `docs/` for stable design docs, integration notes, review summaries, and
  documents that should survive the current PR.
- Use `docs/in_progress/` for active PR tracking, design alternatives, review
  notes, migration checklists, and any document that is expected to evolve
  during the current PR.
- If the task is specific to a submodule and that submodule already has its own
  docs layout, prefer updating the submodule docs in place instead of copying
  the content into superproject docs.

## Read Before Editing

Before changing code or docs:

1. Read the existing stable docs that describe the affected area.
2. Read `docs/in_progress/README.md` if the work belongs to an active PR.
3. Check whether the relevant submodule has local docs or agent instructions.

## Update After Editing

After changing behavior, verify whether any of the following must be updated:

- Stable docs in `docs/`
- The current PR status in `docs/in_progress/README.md`
- PR-specific design or review docs in `docs/in_progress/*.md`
- Submodule-local docs in `pypto/`, `simpler/`, or another touched submodule

## Style

- Explain scope, decisions, and current status before fine detail.
- Link related files and docs rather than duplicating large sections.
- Keep long-running design discussions in separate `docs/in_progress/*.md`
  files and summarize their current outcome in `docs/in_progress/README.md`.
- When updating an existing stable doc, preserve its language and style unless
  the task explicitly requires a rewrite.

## Completion Check

Before closing a task, verify:

- The code and docs describe the same behavior.
- The active PR's in-progress docs still reflect the latest decision state.
- Any doc that should become stable has a clear merge destination in `docs/`.
