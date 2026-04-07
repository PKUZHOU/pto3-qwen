#!/usr/bin/env bash

_superproject_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export PYPTO3_ROOT="${PYPTO3_ROOT:-${_superproject_root}}"
export SIMPLER_ROOT="${SIMPLER_ROOT:-${_superproject_root}/simpler}"
export PTO_ISA_ROOT="${PTO_ISA_ROOT:-${_superproject_root}/pto-isa}"
