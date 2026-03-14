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

const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

const extractErrorText = (error: AppError): string => {
  const stringify = (value: unknown): string => {
    if (value == null) return "";
    if (typeof value === "string") return value;
    try {
      return JSON.stringify(value);
    } catch {
      return "";
    }
  };
  const details = error.details as Record<string, unknown> | undefined;
  const upstreamError = details?.upstream_error;
  const upstreamMessage =
    upstreamError && typeof upstreamError === "object"
      ? (upstreamError as Record<string, unknown>).message
      : undefined;
  return `${error.message} ${stringify(error.details)} ${stringify(upstreamError)} ${stringify(upstreamMessage)}`.toLowerCase();
};

const readUpstreamStatus = (error: AppError): number => {
  const details = error.details as Record<string, unknown> | undefined;
  const raw = details?.upstream_status;
  if (typeof raw === "number") return raw;
  const parsed = Number(raw);
  return Number.isFinite(parsed) ? parsed : 0;
};

const mapUpstreamAuthError = (error: unknown): never => {
  if (!(error instanceof AppError)) {
    throw error;
  }
  if (error.code !== ErrorCodes.UPSTREAM_ERROR) {
    throw error;
  }

  const text = extractErrorText(error);
  const upstreamStatus = readUpstreamStatus(error);
  if (upstreamStatus === 422) {
    if (text.includes("邮箱格式") || text.includes("email format") || text.includes("invalid email")) {
      throw new AppError(400, ErrorCodes.BAD_EMAIL_FORMAT, "邮箱格式不正确，请检查邮箱是否正确");
    }
    if (text.includes("invite")) {
      throw new AppError(400, ErrorCodes.INVITE_CODE_REQUIRED, "当前站点要求填写邀请码");
    }
    if (text.includes("verify") || text.includes("验证码")) {
      throw new AppError(400, ErrorCodes.EMAIL_CODE_INVALID, "邮箱验证码错误或已过期");
    }
  }
  if (text.includes("register") && (text.includes("closed") || text.includes("disable"))) {
    throw new AppError(403, ErrorCodes.REGISTER_CLOSED, "当前站点已关闭注册");
  }
  if (text.includes("invite") && (text.includes("required") || text.includes("empty") || text.includes("must"))) {
    throw new AppError(400, ErrorCodes.INVITE_CODE_REQUIRED, "当前站点要求填写邀请码");
  }
  if (
    (text.includes("email") && text.includes("verify") && text.includes("required")) ||
    text.includes("email code required")
  ) {
    throw new AppError(400, ErrorCodes.EMAIL_VERIFY_REQUIRED, "当前站点要求邮箱验证码");
  }
  if (
    text.includes("email code") &&
    (text.includes("error") || text.includes("invalid") || text.includes("incorrect") || text.includes("expired"))
  ) {
    throw new AppError(400, ErrorCodes.EMAIL_CODE_INVALID, "邮箱验证码错误或已过期");
  }
  if (
    text.includes("suffix") &&
    (text.includes("allow") || text.includes("invalid") || text.includes("limit") || text.includes("not"))
  ) {
    throw new AppError(400, ErrorCodes.EMAIL_SUFFIX_NOT_ALLOWED, "仅支持指定邮箱后缀注册");
  }
  if (
    text.includes("captcha") ||
    text.includes("recaptcha") ||
    text.includes("turnstile") ||
    text.includes("hcaptcha") ||
    text.includes("人机验证")
  ) {
    throw new AppError(400, ErrorCodes.CAPTCHA_REQUIRED, "当前站点开启人机验证，请在网页端完成验证码后再注册");
  }
  if (
    text.includes("invalid email") ||
    text.includes("email format") ||
    text.includes("邮箱格式") ||
    text.includes("email is invalid")
  ) {
    throw new AppError(400, ErrorCodes.BAD_EMAIL_FORMAT, "邮箱格式不正确，请检查邮箱是否正确");
  }
  if (
    text.includes("password") &&
    (text.includes("error") || text.includes("invalid") || text.includes("wrong") || text.includes("incorrect"))
  ) {
    throw new AppError(401, ErrorCodes.AUTH_INVALID_CREDENTIALS, "邮箱或密码错误");
  }
  if (text.includes("credential") || text.includes("unauthorized") || text.includes("login failed")) {
    throw new AppError(401, ErrorCodes.AUTH_INVALID_CREDENTIALS, "邮箱或密码错误");
  }

  throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "上游认证服务异常，请稍后重试");
};

const normalizeEmailSuffixes = (suffixes: string[]): string[] =>
  suffixes
    .map((item) => item.trim().toLowerCase())
    .filter((item) => item.length > 0)
    .map((item) => (item.startsWith("@") ? item : `@${item}`));

const normalizeEmail = (value: string): string =>
  value
    .trim()
    .replace(/\u3000/g, "")
    .replace(/\s+/g, "")
    .toLowerCase();

const ensureEmailValidAndAllowed = (email: string, allowedSuffixes: string[]) => {
  if (!EMAIL_REGEX.test(email)) {
    throw new AppError(400, ErrorCodes.BAD_EMAIL_FORMAT, "邮箱格式不正确，请检查邮箱是否正确");
  }
  if (allowedSuffixes.length <= 0) return;
  const normalized = email.toLowerCase();
  const matched = allowedSuffixes.some((suffix) => normalized.endsWith(suffix));
  if (!matched) {
    throw new AppError(400, ErrorCodes.EMAIL_SUFFIX_NOT_ALLOWED, "仅支持指定邮箱后缀注册");
  }
};

const htmlEscape = (value: string): string =>
  value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");

const authDeepLink = (bindId: string, exchangeToken: string, deviceId?: string): string =>
  `slothvpn://auth/callback?bind_id=${encodeURIComponent(bindId)}&exchange_token=${encodeURIComponent(exchangeToken)}${
    deviceId ? `&device_id=${encodeURIComponent(deviceId)}` : ""
  }`;

const authCallbackPageUrl = (bindId: string, exchangeToken: string, deviceId?: string): string =>
  `${config.publicBaseUrl}/api/app/v1/auth/callback?bind_id=${encodeURIComponent(bindId)}&exchange_token=${encodeURIComponent(exchangeToken)}${
    deviceId ? `&device_id=${encodeURIComponent(deviceId)}` : ""
  }`;

const bindConfirmPage = (bindId: string): string => `<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SlothVPN Account Bind</title>
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
        <h1>Bind SlothVPN Device</h1>
        <p>Sign in to confirm binding. After success, we will return to the App and trigger subscription sync.</p>
        <div class="tips">Current bind ID: <code>${htmlEscape(bindId)}</code></div>

        <form id="bind-form">
          <div class="group">
            <label for="email">XBoard Email</label>
            <input id="email" name="email" type="email" placeholder="you@example.com" />
          </div>
          <div class="group">
            <label for="password">XBoard Password</label>
            <input id="password" name="password" type="password" placeholder="Input password" />
          </div>
          <div class="group">
            <label for="auth_data">Or provide auth_data directly (optional)</label>
            <input id="auth_data" name="xboard_auth_data" type="text" placeholder="Bearer xxxxx" />
          </div>
          <div class="btns">
            <button class="primary" type="submit">Confirm and Return to App</button>
            <button class="ghost" id="open-app" type="button">Open App Only</button>
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
          setStatus('Confirming bind and generating callback link...');

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
              var msg = (result && result.error && result.error.message) ? result.error.message : 'Bind failed';
              throw new Error(msg);
            }

            var data = result.data || {};
            var callbackPage = data.callback_page_url || data.callback_url;
            if (!callbackPage) throw new Error('Callback URL is missing');

            setStatus('Bind succeeded. Returning to App...', 'ok');
            setTimeout(function () { window.location.href = callbackPage; }, 200);
          } catch (error) {
            setStatus('Bind failed: ' + (error && error.message ? error.message : String(error)), 'err');
          }
        });
      })();
    </script>
  </body>
</html>`;

const authCallbackPage = (deepLink: string, bindId: string): string => `<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SlothVPN Login Callback</title>
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
      <h2>Login Succeeded, Returning to SlothVPN</h2>
      <p>If the app does not open automatically, tap the button below.</p>
      <a class="btn" href="${htmlEscape(deepLink)}">Open SlothVPN</a>
      <div class="muted">bind_id: <code>${htmlEscape(bindId)}</code></div>
    </div>
    <script>
      setTimeout(function () { window.location.href = ${JSON.stringify(deepLink)}; }, 120);
    </script>
  </body>
</html>`;
const issueSessionTokenSet = (deps: AuthRouteDeps, input: {
  xboardAuthData: string;
  xboardToken?: string;
  userEmail?: string;
  userUuid?: string;
}) => {
  const session = deps.sessions.create({
    xboardAuthData: input.xboardAuthData,
    xboardToken: input.xboardToken,
    userEmail: input.userEmail,
    userUuid: input.userUuid,
  });

  const accessToken = signAccessToken(session.sid);
  const refreshToken = signRefreshToken(session.sid);
  const pullToken = signPullToken(session.sid);

  return {
    session,
    accessToken,
    refreshToken,
    pullToken,
  };
};

const tokenResponse = (issued: ReturnType<typeof issueSessionTokenSet>) => ({
  access_token: issued.accessToken,
  refresh_token: issued.refreshToken,
  token_type: "Bearer",
  expires_in: config.accessTokenExpires,
  session_id: issued.session.sid,
  subscription_pull_token: issued.pullToken,
  user: {
    email: issued.session.userEmail ?? null,
    uuid: issued.session.userUuid ?? null,
  },
});

export const registerAuthRoutes = (app: FastifyInstance, deps: AuthRouteDeps): void => {
  const configuredAllowedSuffixes = normalizeEmailSuffixes(config.allowedEmailSuffixes);

  const readAuthPolicy = async () => {
    let upstreamPolicy: Awaited<ReturnType<XboardAdapter["getAuthPolicy"]>> | null = null;
    try {
      upstreamPolicy = await deps.xboard.getAuthPolicy();
    } catch {
      upstreamPolicy = null;
    }
    const upstreamSuffixes = upstreamPolicy ? normalizeEmailSuffixes(upstreamPolicy.allowedEmailSuffixes) : [];
    const allowedEmailSuffixes = configuredAllowedSuffixes.length > 0 ? configuredAllowedSuffixes : upstreamSuffixes;
    return {
      allowedEmailSuffixes,
      registerEnabled: upstreamPolicy?.isRegisterEnabled ?? true,
      emailVerifyRequired: upstreamPolicy?.isEmailVerifyEnabled ?? false,
      inviteCodeRequired: upstreamPolicy?.isInviteForce ?? false,
    };
  };

  app.get("/api/app/v1/auth/policy", async (_, reply) => {
    const policy = await readAuthPolicy();
    return ok(reply, {
      allowed_email_suffixes: policy.allowedEmailSuffixes,
      register_enabled: policy.registerEnabled,
      email_verify_required: policy.emailVerifyRequired,
      invite_code_required: policy.inviteCodeRequired,
    });
  });

  app.post("/api/app/v1/auth/send-email-verify", async (request, reply) => {
    const body = (request.body ?? {}) as Record<string, unknown>;
    const email = normalizeEmail(String(body.email ?? ""));
    if (!email) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "email is required");
    }
    const policy = await readAuthPolicy();
    ensureEmailValidAndAllowed(email, policy.allowedEmailSuffixes);

    try {
      await deps.xboard.sendEmailVerify({
        email,
        captchaData: typeof body.captcha_data === "string" ? body.captcha_data : undefined,
        recaptchaData: typeof body.recaptcha_data === "string" ? body.recaptcha_data : undefined,
        turnstileData: typeof body.turnstile_data === "string" ? body.turnstile_data : undefined,
        hcaptchaData: typeof body.hcaptcha_data === "string" ? body.hcaptcha_data : undefined,
      });
    } catch (error) {
      mapUpstreamAuthError(error);
    }

    return ok(reply, {
      sent: true,
      email,
      message: "验证码已发送",
    });
  });

  app.post("/api/app/v1/auth/login", async (request, reply) => {
    const body = (request.body ?? {}) as Record<string, unknown>;
    const email = normalizeEmail(String(body.email ?? ""));
    const password = String(body.password ?? "").trim();
    if (!email || !password) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "email and password are required");
    }
    ensureEmailValidAndAllowed(email, []);

    const login = await deps.xboard
      .login(email, password)
      .catch((error): never => mapUpstreamAuthError(error));
    const [user, subscribe] = await Promise.all([
      deps.xboard.getUserInfo(login.authData),
      deps.xboard.getSubscribe(login.authData),
    ]);
    const issued = issueSessionTokenSet(deps, {
      xboardAuthData: login.authData,
      xboardToken: login.token,
      userEmail: user.email,
      userUuid: subscribe.uuid,
    });

    request.log.info({ evt: "auth_login_success", email: user.email, sid: issued.session.sid });
    return ok(reply, {
      ...tokenResponse(issued),
      profile: {
        plan_name: subscribe.plan?.name ?? null,
        expired_at: subscribe.expired_at ?? null,
      },
    });
  });

  app.post("/api/app/v1/auth/register", async (request, reply) => {
    const body = (request.body ?? {}) as Record<string, unknown>;
    const email = normalizeEmail(String(body.email ?? ""));
    const password = String(body.password ?? "").trim();
    if (!email || !password) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "email and password are required");
    }
    const policy = await readAuthPolicy();
    ensureEmailValidAndAllowed(email, policy.allowedEmailSuffixes);
    if (!policy.registerEnabled) {
      throw new AppError(403, ErrorCodes.REGISTER_CLOSED, "当前站点已关闭注册");
    }

    const registered = await deps.xboard
      .register(email, password, {
        emailCode: typeof body.email_code === "string" ? body.email_code : undefined,
        inviteCode: typeof body.invite_code === "string" ? body.invite_code : undefined,
        captchaData: typeof body.captcha_data === "string" ? body.captcha_data : undefined,
        recaptchaData: typeof body.recaptcha_data === "string" ? body.recaptcha_data : undefined,
        turnstileData: typeof body.turnstile_data === "string" ? body.turnstile_data : undefined,
        hcaptchaData: typeof body.hcaptcha_data === "string" ? body.hcaptcha_data : undefined,
      })
      .catch((error): never => mapUpstreamAuthError(error));

    const [user, subscribe] = await Promise.all([
      deps.xboard.getUserInfo(registered.authData),
      deps.xboard.getSubscribe(registered.authData),
    ]);
    const issued = issueSessionTokenSet(deps, {
      xboardAuthData: registered.authData,
      xboardToken: registered.token,
      userEmail: user.email,
      userUuid: subscribe.uuid,
    });

    request.log.info({ evt: "auth_register_success", email: user.email, sid: issued.session.sid });
    return ok(reply, {
      ...tokenResponse(issued),
      profile: {
        plan_name: subscribe.plan?.name ?? null,
        expired_at: subscribe.expired_at ?? null,
      },
    });
  });

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
    request.log.info({
      evt: "bind_start",
      bind_id: rec.bindId,
      device_id: rec.deviceId,
      platform: rec.platform,
      app_version: rec.appVersion,
    });

    const approveUrl = `${config.publicBaseUrl}/api/app/v1/auth/bind/confirm?bind_id=${encodeURIComponent(rec.bindId)}`;

    return ok(reply, {
      bind_id: rec.bindId,
      bind_device_id: rec.deviceId,
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
    request.log.info({ evt: "bind_confirm_page", bind_id: bind.bindId, bind_device_id: bind.deviceId });

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

    const callbackUrl = authDeepLink(bind.bindId, exchangeToken, bind.deviceId);
    const callbackPageUrl = authCallbackPageUrl(bind.bindId, exchangeToken, bind.deviceId);
    request.log.info({ evt: "bind_confirm_success", bind_id: bind.bindId, bind_device_id: bind.deviceId, user_email: user.email });

    return ok(reply, {
      bind_id: bind.bindId,
      bind_device_id: bind.deviceId,
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
    const deviceId = String(query.device_id ?? "").trim();

    if (!bindId || !exchangeToken) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id and exchange_token are required");
    }

    const deepLink = authDeepLink(bindId, exchangeToken, deviceId || undefined);
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
    request.log.info({
      evt: "bind_exchange_attempt",
      bind_id: bindId,
      expected_device_id: bind.deviceId,
      incoming_device_id: deviceId,
    });

    const payload = verifyBindExchangeToken(exchangeToken);
    if (payload.bind_id !== bind.bindId) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "bind_id does not match exchange token");
    }
    if (payload.device_id !== bind.deviceId || bind.deviceId !== deviceId) {
      request.log.warn({
        evt: "bind_exchange_device_mismatch",
        bind_id: bindId,
        expected_device_id: bind.deviceId,
        token_device_id: payload.device_id,
        incoming_device_id: deviceId,
      });
      throw new AppError(403, ErrorCodes.FORBIDDEN, "device_id does not match bind session");
    }

    if (bind.status !== "approved" && bind.exchangeToken !== exchangeToken) {
      throw new AppError(409, ErrorCodes.BIND_NOT_APPROVED, "Bind session is not approved yet");
    }

    const issued = issueSessionTokenSet(deps, {
      xboardAuthData: payload.xboard_auth_data,
      xboardToken: payload.xboard_token,
      userEmail: payload.user_email,
      userUuid: payload.user_uuid,
    });

    deps.binds.consume(bind.bindId);
    request.log.info({ evt: "bind_exchange_success", bind_id: bind.bindId, device_id: deviceId, sid: issued.session.sid });

    return ok(reply, tokenResponse(issued));
  });
};

