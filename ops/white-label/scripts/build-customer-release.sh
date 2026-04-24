#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"
MANIFEST=""
PLATFORMS="android,macos"
KEEP_BRAND_STATE="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --manifest)
      MANIFEST="$2"
      shift 2
      ;;
    --platforms)
      PLATFORMS="$2"
      shift 2
      ;;
    --keep-brand-state)
      KEEP_BRAND_STATE="true"
      shift 1
      ;;
    -h|--help)
      cat <<'EOF'
Usage:
  bash ops/white-label/scripts/build-customer-release.sh --manifest /abs/path/brand.manifest.json

Optional:
  --platforms android,macos
  --keep-brand-state
EOF
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$MANIFEST" ]]; then
  echo "Missing --manifest" >&2
  exit 1
fi

MANIFEST="$(cd "$(dirname "$MANIFEST")" && pwd)/$(basename "$MANIFEST")"
BRAND_CODE="$(node -e "const fs=require('fs');const m=JSON.parse(fs.readFileSync(process.argv[1],'utf8'));const raw=String(m?.brand?.code||'brand').trim().toLowerCase().replace(/[^a-z0-9._-]+/g,'-').replace(/^-+|-+$/g,'');process.stdout.write(raw||'brand');" "$MANIFEST")"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
OUT_DIR="$ROOT_DIR/artifacts/white-label/$BRAND_CODE/releases/$STAMP"
mkdir -p "$OUT_DIR"

cleanup() {
  if [[ "$KEEP_BRAND_STATE" != "true" ]]; then
    node "$ROOT_DIR/ops/white-label/scripts/restore-customer-build.mjs" >/dev/null 2>&1 || true
  fi
}
trap cleanup EXIT

echo "==> Applying customer manifest"
node "$ROOT_DIR/ops/white-label/scripts/apply-brand.mjs" --manifest "$MANIFEST"
node "$ROOT_DIR/ops/white-label/scripts/prepare-customer-build.mjs" --manifest "$MANIFEST"

HOST_OS="$(uname -s)"
IFS=',' read -r -a TARGETS <<<"$PLATFORMS"

copy_matches() {
  local destination="$1"
  shift
  mkdir -p "$destination"
  local copied=0
  while IFS= read -r file; do
    [[ -f "$file" ]] || continue
    cp -f "$file" "$destination/${BRAND_CODE}-$(basename "$file")"
    copied=1
  done < <(find "$ROOT_DIR" "$@" 2>/dev/null)
  return $copied
}

for target in "${TARGETS[@]}"; do
  target="$(echo "$target" | xargs)"
  [[ -n "$target" ]] || continue

  case "$target" in
    android)
      echo "==> Building Android release"
      (cd "$ROOT_DIR" && make android-apk-release)
      find "$ROOT_DIR/build" "$ROOT_DIR/build_out" "$ROOT_DIR/dist" -type f \( -name "*.apk" -o -name "*.aab" \) 2>/dev/null | while read -r file; do
        mkdir -p "$OUT_DIR/android"
        cp -f "$file" "$OUT_DIR/android/${BRAND_CODE}-$(basename "$file")"
      done
      ;;
    macos)
      if [[ "$HOST_OS" != "Darwin" ]]; then
        echo "macOS packaging must run on a Mac host." >&2
        exit 1
      fi
      echo "==> Building macOS release"
      (cd "$ROOT_DIR" && make macos-release)
      find "$ROOT_DIR/dist" "$ROOT_DIR/build" "$ROOT_DIR/build_out" -type f \( -name "*.dmg" -o -name "*.pkg" -o -name "*.zip" \) 2>/dev/null | while read -r file; do
        mkdir -p "$OUT_DIR/macos"
        cp -f "$file" "$OUT_DIR/macos/${BRAND_CODE}-$(basename "$file")"
      done
      ;;
    windows)
      case "$HOST_OS" in
        MINGW*|MSYS*|CYGWIN*|Windows_NT)
          ;;
        *)
          echo "Windows packaging should run on a Windows runner or GitHub Actions windows-latest." >&2
          exit 1
          ;;
      esac
      echo "==> Building Windows release"
      (cd "$ROOT_DIR" && make windows-release)
      find "$ROOT_DIR/dist" "$ROOT_DIR/build" -type f \( -name "*.zip" -o -name "*.exe" -o -name "*.msix" \) 2>/dev/null | while read -r file; do
        mkdir -p "$OUT_DIR/windows"
        cp -f "$file" "$OUT_DIR/windows/${BRAND_CODE}-$(basename "$file")"
      done
      ;;
    *)
      echo "Unsupported platform: $target" >&2
      exit 1
      ;;
  esac
done

cat >"$OUT_DIR/README.txt" <<EOF
Customer release prepared.

Brand code: $BRAND_CODE
Manifest: $MANIFEST
Platforms: $PLATFORMS
Prepared at: $STAMP

If you want to keep the workspace on this brand, rerun with:
  --keep-brand-state
EOF

echo "==> Customer artifacts ready"
echo "$OUT_DIR"
