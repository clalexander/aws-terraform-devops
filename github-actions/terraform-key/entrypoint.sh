#!/bin/bash -l

function fail {
  echo "Error: $1"
  exit 1
}

components=(aws)

if [[ -n "$INPUT_ENVIRONMENT" ]]; then
  components+=("$INPUT_ENVIRONMENT")
fi

if [[ -n "$INPUT_ACCOUNT" ]]; then
  components+=("$INPUT_ACCOUNT")
fi

if [[ -n "$INPUT_APPLICATION" ]]; then
  if [[ -n "$INPUT_BASELINE" ]] || [[ -n "$INPUT_CATEGORY_NAME" ]]; then
    fail "Only one of application, baseline, or category_name can be set"
  fi
  components+=("application" "$INPUT_APPLICATION")
fi

if [[ -n "$INPUT_BASELINE" ]]; then
  if [[ -n "$INPUT_CATEGORY_NAME" ]]; then
    fail "Only one of application, baseline, or category_name can be set"
  fi
  components+=("baseline" "$INPUT_BASELINE")
fi

if [[ -n "$INPUT_CATEGORY_NAME" ]]; then
  components+=("$INPUT_CATEGORY_NAME")
fi

if [[ -n "$INPUT_KEY" ]]; then
  components+=("$INPUT_KEY")
fi

key=$(IFS=/; echo "${components[*]}")

echo "key=$key" >> $GITHUB_OUTPUT
