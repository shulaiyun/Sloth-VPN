import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayRegisterPage extends HookConsumerWidget {
  const GatewayRegisterPage({super.key});

  bool _isSuffixAllowed(String email, GatewayAuthPolicy? policy) {
    if (policy == null || policy.allowedEmailSuffixes.isEmpty) return true;
    final lower = email.toLowerCase();
    return policy.allowedEmailSuffixes.any((suffix) => lower.endsWith(suffix.toLowerCase()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final theme = Theme.of(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final emailCodeController = useTextEditingController();
    final inviteCodeController = useTextEditingController();
    final isLoading = useState(false);
    final isSendingCode = useState(false);
    final policy = useState<GatewayAuthPolicy?>(null);
    final policyLoading = useState(true);

    Future<void> openCaptchaGuide(GatewayApiException error) async {
      final target = error.captchaActionUrl ?? error.captchaRegisterUrl;
      if (target == null || target.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
        return;
      }

      final openLabel = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh')
          ? "去网页完成验证"
          : "Open Web Verification";

      final action = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(g.registerTitle),
          content: Text(error.message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: Text(g.back)),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(openLabel)),
          ],
        ),
      );
      if (action != true || !context.mounted) return;

      await context.push("/gateway-account/webview", extra: <String, String>{"url": target, "title": openLabel});
    }

    Future<void> loadPolicy() async {
      policyLoading.value = true;
      try {
        policy.value = await ref.read(slothGatewayPortalControllerProvider).fetchAuthPolicy();
      } catch (_) {
        policy.value = GatewayAuthPolicy(
          allowedEmailSuffixes: const [],
          registerEnabled: true,
          emailVerifyRequired: false,
          inviteCodeRequired: false,
        );
      } finally {
        policyLoading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(loadPolicy);
      return null;
    }, const []);

    Future<void> sendVerify() async {
      final email = emailController.text.trim();
      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.enterEmailFirst)));
        return;
      }
      if (!_isSuffixAllowed(email, policy.value)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.emailSuffixRestricted)));
        return;
      }

      isSendingCode.value = true;
      try {
        await ref.read(slothGatewayPortalControllerProvider).sendEmailVerify(email);
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.verifyCodeSent)));
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        if (error.requiresCaptcha) {
          await openCaptchaGuide(error);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.sendFailed(error.message))));
        }
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.sendFailed(g.unknownError))));
      } finally {
        isSendingCode.value = false;
      }
    }

    Future<void> register() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final authPolicy = policy.value;

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.enterEmailPassword)));
        return;
      }
      if (!_isSuffixAllowed(email, authPolicy)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.emailSuffixRestricted)));
        return;
      }
      if (authPolicy != null && !authPolicy.registerEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.registerClosedHint)));
        return;
      }
      if ((authPolicy?.emailVerifyRequired ?? false) && emailCodeController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.emailCodeLabel)));
        return;
      }
      if ((authPolicy?.inviteCodeRequired ?? false) && inviteCodeController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.inviteCodeLabel)));
        return;
      }

      isLoading.value = true;
      try {
        await ref
            .read(slothGatewayPortalControllerProvider)
            .register(
              email: email,
              password: password,
              emailCode: emailCodeController.text.trim(),
              inviteCode: inviteCodeController.text.trim(),
            );
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.registerSucceeded)));
        context.go("/gateway-account");
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        if (error.requiresCaptcha) {
          await openCaptchaGuide(error);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.registerFailed(error.message))));
        }
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.registerFailed(g.unknownError))));
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.person_add_alt_1_rounded, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text(g.registerTitle),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.9),
                  theme.colorScheme.secondaryContainer.withValues(alpha: 0.72),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primary.withValues(alpha: 0.18),
                  ),
                  child: Icon(Icons.app_registration_rounded, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    g.registerSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (policyLoading.value) const LinearProgressIndicator(),
          if (policy.value != null && policy.value!.allowedEmailSuffixes.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(g.emailSuffixHint(policy.value!.allowedEmailSuffixes)),
            ),
          if (policy.value != null && !policy.value!.registerEnabled)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(g.registerClosedHint, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
          const SizedBox(height: 16),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: g.emailLabel,
              prefixIcon: const Icon(Icons.alternate_email_rounded),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: g.passwordHint,
              prefixIcon: const Icon(Icons.lock_rounded),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: emailCodeController,
            decoration: InputDecoration(
              labelText: (policy.value?.emailVerifyRequired ?? false) ? "${g.emailCodeLabel} *" : g.emailCodeLabel,
              prefixIcon: const Icon(Icons.mark_email_read_rounded),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
              onPressed: isSendingCode.value ? null : sendVerify,
              child: Text(isSendingCode.value ? g.sending : g.sendEmailCode),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: inviteCodeController,
            decoration: InputDecoration(
              labelText: (policy.value?.inviteCodeRequired ?? false) ? "${g.inviteCodeLabel} *" : g.inviteCodeLabel,
              prefixIcon: const Icon(Icons.confirmation_number_rounded),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: isLoading.value || (policy.value != null && !policy.value!.registerEnabled) ? null : register,
            icon: Icon(isLoading.value ? Icons.hourglass_top_rounded : Icons.rocket_launch_rounded),
            label: Text(isLoading.value ? g.registering : g.registerAndLogin),
          ),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: isLoading.value ? null : () => context.pop(), child: Text(g.back)),
        ],
      ),
    );
  }
}
