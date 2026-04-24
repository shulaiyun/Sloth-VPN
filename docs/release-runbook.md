# SlothVPN Release Runbook

## Current recommendation

- Fastest Android debug iteration today: local build on this Mac
- Fastest shareable release artifact today: GitHub Actions
- Reason:
  - local Android debug build has been verified successfully after environment bootstrap
  - GitHub Actions is still better for repeatable release artifacts and branch-based delivery

## Local publish workspace

- GitHub remote: `https://github.com/shulaiyun/Sloth-VPN.git`
- Prepared local publish repo:
  - `/Users/shulai/Documents/New project/Sloth-VPN-release`
- Prepared working branch:
  - `feat/sloth-white-label-panel`

## Release workflows already in repo

- Android and multi-platform build entry:
  - `.github/workflows/build.yml`
- Tag and manual release publish:
  - `.github/workflows/release.yml`

## Local Android debug build on this Mac

1. Set Java 17:
   - `export JAVA_HOME='/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home'`
   - `export PATH="$JAVA_HOME/bin:$PATH"`
2. Set Android SDK:
   - `export ANDROID_SDK_ROOT='/opt/homebrew/Caskroom/android-platform-tools/37.0.0'`
   - `export ANDROID_HOME="$ANDROID_SDK_ROOT"`
3. If licenses or NDK are missing:
   - `yes | sdkmanager --sdk_root="$ANDROID_SDK_ROOT" --licenses`
   - `sdkmanager --sdk_root="$ANDROID_SDK_ROOT" --install 'platform-tools' 'platforms;android-35' 'build-tools;35.0.0' 'ndk;28.2.13676358'`
4. Build from the release workspace:
   - `cd '/Users/shulai/Documents/New project/Sloth-VPN-release/android'`
   - `./gradlew app:assembleDebug --stacktrace`
5. Debug APK output:
   - `build_out/app/outputs/flutter-apk/app-debug.apk`
   - `build_out/app/outputs/flutter-apk/app-arm64-v8a-debug.apk`

## Recommended Android release flow

1. Sync working changes into `/Users/shulai/Documents/New project/Sloth-VPN-release`
2. Review `git status`
3. Commit to a feature branch
4. Push branch to GitHub
5. Use GitHub Actions `Release` workflow with:
   - `build_android=true`
   - other platforms optional
6. Download the APK artifact from the workflow or GitHub Release

## Decision rule

- Use local build when you are adjusting UI, login flow, invite flow, routing, or home page layout and want the fastest feedback.
- Use GitHub Actions when you need a clean artifact to hand to others, or when you want branch history tied to the build.

## Notes for production web updates

- Production portal currently runs from:
  - `https://admin.shulaiyun.top`
- Production gateway currently runs from:
  - `https://gateway.jxjvip.help`
- The current XBoard container on the server uses host overrides rather than a custom image.

## White-label deployment kit

- Brand manifest + migration scripts:
  - `ops/white-label/README.md`
  - `ops/white-label/scripts/customer.mjs`
  - `ops/white-label/scripts/apply-brand.mjs`
  - `ops/white-label/scripts/prepare-customer-build.mjs`
  - `ops/white-label/scripts/build-customer-release.sh`
  - `ops/white-label/scripts/restore-customer-build.mjs`
  - `ops/white-label/scripts/preflight.sh`
  - `ops/white-label/scripts/migrate.sh`
  - `ops/white-label/scripts/verify.sh`
  - `ops/white-label/scripts/rollback.sh`
- Full SOP:
  - `docs/white-label-deployment.md`
  - `docs/customer-delivery-sop.md`
  - `docs/customer-deployment-playbook.md`
  - `docs/ios-distribution-guide.md`
  - `docs/white-label-sales-showcase.md`

## Unified customer commands

- Create customer package:
  - `npm run customer:init -- --customer agua-cloud --name '阿瓜云'`
- Generate brand artifacts:
  - `npm run customer:apply -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json`
- Deploy or migrate:
  - `npm run customer:deploy -- --mode migrate`
- Build branded packages:
  - `npm run customer:build -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --platforms android,macos`
- Generate customer handover:
  - `npm run customer:deliver -- --manifest ops/white-label/customers/agua-cloud/brand.manifest.json --download-base-url https://download.aguayun.com/downloads/agua-cloud`

## Public showcase

- Static showcase site:
  - `showcase/index.html`
- Local preview:
  - `npm run showcase:serve`
- GitHub Pages workflow:
  - `.github/workflows/showcase-pages.yml`
