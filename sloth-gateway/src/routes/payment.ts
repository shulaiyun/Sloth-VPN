import type { FastifyInstance } from "fastify";

export const registerPaymentRoutes = (app: FastifyInstance): void => {
  app.get("/api/app/v1/payment/return", async (request, reply) => {
    const query = request.query as Record<string, unknown>;
    const orderNo = (query.order_no ?? query.trade_no ?? "").toString().trim();
    const deepLink = orderNo
      ? `slothvpn://payment/callback?order_no=${encodeURIComponent(orderNo)}`
      : "slothvpn://payment/callback";

    const html = `<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SlothVPN Payment Return</title>
    <style>
      body { font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif; margin: 32px; color: #111; }
      .box { max-width: 560px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 12px; }
      a.btn { display: inline-block; margin-top: 12px; background: #0d6efd; color: #fff; padding: 10px 14px; border-radius: 8px; text-decoration: none; }
    </style>
  </head>
  <body>
    <div class="box">
      <h2>Payment Completed</h2>
      <p>Returning to SlothVPN and refreshing your subscription.</p>
      <a class="btn" href="${deepLink}">Open SlothVPN</a>
    </div>
    <script>
      setTimeout(function () { window.location.href = ${JSON.stringify(deepLink)}; }, 250);
    </script>
  </body>
</html>`;

    reply.header("content-type", "text/html; charset=utf-8");
    return reply.send(html);
  });
};

