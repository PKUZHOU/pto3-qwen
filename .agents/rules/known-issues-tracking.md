# Known Issues Tracking

## Core Principle

If you discover a non-blocking defect that is outside the current task, record
it locally instead of silently ignoring it.

## Local Tracking File

Use `KNOWN_ISSUES.md` at the superproject root for unresolved local notes. This
file is local working state, not project documentation.

## When to Log

- unexpected behavior discovered during unrelated work
- build or environment quirks that are real but not required for the current
  task
- documentation mismatches found incidentally
- submodule integration problems that should be tracked later

Do not log issues that you are already fixing in the current task.

## Entry Format

```markdown
# Known Issues

## Short Title

- Date: YYYY-MM-DD
- Found during: short task context
- Description: what is wrong
- Location: path or N/A
- Severity: low | medium | high
```

## On Task Completion

- remove entries that your current task resolved
- mention remaining relevant issues to the user
- promote durable issues to GitHub with `.agents/skills/create-issue/SKILL.md`
