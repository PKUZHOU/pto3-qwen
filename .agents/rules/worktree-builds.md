# Build and Validation Rules

## Core Principle

Validate changes from the active checkout that owns the code you changed.

## What This Means in a Superproject

- If you change files inside `pypto/`, run build and test commands from
  `pypto/`.
- If you change files inside `simpler/`, run build and test commands from
  `simpler/`.
- If you only change superproject docs, agent rules, or submodule pointers, run
  the checks that make sense for those files and do not invent unrelated builds.
- If a task spans multiple submodules, validate each touched submodule in its
  own checkout.

## Forbidden Shortcuts

- Do not copy `.so` files, generated kernels, logs, or other build artifacts
  from another checkout or branch.
- Do not claim a submodule change is validated based on a build from a
  different repository state.
- Do not update a submodule pointer without understanding whether the referenced
  submodule commit has been validated in its own repo.

## Preferred Validation Order

1. Identify which repository owns each changed file.
2. Run the relevant local validation in each owner repo.
3. If the superproject records a submodule pointer bump, confirm the pointer
   matches the validated submodule commit.
