# Sloth Gateway (MVP)

SlothVPN app gateway for phase-1 integration:

- bind/start
- bind/exchange
- bootstrap
- subscription/sync/pull
- order status
- payment return deep-link page

## Run

```bash
npm install
npm run build
npm start
```

Default listen: `http://0.0.0.0:8787`

Health check:

```bash
GET /healthz
```

## Environment

Copy `.env.example` to `.env` and update:

- `JWT_SECRET`
- `XBOARD_BASE_URL`
- `PUBLIC_BASE_URL`

Optional:

- `SLOTH_GATEWAY_PAYMENT_RETURN_URL` (set in XBoard env)

## MVP Flow

1. App calls `POST /api/app/v1/auth/bind/start`.
2. Web side calls `POST /api/app/v1/auth/bind/confirm` after user login.
3. Web redirects user to `slothvpn://auth/callback?...`.
4. App calls `POST /api/app/v1/auth/bind/exchange`.
5. App auto runs `bootstrap + subscription/sync`.

## Payment Callback

Configure XBoard env:

```env
SLOTH_GATEWAY_PAYMENT_RETURN_URL=https://your-gateway-domain/api/app/v1/payment/return
```

Then payment success page will redirect to:

`slothvpn://payment/callback?order_no=...`

App receives callback and refreshes order/subscription automatically.

## Deployment Checklist

See:

- `docs/mvp-deploy-checklist.md`
