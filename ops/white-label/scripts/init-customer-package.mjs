#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "../../..");

const usage = () => {
  console.log(
    [
      "Usage:",
      "  node ops/white-label/scripts/init-customer-package.mjs --customer acme-airport [--name 客户品牌名]",
      "",
      "Optional:",
      "  --workspace /abs/path/to/Sloth-VPN-release",
      "  --out-dir /abs/path/to/customer-root",
      "  --force",
    ].join("\n"),
  );
};

const parseArgs = (argv) => {
  const args = { workspace: repoRoot, force: false };
  for (let index = 0; index < argv.length; index += 1) {
    const current = argv[index];
    if (current === "--customer" || current === "--code") args.customer = argv[index + 1];
    if (current === "--name") args.name = argv[index + 1];
    if (current === "--workspace") args.workspace = argv[index + 1];
    if (current === "--out-dir") args.outDir = argv[index + 1];
    if (current === "--force") args.force = true;
    if (current === "-h" || current === "--help") args.help = true;
  }
  return args;
};

const asString = (value) => String(value ?? "").trim();
const slugify = (value) =>
  asString(value)
    .toLowerCase()
    .replace(/[^a-z0-9._-]+/g, "-")
    .replace(/^-+|-+$/g, "");

const safeId = (value, fallback = "brand") => {
  const normalized = asString(value)
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "");
  return normalized.length > 0 ? normalized : fallback;
};

const toPascal = (value, fallback = "BrandVpn") => {
  const words = asString(value)
    .split(/[^A-Za-z0-9]+/)
    .map((item) => item.trim())
    .filter(Boolean);
  const joined = words.map((word) => `${word.slice(0, 1).toUpperCase()}${word.slice(1).toLowerCase()}`).join("");
  return joined.length > 0 ? joined : fallback;
};

const writeIfAllowed = (filePath, content, force) => {
  if (fs.existsSync(filePath) && !force) {
    throw new Error(`File already exists: ${filePath}. Re-run with --force to overwrite.`);
  }
  fs.writeFileSync(filePath, content, "utf8");
};

const args = parseArgs(process.argv.slice(2));
if (args.help || !args.customer) {
  usage();
  process.exit(args.help ? 0 : 1);
}

const workspace = path.resolve(process.cwd(), args.workspace);
const templatePath = path.join(workspace, "ops", "white-label", "brand.manifest.example.json");
if (!fs.existsSync(templatePath)) {
  console.error(`Template not found: ${templatePath}`);
  process.exit(1);
}

const customerCode = slugify(args.customer);
if (!customerCode) {
  console.error("Invalid --customer. Use letters, numbers, '-', '_' or '.'.");
  process.exit(1);
}

const customerName = asString(args.name) || `客户-${customerCode}`;
const customerRoot = args.outDir
  ? path.resolve(process.cwd(), args.outDir)
  : path.join(workspace, "ops", "white-label", "customers");
const customerDir = path.join(customerRoot, customerCode);

if (fs.existsSync(customerDir) && !args.force) {
  console.error(`Customer package already exists: ${customerDir}`);
  console.error("Use --force to overwrite.");
  process.exit(1);
}

fs.mkdirSync(customerDir, { recursive: true });

const template = JSON.parse(fs.readFileSync(templatePath, "utf8"));
const brandId = safeId(customerCode, "brand");
const scheme = safeId(customerCode, "sloth");
const appId = `top.example.${brandId}`;
const windowsExeStem = toPascal(customerCode, "BrandVpn");

template.brand = template.brand ?? {};
template.gateway = template.gateway ?? {};
template.web = template.web ?? {};
template.app = template.app ?? {};
template.app.android = template.app.android ?? {};
template.app.ios = template.app.ios ?? {};
template.app.macos = template.app.macos ?? {};
template.app.windows = template.app.windows ?? {};
template.app.linux = template.app.linux ?? {};
template.migration = template.migration ?? {};

template.brand.id = customerCode;
template.brand.code = customerCode;
template.brand.name = customerName;
template.brand.logo_url = `https://cdn.example.com/brands/${customerCode}/logo.png`;

template.gateway.public_base_url = `https://gateway.${customerCode}.example.com`;
template.gateway.xboard_base_url = `https://panel.${customerCode}.example.com`;
template.gateway.xboard_web_base_url = `https://panel.${customerCode}.example.com`;
template.gateway.app_deep_link_scheme = scheme;

template.app.name = customerName;
template.app.scheme = scheme;
template.app.android.application_id = appId;
template.app.android.app_name = customerName;
template.app.ios.bundle_id = appId;
template.app.ios.display_name = customerName;
template.app.macos.bundle_id = `${appId}.macos`;
template.app.macos.display_name = customerName;
template.app.windows.product_name = windowsExeStem;
template.app.windows.exe_name = `${windowsExeStem}.exe`;
template.app.linux.app_id = appId;
template.app.linux.package_name = brandId;

template.migration.customer_id = customerCode;

const manifestPath = path.join(customerDir, "brand.manifest.json");
const intakePath = path.join(customerDir, "intake-checklist.md");
const nextStepsPath = path.join(customerDir, "NEXT-STEPS.md");
const deliveryReportPath = path.join(customerDir, "delivery-report.md");
const handoverPath = path.join(customerDir, "handover.md");

writeIfAllowed(manifestPath, `${JSON.stringify(template, null, 2)}\n`, args.force);

const intakeChecklist = [
  `# ${customerName} 交付采集清单`,
  "",
  `- 客户代号: \`${customerCode}\``,
  "- 品牌名（中/英文）",
  "- 前台域名 / 后台域名 / 网关域名",
  "- Android 包名 / iOS Bundle ID / macOS Bundle ID",
  "- Windows 产品名 / EXE 名",
  "- Logo、App 图标（1024x1024 原图）",
  "- iOS 教程文案",
  "- 获取共享账号链接",
  "- Apple 官方注册外区账号链接",
  "- 支付方式与回调信息",
  "- 邮件 / Telegram / 工单通知配置",
  "- 是否从旧 Xboard 同库迁移",
  "- 如需迁移: 数据库备份、旧 .env、插件清单",
  "",
  "## 进度",
  "",
  "- [ ] 采集完成",
  "- [ ] manifest 已填写",
  "- [ ] 面板品牌配置已应用",
  "- [ ] 客户部署已验收",
  "- [ ] Android/macOS/Windows 包已产出",
  "- [ ] 下载目录已上传",
  "- [ ] 交付单已发送客户",
  "",
].join("\n");
writeIfAllowed(intakePath, intakeChecklist, args.force);

const nextSteps = [
  `# ${customerName} 下一步命令`,
  "",
  `manifest: \`${manifestPath}\``,
  "",
  "## 1) 生成面板品牌配置工件",
  "",
  "```bash",
  `cd '${workspace}'`,
  `make white-label-apply MANIFEST='${manifestPath}'`,
  "```",
  "",
  "## 2) 准备客户品牌打包配置",
  "",
  "```bash",
  `cd '${workspace}'`,
  `make white-label-prepare-build MANIFEST='${manifestPath}'`,
  "```",
  "",
  "## 3) 本地出 Android + macOS 包",
  "",
  "```bash",
  `cd '${workspace}'`,
  `make white-label-build-local MANIFEST='${manifestPath}' PLATFORMS=android,macos`,
  "```",
  "",
  "## 4) 恢复默认品牌（出包结束后）",
  "",
  "```bash",
  `cd '${workspace}'`,
  "make white-label-restore-build",
  "```",
  "",
  "## 5) 客户服务器迁移（如适用）",
  "",
  "```bash",
  `cd '${workspace}'`,
  "bash ops/white-label/scripts/preflight.sh",
  "bash ops/white-label/scripts/migrate.sh",
  "bash ops/white-label/scripts/verify.sh",
  "```",
  "",
].join("\n");
writeIfAllowed(nextStepsPath, nextSteps, args.force);

const deliveryReport = [
  `# ${customerName} 白牌交付报告`,
  "",
  `- 客户代号: \`${customerCode}\``,
  "- 状态: 待生成",
  `- 品牌清单: \`${manifestPath}\``,
  "",
  "## 交付地址",
  "",
  "- 前台/后台: 待填写",
  "- 网关: 待填写",
  "- Android 下载目录: 待生成",
  "- macOS 下载目录: 待生成",
  "- Windows 下载目录: 待生成",
  "",
  "## 强制验收项",
  "",
  "- [ ] 前台品牌名、Logo、标语、下载入口正确",
  "- [ ] 后台管理员可登录并保存配置",
  "- [ ] 注册、登录、创建订单、继续支付、支付回跳正常",
  "- [ ] iOS 教程弹窗显示说明、共享账号按钮、Apple 官方注册按钮",
  "- [ ] AI 助手在线回答、超时降级、离线兜底可区分",
  "- [ ] Android/macOS/Windows 安装包品牌正确",
  "",
  "执行 `npm run customer:deliver -- --manifest <brand.manifest.json>` 后会自动覆盖为正式交付报告。",
  "",
].join("\n");
writeIfAllowed(deliveryReportPath, deliveryReport, args.force);

const handover = [
  `# ${customerName} 客户验收说明`,
  "",
  "这份文件交付给客户看，用来逐项验收上线结果。",
  "",
  "## 验收步骤",
  "",
  "1. 打开前台，确认品牌、Logo、标语和下载中心正确。",
  "2. 注册并登录一个测试用户。",
  "3. 选择套餐创建订单，确认价格、优惠和支付入口正常。",
  "4. 未支付订单再次购买时，确认可以继续支付。",
  "5. 打开下载中心，确认 iOS 教程弹窗和两个链接按钮正常。",
  "6. 打开 AI 助手，测试套餐、支付、订阅导入、iOS 教程问题。",
  "7. 安装 Android 或桌面包，确认应用名、图标和唤起协议是客户品牌。",
  "",
  "执行 `npm run customer:deliver -- --manifest <brand.manifest.json>` 后会自动覆盖为正式客户验收说明。",
  "",
].join("\n");
writeIfAllowed(handoverPath, handover, args.force);

const summary = {
  created_at: new Date().toISOString(),
  customer_code: customerCode,
  customer_name: customerName,
  customer_dir: customerDir,
  manifest: manifestPath,
  intake_checklist: intakePath,
  next_steps: nextStepsPath,
  delivery_report: deliveryReportPath,
  handover: handoverPath,
};
const summaryPath = path.join(customerDir, "init-summary.json");
writeIfAllowed(summaryPath, `${JSON.stringify(summary, null, 2)}\n`, args.force);

console.log("Customer package initialized.");
console.log(`Customer code: ${customerCode}`);
console.log(`Customer name: ${customerName}`);
console.log(`Directory: ${customerDir}`);
console.log(`Manifest: ${manifestPath}`);
console.log(`Checklist: ${intakePath}`);
console.log(`Next steps: ${nextStepsPath}`);
