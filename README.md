# pypto3.0 Superproject

This repository is a superproject that coordinates these child repositories on the `qwen_dist_dev` branch:

- `PTOAS`
- `simpler`
- `pto-isa`
- `pypto-lib`
- `pypto`

## Clone

```bash
git clone --branch qwen_dist_dev --recurse-submodules <root-repo-url>
cd pypto3.0
git submodule update --init --recursive
```

## Update Submodules On The Same Branch

Git submodules are pinned by commit in the superproject. The `branch = qwen_dist_dev` entries in `.gitmodules` are used by `--remote` updates, but they do not make submodules float automatically.

To move every submodule to the latest `origin/qwen_dist_dev`:

```bash
git submodule update --init --recursive --remote
```

If you want to work inside each submodule on a local branch instead of detached HEAD:

```bash
git submodule foreach 'branch=$(git config -f "$toplevel/.gitmodules" submodule.$name.branch); git switch "$branch" 2>/dev/null || git switch -c "$branch" --track "origin/$branch"'
```

## Environment

Some workflows in `simpler` and `pypto` expect environment variables such as `SIMPLER_ROOT` and `PTO_ISA_ROOT`. After clone, you can source:

```bash
source ./superproject_env.sh
```
