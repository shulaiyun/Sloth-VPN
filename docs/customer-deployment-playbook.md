# SlothVPN 客户白牌部署完整流程

这份文档用于真实成交后的交付。客户会技术就按自助流程走，客户不会技术就收齐资料后由你方代部署。

## 1. 成交后先收资料

最低必填:

- 品牌名，例如 `阿瓜云`
- 品牌代号，例如 `agua-cloud`
- 前台/后台域名，例如 `panel.aguayun.com`
- 网关域名，例如 `gateway.aguayun.com`
- 下载域名，例如 `download.aguayun.com`
- Logo 与 App 图标原图
- 支付方式、邮件、Telegram 或工单通知配置
- 是否从旧 Xboard 迁移
- iOS 教程文案、共享账号链接、Apple 官方注册外区账号链接

旧 Xboard 迁移额外需要:

- 数据库备份
- 旧站 `.env`
- Docker Compose 文件
- 支付回调配置
- 插件和二开清单

## 2. 本地创建客户交付包

```bash
cd '/Users/shulai/iCloud云盘（归档）/Documents/New project/Sloth-VPN-release'
npm run customer:init -- --customer agua-cloud --name '阿瓜云'
```

会生成:

- `ops/white-label/customers/agua-cloud/brand.manifest.json`
- `ops/white-label/customers/agua-cloud/intake-checklist.md`
- `ops/white-label/customers/agua-cloud/delivery-report.md`
- `ops/white-label/customers/agua-cloud/handover.md`
- `ops/white-label/customers/agua-cloud/NEXT-STEPS.md`

## 3. 填写品牌清单

打开客户的 `brand.manifest.json`，至少改这些字段:

- `brand.name`: 客户品牌名
- `brand.logo_url`: 客户 Logo 地址
- `gateway.public_base_url`: 网关地址
- `gateway.xboard_base_url`: 面板 API 地址
- `gateway.xboard_web_base_url`: 面板网页地址
- `web.ios_guide_title`: iOS 教程标题
- `web.ios_shared_account_url`: 获取共享账号按钮链接
- `web.ios_apple_id_register_url`: Apple 官方注册外区账号按钮链接
- `app.scheme`: 客户 App 唤起协议
- `app.android.application_id`: Android 包名
- `app.ios.bundle_id`: iOS Bundle ID
- `app.macos.bundle_id`: macOS Bundle ID
- `app.windows.product_name`: Windows 产品名

示例:

```json
{
  "brand": {
    "code": "agua-cloud",
    "name": "阿瓜云"
  },
  "gateway": {
    "public_base_url": "https://gateway.aguayun.com",
    "xboard_base_url": "https://panel.aguayun.com",
    "xboard_web_base_url": "https://panel.aguayun.com",
    "app_deep_link_scheme": "aguacloud"
  }
}
```

## 4. 生成品牌配置工件

```bash
npm run customer:apply -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json
```

输出目录:

```text
artifacts/white-label/agua-cloud/
  brand-profile.generated.json
  gateway.env.generated
  app-build.env.generated
  xboard-settings.generated.json
  migration.meta.generated.json
```

这些文件分别用于:

- `gateway.env.generated`: 写入客户网关服务
- `xboard-settings.generated.json`: 回填面板配置
- `app-build.env.generated`: 出客户品牌安装包
- `brand-profile.generated.json`: 交付和验收留档

## 5. 客户服务器部署

客户自助部署时，在客户服务器设置环境变量:

```bash
export DEPLOY_ROOT=/root/v2board
export COMPOSE_FILE=/root/v2board/docker-compose.yaml
export SERVICE_XBOARD=xboard
export XBOARD_PUBLIC_URL=https://panel.aguayun.com
export GATEWAY_PUBLIC_URL=https://gateway.aguayun.com
```

执行:

```bash
npm run customer:deploy -- --mode migrate
```

执行内容固定为:

```text
preflight -> migrate -> verify
```

只做预检:

```bash
npm run customer:deploy -- --mode preflight-only
```

只做验收:

```bash
npm run customer:deploy -- --mode verify-only
```

## 6. 品牌安装包打包

Android 和 macOS:

```bash
npm run customer:build -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --platforms android,macos
```

Windows:

```bash
npm run customer:build -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --platforms windows
```

Windows 建议在 GitHub Actions `windows-latest` 或独立 Windows 打包机执行。

## 7. 上传下载目录

标准目录:

```text
/downloads/agua-cloud/
  android/
  macos/
  windows/
```

上传完成后生成交付报告:

```bash
npm run customer:deliver -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --download-base-url https://download.aguayun.com/downloads/agua-cloud
```

最终给客户:

- `artifacts/white-label/agua-cloud/delivery-report.md`
- `artifacts/white-label/agua-cloud/handover.md`
- 下载链接清单
- 后台登录地址
- 管理员账号交付方式

## 8. 你方代部署流程

客户不懂技术时，你只让客户提供:

- 服务器 IP、SSH 端口、root 密码或密钥
- 域名解析权限或 DNS 截图
- 品牌资料
- 旧站迁移资料

你方执行:

```bash
npm run customer:init -- --customer agua-cloud --name '阿瓜云'
npm run customer:apply -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json
npm run customer:deploy -- --mode migrate
npm run customer:build -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --platforms android,macos
npm run customer:deliver -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --download-base-url https://download.aguayun.com/downloads/agua-cloud
```

然后按 `handover.md` 陪客户验收。

## 9. 不能承诺自动化的边界

- 旧站深度二开、支付插件魔改、表结构不标准时，先人工评估。
- iOS 不默认独立上架 App Store，第一阶段默认教程引导。
- Windows 本地 Mac 不直接出包，走 Windows Runner 或打包机。
- App 图标多尺寸生成还需要单独的图标流水线。
