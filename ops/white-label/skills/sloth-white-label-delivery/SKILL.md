# SlothVPN White-Label Delivery Skill

Use this skill when a customer wants a SlothVPN white-label deployment, Xboard migration, branded app package, or managed delivery.

## Default delivery path

1. Collect customer data with `ops/white-label/customers/<brand-code>/intake-checklist.md`.
2. Create the package:
   - `npm run customer:init -- --customer <brand-code> --name '<brand name>'`
3. Fill `brand.manifest.json`.
4. Generate delivery artifacts:
   - `npm run customer:apply -- --manifest ops/white-label/customers/<brand-code>/brand.manifest.json`
5. Deploy or migrate on the customer server:
   - `npm run customer:deploy -- --mode migrate`
6. Build packages:
   - `npm run customer:build -- --manifest ops/white-label/customers/<brand-code>/brand.manifest.json --platforms android,macos`
7. Generate final handover:
   - `npm run customer:deliver -- --manifest ops/white-label/customers/<brand-code>/brand.manifest.json --download-base-url <download base url>`

## Rules

- One customer equals one instance.
- Do not introduce multi-tenant data changes for v1.
- Keep customer secrets out of the public showcase repository.
- Treat iOS as tutorial-first unless the customer explicitly buys TestFlight or App Store service.
- If an old Xboard has custom plugins or schema changes, run preflight and mark it as manual migration before touching data.

## Acceptance

- Frontend brand, logo, downloads, iOS guide, and pricing display correctly.
- Admin can save settings.
- New order, reused unpaid order, payment return, and subscription sync work.
- AI assistant online, timeout fallback, and offline fallback are distinguishable.
- Branded Android, macOS, and Windows packages match the manifest.
