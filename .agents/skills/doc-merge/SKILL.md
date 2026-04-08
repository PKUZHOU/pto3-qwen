---
name: doc-merge
description: Review and merge durable content from docs/in_progress into stable docs, then retire temporary PR notes. Use when a PR is converging, ready to merge, or needs documentation cleanup.
---

# In-Progress Doc Merge Workflow

## 1. Inventory the Active Docs

Read:

- `docs/in_progress/README.md`
- every active `docs/in_progress/*.md`
- the stable docs listed as their intended destination

## 2. Classify Each In-Progress Doc

For each file, decide whether to:

- merge content into an existing stable doc
- promote it into a new stable doc under `docs/`
- discard it after extracting the durable conclusions

## 3. Perform a Detailed Review Before Merging

Check that the in-progress content:

- still matches the implementation and current branch state
- does not duplicate or contradict the target stable doc
- distinguishes temporary review discussion from final conclusions

## 4. Merge the Durable Content

When merging into `docs/<name>.md`:

- keep the stable doc focused on decisions, behavior, and long-term guidance
- remove review chatter, tentative language, and resolved alternatives
- preserve links to related stable docs when helpful

## 5. Retire Temporary Files

After the stable docs are updated:

- delete or move the consumed `docs/in_progress/*.md` files
- update `docs/in_progress/README.md`
- remove stale table rows, open questions, and merge checklist items

## 6. Final Check

Before finishing:

- no in-progress doc remains without a purpose
- `docs/in_progress/README.md` reflects the post-merge state
- stable docs contain the final design and review outcome
