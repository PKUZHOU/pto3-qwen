# Branch Naming

Generate branch names from the change type and short description.

## Prefix Rules

| Change type | Branch prefix |
| ----------- | ------------- |
| `feat` | `feat/` |
| `fix` | `fix/` |
| `refactor` | `refactor/` |
| `docs` | `docs/` |
| `test` | `test/` |
| `chore` | `chore/` |
| `support` | `support/` |

## Slug Rules

1. Lowercase the description.
2. Replace spaces and punctuation with `-`.
3. Strip duplicate or trailing `-`.
4. Keep the final slug reasonably short.

## Examples

- `docs(superproject): add wip pr workflow` ->
  `docs/add-wip-pr-workflow`
- `fix(runtime): align qwen dist launch args` ->
  `fix/align-qwen-dist-launch-args`
