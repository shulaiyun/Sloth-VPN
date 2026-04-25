# SlothVPN public showcase

This folder is safe to publish as a public GitHub Pages demo. It is intentionally designed to look like the real deployed SlothPro front desk instead of a separate marketing landing page, so airport owners see the product surface they would actually receive.

Local preview:

```bash
npm run showcase:serve
```

Publishing notes:

- Put this folder in the public showcase repository.
- Keep core source, customer manifests, `.env`, database backups, and deployment scripts private.
- Enable Pages with GitHub Actions and use `.github/workflows/showcase-pages.yml`.
- The first screen should show pricing, download center, console entry, AI helper, and customer branding.
- Screenshot evidence should be sanitized before publication.

Current screenshot evidence:

- `showcase/assets/screens/live-home-pricing.png`
- `showcase/assets/screens/live-download.png`
- `showcase/assets/screens/live-features.png`
- `showcase/assets/screens/app-home-connected-light.jpg`
- `showcase/assets/screens/app-ai-assistant-light.jpg`
- `showcase/assets/screens/app-home-connected-dark.jpg`
- `showcase/assets/screens/app-referral-center-dark.jpg`
- `showcase/assets/screens/app-account-actions-dark.jpg`
- `showcase/assets/screens/app-account-center.jpg`

Customer-facing proof points:

- Web front desk: pricing, new-user discount, download center, iOS tutorial and console entry.
- Mobile app: connection dashboard, light/dark mode, AI assistant, account center, referral sharing and subscription sync.
- Delivery story: not a raw XBoard login page, but a white-label product surface that can be handed to an airport owner.
