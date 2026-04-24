#!/usr/bin/env bash
set -euo pipefail

DEPLOY_ROOT="${DEPLOY_ROOT:-/root/v2board}"
COMPOSE_FILE="${COMPOSE_FILE:-$DEPLOY_ROOT/docker-compose.yaml}"
SERVICE_XBOARD="${SERVICE_XBOARD:-xboard}"
REPORT_DIR="${REPORT_DIR:-$DEPLOY_ROOT/reports/whitelabel}"
BACKUP_FILE=""
CONFIRMED="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --backup)
      BACKUP_FILE="$2"
      shift 2
      ;;
    --yes)
      CONFIRMED="true"
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$BACKUP_FILE" ]]; then
  echo "Usage: bash rollback.sh --backup /abs/path/backup.sql.gz --yes"
  exit 1
fi
if [[ "$CONFIRMED" != "true" ]]; then
  echo "Rollback is destructive. Add --yes to continue."
  exit 1
fi
if [[ ! -f "$BACKUP_FILE" ]]; then
  echo "Backup file not found: $BACKUP_FILE"
  exit 1
fi

mkdir -p "$REPORT_DIR"
TS="$(date -u +%Y%m%dT%H%M%SZ)"
REPORT_FILE="$REPORT_DIR/rollback-$TS.json"

run_compose() {
  docker compose -f "$COMPOSE_FILE" --project-directory "$DEPLOY_ROOT" "$@"
}

CONTAINER_ID="$(run_compose ps -q "$SERVICE_XBOARD" | head -n 1)"
if [[ -z "$CONTAINER_ID" ]]; then
  echo "xboard container id not found"
  exit 2
fi

TARGET_IN_CONTAINER="/tmp/sloth_rollback_${TS}.sql.gz"
echo "[1/4] Copying backup into container..."
docker cp "$BACKUP_FILE" "${CONTAINER_ID}:${TARGET_IN_CONTAINER}"

echo "[2/4] Restoring database from backup..."
run_compose exec -T "$SERVICE_XBOARD" sh -lc "
set -e
if ! command -v mysql >/dev/null 2>&1; then
  echo 'mysql client missing in xboard container'
  exit 20
fi
if [ -z \"\${DB_DATABASE:-}\" ] || [ -z \"\${DB_USERNAME:-}\" ] || [ -z \"\${DB_HOST:-}\" ]; then
  echo 'DB env missing in container'
  exit 21
fi
export MYSQL_PWD=\"\${DB_PASSWORD:-}\"
gunzip -c \"$TARGET_IN_CONTAINER\" | mysql -h\"\${DB_HOST}\" -P\"\${DB_PORT:-3306}\" -u\"\${DB_USERNAME}\" \"\${DB_DATABASE}\"
" >/tmp/sloth_rollback_restore.log 2>&1 || {
  cat /tmp/sloth_rollback_restore.log
  echo "Rollback restore failed"
  exit 2
}

echo "[3/4] Clearing runtime cache..."
run_compose exec -T "$SERVICE_XBOARD" php artisan optimize:clear >/tmp/sloth_rollback_optimize.log 2>&1 || true

echo "[4/4] Capturing rollback report..."
cat >"$REPORT_FILE" <<JSON
{
  "type": "rollback",
  "timestamp_utc": "$TS",
  "backup_file_host": "$(printf '%s' "$BACKUP_FILE" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "backup_file_container": "$TARGET_IN_CONTAINER",
  "compose_file": "$(printf '%s' "$COMPOSE_FILE" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "service_xboard": "$SERVICE_XBOARD"
}
JSON

echo "Rollback report written: $REPORT_FILE"
echo "Rollback completed."
