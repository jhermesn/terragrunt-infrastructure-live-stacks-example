#!/usr/bin/env bash

_env="${1:?Usage: source ./load-env.sh <prod|dev|stg>}"
_file="$(dirname "${BASH_SOURCE[0]}")/${_env}.env"

[[ -f "$_file" ]] || { echo "load-env: ${_env}.env not found" >&2; return 1; }

set -a
source "$_file"
set +a

unset _env _file