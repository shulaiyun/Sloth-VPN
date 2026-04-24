#!/usr/bin/env bash
set -euo pipefail

DEPLOY_ROOT="${DEPLOY_ROOT:-/root/v2board}"
COMPOSE_FILE="${COMPOSE_FILE:-$DEPLOY_ROOT/docker-compose.yaml}"
SERVICE_XBOARD="${SERVICE_XBOARD:-xboard}"
REPORT_DIR="${REPORT_DIR:-$DEPLOY_ROOT/reports/whitelabel}"
XBOARD_PUBLIC_URL="${XBOARD_PUBLIC_URL:-}"
GATEWAY_PUBLIC_URL="${GATEWAY_PUBLIC_URL:-}"

mkdir -p "$REPORT_DIR"
TS="$(date -u +%Y%m%dT%H%M%SZ)"
REPORT_FILE="$REPORT_DIR/verify-$TS.json"

run_compose() {
  docker compose -f "$COMPOSE_FILE" --project-directory "$DEPLOY_ROOT" "$@"
}

check_http_200() {
  local url="$1"
  local code
  code="$(curl -s -o /tmp/sloth_verify_resp.json -w '%{http_code}' "$url" || true)"
  if [[ "$code" == "200" ]]; then
    echo "true"
  else
    echo "false"
  fi
}

xboard_running=false
artisan_route_ready=false
guest_comm_ok=null
guest_plans_ok=null
gateway_health_ok=null
errors=()

if run_compose ps --status running | grep -q "$SERVICE_XBOARD"; then
  xboard_running=true
else
  errors+=("xboard_service_not_running")
fi

if [[ "$xboard_running" == "true" ]]; then
  if run_compose exec -T "$SERVICE_XBOARD" php artisan route:list --path=api/v2/admin/config --no-ansi >/tmp/sloth_verify_routes.log 2>&1; then
    artisan_route_ready=true
  else
    errors+=("route_list_failed")
  fi
fi

if [[ -n "$XBOARD_PUBLIC_URL" ]]; then
  guest_comm_ok="$(check_http_200 "$XBOARD_PUBLIC_URL/api/v1/guest/comm/config?_ts=$TS")"
  guest_plans_ok="$(check_http_200 "$XBOARD_PUBLIC_URL/api/v1/guest/plan/fetch?_ts=$TS")"
  if [[ "$guest_comm_ok" != "true" ]]; then
    errors+=("guest_comm_config_unavailable")
  fi
  if [[ "$guest_plans_ok" != "true" ]]; then
    errors+=("guest_plan_fetch_unavailable")
  fi
fi

if [[ -n "$GATEWAY_PUBLIC_URL" ]]; then
  gateway_health_ok="$(check_http_200 "$GATEWAY_PUBLIC_URL/healthz?_ts=$TS")"
  if [[ "$gateway_health_ok" != "true" ]]; then
    errors+=("gateway_healthz_unavailable")
  fi
fi

errors_json=""
if [[ ${#errors[@]} -gt 0 ]]; then
  for e in "${errors[@]}"; do
    escaped="$(printf '%s' "$e" | sed 's/\\/\\\\/g; s/"/\\"/g')"
    if [[ -z "$errors_json" ]]; then
      errors_json="\"$escaped\""
    else
      errors_json="$errors_json, \"$escaped\""
    fi
  done
fi

cat >"$REPORT_FILE" <<JSON
{
  "type": "verify",
  "timestamp_utc": "$TS",
  "checks": {
    "xboard_running": $xboard_running,
    "artisan_route_ready": $artisan_route_ready,
    "guest_comm_config_ok": $guest_comm_ok,
    "guest_plan_fetch_ok": $guest_plans_ok,
    "gateway_healthz_ok": $gateway_health_ok
  },
  "xboard_public_url": "$(printf '%s' "$XBOARD_PUBLIC_URL" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "gateway_public_url": "$(printf '%s' "$GATEWAY_PUBLIC_URL" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "errors": [${errors_json}]
}
JSON

echo "Verify report written: $REPORT_FILE"
if [[ "${#errors[@]}" -gt 0 ]]; then
  echo "Verify finished with errors."
  exit 2
fi
echo "Verify passed."
