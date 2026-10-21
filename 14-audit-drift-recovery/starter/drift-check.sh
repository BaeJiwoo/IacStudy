#!/usr/bin/env bash
set -euo pipefail

plan_file="${1:-drift.tfplan}"

set +e
terraform plan -detailed-exitcode -out="$plan_file"
exit_code=$?
set -e

case "$exit_code" in
  0)
    echo "No drift or pending changes detected."
    ;;
  1)
    echo "Terraform plan failed." >&2
    exit 1
    ;;
  2)
    echo "Drift or pending changes detected."
    terraform show -no-color "$plan_file"
    exit 2
    ;;
  *)
    echo "Unexpected terraform exit code: $exit_code" >&2
    exit "$exit_code"
    ;;
esac
