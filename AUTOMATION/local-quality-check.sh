#!/usr/bin/env bash
set -u

PROJECT_PATH=""
RUN_PROJECT_SCRIPTS=0
RUN_CODE_ANALYZER=0
ALLOW_MISSING_PROJECT=0
HAS_BLOCKING_FAILURE=0
CANDIDATE_PATHS=()
CANDIDATE_SOURCES=()
CODE_ANALYZER_LABEL=""
CODE_ANALYZER_COMMAND=""
CODE_ANALYZER_INSTALL=""
CODE_ANALYZER_ARGS=()

for arg in "$@"; do
  case "$arg" in
    --run-project-scripts)
      RUN_PROJECT_SCRIPTS=1
      ;;
    --run-code-analyzer)
      RUN_CODE_ANALYZER=1
      ;;
    --allow-missing-project)
      ALLOW_MISSING_PROJECT=1
      ;;
    *)
      PROJECT_PATH="$arg"
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

status() {
  printf '%s: %s\n' "$1" "$2"
}

blocking_failure() {
  HAS_BLOCKING_FAILURE=1
  status "FAIL" "$1"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

trim() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "$value"
}

usable_path_note() {
  local value
  value="$(trim "${1:-}")"
  [ -n "$value" ] || return 1
  [[ "$value" =~ ^\[PASTE\ .+\ HERE\]$ ]] && return 1
  [[ "$value" =~ ^\`\`\` ]] && return 1
  [[ "$value" =~ ^Actual\ .+\ Path: ]] && return 1
  [[ "$value" =~ ^Target\ Org\ Alias: ]] && return 1
  return 0
}

project_root_from_path() {
  local path="$1"
  case "$path" in
    */force-app/main/default)
      dirname "$(dirname "$(dirname "$path")")"
      ;;
    *)
      printf '%s\n' "$path"
      ;;
  esac
}

normalize_input_path() {
  local path="$1"
  local drive rest
  if [[ "$path" =~ ^([A-Za-z]):\\(.*)$ ]]; then
    drive="$(printf '%s' "${BASH_REMATCH[1]}" | tr '[:upper:]' '[:lower:]')"
    rest="${BASH_REMATCH[2]//\\//}"
    printf '/%s/%s\n' "$drive" "$rest"
  else
    printf '%s\n' "${path//\\//}"
  fi
}

candidate_exists() {
  local path="$1"
  local existing
  for existing in "${CANDIDATE_PATHS[@]}"; do
    [ "$existing" = "$path" ] && return 0
  done
  return 1
}

add_candidate_root() {
  local raw_path="$1"
  local source="$2"
  local clean_path resolved root

  usable_path_note "$raw_path" || return 0

  clean_path="$(trim "$raw_path")"
  clean_path="${clean_path%\"}"
  clean_path="${clean_path#\"}"
  clean_path="${clean_path%\'}"
  clean_path="${clean_path#\'}"
  clean_path="${clean_path/#\~/$HOME}"
  clean_path="$(normalize_input_path "$clean_path")"

  [ -e "$clean_path" ] || return 0

  if [ -d "$clean_path" ]; then
    resolved="$(cd "$clean_path" && pwd -P)"
  else
    resolved="$(cd "$(dirname "$clean_path")" && pwd -P)/$(basename "$clean_path")"
  fi

  root="$(project_root_from_path "$resolved")"
  if [ -d "$root" ]; then
    root="$(cd "$root" && pwd -P)"
    if ! candidate_exists "$root"; then
      CANDIDATE_PATHS+=("$root")
      CANDIDATE_SOURCES+=("$source")
    fi
  fi
}

add_metadata_root_candidate() {
  local metadata_root="$1"
  local source="$2"
  local project_root
  project_root="$(dirname "$(dirname "$(dirname "$metadata_root")")")"
  add_candidate_root "$project_root" "$source"
}

add_nested_metadata_candidates() {
  local base_path="$1"
  local source="$2"
  local metadata_root

  [ -d "$base_path" ] || return 0
  while IFS= read -r metadata_root; do
    [ -n "$metadata_root" ] || continue
    add_metadata_root_candidate "$metadata_root" "$source"
  done < <(find "$base_path" -type d -path '*/force-app/main/default' 2>/dev/null)
}

add_external_readme_candidates() {
  local readme="$REPO_ROOT/FORCE_APP_DIRECTORY/README.md"
  local line inline next capture_next

  [ -f "$readme" ] || return 0

  capture_next=0
  while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]*(Actual\ Salesforce\ Project\ Path|Actual\ force-app/main/default\ Path):[[:space:]]*(.*)$ ]]; then
      inline="$(trim "${BASH_REMATCH[2]}")"
      if usable_path_note "$inline"; then
        add_candidate_root "$inline" "FORCE_APP_DIRECTORY/README.md"
        add_nested_metadata_candidates "$inline" "FORCE_APP_DIRECTORY/README.md"
      fi
      capture_next=1
      continue
    fi

    if [ "$capture_next" -eq 1 ]; then
      next="$(trim "$line")"
      [ -z "$next" ] && continue
      if usable_path_note "$next"; then
        add_candidate_root "$next" "FORCE_APP_DIRECTORY/README.md"
        add_nested_metadata_candidates "$next" "FORCE_APP_DIRECTORY/README.md"
      fi
      capture_next=0
    fi
  done < "$readme"
}

find_salesforce_project() {
  local i metadata_root

  if usable_path_note "$PROJECT_PATH"; then
    add_candidate_root "$PROJECT_PATH" "explicit project path"
    add_nested_metadata_candidates "$PROJECT_PATH" "explicit project path"
  fi

  if [ -d "$REPO_ROOT/FORCE_APP_DIRECTORY" ]; then
    add_nested_metadata_candidates "$REPO_ROOT/FORCE_APP_DIRECTORY" "FORCE_APP_DIRECTORY"
  fi

  add_external_readme_candidates

  if [ -d "$REPO_ROOT/force-app/main/default" ]; then
    add_candidate_root "$REPO_ROOT" "repo root"
  fi

  for i in "${!CANDIDATE_PATHS[@]}"; do
    metadata_root="${CANDIDATE_PATHS[$i]}/force-app/main/default"
    if [ -d "$metadata_root" ]; then
      printf '%s\n' "$i"
      return 0
    fi
  done
  return 1
}

has_script() {
  local package_json="$1"
  local script_name="$2"

  [ -f "$package_json" ] || return 1
  if command_exists node; then
    node -e "const p=require(process.argv[1]); const s=p.scripts||{}; process.exit(Object.prototype.hasOwnProperty.call(s, process.argv[2]) ? 0 : 1)" "$package_json" "$script_name" >/dev/null 2>&1
  else
    grep -Eq "\"$script_name\"[[:space:]]*:" "$package_json"
  fi
}

first_script() {
  local package_json="$1"
  shift
  local script_name

  for script_name in "$@"; do
    if has_script "$package_json" "$script_name"; then
      printf '%s\n' "$script_name"
      return 0
    fi
  done
  return 1
}

has_dependency() {
  local package_json="$1"
  local dependency_name="$2"

  [ -f "$package_json" ] || return 1
  if command_exists node; then
    node -e "const p=require(process.argv[1]); const n=process.argv[2]; const sections=['dependencies','devDependencies','peerDependencies','optionalDependencies']; process.exit(sections.some((s)=>p[s] && Object.prototype.hasOwnProperty.call(p[s], n)) ? 0 : 1)" "$package_json" "$dependency_name" >/dev/null 2>&1
  else
    grep -Eq "\"$dependency_name\"[[:space:]]*:" "$package_json"
  fi
}

report_dependency() {
  local package_json="$1"
  local dependency_name="$2"
  local label="$3"

  if has_dependency "$package_json" "$dependency_name"; then
    status "FOUND" "npm dependency: $dependency_name"
  else
    status "MISSING" "npm dependency: $dependency_name ($label)"
  fi
}

run_project_command() {
  local project_root="$1"
  local reason="$2"
  shift 2

  if [ "$RUN_PROJECT_SCRIPTS" -ne 1 ]; then
    status "SKIPPED" "$reason. Recommended command from project root: $*"
    return 0
  fi

  status "INFO" "Running: $*"
  (cd "$project_root" && "$@")
  local exit_code=$?
  if [ "$exit_code" -eq 0 ]; then
    status "PASS" "Command passed: $*"
  else
    blocking_failure "Command failed with exit code $exit_code: $*"
  fi
}

sf_command_available() {
  command_exists sf || return 1
  sf "$@" >/dev/null 2>&1
}

sfdx_command_available() {
  command_exists sfdx || return 1
  sfdx "$@" >/dev/null 2>&1
}

detect_code_analyzer() {
  if sf_command_available code-analyzer run --help; then
    CODE_ANALYZER_LABEL="Salesforce Code Analyzer through sf code-analyzer"
    CODE_ANALYZER_COMMAND="sf"
    CODE_ANALYZER_ARGS=(code-analyzer run --target force-app/main/default --view table)
    CODE_ANALYZER_INSTALL="sf plugins install @salesforce/plugin-code-analyzer"
    return 0
  fi

  if sf_command_available scanner run --help; then
    CODE_ANALYZER_LABEL="Salesforce Scanner through sf scanner run"
    CODE_ANALYZER_COMMAND="sf"
    CODE_ANALYZER_ARGS=(scanner run --target force-app/main/default)
    CODE_ANALYZER_INSTALL="sf plugins install @salesforce/sfdx-scanner"
    return 0
  fi

  if sfdx_command_available scanner:run --help; then
    CODE_ANALYZER_LABEL="Salesforce Scanner through sfdx scanner:run"
    CODE_ANALYZER_COMMAND="sfdx"
    CODE_ANALYZER_ARGS=(scanner:run --target force-app/main/default)
    CODE_ANALYZER_INSTALL="sfdx plugins:install @salesforce/sfdx-scanner"
    return 0
  fi

  return 1
}

run_or_recommend_code_analyzer() {
  local project_root="${1:-}"

  if ! detect_code_analyzer; then
    status "MISSING" "Salesforce Code Analyzer was not detected."
    status "INFO" "Recommended install: sf plugins install @salesforce/plugin-code-analyzer"
    status "SKIPPED" "Salesforce Code Analyzer was not run because no analyzer command is available."
    return 0
  fi

  status "FOUND" "$CODE_ANALYZER_LABEL"
  status "INFO" "Analyzer command: $CODE_ANALYZER_COMMAND ${CODE_ANALYZER_ARGS[*]}"
  status "INFO" "Supported targets include repo-root force-app/main/default or FORCE_APP_DIRECTORY/your-project/force-app/main/default."

  if [ -z "$project_root" ]; then
    status "SKIPPED" "Salesforce Code Analyzer was not run because no real Salesforce DX project target was found."
    return 0
  fi

  if [ "$RUN_CODE_ANALYZER" -ne 1 ]; then
    status "SKIPPED" "Salesforce Code Analyzer not run. To run it from the selected project root, pass --run-code-analyzer. Project root: $project_root"
    return 0
  fi

  status "INFO" "Running Salesforce Code Analyzer from $project_root"
  (cd "$project_root" && "$CODE_ANALYZER_COMMAND" "${CODE_ANALYZER_ARGS[@]}")
  local exit_code=$?
  if [ "$exit_code" -eq 0 ]; then
    status "PASS" "Salesforce Code Analyzer completed successfully."
  else
    blocking_failure "Salesforce Code Analyzer failed or reported blocking findings with exit code $exit_code."
  fi
}

echo "Local Salesforce quality check"
echo "Repo: $REPO_ROOT"

for tool in git sf sfdx node npm npx rg; do
  if command_exists "$tool"; then
    status "FOUND" "$tool: $(command -v "$tool")"
  else
    status "MISSING" "$tool is not installed or not on PATH."
  fi
done

if command_exists git; then
  git -C "$REPO_ROOT" status --short --branch
else
  status "SKIPPED" "git status was skipped because git is missing."
fi

if command_exists rg; then
  RG_SCAN_GLOBS=(
    --hidden
    --glob '!.git/*'
    --glob '!AUTOMATION/*'
    --glob '!VENDOR_REFERENCES/_external/**'
    --glob '!temp/**'
    --glob '!node_modules/**'
  )

  TEMPORARY_REFERENCE_PATTERN="SALES"" FORCE"" READ"" ME"
  rg "${RG_SCAN_GLOBS[@]}" --line-number --fixed-strings -- "$TEMPORARY_REFERENCE_PATTERN" "$REPO_ROOT"
  case "$?" in
    0) blocking_failure "Temporary folder reference found." ;;
    1) status "PASS" "No temporary folder references found." ;;
    *) blocking_failure "Temporary folder reference scan failed." ;;
  esac

  LOCAL_PATH_PATTERN='[A-Za-z]:\\\\Users\\\\|[A-Za-z]:\\\\|/(Users|home)/[^/\s]+/'
  rg "${RG_SCAN_GLOBS[@]}" --line-number -- "$LOCAL_PATH_PATTERN" "$REPO_ROOT"
  case "$?" in
    0) blocking_failure "Local-only Windows path found in public-scanned files." ;;
    1) status "PASS" "No local-only Windows paths found." ;;
    *) blocking_failure "Local path scan failed." ;;
  esac

  rg "${RG_SCAN_GLOBS[@]}" --line-number -i -- "(api[_-]?key|access[_-]?token|refresh[_-]?token|client[_-]?secret|session[_-]?id|password|passwd|secret)\s*[:=]\s*[A-Za-z0-9_./+=-]{8,}" "$REPO_ROOT"
  case "$?" in
    0) blocking_failure "Credential-like assignment found." ;;
    1) status "PASS" "No credential-like assignments found." ;;
    *) blocking_failure "Credential-like scan failed." ;;
  esac
else
  status "SKIPPED" "Public-safety text scans skipped because ripgrep is missing."
fi

VALIDATOR_ARGS=()
if usable_path_note "$PROJECT_PATH"; then
  VALIDATOR_ARGS+=("$PROJECT_PATH")
fi
if [ "$ALLOW_MISSING_PROJECT" -eq 1 ]; then
  VALIDATOR_ARGS+=("--allow-missing")
fi

bash "$SCRIPT_DIR/validate-salesforce-project.sh" "${VALIDATOR_ARGS[@]}"
VALIDATOR_EXIT=$?
if [ "$VALIDATOR_EXIT" -eq 0 ]; then
  status "PASS" "Salesforce project validator completed."
else
  blocking_failure "Salesforce project validator failed. Codex must locate force-app/main/default before editing."
fi

VALID_INDEX="$(find_salesforce_project || true)"
if [ -z "$VALID_INDEX" ]; then
  if [ "$ALLOW_MISSING_PROJECT" -eq 1 ]; then
    status "SKIPPED" "No real Salesforce DX project located; project-level package checks skipped."
  else
    blocking_failure "No real Salesforce DX project located for package-level checks."
  fi
else
  PROJECT_ROOT="${CANDIDATE_PATHS[$VALID_INDEX]}"
  PACKAGE_JSON="$PROJECT_ROOT/package.json"
  status "FOUND" "Selected Salesforce project root for quality gates: $PROJECT_ROOT"

  if [ -f "$PACKAGE_JSON" ]; then
    status "FOUND" "package.json: $PACKAGE_JSON"
    for script_name in lint lint:lwc lint:mobile test test:unit test:unit:coverage prettier prettier:check; do
      if has_script "$PACKAGE_JSON" "$script_name"; then
        status "FOUND" "npm script: $script_name"
      else
        status "MISSING" "npm script: $script_name"
      fi
    done

    report_dependency "$PACKAGE_JSON" "eslint" "base ESLint"
    report_dependency "$PACKAGE_JSON" "@salesforce/eslint-config-lwc" "Salesforce LWC ESLint config"
    report_dependency "$PACKAGE_JSON" "@lwc/eslint-plugin-lwc" "LWC ESLint plugin"
    report_dependency "$PACKAGE_JSON" "@salesforce/sfdx-lwc-jest" "LWC Jest"
    report_dependency "$PACKAGE_JSON" "@salesforce/eslint-plugin-lwc-mobile" "LWC mobile lint"
    report_dependency "$PACKAGE_JSON" "@salesforce/eslint-plugin-lwc-graph-analyzer" "advanced graph analyzer"

    LWC_LINT_SCRIPT="$(first_script "$PACKAGE_JSON" lint:lwc lint || true)"
    MOBILE_LINT_SCRIPT="$(first_script "$PACKAGE_JSON" lint:mobile || true)"
    JEST_SCRIPT="$(first_script "$PACKAGE_JSON" test:unit test || true)"

    if has_dependency "$PACKAGE_JSON" "@salesforce/sfdx-lwc-jest" || grep -Eq 'sfdx-lwc-jest' "$PACKAGE_JSON" || has_script "$PACKAGE_JSON" "test:unit"; then
      if command_exists npm && [ -n "$JEST_SCRIPT" ]; then
        run_project_command "$PROJECT_ROOT" "LWC Jest appears available via npm script '$JEST_SCRIPT'" npm run "$JEST_SCRIPT"
      else
        status "SKIPPED" "LWC Jest appears available, but no runnable npm test script was found."
      fi
    else
      status "SKIPPED" "LWC Jest was not detected in package.json."
    fi

    if has_dependency "$PACKAGE_JSON" "eslint" || has_dependency "$PACKAGE_JSON" "@salesforce/eslint-config-lwc" || has_dependency "$PACKAGE_JSON" "@lwc/eslint-plugin-lwc" || [ -n "$LWC_LINT_SCRIPT" ]; then
      if command_exists npm && [ -n "$LWC_LINT_SCRIPT" ]; then
        run_project_command "$PROJECT_ROOT" "LWC ESLint appears available via npm script '$LWC_LINT_SCRIPT'" npm run "$LWC_LINT_SCRIPT"
      else
        status "SKIPPED" "LWC ESLint appears available, but no runnable npm lint or lint:lwc script was found."
      fi
    else
      status "SKIPPED" "ESLint was not detected in package.json."
    fi

    if has_dependency "$PACKAGE_JSON" "@salesforce/eslint-plugin-lwc-mobile" || has_dependency "$PACKAGE_JSON" "@salesforce/eslint-plugin-lwc-graph-analyzer" || [ -n "$MOBILE_LINT_SCRIPT" ]; then
      if command_exists npm && [ -n "$MOBILE_LINT_SCRIPT" ]; then
        run_project_command "$PROJECT_ROOT" "LWC mobile lint appears available via npm script '$MOBILE_LINT_SCRIPT'" npm run "$MOBILE_LINT_SCRIPT"
      else
        status "SKIPPED" "LWC mobile lint or graph analyzer appears available, but no runnable npm lint:mobile script was found."
      fi
    else
      status "SKIPPED" "LWC mobile lint and graph analyzer were not detected in package.json."
    fi

    if command_exists npm && has_script "$PACKAGE_JSON" "prettier:check"; then
      run_project_command "$PROJECT_ROOT" "Prettier check script is available" npm run prettier:check
    elif has_script "$PACKAGE_JSON" "prettier"; then
      status "SKIPPED" "npm run prettier exists, but it may write files. Prefer a non-mutating prettier:check script before validation."
    else
      status "SKIPPED" "No prettier:check script was detected."
    fi
  else
    status "SKIPPED" "No package.json found at selected Salesforce project root."
  fi
fi

if [ -n "${PROJECT_ROOT:-}" ]; then
  run_or_recommend_code_analyzer "$PROJECT_ROOT"
else
  run_or_recommend_code_analyzer ""
fi

if ! command_exists sf && ! command_exists sfdx && ! command_exists node && ! command_exists npm && ! command_exists npx; then
  status "INFO" "Install checklist: Salesforce CLI (sf), Node.js, npm, project dev dependencies, Salesforce Code Analyzer, LWC Jest, ESLint, and an Apex formatter as needed."
fi

if [ "$HAS_BLOCKING_FAILURE" -eq 1 ]; then
  status "FAIL" "Local quality check completed with blocking failures."
  exit 1
fi

status "PASS" "Local quality check complete."
exit 0
