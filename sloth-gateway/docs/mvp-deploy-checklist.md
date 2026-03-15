# SlothVPN 第一阶段 MVP 部署清单

目标链路：

`bind/start -> 网页确认绑定 -> slothvpn://auth/callback -> bind/exchange -> bootstrap -> subscription/sync -> 自动连接可用节点`

## 1. sloth-gateway 环境变量

必须配置：

1. `PORT`：网关端口，默认 `8787`
2. `HOST`：监听地址，默认 `0.0.0.0`
3. `PUBLIC_BASE_URL`：网关对外 HTTPS 地址，例如 `https://gateway.example.com`
4. `JWT_SECRET`：随机高强度密钥
5. `XBOARD_BASE_URL`：XBoard 对外地址，例如 `https://panel.example.com`

建议配置：

1. `ACCESS_TOKEN_EXPIRES`：默认 `30d`
2. `REFRESH_TOKEN_EXPIRES`：默认 `90d`
3. `PULL_TOKEN_EXPIRES`：默认 `30d`
4. `BIND_TOKEN_EXPIRES`：默认 `10m`
5. `BIND_TTL_SECONDS`：默认 `600`
6. `XBOARD_TIMEOUT_MS`：默认 `15000`
7. `DEFAULT_TELEGRAM_URL`：默认 `https://t.me/shulai2026`
8. `DEFAULT_GITHUB_URL`：默认 `https://github.com/shulaiyun/Sloth-VPN`
9. `DEBUG_BIND_CODE`：本地联调可设 `true`，生产建议 `false`

## 2. XBoard 需要新增的环境变量

新增：

1. `SLOTH_GATEWAY_PAYMENT_RETURN_URL`

示例：

```env
SLOTH_GATEWAY_PAYMENT_RETURN_URL=https://gateway.example.com/api/app/v1/payment/return
```

说明：

1. 已在 `app/Services/PaymentService.php` 接入此变量。
2. 未配置时保持原有 XBoard 返回页逻辑，不影响旧流程。

## 3. App 侧配置

当前 MVP 使用自定义 scheme 回跳（已接入）：

1. `slothvpn://auth/callback`
2. `slothvpn://payment/callback`

需要设置网关地址（编译时）：

```bash
flutter build apk --dart-define=SLOTH_GATEWAY_BASE_URL=https://gateway.example.com
```

说明：

1. 读取位置：`lib/core/model/constants.dart` 中 `gatewayBaseUrl`
2. 现有 Android / iOS / Windows 的 `slothvpn` scheme 已配置

## 4. 域名与 HTTPS 前置条件

至少准备：

1. `gateway.example.com` -> sloth-gateway
2. `panel.example.com` -> XBoard

必须 HTTPS：

1. 支付返回页和绑定页都应走 HTTPS
2. 避免浏览器拦截跳转和混合内容问题

## 5. 服务部署顺序（建议）

1. 先部署 `sloth-gateway`
2. 再配置 XBoard 的 `SLOTH_GATEWAY_PAYMENT_RETURN_URL`
3. 最后使用带 `SLOTH_GATEWAY_BASE_URL` 的 App 包测试

## 6. sloth-gateway 启动命令

```bash
npm install
npm run build
npm start
```

健康检查：

```bash
GET https://gateway.example.com/healthz
```

## 7. Nginx 反向代理示例（最简）

```nginx
server {
  listen 443 ssl http2;
  server_name gateway.example.com;

  ssl_certificate /path/fullchain.pem;
  ssl_certificate_key /path/privkey.pem;

  location / {
    proxy_pass http://127.0.0.1:8787;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```

## 8. 本地联调（mock + 真实）

### 8.1 绑定登录链路

1. App 里点 `Link Account (MVP)`（About 页）
2. App 会调用 `POST /api/app/v1/auth/bind/start` 并打开 `approve_url`
3. 网页输入 XBoard 账号密码，点“确认绑定并回到 App”
4. 页面自动跳 `slothvpn://auth/callback?...`
5. App 收到后自动调用：
   1. `POST /api/app/v1/auth/bind/exchange`
   2. `GET /api/app/v1/bootstrap`
   3. `POST /api/app/v1/subscription/sync`
   4. `GET /api/app/v1/subscription`

### 8.2 手工 API 测试（不依赖 App UI）

1. 启动绑定：

```bash
curl -X POST https://gateway.example.com/api/app/v1/auth/bind/start \
  -H "Content-Type: application/json" \
  -d '{"device_id":"test-device-001","platform":"android","app_version":"1.0.1"}'
```

2. 网页确认后取回 `exchange_token`，再 exchange：

```bash
curl -X POST https://gateway.example.com/api/app/v1/auth/bind/exchange \
  -H "Content-Type: application/json" \
  -d '{"bind_id":"<bind_id>","exchange_token":"<exchange_token>","device_id":"test-device-001"}'
```

3. 拿 `access_token` 请求：

```bash
curl https://gateway.example.com/api/app/v1/bootstrap \
  -H "Authorization: Bearer <access_token>"
```

```bash
curl -X POST https://gateway.example.com/api/app/v1/subscription/sync \
  -H "Authorization: Bearer <access_token>"
```

### 8.3 支付回跳链路

1. 在 XBoard 配置 `SLOTH_GATEWAY_PAYMENT_RETURN_URL`
2. 完成支付后先到：
   `https://gateway.example.com/api/app/v1/payment/return?order_no=...`
3. 页面自动拉起：
   `slothvpn://payment/callback?order_no=...`
4. App 收到后查单并自动刷新订阅

## 9. Deep Link / App Link 说明

当前 MVP 依赖 custom scheme（必须项）：

1. `slothvpn://...`

App Link / Universal Link（可选，后续增强）：

1. Android：`assetlinks.json`
2. iOS：`apple-app-site-association`
3. 当前阶段可先不做，不影响 MVP 跑通

## 10. 部署前必须完成的检查

1. `PUBLIC_BASE_URL` 与实际访问域名一致
2. `XBOARD_BASE_URL` 可从网关服务器访问
3. XBoard 的 `SLOTH_GATEWAY_PAYMENT_RETURN_URL` 已配置
4. App 已用 `--dart-define=SLOTH_GATEWAY_BASE_URL=...` 构建
5. 手机系统允许 `slothvpn://` scheme 回跳


