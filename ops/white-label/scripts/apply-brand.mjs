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
      "  node ops/white-label/scripts/apply-brand.mjs --manifest /abs/path/brand.manifest.json [--out-dir /abs/path]",
      "",
      "Optional:",
      "  --gateway-env /abs/path/.env.brand.generated",
      "  --strict (fail when optional blocks are missing)",
    ].join("\n"),
  );
};

const parseArgs = (argv) => {
  const args = { strict: false };
  for (let i = 0; i < argv.length; i += 1) {
    const current = argv[i];
    if (current === "--manifest") args.manifest = argv[i + 1];
    if (current === "--out-dir") args.outDir = argv[i + 1];
    if (current === "--gateway-env") args.gatewayEnv = argv[i + 1];
    if (current === "--strict") args.strict = true;
    if (current === "-h" || current === "--help") args.help = true;
  }
  return args;
};

const args = parseArgs(process.argv.slice(2));
if (args.help || !args.manifest) {
  usage();
  process.exit(args.help ? 0 : 1);
}

const readJson = (filePath) => {
  const content = fs.readFileSync(filePath, "utf8");
  return JSON.parse(content);
};

const ensureDir = (dirPath) => {
  fs.mkdirSync(dirPath, { recursive: true });
};

const normalizeSlug = (value, fallback) => {
  const raw = String(value ?? "").trim().toLowerCase();
  const normalized = raw.replace(/[^a-z0-9._-]+/g, "-").replace(/^-+|-+$/g, "");
  return normalized || fallback;
};

const asString = (value, fallback = "") => {
  const text = String(value ?? "").trim();
  return text.length > 0 ? text : fallback;
};

const asNumber = (value, fallback) => {
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : fallback;
};

const asBool = (value, fallback) => {
  if (typeof value === "boolean") return value;
  if (typeof value === "number") return value !== 0;
  if (typeof value === "string") {
    const normalized = value.trim().toLowerCase();
    if (["1", "true", "yes", "on"].includes(normalized)) return true;
    if (["0", "false", "no", "off"].includes(normalized)) return false;
  }
  return fallback;
};

const envQuote = (value) => {
  const normalized = String(value ?? "")
    .replace(/\r\n/g, "\n")
    .replace(/\n/g, "\\n");
  if (/^[A-Za-z0-9_./:@,+-]*$/.test(normalized)) return normalized;
  return `"${normalized.replace(/\\/g, "\\\\").replace(/"/g, '\\"')}"`;
};

const writeEnvFile = (filePath, payload) => {
  const keys = Object.keys(payload).sort();
  const lines = keys.map((key) => `${key}=${envQuote(payload[key])}`);
  fs.writeFileSync(filePath, `${lines.join("\n")}\n`, "utf8");
};

const writeJsonFile = (filePath, payload) => {
  fs.writeFileSync(filePath, `${JSON.stringify(payload, null, 2)}\n`, "utf8");
};

const fail = (message) => {
  console.error(`Error: ${message}`);
  process.exit(1);
};

const manifestPath = path.resolve(process.cwd(), args.manifest);
if (!fs.existsSync(manifestPath)) {
  fail(`manifest not found: ${manifestPath}`);
}

const manifest = readJson(manifestPath);
const brand = manifest.brand ?? {};
const gateway = manifest.gateway ?? {};
const web = manifest.web ?? {};
const app = manifest.app ?? {};
const migration = manifest.migration ?? {};

const requiredChecks = [
  ["brand.id", brand.id],
  ["brand.code", brand.code],
  ["brand.name", brand.name],
  ["gateway.public_base_url", gateway.public_base_url],
  ["gateway.xboard_base_url", gateway.xboard_base_url],
  ["gateway.xboard_web_base_url", gateway.xboard_web_base_url],
  ["gateway.app_deep_link_scheme", gateway.app_deep_link_scheme ?? app.scheme],
  ["app.name", app.name ?? brand.name],
  ["app.scheme", app.scheme ?? gateway.app_deep_link_scheme],
];

for (const [name, value] of requiredChecks) {
  if (!asString(value).length) {
    fail(`missing required field: ${name}`);
  }
}

if (args.strict) {
  const strictChecks = [
    ["web.ios_guide_title", web.ios_guide_title],
    ["web.new_user_discount_percent", web.new_user_discount_percent],
    ["app.android.application_id", app.android?.application_id],
    ["app.ios.bundle_id", app.ios?.bundle_id],
    ["app.windows.product_name", app.windows?.product_name],
  ];
  for (const [name, value] of strictChecks) {
    if (!asString(value).length) {
      fail(`missing strict field: ${name}`);
    }
  }
}

const brandCode = normalizeSlug(brand.code, "brand");
const outDir = args.outDir
  ? path.resolve(process.cwd(), args.outDir)
  : path.join(repoRoot, "artifacts", "white-label", brandCode);
ensureDir(outDir);

const generatedAt = new Date().toISOString();
const deepLinkScheme = normalizeSlug(app.scheme ?? gateway.app_deep_link_scheme, "slothvpn");
const discountPercent = Math.max(0, Math.min(100, asNumber(web.new_user_discount_percent, 15)));
const discountDays = Math.max(1, Math.min(365, Math.round(asNumber(web.new_user_discount_days, 7))));

const brandProfile = {
  generated_at: generatedAt,
  manifest_path: manifestPath,
  brand: {
    id: asString(brand.id, brandCode),
    code: brandCode,
    name: asString(brand.name, "SlothVPN"),
    tagline: asString(brand.tagline, "安全 / 稳定 / 快速"),
    description: asString(brand.description, "面向机场主和终端用户的一体化 VPN 服务面板"),
    logo_url: asString(brand.logo_url),
    primary_color: asString(brand.primary_color, "#0F4D9B"),
    secondary_color: asString(brand.secondary_color, "#0BB8D0"),
    accent_color: asString(brand.accent_color, "#27D1B1"),
    font_family: asString(brand.font_family, "Sora, Noto Sans SC, PingFang SC, Microsoft YaHei, sans-serif"),
    deployment_mode: asString(brand.deployment_mode, "self_hosted"),
    support: {
      email: asString(brand.support?.email),
      telegram: asString(brand.support?.telegram),
    },
  },
  gateway: {
    public_base_url: asString(gateway.public_base_url),
    xboard_base_url: asString(gateway.xboard_base_url),
    xboard_web_base_url: asString(gateway.xboard_web_base_url),
    app_deep_link_scheme: deepLinkScheme,
  },
  web: {
    home_hero_title: asString(web.home_hero_title, "全系列AI可以使用✅，树赖云的初衷是帮助更多的人打开世界的大门🔑"),
    home_hero_lead: asString(web.home_hero_lead),
    ios_guide_title: asString(web.ios_guide_title, "iOS 安装教程"),
    ios_guide_url: asString(web.ios_guide_url),
    ios_shared_account_url: asString(web.ios_shared_account_url),
    ios_apple_id_register_url: asString(web.ios_apple_id_register_url),
    ios_guide_markdown: asString(web.ios_guide_markdown),
    new_user_discount_enabled: asBool(web.new_user_discount_enabled, true),
    new_user_discount_percent: discountPercent,
    new_user_discount_days: discountDays,
    new_user_discount_text: asString(web.new_user_discount_text, `新用户注册 ${discountDays} 天内自动享 ${discountPercent}% 优惠`),
  },
  app: {
    name: asString(app.name, asString(brand.name, "SlothVPN")),
    scheme: deepLinkScheme,
    android: {
      application_id: asString(app.android?.application_id),
      app_name: asString(app.android?.app_name, asString(app.name, asString(brand.name, "SlothVPN"))),
    },
    ios: {
      bundle_id: asString(app.ios?.bundle_id),
      display_name: asString(app.ios?.display_name, asString(app.name, asString(brand.name, "SlothVPN"))),
    },
    macos: {
      bundle_id: asString(app.macos?.bundle_id),
      display_name: asString(app.macos?.display_name, asString(app.name, asString(brand.name, "SlothVPN"))),
    },
    windows: {
      product_name: asString(app.windows?.product_name, asString(app.name, asString(brand.name, "SlothVPN"))),
      exe_name: asString(app.windows?.exe_name),
    },
    linux: {
      app_id: asString(app.linux?.app_id),
      package_name: asString(app.linux?.package_name),
    },
  },
  migration: {
    customer_id: asString(migration.customer_id),
    source_panel: asString(migration.source_panel, "xboard"),
    source_version: asString(migration.source_version),
    notes: asString(migration.notes),
  },
};

const gatewayEnv = {
  BRAND_MANIFEST_PATH: manifestPath,
  PUBLIC_BASE_URL: brandProfile.gateway.public_base_url,
  XBOARD_BASE_URL: brandProfile.gateway.xboard_base_url,
  XBOARD_WEB_BASE_URL: brandProfile.gateway.xboard_web_base_url,
  APP_DEEP_LINK_SCHEME: brandProfile.gateway.app_deep_link_scheme,
  BRAND_ID: brandProfile.brand.id,
  BRAND_CODE: brandProfile.brand.code,
  BRAND_NAME: brandProfile.brand.name,
  BRAND_TAGLINE: brandProfile.brand.tagline,
  BRAND_DESCRIPTION: brandProfile.brand.description,
  BRAND_LOGO_URL: brandProfile.brand.logo_url,
  BRAND_PRIMARY_COLOR: brandProfile.brand.primary_color,
  BRAND_SECONDARY_COLOR: brandProfile.brand.secondary_color,
  BRAND_ACCENT_COLOR: brandProfile.brand.accent_color,
  BRAND_FONT_FAMILY: brandProfile.brand.font_family,
  DEPLOYMENT_MODE: brandProfile.brand.deployment_mode,
  BRAND_SUPPORT_EMAIL: brandProfile.brand.support.email,
  BRAND_SUPPORT_TELEGRAM: brandProfile.brand.support.telegram,
  IOS_GUIDE_TITLE: brandProfile.web.ios_guide_title,
  IOS_GUIDE_URL: brandProfile.web.ios_guide_url,
  IOS_SHARED_ACCOUNT_URL: brandProfile.web.ios_shared_account_url,
  IOS_APPLE_ID_REGISTER_URL: brandProfile.web.ios_apple_id_register_url,
  IOS_GUIDE_MARKDOWN: brandProfile.web.ios_guide_markdown,
  NEW_USER_DISCOUNT_ENABLED: brandProfile.web.new_user_discount_enabled ? "true" : "false",
  NEW_USER_DISCOUNT_PERCENT: String(brandProfile.web.new_user_discount_percent),
  NEW_USER_DISCOUNT_WINDOW_DAYS: String(brandProfile.web.new_user_discount_days),
  NEW_USER_DISCOUNT_TEXT: brandProfile.web.new_user_discount_text,
};

const appBuildEnv = {
  APP_NAME: brandProfile.app.name,
  APP_SCHEME: brandProfile.app.scheme,
  ANDROID_APPLICATION_ID: brandProfile.app.android.application_id,
  ANDROID_APP_NAME: brandProfile.app.android.app_name,
  IOS_BUNDLE_ID: brandProfile.app.ios.bundle_id,
  IOS_DISPLAY_NAME: brandProfile.app.ios.display_name,
  MACOS_BUNDLE_ID: brandProfile.app.macos.bundle_id,
  MACOS_DISPLAY_NAME: brandProfile.app.macos.display_name,
  WINDOWS_PRODUCT_NAME: brandProfile.app.windows.product_name,
  WINDOWS_EXE_NAME: brandProfile.app.windows.exe_name,
  LINUX_APP_ID: brandProfile.app.linux.app_id,
  LINUX_PACKAGE_NAME: brandProfile.app.linux.package_name,
};

const xboardSettings = {
  app_name: brandProfile.brand.name,
  app_description: brandProfile.brand.description,
  home_hero_title: brandProfile.web.home_hero_title,
  home_hero_lead: brandProfile.web.home_hero_lead,
  ios_guide_title: brandProfile.web.ios_guide_title,
  ios_guide_url: brandProfile.web.ios_guide_url,
  ios_shared_account_url: brandProfile.web.ios_shared_account_url,
  ios_apple_id_register_url: brandProfile.web.ios_apple_id_register_url,
  ios_guide_markdown: brandProfile.web.ios_guide_markdown,
  new_user_discount_enabled: brandProfile.web.new_user_discount_enabled ? 1 : 0,
  new_user_discount_percent: brandProfile.web.new_user_discount_percent,
  new_user_discount_days: brandProfile.web.new_user_discount_days,
  new_user_discount_text: brandProfile.web.new_user_discount_text,
};

const migrationMeta = {
  generated_at: generatedAt,
  manifest_path: manifestPath,
  brand_code: brandProfile.brand.code,
  customer_id: brandProfile.migration.customer_id || null,
  source_panel: brandProfile.migration.source_panel,
  source_version: brandProfile.migration.source_version || null,
  notes: brandProfile.migration.notes || null,
  artifacts: {
    brand_profile: path.join(outDir, "brand-profile.generated.json"),
    gateway_env: path.join(outDir, "gateway.env.generated"),
    app_build_env: path.join(outDir, "app-build.env.generated"),
    xboard_settings: path.join(outDir, "xboard-settings.generated.json"),
  },
};

writeJsonFile(path.join(outDir, "brand-profile.generated.json"), brandProfile);
writeEnvFile(path.join(outDir, "gateway.env.generated"), gatewayEnv);
writeEnvFile(path.join(outDir, "app-build.env.generated"), appBuildEnv);
writeJsonFile(path.join(outDir, "xboard-settings.generated.json"), xboardSettings);
writeJsonFile(path.join(outDir, "migration.meta.generated.json"), migrationMeta);

const gatewayEnvPath = args.gatewayEnv
  ? path.resolve(process.cwd(), args.gatewayEnv)
  : path.join(repoRoot, "sloth-gateway", ".env.brand.generated");
writeEnvFile(gatewayEnvPath, gatewayEnv);

console.log("Brand manifest applied successfully.");
console.log(`Manifest: ${manifestPath}`);
console.log(`Output directory: ${outDir}`);
console.log(`Gateway env: ${gatewayEnvPath}`);
