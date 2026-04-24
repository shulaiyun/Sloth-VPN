#!/usr/bin/env bash
set -euo pipefail

DEPLOY_ROOT="${DEPLOY_ROOT:-/root/v2board}"
COMPOSE_FILE="${COMPOSE_FILE:-$DEPLOY_ROOT/docker-compose.yaml}"
SERVICE_XBOARD="${SERVICE_XBOARD:-xboard}"
REPORT_DIR="${REPORT_DIR:-$DEPLOY_ROOT/reports/whitelabel}"
XBOARD_PUBLIC_URL="${XBOARD_PUBLIC_URL:-}"

mkdir -p "$REPORT_DIR"
TS="$(date -u +%Y%m%dT%H%M%SZ)"
REPORT_FILE="$REPORT_DIR/preflight-$TS.json"

ok_compose=false
ok_service=false
ok_artisan=false
ok_guest_api=null
ok_guest_plan_api=null
errors=()

run_compose() {
  docker compose -f "$COMPOSE_FILE" --project-directory "$DEPLOY_ROOT" "$@"
}

if [[ ! -f "$COMPOSE_FILE" ]]; then
  errors+=("compose_file_not_found:$COMPOSE_FILE")
else
  ok_compose=true
fi

if [[ "$ok_compose" == true ]]; then
  if run_compose ps --status running | grep -q "$SERVICE_XBOARD"; then
    ok_service=true
  else
    errors+=("xboard_service_not_running:$SERVICE_XBOARD")
  fi
fi

if [[ "$ok_service" == true ]]; then
  if run_compose exec -T "$SERVICE_XBOARD" php artisan --version >/dev/null 2>&1; then
    ok_artisan=true
  else
    errors+=("artisan_not_ready")
  fi
fi

if [[ -n "$XBOARD_PUBLIC_URL" ]]; then
  code="$(curl -s -o /tmp/sloth_preflight_guest_comm.json -w '%{http_code}' "$XBOARD_PUBLIC_URL/api/v1/guest/comm/config?_ts=$TS" || true)"
  if [[ "$code" == "200" ]]; then
    ok_guest_api=true
  else
    ok_guest_api=false
    errors+=("guest_comm_config_http_$code")
  fi

  code_plan="$(curl -s -o /tmp/sloth_preflight_guest_plan.json -w '%{http_code}' "$XBOARD_PUBLIC_URL/api/v1/guest/plan/fetch?_ts=$TS" || true)"
  if [[ "$code_plan" == "200" ]]; then
    ok_guest_plan_api=true
  else
    ok_guest_plan_api=false
    errors+=("guest_plan_fetch_http_$code_plan")
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
  "type": "preflight",
  "timestamp_utc": "$TS",
  "deploy_root": "$DEPLOY_ROOT",
  "compose_file": "$COMPOSE_FILE",
  "service_xboard": "$SERVICE_XBOARD",
  "xboard_public_url": "$(printf '%s' "$XBOARD_PUBLIC_URL" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "checks": {
    "compose_present": $ok_compose,
    "xboard_running": $ok_service,
    "artisan_ready": $ok_artisan,
    "guest_comm_config_ok": $ok_guest_api,
    "guest_plan_fetch_ok": $ok_guest_plan_api
  },
  "errors": [${errors_json}]
}
JSON

echo "Preflight report written: $REPORT_FILE"
if [[ "${#errors[@]}" -gt 0 ]]; then
  echo "Preflight finished with errors."
  exit 2
fi
echo "Preflight passed."
