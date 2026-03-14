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
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final emailCodeController = useTextEditingController();
    final inviteCodeController = useTextEditingController();
    final isLoading = useState(false);
    final isSendingCode = useState(false);
    final policy = useState<GatewayAuthPolicy?>(null);
    final policyLoading = useState(true);

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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.sendFailed(error.message))));
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.registerFailed(error.message))));
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.registerFailed(g.unknownError))));
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(g.registerTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(g.registerSubtitle),
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
            decoration: InputDecoration(labelText: g.emailLabel, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: g.passwordHint, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: emailCodeController,
            decoration: InputDecoration(
              labelText: (policy.value?.emailVerifyRequired ?? false) ? "${g.emailCodeLabel} *" : g.emailCodeLabel,
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
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: isLoading.value || (policy.value != null && !policy.value!.registerEnabled) ? null : register,
            child: Text(isLoading.value ? g.registering : g.registerAndLogin),
          ),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: isLoading.value ? null : () => context.pop(), child: Text(g.back)),
        ],
      ),
    );
  }
}
