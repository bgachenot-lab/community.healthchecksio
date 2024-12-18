#!/usr/bin/env bash

# Renders tests/integration/integration_config.yml

set -e
set -o pipefail
set -u

function main()
{
  readonly template="$1"; shift

  # Check if at least one of the variables is set
  if [[ -z "${MANAGEMENT_API_TOKEN:-}" && -z "${HEALTHCHECKSIO_API_TOKEN:-}" ]]; then
    echo "Error: Either MANAGEMENT_API_TOKEN or HEALTHCHECKSIO_API_TOKEN must be set."
    exit 1
  fi

  local content
  content="$(cat "$template")"
  readonly content

  eval "echo \"$content\""
}

main "$@"
