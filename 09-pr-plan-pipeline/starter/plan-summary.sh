#!/usr/bin/env bash
set -euo pipefail

plan_json="${1:-tfplan.json}"

jq -r '
  [.resource_changes[]?.change.actions | join("->")]
  | group_by(.)
  | map({action: .[0], count: length})
  | (["ACTION", "COUNT"], (.[] | [.action, (.count | tostring)]))
  | @tsv
' "$plan_json"
