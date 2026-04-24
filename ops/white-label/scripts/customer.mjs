#!/usr/bin/env node
import { spawnSync } from "node:child_process";
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
      "  node ops/white-label/scripts/customer.mjs init --customer agua-cloud --name 阿瓜云",
      "  node ops/white-label/scripts/customer.mjs apply --manifest ops/white-label/customers/agua-cloud/brand.manifest.json",
      "  node ops/white-label/scripts/customer.mjs deploy [--mode migrate|verify-only|preflight-only]",
      "  node ops/white-label/scripts/customer.mjs build --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --platforms android,macos",
      "  node ops/white-label/scripts/customer.mjs deliver --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --download-base-url https://download.example.com/downloads/agua-cloud",
      "",
      "Environment:",
      "  MANIFEST, CUSTOMER, CUSTOMER_NAME, PLATFORMS, DOWNLOAD_BASE_URL",
      "  DEPLOY_ROOT, COMPOSE_FILE, SERVICE_XBOARD, XBOARD_PUBLIC_URL, GATEWAY_PUBLIC_URL",
    ].join("\n"),
  );
};

const commandAliases = {
  "customer:init": "init",
  "customer:apply": "apply",
  "customer:deploy": "deploy",
  "customer:build": "build",
  "customer:deliver": "deliver",
};

const parseArgs = (argv) => {
  const args = { _: [] };
  for (let index = 0; index < argv.length; index += 1) {
    const current = argv[index];
    if (!current.startsWith("--")) {
      args._.push(current);
      continue;
    }
    const key = current.slice(2);
    const next = argv[index + 1];
    if (next && !next.startsWith("--")) {
      args[key] = next;
      index += 1;
    } else {
      args[key] = true;
    }
  }
  return args;
};

const asString = (value, fallback = "") => {
  const normalized = String(value ?? "").trim();
  return normalized.length > 0 ? normalized : fallback;
};

const slugify = (value, fallback = "brand") => {
  const normalized = asString(value, fallback)
    .toLowerCase()
    .replace(/[^a-z0-9._-]+/g, "-")
    .replace(/^-+|-+$/g, "");
  return normalized || fallback;
};

const resolvePath = (value) => path.resolve(process.cwd(), value);

const fail = (message) => {
  console.error(`Error: ${message}`);
  process.exit(1);
};

const run = (cmd, args, options = {}) => {
  const result = spawnSync(cmd, args, {
    cwd: options.cwd ?? repoRoot,
    env: { ...process.env, ...(options.env ?? {}) },
    stdio: "inherit",
    shell: false,
  });
  if (result.status !== 0) {
    process.exit(result.status ?? 1);
  }
};

const readJson = (filePath) => JSON.parse(fs.readFileSync(filePath, "utf8"));

const writeJson = (filePath, payload) => {
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, `${JSON.stringify(payload, null, 2)}\n`, "utf8");
};

const writeText = (filePath, content) => {
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, content, "utf8");
};

const getManifestPath = (args, required = true) => {
  const manifest = args.manifest ?? process.env.MANIFEST;
  if (manifest) return resolvePath(manifest);

  const customer = args.customer ?? process.env.CUSTOMER;
  if (customer) {
    return path.join(repoRoot, "ops", "white-label", "customers", slugify(customer), "brand.manifest.json");
  }

  if (required) fail("missing --manifest or CUSTOMER");
  return "";
};

const loadBrandContext = (manifestPath) => {
  if (!fs.existsSync(manifestPath)) {
    fail(`manifest not found: ${manifestPath}`);
  }
  const manifest = readJson(manifestPath);
  const brandCode = slugify(manifest.brand?.code ?? manifest.brand?.id, "brand");
  const brandName = asString(manifest.brand?.name, brandCode);
  const artifactDir = path.join(repoRoot, "artifacts", "white-label", brandCode);
  return { manifest, manifestPath, brandCode, brandName, artifactDir };
};

const findLatestReleaseDir = (brandCode) => {
  const releaseRoot = path.join(repoRoot, "artifacts", "white-label", brandCode, "releases");
  if (!fs.existsSync(releaseRoot)) return "";
  const candidates = fs
    .readdirSync(releaseRoot, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => path.join(releaseRoot, entry.name))
    .sort((a, b) => b.localeCompare(a));
  return candidates[0] ?? "";
};

const customerDirForManifest = (manifestPath) => {
  const customersRoot = path.join(repoRoot, "ops", "white-label", "customers");
  const relative = path.relative(customersRoot, path.dirname(manifestPath));
  if (relative.startsWith("..") || path.isAbsolute(relative)) return "";
  return path.dirname(manifestPath);
};

const renderDownloadUrls = (brandCode, downloadBaseUrl) => {
  const base = asString(downloadBaseUrl, `/downloads/${brandCode}`).replace(/\/+$/g, "");
  return {
    generated_at: new Date().toISOString(),
    brand_code: brandCode,
    base_url: base,
    android: `${base}/android/`,
    macos: `${base}/macos/`,
    windows: `${base}/windows/`,
    ios: {
      guide: `${base}/ios/`,
      note: "iOS v1 uses tutorial + external account flow unless the customer buys a dedicated App Store/TestFlight service.",
    },
  };
};

const renderDeliveryReport = ({ brandName, brandCode, manifest, manifestPath, artifactDir, latestReleaseDir, downloadUrls }) => {
  const gateway = manifest.gateway ?? {};
  const app = manifest.app ?? {};
  return [
    `# ${brandName} 白牌交付报告`,
    "",
    `- 客户代号: \`${brandCode}\``,
    `- 生成时间: \`${new Date().toISOString()}\``,
    `- 品牌清单: \`${manifestPath}\``,
    `- 交付工件目录: \`${artifactDir}\``,
    latestReleaseDir ? `- 最新安装包目录: \`${latestReleaseDir}\`` : "- 最新安装包目录: 暂未发现，请先执行 customer:build",
    "",
    "## 访问地址",
    "",
    `- 前台/后台: ${asString(gateway.xboard_web_base_url ?? gateway.xboard_base_url, "待配置")}`,
    `- 网关: ${asString(gateway.public_base_url, "待配置")}`,
    "",
    "## 品牌安装包",
    "",
    `- Android 下载目录: ${downloadUrls.android}`,
    `- macOS 下载目录: ${downloadUrls.macos}`,
    `- Windows 下载目录: ${downloadUrls.windows}`,
    "- iOS: 通过站内教程引导外区账号下载，独立 TestFlight/App Store 上架作为增值服务。",
    "",
    "## App 标识",
    "",
    `- Deep Link Scheme: \`${asString(app.scheme ?? gateway.app_deep_link_scheme, "待配置")}\``,
    `- Android applicationId: \`${asString(app.android?.application_id, "待配置")}\``,
    `- iOS Bundle ID: \`${asString(app.ios?.bundle_id, "待配置")}\``,
    `- macOS Bundle ID: \`${asString(app.macos?.bundle_id, "待配置")}\``,
    `- Windows 产品名: \`${asString(app.windows?.product_name, "待配置")}\``,
    "",
    "## 强制验收项",
    "",
    "- [ ] 前台品牌名、Logo、标语、下载入口正确。",
    "- [ ] 后台管理员可以登录，App 设置和优惠管理可保存。",
    "- [ ] 注册、登录、套餐选择、创建订单、继续支付、支付回跳正常。",
    "- [ ] iOS 教程弹窗显示说明，并有共享账号和 Apple 官方注册外区账号两个入口。",
    "- [ ] AI 助手在线回答、超时降级、离线兜底状态可区分。",
    "- [ ] Android/macOS/Windows 包名、应用名、scheme 与品牌清单一致。",
    "",
  ].join("\n");
};

const renderHandover = ({ brandName, brandCode, manifest, downloadUrls }) => {
  const gateway = manifest.gateway ?? {};
  return [
    `# ${brandName} 客户验收说明`,
    "",
    "## 1. 登录与基础信息",
    "",
    `- 面板地址: ${asString(gateway.xboard_web_base_url ?? gateway.xboard_base_url, "请联系交付人员确认")}`,
    `- 网关健康检查: ${asString(gateway.public_base_url, "请联系交付人员确认")}/healthz`,
    `- 客户代号: \`${brandCode}\``,
    "",
    "## 2. 下载入口",
    "",
    `- Android: ${downloadUrls.android}`,
    `- macOS: ${downloadUrls.macos}`,
    `- Windows: ${downloadUrls.windows}`,
    "- iOS: 进入官网「下载中心」查看 iOS 教程，按共享账号或 Apple 官方注册外区账号流程操作。",
    "",
    "## 3. 必测流程",
    "",
    "1. 打开前台，确认品牌名、Logo、主标语正确。",
    "2. 注册一个新用户并登录。",
    "3. 选择套餐，下单并进入支付页。",
    "4. 未支付订单再次购买时，确认系统直接提示继续支付。",
    "5. 支付成功后回到站内，确认订单和订阅状态更新。",
    "6. 打开 AI 助手，分别测试套餐、支付、iOS 教程、订阅导入问题。",
    "7. 下载 Android 或桌面安装包，确认应用名和图标为客户品牌。",
    "",
  ].join("\n");
};

const generateDeliveryArtifacts = (manifestPath, downloadBaseUrl) => {
  const context = loadBrandContext(manifestPath);
  const { brandCode, brandName, manifest, artifactDir } = context;
  const latestReleaseDir = findLatestReleaseDir(brandCode);
  const downloadUrls = renderDownloadUrls(brandCode, downloadBaseUrl);
  const report = renderDeliveryReport({ ...context, latestReleaseDir, downloadUrls });
  const handover = renderHandover({ ...context, downloadUrls });

  writeJson(path.join(artifactDir, "download-urls.generated.json"), downloadUrls);
  writeText(path.join(artifactDir, "delivery-report.md"), report);
  writeText(path.join(artifactDir, "handover.md"), handover);

  const customerDir = customerDirForManifest(manifestPath);
  if (customerDir) {
    writeText(path.join(customerDir, "delivery-report.md"), report);
    writeText(path.join(customerDir, "handover.md"), handover);
  }

  console.log("Customer delivery artifacts generated.");
  console.log(`Brand: ${brandName} (${brandCode})`);
  console.log(`Delivery report: ${path.join(artifactDir, "delivery-report.md")}`);
  console.log(`Handover: ${path.join(artifactDir, "handover.md")}`);
};

const args = parseArgs(process.argv.slice(2));
const rawCommand = args._[0] ?? "";
const command = commandAliases[rawCommand] ?? rawCommand;

if (!command || args.help || args.h) {
  usage();
  process.exit(command ? 0 : 1);
}

if (command === "init") {
  const customer = args.customer ?? process.env.CUSTOMER;
  if (!customer) fail("missing --customer or CUSTOMER");
  const childArgs = ["ops/white-label/scripts/init-customer-package.mjs", "--customer", customer];
  const name = args.name ?? process.env.CUSTOMER_NAME;
  if (name) childArgs.push("--name", name);
  if (args["out-dir"]) childArgs.push("--out-dir", args["out-dir"]);
  if (args.force) childArgs.push("--force");
  run("node", childArgs);
  process.exit(0);
}

if (command === "apply") {
  const manifestPath = getManifestPath(args);
  run("node", ["ops/white-label/scripts/apply-brand.mjs", "--manifest", manifestPath]);
  process.exit(0);
}

if (command === "deploy") {
  const mode = asString(args.mode ?? process.env.CUSTOMER_DEPLOY_MODE, "migrate");
  if (mode === "preflight-only") {
    run("bash", ["ops/white-label/scripts/preflight.sh"]);
  } else if (mode === "verify-only") {
    run("bash", ["ops/white-label/scripts/verify.sh"]);
  } else if (mode === "migrate") {
    run("bash", ["ops/white-label/scripts/preflight.sh"]);
    run("bash", ["ops/white-label/scripts/migrate.sh"], { env: { RUN_PREFLIGHT: "false" } });
    run("bash", ["ops/white-label/scripts/verify.sh"]);
  } else {
    fail(`unsupported deploy mode: ${mode}`);
  }
  process.exit(0);
}

if (command === "build") {
  const manifestPath = getManifestPath(args);
  const platforms = asString(args.platforms ?? process.env.PLATFORMS, "android,macos");
  const childArgs = ["ops/white-label/scripts/build-customer-release.sh", "--manifest", manifestPath, "--platforms", platforms];
  if (args["keep-brand-state"]) childArgs.push("--keep-brand-state");
  run("bash", childArgs);
  process.exit(0);
}

if (command === "deliver") {
  const manifestPath = getManifestPath(args);
  const downloadBaseUrl = args["download-base-url"] ?? process.env.DOWNLOAD_BASE_URL;
  run("node", ["ops/white-label/scripts/apply-brand.mjs", "--manifest", manifestPath]);
  generateDeliveryArtifacts(manifestPath, downloadBaseUrl);
  process.exit(0);
}

fail(`unknown command: ${rawCommand}`);
