import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayLoginPage extends HookConsumerWidget {
  const GatewayLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
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
      appBar: AppBar(title: Text(g.loginTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(g.loginSubtitle),
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
            decoration: InputDecoration(labelText: g.passwordLabel, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: isLoading.value ? null : submit,
            child: Text(isLoading.value ? g.loggingIn : g.loginButton),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: isLoading.value ? null : () => context.push("/home/gateway-register"),
            child: Text(g.createAccountButton),
          ),
        ],
      ),
    );
  }
}
