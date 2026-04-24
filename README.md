# 树懒VPN（SlothVPN）

面向机场主的白牌交付方案：支持新开站、Xboard 同库迁移、品牌前台/后台配置、下载中心、iOS 教程、AI 助手以及 Android/Windows/macOS 安装包交付。

[GitHub 仓库](https://github.com/shulaiyun/Sloth-VPN) | [真实线上前台](https://admin.shulaiyun.top/pricing) | [用户控制台](https://admin.shulaiyun.top/portal) | [Telegram 咨询](https://t.me/shulai2026)

## 这套系统是什么

这不是“原版 Xboard 登录页换个皮”，而是可交付给客户直接上线收款的一整套系统：

- 前台品牌站（套餐、下载、教程、支持）
- 后台运营面板（套餐、订单、优惠、教程、节点、工单）
- App 与下载中心联动
- AI 业务助手（在线+离线兜底）
- 白牌安装包分发（Android / Windows / macOS）

## 演示入口

- 本地演示目录：`showcase/`
- 本地预览命令：

```bash
npm run showcase:serve
```

- 演示页目标：首屏视觉和交互尽量贴近真实部署，不做“纯营销假页”。
- 演示页按钮：
  - `进入控制台` 会跳转真实控制台地址
  - `发送咨询` 会打开 Telegram，并复制咨询内容

## 白牌交付范围（v1）

默认模式为“一客户一实例（非多租户）”，支持两种服务方式：

- 客户自助部署：你提供文档、脚本与验收清单，客户自己落地
- 你方代部署：客户给服务器与域名，你方一步到位交付并验收

标准交付结果：

- 客户品牌名、Logo、首页标语、下载链接已替换
- iOS 教程入口包含“共享账号入口 + Apple 官方注册入口”
- 订单链路可创建/复用待支付订单并继续支付
- 新用户优惠策略与前后台展示一致

## 仓库结构

- `showcase/`：面向客户的公开演示站
- `docs/`：部署、迁移、验收文档
- `ops/white-label/`：白牌交付与客户资料模板
- `sloth-gateway/`：网关与业务 API
- `Xboard-master/`：Xboard 相关主题与后端改造
- `android/` `macos/` `windows/` `ios/`：客户端工程

## iOS 分发说明（阶段策略）

第一阶段默认不把 App Store 独立上架作为成交前置条件：

- 线上先提供 iOS 教程与账号引导
- 可选提供 TestFlight/代上架服务（按客户需求单独评估）

## 合规声明

本项目仅用于合法合规场景下的网络连接管理与技术研究。使用方需自行确保当地法律、平台政策与服务条款合规。
