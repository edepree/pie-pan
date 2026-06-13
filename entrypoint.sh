#!/bin/bash
set -euo pipefail

MODEL_ROUTER="${MODEL_ROUTER:-http://example.com}"
BASE_URL="${MODEL_ROUTER}/v1"
MODELS_PATH="${BASE_URL}/models"

echo "Fetching Models: ${MODELS_PATH}"

RAW_JSON="$(curl -fsSL --connect-timeout 10 --max-time 30 "${MODELS_PATH}")"

MODEL_COUNT="$(echo "${RAW_JSON}" | jq '.data | length')"
if [[ "${MODEL_COUNT}" -eq 0 ]]; then
  echo "Error: No Models Found" >&2
  exit 1
fi

mkdir -p "$HOME/.pi/agent/"

echo "${RAW_JSON}" | jq --arg baseUrl "${BASE_URL}" '
{
  providers: {
    router: {
      baseUrl: $baseUrl,
      api: "openai-completions",
      apiKey: "dummy-key",
      compat: {
        supportsDeveloperRole: false,
        supportsReasoningEffort: false
      },
      models: [.data[] | { id: .id }]
    }
  }
}' > "$HOME/.pi/agent/models.json"

exec "$@"
