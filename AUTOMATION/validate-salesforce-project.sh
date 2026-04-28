#!/usr/bin/env bash
set -u

PROJECT_PATH=""
ALLOW_MISSING=0
HAS_FAILURE=0
CANDIDATE_PATHS=()
CANDIDATE_SOURCES=()

for arg in "$@"; do
  case "$arg" in
    --allow-missing)
      ALLOW_MISSING=1
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

fail_check() {
  HAS_FAILURE=1
  status "FAIL" "$1"
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

  if [ ! -e "$clean_path" ]; then
    status "MISSING" "$source path not found: $raw_path"
    return 0
  fi

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
  local line inline next capture_next found_path_note

  if [ ! -f "$readme" ]; then
    status "SKIPPED" "FORCE_APP_DIRECTORY/README.md external path note not found."
    return 0
  fi

  capture_next=0
  found_path_note=0
  while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]*(Actual\ Salesforce\ Project\ Path|Actual\ force-app/main/default\ Path):[[:space:]]*(.*)$ ]]; then
      inline="$(trim "${BASH_REMATCH[2]}")"
      if usable_path_note "$inline"; then
        add_candidate_root "$inline" "FORCE_APP_DIRECTORY/README.md"
        add_nested_metadata_candidates "$inline" "FORCE_APP_DIRECTORY/README.md"
        found_path_note=1
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
        found_path_note=1
      fi
      capture_next=0
    fi
  done < "$readme"

  if [ "$found_path_note" -eq 1 ]; then
    status "FOUND" "External Salesforce project path note in FORCE_APP_DIRECTORY/README.md."
  else
    status "SKIPPED" "No filled external Salesforce project path note found in FORCE_APP_DIRECTORY/README.md."
  fi
}

first_valid_project_index() {
  local i metadata_root
  for i in "${!CANDIDATE_PATHS[@]}"; do
    metadata_root="${CANDIDATE_PATHS[$i]}/force-app/main/default"
    if [ -d "$metadata_root" ]; then
      printf '%s\n' "$i"
      return 0
    fi
  done
  return 1
}

count_find() {
  find "$@" 2>/dev/null | wc -l | tr -d '[:space:]'
}

relative_metadata_path() {
  local metadata_root="$1"
  local file_path="$2"
  local relative="${file_path#"$metadata_root"/}"
  printf '%s\n' "$relative"
}

validate_metadata_family() {
  local metadata_root="$1"
  local relative_folder="$2"
  local find_name="$3"
  local valid_regex="$4"
  local label="$5"
  local folder="$metadata_root/$relative_folder"
  local file_path relative bad_count file_count

  bad_count=0
  file_count=0
  while IFS= read -r file_path; do
    [ -n "$file_path" ] || continue
    file_count=$((file_count + 1))
    relative="$(relative_metadata_path "$metadata_root" "$file_path")"
    if [[ ! "$relative" =~ $valid_regex ]]; then
      bad_count=$((bad_count + 1))
      if [ "$bad_count" -le 5 ]; then
        status "INFO" "Misplaced $label: $relative"
      fi
    fi
  done < <(find "$metadata_root" -type f -name "$find_name" 2>/dev/null)

  if [ "$file_count" -eq 0 ]; then
    if [ -d "$folder" ]; then
      status "FOUND" "$relative_folder exists but no matching files were detected: $folder"
    else
      status "SKIPPED" "No $label metadata detected."
    fi
    return 0
  fi

  if [ "$bad_count" -gt 0 ]; then
    fail_check "$label metadata found outside expected Salesforce DX source-format path."
    return 0
  fi

  status "PASS" "$label metadata path check passed ($file_count files)."
}

validate_metadata_directory() {
  local metadata_root="$1"
  local relative_folder="$2"
  local label="$3"
  local folder="$metadata_root/$relative_folder"
  local file_count

  if [ -d "$folder" ]; then
    file_count="$(count_find "$folder" -type f)"
    if [ "$file_count" -gt 0 ]; then
      status "PASS" "$label folder exists and contains files: $folder"
    else
      status "FOUND" "$label folder exists but appears empty: $folder"
    fi
  else
    status "SKIPPED" "No $label folder detected."
  fi
}

validate_package_manifest() {
  local project_root="$1"
  local manifest="$project_root/manifest/package.xml"
  local root_manifest="$project_root/package.xml"
  local metadata_manifest="$project_root/force-app/main/default/package.xml"

  if [ -f "$manifest" ]; then
    status "FOUND" "package.xml manifest: $manifest"
  elif [ -f "$root_manifest" ]; then
    status "FOUND" "root package.xml manifest: $root_manifest"
  else
    status "SKIPPED" "No package.xml manifest detected."
  fi

  if [ -f "$metadata_manifest" ]; then
    fail_check "package.xml was found under force-app/main/default. Keep deployment manifests outside deployable metadata folders."
  fi
}

validate_metadata_paths() {
  local project_root="$1"
  local metadata_root="$2"

  status "INFO" "Checking common Salesforce metadata source-format paths."
  validate_package_manifest "$project_root"

  validate_metadata_family "$metadata_root" "objects" "*.object-meta.xml" '^objects/[^/]+/[^/]+\.object-meta\.xml$' "Object"
  validate_metadata_family "$metadata_root" "objects" "*.field-meta.xml" '^objects/[^/]+/fields/[^/]+\.field-meta\.xml$' "Field"
  validate_metadata_family "$metadata_root" "objects" "*.validationRule-meta.xml" '^objects/[^/]+/validationRules/[^/]+\.validationRule-meta\.xml$' "Validation rule"
  validate_metadata_family "$metadata_root" "objects" "*.recordType-meta.xml" '^objects/[^/]+/recordTypes/[^/]+\.recordType-meta\.xml$' "Record type"
  validate_metadata_family "$metadata_root" "objects" "*.compactLayout-meta.xml" '^objects/[^/]+/compactLayouts/[^/]+\.compactLayout-meta\.xml$' "Compact layout"
  validate_metadata_family "$metadata_root" "layouts" "*.layout-meta.xml" '^layouts/[^/]+\.layout-meta\.xml$' "Layout"
  validate_metadata_family "$metadata_root" "flexipages" "*.flexipage-meta.xml" '^flexipages/[^/]+\.flexipage-meta\.xml$' "FlexiPage"
  validate_metadata_family "$metadata_root" "quickActions" "*.quickAction-meta.xml" '^(quickActions/[^/]+\.quickAction-meta\.xml|objects/[^/]+/quickActions/[^/]+\.quickAction-meta\.xml)$' "Quick action"
  validate_metadata_family "$metadata_root" "permissionsets" "*.permissionset-meta.xml" '^permissionsets/[^/]+\.permissionset-meta\.xml$' "Permission set"
  validate_metadata_family "$metadata_root" "profiles" "*.profile-meta.xml" '^profiles/[^/]+\.profile-meta\.xml$' "Profile"
  validate_metadata_family "$metadata_root" "tabs" "*.tab-meta.xml" '^tabs/[^/]+\.tab-meta\.xml$' "Tab"
  validate_metadata_family "$metadata_root" "applications" "*.app-meta.xml" '^applications/[^/]+\.app-meta\.xml$' "Application"
  validate_metadata_family "$metadata_root" "customMetadata" "*.md-meta.xml" '^customMetadata/[^/]+\.md-meta\.xml$' "Custom metadata"
  validate_metadata_family "$metadata_root" "customPermissions" "*.customPermission-meta.xml" '^customPermissions/[^/]+\.customPermission-meta\.xml$' "Custom permission"

  validate_metadata_directory "$metadata_root" "staticresources" "Static resource"
  validate_metadata_directory "$metadata_root" "email" "Email"
  validate_metadata_directory "$metadata_root" "reports" "Report"
  validate_metadata_directory "$metadata_root" "dashboards" "Dashboard"
}

validate_project_shape() {
  local project_root="$1"
  local metadata_root="$2"
  local sfdx_project classes_dir triggers_dir lwc_dir objects_dir
  local apex_class_count stray_class_count trigger_count lwc_count object_count object_anywhere_count

  status "PASS" "force-app/main/default exists: $metadata_root"

  sfdx_project="$project_root/sfdx-project.json"
  if [ -f "$sfdx_project" ]; then
    status "FOUND" "sfdx-project.json: $sfdx_project"
  else
    status "MISSING" "sfdx-project.json not found at the selected project root."
  fi

  classes_dir="$metadata_root/classes"
  triggers_dir="$metadata_root/triggers"
  lwc_dir="$metadata_root/lwc"
  objects_dir="$metadata_root/objects"

  apex_class_count=0
  if [ -d "$classes_dir" ]; then
    apex_class_count="$(count_find "$classes_dir" -type f \( -name '*.cls' -o -name '*.cls-meta.xml' \))"
  fi
  stray_class_count="$(count_find "$metadata_root" -type f \( -name '*.cls' -o -name '*.cls-meta.xml' \) ! -path "$classes_dir/*")"

  if [ "$apex_class_count" -gt 0 ] && [ -d "$classes_dir" ]; then
    status "PASS" "Apex classes folder exists and contains Apex class metadata: $classes_dir"
  elif [ "$stray_class_count" -gt 0 ] && [ ! -d "$classes_dir" ]; then
    fail_check "Apex class metadata exists but classes/ is missing under force-app/main/default."
  elif [ -d "$classes_dir" ]; then
    status "FOUND" "classes/ exists but no Apex class files were detected: $classes_dir"
  else
    status "SKIPPED" "No Apex class files detected; classes/ is not required for this check."
  fi

  trigger_count=0
  if [ -d "$triggers_dir" ]; then
    trigger_count="$(count_find "$triggers_dir" -type f \( -name '*.trigger' -o -name '*.trigger-meta.xml' \))"
  fi
  if [ "$trigger_count" -gt 0 ]; then
    status "PASS" "Apex triggers folder exists and contains trigger metadata: $triggers_dir"
  elif [ -d "$triggers_dir" ]; then
    status "FOUND" "triggers/ exists but no trigger files were detected: $triggers_dir"
  else
    status "SKIPPED" "No Apex trigger files detected."
  fi

  if [ -d "$lwc_dir" ]; then
    lwc_count="$(count_find "$lwc_dir" -type f)"
    if [ "$lwc_count" -gt 0 ]; then
      status "PASS" "lwc/ exists and contains Lightning Web Component files: $lwc_dir"
    else
      status "FOUND" "lwc/ exists but appears empty: $lwc_dir"
    fi
  else
    status "SKIPPED" "No lwc/ folder detected under force-app/main/default."
  fi

  object_anywhere_count="$(count_find "$metadata_root" -type f -name '*.object-meta.xml')"
  if [ -d "$objects_dir" ]; then
    object_count="$(count_find "$objects_dir" -type f \( -name '*.object-meta.xml' -o -name '*.field-meta.xml' \))"
    if [ "$object_count" -gt 0 ]; then
      status "PASS" "objects/ exists and contains object metadata: $objects_dir"
    else
      status "FOUND" "objects/ exists but no object metadata files were detected: $objects_dir"
    fi
  elif [ "$object_anywhere_count" -gt 0 ]; then
    fail_check "Object metadata exists but objects/ is missing under force-app/main/default."
  else
    status "SKIPPED" "No object metadata detected; objects/ is not required for this check."
  fi

  validate_metadata_paths "$project_root" "$metadata_root"
}

echo "Salesforce DX project validation"
echo "Repo: $REPO_ROOT"

if usable_path_note "$PROJECT_PATH"; then
  add_candidate_root "$PROJECT_PATH" "explicit project path"
  add_nested_metadata_candidates "$PROJECT_PATH" "explicit project path"
fi

FORCE_APP_DIRECTORY="$REPO_ROOT/FORCE_APP_DIRECTORY"
if [ -d "$FORCE_APP_DIRECTORY" ]; then
  status "FOUND" "FORCE_APP_DIRECTORY exists: $FORCE_APP_DIRECTORY"
  add_nested_metadata_candidates "$FORCE_APP_DIRECTORY" "FORCE_APP_DIRECTORY"
else
  status "MISSING" "FORCE_APP_DIRECTORY does not exist."
fi

add_external_readme_candidates

if [ -d "$REPO_ROOT/force-app/main/default" ]; then
  add_candidate_root "$REPO_ROOT" "repo root"
fi

if [ "${#CANDIDATE_PATHS[@]}" -gt 0 ]; then
  status "FOUND" "Candidate Salesforce project roots:"
  for i in "${!CANDIDATE_PATHS[@]}"; do
    printf ' - %s [%s]\n' "${CANDIDATE_PATHS[$i]}" "${CANDIDATE_SOURCES[$i]}"
  done
else
  status "MISSING" "No candidate Salesforce project roots were found."
fi

VALID_INDEX="$(first_valid_project_index || true)"
if [ -z "$VALID_INDEX" ]; then
  if [ "$ALLOW_MISSING" -eq 1 ]; then
    status "SKIPPED" "No force-app/main/default folder found. This is allowed for placeholder/helper repo checks."
    exit 0
  fi
  fail_check "No real Salesforce DX project with force-app/main/default was located."
  status "INFO" "Place a project under FORCE_APP_DIRECTORY/ or fill the external path note in FORCE_APP_DIRECTORY/README.md."
  exit 1
fi

PROJECT_ROOT="${CANDIDATE_PATHS[$VALID_INDEX]}"
METADATA_ROOT="$PROJECT_ROOT/force-app/main/default"
status "FOUND" "Selected Salesforce project root: $PROJECT_ROOT"
status "FOUND" "Project source: ${CANDIDATE_SOURCES[$VALID_INDEX]}"
validate_project_shape "$PROJECT_ROOT" "$METADATA_ROOT"

if [ "$HAS_FAILURE" -eq 1 ]; then
  if [ "$ALLOW_MISSING" -eq 1 ]; then
    status "SKIPPED" "Validation found shape problems, but --allow-missing was set."
    exit 0
  fi
  exit 1
fi

status "PASS" "Salesforce project validation complete."
exit 0
