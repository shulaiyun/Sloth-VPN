# SlothVPN 白牌专属部署与迁移 SOP

本 SOP 面向“机场主专属部署”交付，不是多租户 SaaS 流程。

## 1. 交付模型

- 一客户一实例：独立域名、独立 Xboard、独立 gateway、独立 Redis。
- 同库迁移优先：先支持 Xboard 同库迁移，不承诺异构面板一键导入。
- 白牌来源统一：所有品牌信息由 `brand.manifest.json` 驱动。

## 2. 目录规范（建议）

```text
/opt/sloth-delivery/
  customers/
    <brand-code>/
      brand.manifest.json
      reports/
      artifacts/
      deploy/
        v2board/
        sloth-gateway/
```

## 3. 生成品牌工件

```bash
cd /Users/shulai/Documents/New\ project/Sloth-VPN-release
cp ops/white-label/brand.manifest.example.json /tmp/brand.manifest.json
npm run customer:apply -- --manifest /tmp/brand.manifest.json
```

输出：

- `artifacts/white-label/<brand-code>/gateway.env.generated`
- `artifacts/white-label/<brand-code>/xboard-settings.generated.json`
- `artifacts/white-label/<brand-code>/app-build.env.generated`
- `sloth-gateway/.env.brand.generated`

## 4. 客户服务器迁移流程（Xboard 同库）

在客户服务器执行（或通过你的运维流水线执行）：

```bash
export DEPLOY_ROOT=/root/v2board
export COMPOSE_FILE=/root/v2board/docker-compose.yaml
export SERVICE_XBOARD=xboard
export XBOARD_PUBLIC_URL=https://panel.example.com
export GATEWAY_PUBLIC_URL=https://gateway.example.com

npm run customer:deploy -- --mode migrate
```

## 5. 回滚流程

```bash
bash ops/white-label/scripts/rollback.sh --backup /root/v2board/reports/whitelabel/<timestamp>_database_backup.sql.gz --yes
```

## 6. 验收清单

- 管理端：
  - 可登录后台。
  - 系统配置可保存下载、iOS 教程和优惠相关配置。
- 前台：
  - 首页品牌名、标语、logo、下载入口与教程入口正确。
  - iOS 教程弹窗显示说明和按钮链接（共享账号 + Apple 官方注册）。
- App：
  - 登录、下单、继续支付、订阅导入、支付回跳链路可用。
  - deep link scheme 与白牌一致。
- 网关：
  - `GET /healthz` 正常。
  - `bootstrap` 返回 brand profile / ios guide / discount 字段。

## 7. 说明

- 该方案是“可规模化交付”的第一阶段，不是多租户数据模型。
- 若客户旧站有重度插件改造，请先做人工 preflight，确认后再迁移。
- 面向成交交付的完整教程见 `docs/customer-deployment-playbook.md`。
- 公开销售展示站见 `showcase/index.html`。
