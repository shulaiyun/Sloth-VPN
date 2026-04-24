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

## 相比原生 XBoard 新增了什么

原生 XBoard 适合作为机场后台基础框架，但对想直接卖给用户、做品牌、做下载入口和售后闭环的机主来说，还需要补很多产品层能力。树懒云白牌版已经把这些链路整理成可交付方案：

- `SlothPro` 品牌前台：套餐价格、登录注册、下载中心、帮助教程、控制台入口集中在一个真实前台。
- 白牌配置链路：品牌名、Logo、首页标语、下载地址、iOS 教程、AI 助手文案都能按客户品牌交付。
- 下载与 iOS 教程：Windows、macOS、Android 直接下载，iOS 提供共享账号入口和 Apple 官方外区账号注册入口。
- 订单体验增强：新用户优惠展示、优惠券叠加提示、未支付订单复用和继续支付都围绕真实支付场景优化。
- AI 业务助手：用户可直接问套餐、支付、订阅导入、分流模式、iOS 下载等问题，处理不了再转工单。
- 白牌交付 SOP：支持新开站、XBoard 同库迁移、品牌安装包出包、客户服务器代部署和验收报告。

## 展示截图

GitHub Pages 展示站已经放入真实部署截图，位于 `showcase/assets/screens/`：

- `live-home-pricing.png`：真实前台套餐与新用户优惠
- `live-download.png`：客户端下载中心与 iOS 教程入口
- `live-features.png`：产品能力与服务链路页面
- `app-account-center.jpg`：移动端账户中心、同步订阅、工单和 AI 助手入口

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
