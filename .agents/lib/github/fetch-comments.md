# Fetch Unresolved PR Comments

Fetch unresolved review threads for a PR.

```bash
gh api graphql -f query='
query {
  repository(owner: "'"$CANONICAL_OWNER"'", name: "'"$CANONICAL_NAME"'") {
    pullRequest(number: '"$PR_NUMBER"') {
      reviewThreads(first: 100) {
        nodes {
          id
          isResolved
          comments(first: 50) {
            nodes {
              id
              databaseId
              body
              path
              line
              originalLine
              diffHunk
              author { login }
              createdAt
            }
          }
        }
      }
    }
  }
}' --jq '[.data.repository.pullRequest.reviewThreads.nodes[] | select(.isResolved == false)]'
```
