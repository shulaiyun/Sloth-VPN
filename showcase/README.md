# SlothVPN showcase site

This folder is safe to publish as a public GitHub Pages demo. The entry page now intentionally looks like a real deployed SlothPro front desk instead of a separate marketing landing page, so airport owners see the product surface they would actually receive.

Local preview:

```bash
npm run showcase:serve
```

GitHub Pages:

- Put this folder in the public showcase repository.
- Keep core source, customer manifests, `.env`, database backups, and deployment scripts private.
- Enable Pages with GitHub Actions and use `.github/workflows/showcase-pages.yml`.
- The first screen should show pricing, download center, console entry, AI helper, and customer branding.

Optional sanitized screenshot slots:

- `showcase/assets/screens/frontend.png`
- `showcase/assets/screens/admin.png`
- `showcase/assets/screens/payment.png`
- `showcase/assets/screens/assistant.png`
- `showcase/assets/screens/download.png`
