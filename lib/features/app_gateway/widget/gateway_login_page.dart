import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayLoginPage extends HookConsumerWidget {
  const GatewayLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final theme = Theme.of(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);

    Future<void> submit() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.enterEmailPassword)));
        return;
      }
      isLoading.value = true;
      try {
        await ref.read(slothGatewayPortalControllerProvider).login(email: email, password: password);
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.loginSucceeded)));
        context.go("/gateway-account");
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.loginFailed(error.message))));
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.loginFailed(g.unknownError))));
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 20, height: 20, child: Assets.images.logo.svg()),
            const SizedBox(width: 8),
            Text(g.loginTitle),
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
                  child: Icon(Icons.login_rounded, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    g.loginSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
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
              labelText: g.passwordLabel,
              prefixIcon: const Icon(Icons.lock_rounded),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          _GatewayLoginPrimaryAction(
            onPressed: isLoading.value ? null : submit,
            icon: Icon(isLoading.value ? Icons.hourglass_top_rounded : Icons.login_rounded),
            label: isLoading.value ? g.loggingIn : g.loginButton,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: isLoading.value ? null : () => context.push("/home/gateway-forgot-password"),
            child: Text(
              Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh') ? "忘记密码" : "Forgot Password",
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: isLoading.value ? null : () => context.push("/home/gateway-register"),
            style: OutlinedButton.styleFrom(
              backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
              side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.24)),
            ),
            child: Text(g.createAccountButton),
          ),
        ],
      ),
    );
  }
}

class _GatewayLoginPrimaryAction extends StatelessWidget {
  const _GatewayLoginPrimaryAction({required this.onPressed, required this.icon, required this.label});

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: disabled
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF113D84), Color(0xFF2F72D4), Color(0xFF34BFD0)],
              ),
        color: disabled ? Theme.of(context).colorScheme.surfaceContainerHighest : null,
        boxShadow: disabled ? null : SlothShadows.card,
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
