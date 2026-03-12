import type { FastifyInstance } from "fastify";
import { randomUUID } from "node:crypto";
import { config } from "../config";
import { AppError, ErrorCodes } from "../errors";
import type { BindStore } from "../store/bind-store";
import type { SessionStore } from "../store/session-store";
import { signAccessToken, signBindExchangeToken, signPullToken, signRefreshToken, verifyBindExchangeToken } from "../utils/jwt";
import { ok } from "../utils/response";
import type { XboardAdapter } from "../adapter/xboard-adapter";

type AuthRouteDeps = {
  binds: BindStore;
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const htmlEscape = (value: string): string =>
  value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");

const authDeepLink = (bindId: string, exchangeToken: string): string =>
  `slothvpn://auth/callback?bind_id=${encodeURIComponent(bindId)}&exchange_token=${encodeURIComponent(exchangeToken)}`;

const authCallbackPageUrl = (bindId: string, exchangeToken: string): string =>
  `${config.publicBaseUrl}/api/app/v1/auth/callback?bind_id=${encodeURIComponent(bindId)}&exchange_token=${encodeURIComponent(exchangeToken)}`;

const bindConfirmPage = (bindId: string): string => `<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SlothVPN 账号绑定</title>
    <style>
      body { font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif; margin: 0; background: #f6f8fb; color: #111; }
      .wrap { max-width: 680px; margin: 28px auto; padding: 0 16px; }
      .card { background: #fff; border: 1px solid #e6e9ef; border-radius: 14px; padding: 18px; box-shadow: 0 4px 20px rgba(0,0,0,0.03); }
      h1 { margin: 0 0 8px; font-size: 22px; }
      p { margin: 0 0 12px; color: #4c5565; }
      .tips { font-size: 13px; color: #677389; margin-bottom: 14px; }
      .group { margin: 10px 0; }
      label { display: block; font-size: 13px; margin-bottom: 6px; color: #334; }
      input { width: 100%; box-sizing: border-box; padding: 10px 12px; border: 1px solid #d7dce6; border-radius: 8px; font-size: 14px; }
      .btns { display: flex; gap: 10px; flex-wrap: wrap; margin-top: 14px; }
      button, a.btn { border: 0; border-radius: 8px; padding: 10px 14px; cursor: pointer; text-decoration: none; font-size: 14px; }
      button.primary { background: #0f6fff; color: #fff; }
      button.ghost, a.btn.ghost { background: #eef3ff; color: #214caa; }
      .status { margin-top: 12px; font-size: 13px; color: #44526a; white-space: pre-wrap; word-break: break-word; }
      .ok { color: #0d7a3f; }
      .err { color: #b42318; }
      code { background: #f2f4f8; border-radius: 6px; padding: 2px 6px; }
    </style>
  </head>
  <body>
    <div class="wrap">
      <div class="card">
        <h1>绑定 SlothVPN 设备</h1>
        <p>完成登录后将自动回到 App，并执行订阅同步。</p>
        <div class="tips">当前绑定 ID：<code>${htmlEscape(bindId)}</code></div>

        <form id="bind-form">
          <div class="group">
            <label for="email">XBoard 账号邮箱</label>
            <input id="email" name="email" type="email" placeholder="you@example.com" />
          </div>
          <div class="group">
            <label for="password">XBoard 账号密码</label>
            <input id="password" name="password" type="password" placeholder="输入密码" />
          </div>
          <div class="group">
            <label for="auth_data">或直接填 auth_data（可选）</label>
            <input id="auth_data" name="xboard_auth_data" type="text" placeholder="Bearer xxxxx" />
          </div>
          <div class="btns">
            <button class="primary" type="submit">确认绑定并回到 App</button>
            <button class="ghost" id="open-app" type="button">仅打开 App</button>
          </div>
        </form>
        <div id="status" class="status"></div>
      </div>
    </div>

    <script>
      (function () {
        var bindId = ${JSON.stringify(bindId)};
        var statusEl = document.getElementById('status');
        var form = document.getElementById('bind-form');
        var openBtn = document.getElementById('open-app');

        function setStatus(text, cls) {
          statusEl.className = 'status ' + (cls || '');
          statusEl.textContent = text || '';
        }

        openBtn.addEventListener('click', function () {
          window.location.href = 'slothvpn://auth/callback?bind_id=' + encodeURIComponent(bindId);
        });

        form.addEventListener('submit', async function (event) {
          event.preventDefault();
          setStatus('正在确认绑定并生成回跳链接...');

          var email = (document.getElementById('email').value || '').trim();
          var password = (document.getElementById('password').value || '').trim();
          var authData = (document.getElementById('auth_data').value || '').trim();

          var payload = { bind_id: bindId };
          if (authData) {
            payload.xboard_auth_data = authData;
          } else {
            payload.email = email;
            payload.password = password;
          }

          try {
            var response = await fetch('/api/app/v1/auth/bind/confirm', {
              method: 'POST',
              headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
              body: JSON.stringify(payload)
            });
            var result = await response.json();
            if (!response.ok || !result.success) {
              var msg = (result && result.error && result.error.message) ? result.error.message : '绑定失败';
              throw new Error(msg);
            }

            var data = result.data || {};
            var callbackPage = data.callback_page_url || data.callback_url;
            if (!callbackPage) throw new Error('未返回回跳地址');

            setStatus('绑定成功，正在回到 App...', 'ok');
            setTimeout(function () { window.location.href = callbackPage; }, 200);
          } catch (error) {
            setStatus('绑定失败：' + (error && error.message ? error.message : String(error)), 'err');
          }
        });
      })();
    </script>
  </body>
</html>`;

const authCallbackPage = (deepLink: string, bindId: string): string => `<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SlothVPN 登录回跳</title>
    <style>
      body { font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, sans-serif; margin: 30px; color: #111; }
      .box { max-width: 620px; margin: 0 auto; padding: 18px; border: 1px solid #ddd; border-radius: 12px; }
      a.btn { display: inline-block; margin-top: 12px; background: #0f6fff; color: #fff; padding: 10px 14px; border-radius: 8px; text-decoration: none; }
      .muted { color: #637086; font-size: 13px; margin-top: 10px; word-break: break-word; }
      code { background: #f2f4f8; border-radius: 6px; padding: 2px 6px; }
    </style>
  </head>
  <body>
    <div class="box">
      <h2>登录成功，正在打开 SlothVPN</h2>
      <p>如果没有自动打开，请点击下方按钮。</p>
      <a class="btn" href="${htmlEscape(deepLink)}">打开 SlothVPN</a>
      <div class="muted">bind_id: <code>${htmlEscape(bindId)}</code></div>
    </div>
    <script>
      setTimeout(function () { window.location.href = ${JSON.stringify(deepLink)}; }, 120);
    </script>
  </body>
</html>`;

export const registerAuthRoutes = (app: FastifyInstance, deps: AuthRouteDeps): void => {
  app.post("/api/app/v1/auth/bind/start", async (request, reply) => {
    const body = (request.body ?? {}) as Record<string, unknown>;
    const deviceId = String(body.device_id ?? "").trim();
    if (!deviceId) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "device_id is required");
    }

    const platform = typeof body.platform === "string" ? body.platform : undefined;
    const appVersion = typeof body.app_version === "string" ? body.app_version : undefined;

    const rec = deps.binds.create({
      deviceId,
      platform,
      appVersion,
      ttlSeconds: config.bindTtlSeconds,
    });

    const approveUrl = `${config.publicBaseUrl}/api/app/v1/auth/bind/confirm?bind_id=${encodeURIComponent(rec.bindId)}`;

    return ok(reply, {
      bind_id: rec.bindId,
      expires_at: new Date(rec.expiresAt).toISOString(),
      approve_url: approveUrl,
      deep_link: `slothvpn://auth/callback?bind_id=${encodeURIComponent(rec.bindId)}`,
      ...(config.debugBindCode ? { debug_bind_code: rec.bindCode } : {}),
    });
  });

  app.get("/api/app/v1/auth/bind/confirm", async (request, reply) => {
    const query = request.query as Record<string, unknown>;
    const bindId = String(query.bind_id ?? "").trim();
    if (!bindId) throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id is required");

    const bind = deps.binds.get(bindId);
    if (!bind) throw new AppError(404, ErrorCodes.NOT_FOUND, "Bind session not found");
    if (bind.expiresAt <= Date.now()) throw new AppError(400, ErrorCodes.BIND_EXPIRED, "Bind session expired");

    reply.header("content-type", "text/html; charset=utf-8");
    return reply.send(bindConfirmPage(bind.bindId));
  });

  app.post("/api/app/v1/auth/bind/confirm", async (request, reply) => {
    const body = (request.body ?? {}) as Record<string, unknown>;
    const bindId = String(body.bind_id ?? "").trim();
    if (!bindId) throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id is required");

    const bind = deps.binds.get(bindId);
    if (!bind) throw new AppError(404, ErrorCodes.NOT_FOUND, "Bind session not found");
    if (bind.expiresAt <= Date.now()) throw new AppError(400, ErrorCodes.BIND_EXPIRED, "Bind session expired");

    let xboardAuthData = typeof body.xboard_auth_data === "string" ? body.xboard_auth_data : "";
    let xboardToken = typeof body.xboard_token === "string" ? body.xboard_token : undefined;

    if (!xboardAuthData) {
      const email = String(body.email ?? "").trim();
      const password = String(body.password ?? "").trim();
      if (!email || !password) {
        throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "xboard_auth_data or email/password is required");
      }
      const login = await deps.xboard.login(email, password);
      xboardAuthData = login.authData;
      xboardToken = login.token;
    }

    const user = await deps.xboard.getUserInfo(xboardAuthData);
    const sub = await deps.xboard.getSubscribe(xboardAuthData);
    const exchangeToken = signBindExchangeToken({
      bind_id: bind.bindId,
      device_id: bind.deviceId,
      xboard_auth_data: xboardAuthData,
      xboard_token: xboardToken,
      user_email: user.email,
      user_uuid: sub.uuid,
      jti: randomUUID(),
    });

    deps.binds.approve(bind.bindId, exchangeToken);

    const callbackUrl = authDeepLink(bind.bindId, exchangeToken);
    const callbackPageUrl = authCallbackPageUrl(bind.bindId, exchangeToken);

    return ok(reply, {
      bind_id: bind.bindId,
      exchange_token: exchangeToken,
      callback_url: callbackUrl,
      callback_page_url: callbackPageUrl,
      user: {
        email: user.email,
        uuid: sub.uuid,
        plan_name: sub.plan?.name ?? null,
      },
    });
  });

  app.get("/api/app/v1/auth/callback", async (request, reply) => {
    const query = request.query as Record<string, unknown>;
    const bindId = String(query.bind_id ?? "").trim();
    const exchangeToken = String(query.exchange_token ?? "").trim();

    if (!bindId || !exchangeToken) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id and exchange_token are required");
    }

    const deepLink = authDeepLink(bindId, exchangeToken);
    reply.header("content-type", "text/html; charset=utf-8");
    return reply.send(authCallbackPage(deepLink, bindId));
  });

  app.post("/api/app/v1/auth/bind/exchange", async (request, reply) => {
    const body = (request.body ?? {}) as Record<string, unknown>;
    const bindId = String(body.bind_id ?? "").trim();
    const exchangeToken = String(body.exchange_token ?? "").trim();
    const deviceId = String(body.device_id ?? "").trim();

    if (!bindId || !exchangeToken || !deviceId) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id, exchange_token and device_id are required");
    }

    const bind = deps.binds.get(bindId);
    if (!bind) throw new AppError(404, ErrorCodes.NOT_FOUND, "Bind session not found");
    if (bind.expiresAt <= Date.now()) throw new AppError(400, ErrorCodes.BIND_EXPIRED, "Bind session expired");
    if (bind.status === "consumed") throw new AppError(409, ErrorCodes.BIND_ALREADY_USED, "Bind session already used");

    const payload = verifyBindExchangeToken(exchangeToken);
    if (payload.bind_id !== bind.bindId) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id does not match exchange token");
    }
    if (payload.device_id !== bind.deviceId || bind.deviceId !== deviceId) {
      throw new AppError(403, ErrorCodes.FORBIDDEN, "device_id does not match bind session");
    }

    if (bind.status !== "approved" && bind.exchangeToken !== exchangeToken) {
      throw new AppError(409, ErrorCodes.BIND_NOT_APPROVED, "Bind session is not approved yet");
    }

    const session = deps.sessions.create({
      xboardAuthData: payload.xboard_auth_data,
      xboardToken: payload.xboard_token,
      userEmail: payload.user_email,
      userUuid: payload.user_uuid,
    });

    deps.binds.consume(bind.bindId);

    const accessToken = signAccessToken(session.sid);
    const refreshToken = signRefreshToken(session.sid);
    const pullToken = signPullToken(session.sid);

    return ok(reply, {
      access_token: accessToken,
      refresh_token: refreshToken,
      token_type: "Bearer",
      expires_in: config.accessTokenExpires,
      session_id: session.sid,
      subscription_pull_token: pullToken,
      user: {
        email: session.userEmail ?? null,
        uuid: session.userUuid ?? null,
      },
    });
  });
};

