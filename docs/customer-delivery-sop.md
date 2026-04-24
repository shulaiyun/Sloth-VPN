# SlothVPN 客户交付 SOP

这份文档只回答一件事:
客户来找你买这套面板时, 你到底怎么给他开站, 怎么给他出他自己品牌的安装包。

## 1. 先向客户收什么

一个客户单子, 你至少收这几项:

- 品牌名
- 品牌英文代号
- 前台域名
- 后台域名
- 网关域名
- 安卓包名
- iOS Bundle ID
- macOS Bundle ID
- Windows 产品名
- Windows 安装包 exe 名
- Logo / 图标素材
- iOS 教程文案
- iOS 共享账号链接
- Apple 官方注册外区账号链接
- 是否要从旧 Xboard 同库迁移
- 如果迁移: 数据库备份、旧 `.env`、支付配置、邮件配置、Telegram 配置

## 2. 你本地先一键新建客户交付包

```bash
cd '/Users/shulai/Documents/New project/Sloth-VPN-release'
npm run customer:init -- --customer acme-airport --name 'Acme VPN'
```

会自动生成:

- `ops/white-label/customers/acme-airport/brand.manifest.json`
- `ops/white-label/customers/acme-airport/intake-checklist.md`
- `ops/white-label/customers/acme-airport/delivery-report.md`
- `ops/white-label/customers/acme-airport/handover.md`
- `ops/white-label/customers/acme-airport/NEXT-STEPS.md`

然后把 `brand.manifest.json` 改成客户自己的信息。

最关键的几项是:

- `brand.name`
- `brand.code`
- `gateway.public_base_url`
- `gateway.xboard_base_url`
- `app.scheme`
- `app.android.application_id`
- `app.ios.bundle_id`
- `app.macos.bundle_id`
- `app.windows.product_name`
- `app.windows.exe_name`

## 3. 如果客户要部署面板

先生成交付工件:

```bash
cd '/Users/shulai/Documents/New project/Sloth-VPN-release'
npm run customer:apply -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json
```

生成后重点看这几个文件:

- `artifacts/white-label/<brand-code>/gateway.env.generated`
- `artifacts/white-label/<brand-code>/xboard-settings.generated.json`
- `artifacts/white-label/<brand-code>/app-build.env.generated`

然后把客户服务器上的面板按这条顺序处理:

1. 备份旧库和旧 `.env`
2. 把品牌配置写进 Xboard / gateway
3. 在客户服务器执行:

```bash
npm run customer:deploy -- --mode migrate
```

如果是新开站, 就直接部署一套独立实例。
如果是旧 Xboard 迁移, 就走同库迁移。

## 4. 如果客户要品牌安装包

你先把品牌清单写进打包配置:

```bash
cd '/Users/shulai/Documents/New project/Sloth-VPN-release'
node ops/white-label/scripts/prepare-customer-build.mjs --manifest ops/white-label/customers/acme-airport/brand.manifest.json
```

这一步会把这些东西换成客户自己的:

- Android 应用名
- Android 包名
- Android deep link scheme
- iOS 显示名
- iOS Bundle ID
- iOS deep link scheme
- macOS 显示名
- macOS Bundle ID
- macOS deep link scheme
- Windows 产品名
- Windows exe 名
- Windows 安装目录名
- App 内部网关深链识别常量

## 5. 最省事的本地出包方式

### Android + macOS

如果你现在在这台 Mac 上:

```bash
cd '/Users/shulai/Documents/New project/Sloth-VPN-release'
npm run customer:build -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json --platforms android,macos
```

出包完成后, 产物会在:

- `artifacts/white-label/<brand-code>/releases/<timestamp>/android`
- `artifacts/white-label/<brand-code>/releases/<timestamp>/macos`

而且脚本默认会把你的工作区恢复回原品牌状态, 不会把仓库一直停在客户品牌上。

### Windows

Windows 不建议在这台 Mac 上硬出。

更稳的办法是:

1. 先跑 `make white-label-prepare-build`
2. 提交到客户专用 release 分支
3. 在 GitHub Actions 或 Windows 机器上跑 Windows build

如果你本身有 Windows 打包机, 就执行:

```bash
npm run customer:build -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json --platforms windows
```

## 6. 出包后怎么给客户

你一般会给客户 3 类东西:

- 面板部署结果
  - 前台域名
  - 后台域名
  - 网关域名
- 品牌安装包
  - Android APK
  - macOS DMG / PKG / ZIP
  - Windows EXE / MSIX / ZIP
- 一份交付说明
  - 后台登录地址
  - 默认管理员账号
  - 下载地址
  - iOS 教程入口
  - 支付配置说明
  - 回滚备份位置

## 7. 下载目录怎么上传

通常你会在下载服务器上给每个客户一套独立目录, 例如:

```text
/www/wwwroot/downloads/<brand-code>/
  android/
  macos/
  windows/
```

然后把 `artifacts/white-label/<brand-code>/releases/<timestamp>/` 里的文件分别传上去。

最后再把这些 URL 回填到客户站点后台的下载配置里。

生成可交付给客户的报告:

```bash
cd '/Users/shulai/Documents/New project/Sloth-VPN-release'
npm run customer:deliver -- --manifest ops/white-label/customers/acme-airport/brand.manifest.json --download-base-url https://download.example.com/downloads/acme-airport
```

会输出:

- `artifacts/white-label/<brand-code>/delivery-report.md`
- `artifacts/white-label/<brand-code>/handover.md`
- `artifacts/white-label/<brand-code>/download-urls.generated.json`

## 8. 现在这套流程已经能做什么

现在已经能稳定支持:

- 一客户一实例白牌部署
- Xboard 同库迁移 SOP
- 品牌域名 / 下载地址 / iOS 教程 / 优惠配置工件生成
- Android / iOS / macOS / Windows 的名称、标识符、scheme 级白牌准备
- 本地 Android / macOS 出包
- Windows 走单独打包机或 GitHub Actions

## 9. 现在还没完全自动化的地方

目前还没有完全自动做好的, 你要心里有数:

- 各平台图标还没有做成一键多尺寸生成
- Windows 远程自动出包还更适合走独立 runner
- App Store 独立上架仍然是单客户单证书流程
- 极重度改造过的旧 Xboard 仍要人工评估后迁移

## 10. 你接一个客户单子时最实用的固定顺序

1. 收客户品牌资料和旧站资料
2. 新建客户 manifest
3. 跑 `npm run customer:apply`
4. 跑 `npm run customer:deploy -- --mode migrate`
5. 跑 `npm run customer:build` 出 Android / macOS
6. 用 Windows 打包机或 Actions 出 Windows
7. 上传到客户下载目录
8. 跑 `npm run customer:deliver` 生成交付报告
9. 回填下载地址和 iOS 教程
10. 用客户域名完整验收一次注册、登录、下单、支付、导入订阅
