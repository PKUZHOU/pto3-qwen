# Common Issues

| Issue | Action |
| ----- | ------ |
| `gh auth status` fails | Ask the user to run `gh auth login` |
| rebase conflict | Resolve files, stage them, continue the rebase |
| push rejected after rebase | Use `git push --force-with-lease` |
| PR not found | Re-check the branch, head owner, or PR number |
| no writable remote | Add a fork remote or push to the canonical remote if allowed |
| branch has multiple commits | Squash before pushing a review PR |

## Quoting Pitfalls

- Use single quotes around `--jq` expressions that contain `!=`.
- Use single quotes or a heredoc for `gh api -f body=...`.
- Prefer `jq` or `gh --jq` over piping `gh api` output into ad hoc JSON parsing.
