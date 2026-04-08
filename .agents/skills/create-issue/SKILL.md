---
name: create-issue
description: Create a GitHub issue for the canonical superproject repo, including issues promoted from KNOWN_ISSUES.md. Use when the user asks to file a bug, feature request, or tracking issue.
---

# Create GitHub Issue

## 1. Setup

Read `.agents/lib/github/setup.md` and confirm `gh auth status` works.

## 2. Gather the Source

The issue can come from:

- direct user input
- a local `KNOWN_ISSUES.md` entry

If promoting from `KNOWN_ISSUES.md`, verify the issue still exists before
creating the GitHub issue.

## 3. Check for Duplicates

Search open issues in the canonical repo:

```bash
gh issue list --repo "$CANONICAL_REPO" --state open --limit 100
```

If an existing issue already covers the same problem, stop and report it.

## 4. Create the Issue

Use a concise title and a structured body:

```markdown
## Summary

## Context

## Reproduction or Evidence

## Expected Outcome

## Actual Outcome
```

Then create it:

```bash
gh issue create --repo "$CANONICAL_REPO" --title "..." --body "..."
```

## 5. Cleanup

If the issue came from `KNOWN_ISSUES.md`, remove the local entry after the
GitHub issue is created.
