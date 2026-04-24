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
      "  node ops/white-label/scripts/prepare-customer-build.mjs --manifest /abs/path/brand.manifest.json",
      "",
      "Optional:",
      "  --workspace /abs/path/to/Sloth-VPN-release",
      "  --refresh-backup",
    ].join("\n"),
  );
};

const parseArgs = (argv) => {
  const args = { workspace: repoRoot, refreshBackup: false };
  for (let index = 0; index < argv.length; index += 1) {
    const current = argv[index];
    if (current === "--manifest") args.manifest = argv[index + 1];
    if (current === "--workspace") args.workspace = argv[index + 1];
    if (current === "--refresh-backup") args.refreshBackup = true;
    if (current === "-h" || current === "--help") args.help = true;
  }
  return args;
};

const args = parseArgs(process.argv.slice(2));
if (args.help || !args.manifest) {
  usage();
  process.exit(args.help ? 0 : 1);
}

const workspace = path.resolve(process.cwd(), args.workspace);
const manifestPath = path.resolve(process.cwd(), args.manifest);
if (!fs.existsSync(manifestPath)) {
  console.error(`Manifest not found: ${manifestPath}`);
  process.exit(1);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, "utf8"));
const brand = manifest.brand ?? {};
const app = manifest.app ?? {};
const gateway = manifest.gateway ?? {};

const asString = (value, fallback = "") => {
  const normalized = String(value ?? "").trim();
  return normalized.length > 0 ? normalized : fallback;
};

const slugify = (value, fallback = "slothvpn") => {
  const normalized = asString(value, fallback).toLowerCase().replace(/[^a-z0-9._-]+/g, "-").replace(/^-+|-+$/g, "");
  return normalized || fallback;
};

const xmlEscape = (value) =>
  String(value ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&apos;");

const readFile = (relativePath) => fs.readFileSync(path.join(workspace, relativePath), "utf8");
const writeFile = (relativePath, content) => fs.writeFileSync(path.join(workspace, relativePath), content, "utf8");

const displayName = asString(app.name, asString(brand.name, "SlothVPN"));
const brandCode = slugify(brand.code, "slothvpn");
const appScheme = slugify(app.scheme ?? gateway.app_deep_link_scheme, "slothvpn");
const androidAppId = asString(app.android?.application_id, `top.example.${brandCode}`);
const iosBundleId = asString(app.ios?.bundle_id, androidAppId);
const iosDisplayName = asString(app.ios?.display_name, displayName);
const macosBundleId = asString(app.macos?.bundle_id, `${iosBundleId}.macos`);
const macosDisplayName = asString(app.macos?.display_name, displayName);
const windowsProductName = asString(app.windows?.product_name, displayName);
const windowsExeName = asString(app.windows?.exe_name, `${windowsProductName.replace(/[^A-Za-z0-9_-]+/g, "") || "SlothVPN"}.exe`);
const windowsExeStem = windowsExeName.replace(/\.exe$/i, "") || "SlothVPN";
const windowsInternalName = slugify(windowsExeStem, "slothvpn");
const windowsIdentityName = asString(app.windows?.identity_name, androidAppId);
const windowsPublisherName = asString(app.windows?.publisher_name, asString(brand.name, "Shulaiyun"));
const windowsPublisherUrl = asString(app.windows?.publisher_url, gateway.xboard_web_base_url || gateway.public_base_url || "https://example.com");

const filesToPatch = [
  "android/app/build.gradle",
  "android/app/src/main/AndroidManifest.xml",
  "android/app/src/main/res/values/strings.xml",
  "android/app/src/main/res/xml/shortcuts.xml",
  "ios/Base.xcconfig",
  "ios/Runner/Info.plist",
  "macos/Runner/Configs/AppInfo.xcconfig",
  "macos/Runner/Info.plist",
  "windows/CMakeLists.txt",
  "windows/runner/Runner.rc",
  "windows/packaging/msix/make_config.yaml",
  "windows/packaging/exe/make_config.yaml",
  "windows/packaging/exe/inno_setup.sas",
  "scripts/android_run_debug.sh",
  "lib/core/branding/build_branding.g.dart",
];

const backupDir = path.join(workspace, "artifacts", "white-label", "_workspace-backup");
const backupStatePath = path.join(backupDir, "files.json");
fs.mkdirSync(backupDir, { recursive: true });

if (args.refreshBackup || !fs.existsSync(backupStatePath)) {
  const snapshot = {
    generated_at: new Date().toISOString(),
    workspace,
    files: Object.fromEntries(filesToPatch.map((relativePath) => [relativePath, readFile(relativePath)])),
  };
  fs.writeFileSync(backupStatePath, `${JSON.stringify(snapshot, null, 2)}\n`, "utf8");
}

const replaceRequired = (content, pattern, replacement, label, relativePath) => {
  const next = content.replace(pattern, replacement);
  if (next === content) {
    throw new Error(`Failed to update ${label} in ${relativePath}`);
  }
  return next;
};

const replaceFirstSchemeArray = (content, newScheme, relativePath) =>
  replaceRequired(
    content,
    /(<key>CFBundleURLSchemes<\/key>\s*<array>\s*<string>)([^<]*)(<\/string>)/,
    `$1${xmlEscape(newScheme)}$3`,
    "CFBundleURLSchemes",
    relativePath,
  );

let androidBuildGradle = readFile("android/app/build.gradle");
androidBuildGradle = replaceRequired(
  androidBuildGradle,
  /applicationId\s+"[^"]+"/,
  `applicationId "${androidAppId}"`,
  "applicationId",
  "android/app/build.gradle",
);
writeFile("android/app/build.gradle", androidBuildGradle);

let androidManifest = readFile("android/app/src/main/AndroidManifest.xml");
androidManifest = replaceRequired(
  androidManifest,
  /<data android:scheme="[^"]+"\s*\/>/,
  `<data android:scheme="${appScheme}" />`,
  "android deeplink scheme",
  "android/app/src/main/AndroidManifest.xml",
);
writeFile("android/app/src/main/AndroidManifest.xml", androidManifest);

let androidStrings = readFile("android/app/src/main/res/values/strings.xml");
androidStrings = replaceRequired(
  androidStrings,
  /<string name="app_name">[^<]*<\/string>/,
  `<string name="app_name">${xmlEscape(displayName)}</string>`,
  "android app_name",
  "android/app/src/main/res/values/strings.xml",
);
writeFile("android/app/src/main/res/values/strings.xml", androidStrings);

let androidShortcuts = readFile("android/app/src/main/res/xml/shortcuts.xml");
androidShortcuts = replaceRequired(
  androidShortcuts,
  /android:targetPackage="[^"]+"/,
  `android:targetPackage="${androidAppId}"`,
  "android shortcut targetPackage",
  "android/app/src/main/res/xml/shortcuts.xml",
);
writeFile("android/app/src/main/res/xml/shortcuts.xml", androidShortcuts);

let iosBase = readFile("ios/Base.xcconfig");
iosBase = replaceRequired(iosBase, /BASE_BUNDLE_IDENTIFIER=.*/, `BASE_BUNDLE_IDENTIFIER=${iosBundleId}`, "BASE_BUNDLE_IDENTIFIER", "ios/Base.xcconfig");
iosBase = replaceRequired(iosBase, /SERVICE_IDENTIFIER=.*/, `SERVICE_IDENTIFIER=${iosBundleId}`, "SERVICE_IDENTIFIER", "ios/Base.xcconfig");
writeFile("ios/Base.xcconfig", iosBase);

let iosInfo = readFile("ios/Runner/Info.plist");
iosInfo = replaceRequired(
  iosInfo,
  /(<key>CFBundleDisplayName<\/key>\s*<string>)([^<]*)(<\/string>)/,
  `$1${xmlEscape(iosDisplayName)}$3`,
  "CFBundleDisplayName",
  "ios/Runner/Info.plist",
);
iosInfo = replaceFirstSchemeArray(iosInfo, appScheme, "ios/Runner/Info.plist");
iosInfo = replaceRequired(
  iosInfo,
  /(<key>CFBundleURLName<\/key>\s*<string>)([^<]*)(<\/string>)/,
  `$1${xmlEscape(`${iosBundleId}.ios`)}$3`,
  "CFBundleURLName",
  "ios/Runner/Info.plist",
);
writeFile("ios/Runner/Info.plist", iosInfo);

let macosAppInfo = readFile("macos/Runner/Configs/AppInfo.xcconfig");
macosAppInfo = replaceRequired(
  macosAppInfo,
  /PRODUCT_NAME = .*/,
  `PRODUCT_NAME = ${macosDisplayName}`,
  "PRODUCT_NAME",
  "macos/Runner/Configs/AppInfo.xcconfig",
);
macosAppInfo = replaceRequired(
  macosAppInfo,
  /PRODUCT_BUNDLE_IDENTIFIER = .*/,
  `PRODUCT_BUNDLE_IDENTIFIER = ${macosBundleId}`,
  "PRODUCT_BUNDLE_IDENTIFIER",
  "macos/Runner/Configs/AppInfo.xcconfig",
);
writeFile("macos/Runner/Configs/AppInfo.xcconfig", macosAppInfo);

let macosInfo = readFile("macos/Runner/Info.plist");
macosInfo = replaceFirstSchemeArray(macosInfo, appScheme, "macos/Runner/Info.plist");
macosInfo = replaceRequired(
  macosInfo,
  /(<key>CFBundleURLName<\/key>\s*<string>)([^<]*)(<\/string>)/,
  `$1${xmlEscape(`${macosBundleId}.macos`)}$3`,
  "CFBundleURLName",
  "macos/Runner/Info.plist",
);
writeFile("macos/Runner/Info.plist", macosInfo);

let windowsCmake = readFile("windows/CMakeLists.txt");
windowsCmake = replaceRequired(
  windowsCmake,
  /set\(BINARY_NAME "[^"]+"\)/,
  `set(BINARY_NAME "${windowsExeStem}")`,
  "windows binary name",
  "windows/CMakeLists.txt",
);
windowsCmake = replaceRequired(
  windowsCmake,
  /RENAME [A-Za-z0-9._-]+Cli\.exe\)/,
  `RENAME ${windowsExeStem}Cli.exe)`,
  "windows CLI rename",
  "windows/CMakeLists.txt",
);
writeFile("windows/CMakeLists.txt", windowsCmake);

let runnerRc = readFile("windows/runner/Runner.rc");
runnerRc = replaceRequired(runnerRc, /VALUE "CompanyName", "[^"]*"/, `VALUE "CompanyName", "${windowsPublisherName}"`, "CompanyName", "windows/runner/Runner.rc");
runnerRc = replaceRequired(runnerRc, /VALUE "FileDescription", "[^"]*"/, `VALUE "FileDescription", "${windowsProductName}"`, "FileDescription", "windows/runner/Runner.rc");
runnerRc = replaceRequired(runnerRc, /VALUE "InternalName", "[^"]*"/, `VALUE "InternalName", "${windowsInternalName}"`, "InternalName", "windows/runner/Runner.rc");
runnerRc = replaceRequired(runnerRc, /VALUE "OriginalFilename", "[^"]*"/, `VALUE "OriginalFilename", "${windowsExeName}"`, "OriginalFilename", "windows/runner/Runner.rc");
runnerRc = replaceRequired(runnerRc, /VALUE "ProductName", "[^"]*"/, `VALUE "ProductName", "${windowsProductName}"`, "ProductName", "windows/runner/Runner.rc");
writeFile("windows/runner/Runner.rc", runnerRc);

let msixConfig = readFile("windows/packaging/msix/make_config.yaml");
msixConfig = replaceRequired(
  msixConfig,
  /^\uFEFF?display_name:.*$/m,
  `display_name: ${JSON.stringify(windowsProductName)}`,
  "display_name",
  "windows/packaging/msix/make_config.yaml",
);
msixConfig = replaceRequired(msixConfig, /^publisher_display_name:.*$/m, `publisher_display_name: ${JSON.stringify(windowsPublisherName)}`, "publisher_display_name", "windows/packaging/msix/make_config.yaml");
msixConfig = replaceRequired(msixConfig, /^identity_name:.*$/m, `identity_name: ${windowsIdentityName}`, "identity_name", "windows/packaging/msix/make_config.yaml");
msixConfig = replaceRequired(msixConfig, /^protocol_activation:.*$/m, `protocol_activation: ${appScheme}, v2ray, v2rayn, v2rayng, clash, clashmeta, sing-box`, "protocol_activation", "windows/packaging/msix/make_config.yaml");
msixConfig = replaceRequired(msixConfig, /^execution_alias:.*$/m, `execution_alias: ${windowsInternalName}`, "execution_alias", "windows/packaging/msix/make_config.yaml");
writeFile("windows/packaging/msix/make_config.yaml", msixConfig);

let exeConfig = readFile("windows/packaging/exe/make_config.yaml");
exeConfig = replaceRequired(exeConfig, /^publisher:.*$/m, `publisher: ${windowsPublisherName}`, "publisher", "windows/packaging/exe/make_config.yaml");
exeConfig = replaceRequired(exeConfig, /^publisher_url:.*$/m, `publisher_url: ${windowsPublisherUrl}`, "publisher_url", "windows/packaging/exe/make_config.yaml");
exeConfig = replaceRequired(exeConfig, /^display_name:.*$/m, `display_name: ${JSON.stringify(windowsProductName)}`, "display_name", "windows/packaging/exe/make_config.yaml");
exeConfig = replaceRequired(
  exeConfig,
  /^install_dir_name:.*$/m,
  `install_dir_name: "{autopf64}\\\\${windowsProductName}"`,
  "install_dir_name",
  "windows/packaging/exe/make_config.yaml",
);
writeFile("windows/packaging/exe/make_config.yaml", exeConfig);

let innoSetup = readFile("windows/packaging/exe/inno_setup.sas");
innoSetup = replaceRequired(
  innoSetup,
  /^OutputBaseFilename=.*$/m,
  `OutputBaseFilename=${brandCode}-{{APP_VERSION}}-windows-setup`,
  "OutputBaseFilename",
  "windows/packaging/exe/inno_setup.sas",
);
innoSetup = replaceRequired(
  innoSetup,
  /Type: filesandordirs; Name: "\{userappdata\}\\[^"]+"/,
  `Type: filesandordirs; Name: "{userappdata}\\${windowsExeStem}"`,
  "user appdata cleanup path",
  "windows/packaging/exe/inno_setup.sas",
);
innoSetup = replaceRequired(
  innoSetup,
  /Exec\('taskkill', '\/F \/IM [^']+'/,
  `Exec('taskkill', '/F /IM ${windowsExeName}'`,
  "taskkill executable",
  "windows/packaging/exe/inno_setup.sas",
);
innoSetup = replaceRequired(
  innoSetup,
  /Exec\('net', 'stop "[^"]+"/,
  `Exec('net', 'stop "${windowsExeStem}TunnelService"`,
  "stop service name",
  "windows/packaging/exe/inno_setup.sas",
);
innoSetup = replaceRequired(
  innoSetup,
  /Exec\('sc\.exe', 'delete "[^"]+"/,
  `Exec('sc.exe', 'delete "${windowsExeStem}TunnelService"`,
  "delete service name",
  "windows/packaging/exe/inno_setup.sas",
);
writeFile("windows/packaging/exe/inno_setup.sas", innoSetup);

let androidDebugScript = readFile("scripts/android_run_debug.sh");
androidDebugScript = replaceRequired(
  androidDebugScript,
  /PACKAGE_NAME="[^"]+"/,
  `PACKAGE_NAME="${androidAppId}"`,
  "debug package name",
  "scripts/android_run_debug.sh",
);
writeFile("scripts/android_run_debug.sh", androidDebugScript);

const brandingGenerated = [
  `const kBuildBrandingName = ${JSON.stringify(displayName)};`,
  `const kBuildBrandingCode = ${JSON.stringify(brandCode)};`,
  `const kBuildBrandingScheme = ${JSON.stringify(appScheme)};`,
  "",
].join("\n");
writeFile("lib/core/branding/build_branding.g.dart", brandingGenerated);

const state = {
  prepared_at: new Date().toISOString(),
  manifest_path: manifestPath,
  workspace,
  brand: {
    code: brandCode,
    display_name: displayName,
    app_scheme: appScheme,
    android_application_id: androidAppId,
    ios_bundle_id: iosBundleId,
    macos_bundle_id: macosBundleId,
    windows_product_name: windowsProductName,
    windows_exe_name: windowsExeName,
  },
};
fs.writeFileSync(path.join(backupDir, "last-prepared.json"), `${JSON.stringify(state, null, 2)}\n`, "utf8");

console.log("Customer build branding applied successfully.");
console.log(`Workspace: ${workspace}`);
console.log(`Manifest: ${manifestPath}`);
console.log(`Brand: ${displayName} (${brandCode})`);
