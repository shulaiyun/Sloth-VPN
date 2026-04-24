# iOS 分发方案说明

iOS 不像 Android 可以直接发 APK。第一阶段默认走教程方案，降低成交门槛；客户有预算和资质后，再走 TestFlight 或 App Store。

## 1. 第一阶段：教程方案

适合大多数机场主快速上线。

客户前台下载中心展示:

- iOS 安装教程
- 获取共享账号按钮
- Apple 官方注册外区账号按钮
- 下载/继续前往按钮

用户流程:

1. 打开下载中心。
2. 点击 iOS 教程。
3. 选择共享账号或自己注册外区 Apple ID。
4. 登录外区 Apple ID。
5. 在 App Store 下载指定客户端。
6. 回到站点一键导入订阅。

优点:

- 不需要客户立刻提供 Apple Developer 账号。
- 不需要等待 App Store 审核。
- 能快速成交和上线。

限制:

- App Store 内看到的 App 名可能不是客户自己的品牌。
- 客户要接受教程引导式体验。

## 2. 第二阶段：TestFlight

适合有更强品牌诉求的客户。

需要:

- Apple Developer 账号
- 客户品牌 Bundle ID
- 图标和隐私说明
- TestFlight 测试员邀请

优点:

- App 名、图标、Bundle ID 可按客户品牌设置。
- 比正式上架更快。

限制:

- TestFlight 有测试期限。
- 对普通用户仍有一定操作门槛。

## 3. 第三阶段：App Store 独立上架

适合愿意长期运营品牌的客户。

需要:

- Apple Developer 账号
- 隐私政策
- 应用截图
- 审核材料
- 合规说明
- 客户品牌 App 包

优点:

- 用户体验最好。
- 品牌感最强。

限制:

- 审核不确定。
- VPN/代理类 App 审核要求高。
- 每个客户都要单独处理证书、描述文件、合规资料。

## 4. 商业建议

默认套餐:

- 面板部署
- Android / Windows / macOS 品牌包
- iOS 教程方案

增值套餐:

- iOS TestFlight 代配置
- iOS App Store 上架辅导
- 独立 Apple Developer 账号资料准备

交付时不要承诺 App Store 必过审，只承诺按 Apple 要求协助准备和提交。
