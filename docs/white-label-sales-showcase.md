# SlothVPN 公开演示与销售展示说明

公开展示优先模拟真实部署后的 SlothPro 前台，让客户第一眼看到套餐、下载中心、控制台入口和 AI 助手；销售说明只作为辅助内容出现。公开仓不放核心源码、不放真实密钥、不放客户数据。

## 1. 公开仓建议内容

```text
slothvpn-showcase/
  README.md
  showcase/
    index.html
    assets/
      screens/
        frontend.png
        admin.png
        payment.png
        assistant.png
        download.png
  docs/
    customer-deployment-playbook.md
    ios-distribution-guide.md
```

公开仓只用于获客:

- 模拟真实前台效果
- 展示白牌能力
- 展示迁移流程
- 展示 App 打包能力
- 展示验收截图
- 收集客户咨询

核心私有仓保留:

- 真实代码
- 打包脚本
- 迁移脚本
- 客户 manifest
- 客户服务器资料

## 2. GitHub Pages 发布方式

当前仓库提供 `showcase/` 静态站和 `.github/workflows/showcase-pages.yml`。

如果这是公开演示仓，推送后在 GitHub 仓库设置里开启 Pages:

- Source: `GitHub Actions`
- Workflow: `Showcase Pages`

本地预览:

```bash
npm run showcase:serve
```

打开:

```text
http://127.0.0.1:4173
```

## 3. 截图要求

截图必须脱敏后再放公开仓:

- 不显示管理员真实 token
- 不显示服务器 root 密码
- 不显示客户邮箱、订单号、支付密钥
- 不显示真实用户列表
- 域名可展示公开前台域名，后台域名建议用演示域名

推荐截图:

- 官网首页品牌效果
- 套餐价格页
- 下载中心 iOS 教程弹窗
- 后台 App 设置
- 优惠管理
- 支付继续订单
- AI 助手在线/离线状态
- Android App 首页

## 4. 演示站话术重点

面向机场主时，重点讲这四件事:

- 你不是让客户自己搭原版 Xboard，而是交付一套可售卖、可品牌化、有 App、有支付、有 AI 助手的业务面板。
- 从旧 Xboard 迁移的客户，可以走同库迁移，降低切换成本。
- 每个客户独立实例，互不影响，便于后续托管和售后。
- App 包可以按客户品牌生成，iOS 第一阶段用教程方案，后续可付费做 TestFlight 或 App Store 上架。

## 5. 演示站展示原则

- 首屏必须像真实部署前台，不要用另一套视觉做销售页。
- 品牌建议用虚拟客户名，例如“阿瓜云”，让客户马上理解可以换成自己的品牌。
- 白牌说明可以放在顶部提示条、套餐侧边说明或页面底部咨询区，不能抢走产品本身。
- 所有联系方式、截图和域名都要脱敏后再公开。
