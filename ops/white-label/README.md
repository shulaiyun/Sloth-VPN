# SlothVPN White-Label Delivery Kit

This folder turns SlothVPN into a repeatable white-label delivery flow for airport operators.

## What this kit provides

- Single source brand manifest (`brand.manifest.json` style input).
- Deterministic generation of gateway/app/xboard config artifacts.
- Standard Xboard same-database migration toolchain:
  - `preflight.sh`
  - `migrate.sh`
  - `verify.sh`
  - `rollback.sh`
- Machine-readable migration reports (`migration-report.json`).

## Quick start

1. Initialize a customer package (one command):
   - `npm run customer:init -- --customer acme-airport --name 'Acme VPN'`
2. Edit the generated manifest:
   - `ops/white-label/customers/acme-airport/brand.manifest.json`
3. Generate delivery artifacts:
   - `npm run customer:apply -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json`
4. Write the customer brand into native build config:
   - `node ops/white-label/scripts/prepare-customer-build.mjs --manifest ops/white-label/customers/acme-airport/brand.manifest.json`
5. Build customer app packages on the current host:
   - `npm run customer:build -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json --platforms android,macos`
6. Restore the workspace back to the default brand if needed:
   - `node ops/white-label/scripts/restore-customer-build.mjs`
7. Review output:
   - `artifacts/white-label/<brand-code>/gateway.env.generated`
   - `artifacts/white-label/<brand-code>/xboard-settings.generated.json`
   - `artifacts/white-label/<brand-code>/app-build.env.generated`
8. Run migration on customer host:
   - `npm run customer:deploy -- --mode migrate`
9. If needed, rollback:
   - `bash ops/white-label/scripts/rollback.sh --backup /path/to/backup.sql.gz --yes`
10. Generate final handover files:
   - `npm run customer:deliver -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json --download-base-url https://download.example.com/downloads/acme-airport`

## Assumptions

- One deployment = one customer brand (single-tenant instance).
- Xboard compatible schema (same-db migration path).
- Scripts run on the customer host where docker compose and xboard container exist.

## Notes

- `preflight.sh`, `migrate.sh`, `verify.sh`, and `rollback.sh` all write reports to:
  - `${REPORT_DIR:-$DEPLOY_ROOT/reports/whitelabel}`
- For production automation, call these scripts from your internal delivery pipeline.
- A simpler operator-facing SOP lives at:
  - `docs/customer-delivery-sop.md`
- A complete customer deployment playbook lives at:
  - `docs/customer-deployment-playbook.md`
