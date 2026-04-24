#!/usr/bin/env bash
set -euo pipefail

DEPLOY_ROOT="${DEPLOY_ROOT:-/root/v2board}"
COMPOSE_FILE="${COMPOSE_FILE:-$DEPLOY_ROOT/docker-compose.yaml}"
SERVICE_XBOARD="${SERVICE_XBOARD:-xboard}"
REPORT_DIR="${REPORT_DIR:-$DEPLOY_ROOT/reports/whitelabel}"
MIGRATE_FROM_V2B_VERSION="${MIGRATE_FROM_V2B_VERSION:-}"
RUN_PREFLIGHT="${RUN_PREFLIGHT:-true}"

mkdir -p "$REPORT_DIR"
TS="$(date -u +%Y%m%dT%H%M%SZ)"
REPORT_FILE="$REPORT_DIR/migration-report-$TS.json"

run_compose() {
  docker compose -f "$COMPOSE_FILE" --project-directory "$DEPLOY_ROOT" "$@"
}

if [[ "$RUN_PREFLIGHT" == "true" ]]; then
  bash "$(dirname "$0")/preflight.sh"
fi

echo "[1/5] Running xboard database backup..."
run_compose exec -T "$SERVICE_XBOARD" php artisan backup:database >/tmp/sloth_migrate_backup.log 2>&1 || {
  cat /tmp/sloth_migrate_backup.log
  echo "backup:database failed"
  exit 2
}

CONTAINER_ID="$(run_compose ps -q "$SERVICE_XBOARD" | head -n 1)"
if [[ -z "$CONTAINER_ID" ]]; then
  echo "xboard container id not found"
  exit 2
fi

LATEST_BACKUP_IN_CONTAINER="$(run_compose exec -T "$SERVICE_XBOARD" sh -lc "ls -1t /www/storage/backup/*_database_backup.sql.gz 2>/dev/null | head -n 1" | tr -d '\r')"
if [[ -z "$LATEST_BACKUP_IN_CONTAINER" ]]; then
  echo "backup file not found in container"
  exit 2
fi

HOST_BACKUP_FILE="$REPORT_DIR/${TS}_database_backup.sql.gz"
echo "[2/5] Copying backup to host report dir..."
docker cp "${CONTAINER_ID}:${LATEST_BACKUP_IN_CONTAINER}" "$HOST_BACKUP_FILE"

if [[ -n "$MIGRATE_FROM_V2B_VERSION" ]]; then
  echo "[3/5] Running migrateFromV2b version=${MIGRATE_FROM_V2B_VERSION}..."
  run_compose exec -T "$SERVICE_XBOARD" php artisan migrateFromV2b "$MIGRATE_FROM_V2B_VERSION" >/tmp/sloth_migrate_apply.log 2>&1 || {
    cat /tmp/sloth_migrate_apply.log
    echo "migrateFromV2b failed"
    exit 2
  }
else
  echo "[3/5] Running Laravel migrations..."
  run_compose exec -T "$SERVICE_XBOARD" php artisan migrate --force >/tmp/sloth_migrate_apply.log 2>&1 || {
    cat /tmp/sloth_migrate_apply.log
    echo "migrate --force failed"
    exit 2
  }
fi

echo "[4/5] Clearing runtime cache..."
run_compose exec -T "$SERVICE_XBOARD" php artisan optimize:clear >/tmp/sloth_migrate_optimize.log 2>&1 || true

echo "[5/5] Capturing migration report..."
APPLIED_MIGRATIONS="$(run_compose exec -T "$SERVICE_XBOARD" php artisan migrate:status --no-ansi 2>/dev/null | sed 's/"/\\"/g' | tr '\n' '\\' | sed 's/\\n/\\\\n/g' || true)"
cat >"$REPORT_FILE" <<JSON
{
  "type": "migration",
  "timestamp_utc": "$TS",
  "deploy_root": "$DEPLOY_ROOT",
  "compose_file": "$COMPOSE_FILE",
  "service_xboard": "$SERVICE_XBOARD",
  "migrate_from_v2b_version": "$(printf '%s' "$MIGRATE_FROM_V2B_VERSION" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "backup_file_host": "$HOST_BACKUP_FILE",
  "backup_file_container": "$(printf '%s' "$LATEST_BACKUP_IN_CONTAINER" | sed 's/\\/\\\\/g; s/"/\\"/g')",
  "migration_status_snapshot": "$APPLIED_MIGRATIONS"
}
JSON

echo "Migration report written: $REPORT_FILE"
echo "Backup snapshot: $HOST_BACKUP_FILE"
