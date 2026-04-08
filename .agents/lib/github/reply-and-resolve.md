# Reply and Resolve

For each addressed review comment:

1. reply to the comment
2. resolve the thread

## Reply

```bash
gh api "repos/${CANONICAL_OWNER}/${CANONICAL_NAME}/pulls/${PR_NUMBER}/comments/${COMMENT_DATABASE_ID}/replies" \
  -f body='Fixed in <commit-hash> - short description'
```

## Resolve

```bash
gh api graphql -f query='
mutation ResolveThread($threadId: ID!) {
  resolveReviewThread(input: {threadId: $threadId}) {
    thread { isResolved }
  }
}' -f threadId="$THREAD_ID"
```

Use the review thread's GraphQL `id` as `THREAD_ID`, not the comment
`databaseId`.
