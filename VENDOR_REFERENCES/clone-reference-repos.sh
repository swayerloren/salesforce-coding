#!/usr/bin/env bash
set -u

DESTINATION=""
FULL_CLONE=0
HAD_FAILURE=0

for arg in "$@"; do
  case "$arg" in
    --destination=*)
      DESTINATION="${arg#--destination=}"
      ;;
    --full-clone)
      FULL_CLONE=1
      ;;
    *)
      printf 'FAIL: Unknown argument: %s\n' "$arg"
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [ -z "$DESTINATION" ]; then
  DESTINATION="$SCRIPT_DIR/_external"
fi

case "$DESTINATION" in
  /*) ;;
  *) DESTINATION="$PWD/$DESTINATION" ;;
esac

VENDOR_ROOT="$(cd "$SCRIPT_DIR" && pwd -P)"

case "$DESTINATION" in
  "$VENDOR_ROOT"/*|"$VENDOR_ROOT") ;;
  *)
    printf 'FAIL: Destination must stay under VENDOR_REFERENCES. Refusing: %s\n' "$DESTINATION"
    exit 1
    ;;
esac

DESTINATION="$(mkdir -p "$DESTINATION" && cd "$DESTINATION" && pwd -P)"

status() {
  printf '%s: %s\n' "$1" "$2"
}

fail_clone() {
  HAD_FAILURE=1
  status "FAIL" "$1"
}

if ! command -v git >/dev/null 2>&1; then
  status "FAIL" "git is required but was not found on PATH."
  exit 1
fi

REPOS=(
  "code-analyzer|https://github.com/forcedotcom/code-analyzer"
  "lwc-recipes|https://github.com/trailheadapps/lwc-recipes"
  "apex-recipes|https://github.com/trailheadapps/apex-recipes"
  "sfdx-lwc-jest|https://github.com/salesforce/sfdx-lwc-jest"
  "prettier-plugin-apex|https://github.com/dangmai/prettier-plugin-apex"
  "eslint-plugin-lwc|https://github.com/salesforce/eslint-plugin-lwc"
  "eslint-config-lwc|https://github.com/salesforce/eslint-config-lwc"
  "eslint-plugin-lwc-mobile|https://github.com/salesforce/eslint-plugin-lwc-mobile"
  "eslint-plugin-lwc-graph-analyzer|https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer"
  "salesforcedx-vscode|https://github.com/forcedotcom/salesforcedx-vscode"
  "sfdx-scan-pull-request|https://github.com/mitchspano/sfdx-scan-pull-request"
)

status "INFO" "Repo root: $REPO_ROOT"
status "INFO" "Clone destination: $DESTINATION"
status "INFO" "These clones are local references only and must not be committed."

for entry in "${REPOS[@]}"; do
  name="${entry%%|*}"
  url="${entry#*|}"
  target="$DESTINATION/$name"

  if [ -e "$target" ]; then
    status "SKIPPED" "$name already exists: $target"
    continue
  fi

  args=(clone)
  if [ "$FULL_CLONE" -ne 1 ]; then
    args+=(--depth 1)
  fi
  args+=("$url" "$target")

  status "INFO" "Cloning $name from $url"
  if git "${args[@]}"; then
    status "PASS" "Cloned $name"
  else
    fail_clone "Clone failed for $name"
  fi
done

if [ "$HAD_FAILURE" -eq 1 ]; then
  status "FAIL" "One or more optional reference repos failed to clone."
  exit 1
fi

status "PASS" "Optional reference clone pass complete."
exit 0
