#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "usage: $0 STACK_NAME TEMPLATE_FILE [CHANGE_SET_NAME]" >&2
  exit 64
fi

stack_name="$1"
template_file="$2"
change_set_name="${3:-review-$(date +%Y%m%d%H%M%S)}"

aws cloudformation create-change-set \
  --stack-name "$stack_name" \
  --change-set-name "$change_set_name" \
  --change-set-type UPDATE \
  --template-body "file://${template_file}" \
  --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait change-set-create-complete \
  --stack-name "$stack_name" \
  --change-set-name "$change_set_name"

aws cloudformation describe-change-set \
  --stack-name "$stack_name" \
  --change-set-name "$change_set_name" \
  --query '{Status:Status,Reason:StatusReason,Changes:Changes}'
