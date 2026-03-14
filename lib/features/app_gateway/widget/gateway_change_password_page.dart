import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayChangePasswordPage extends HookConsumerWidget {
  const GatewayChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final oldPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmController = useTextEditingController();
    final isSubmitting = useState(false);

    Future<void> submit() async {
      final oldPassword = oldPasswordController.text.trim();
      final newPassword = newPasswordController.text.trim();
      final confirmPassword = confirmController.text.trim();
      if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.enterEmailPassword)));
        return;
      }
      if (newPassword.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.passwordTooShort)));
        return;
      }
      if (newPassword != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.passwordNotMatch)));
        return;
      }

      isSubmitting.value = true;
      try {
        await ref.read(slothGatewayPortalControllerProvider).changePassword(
              oldPassword: oldPassword,
              newPassword: newPassword,
            );
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.changePasswordSuccess)));
        Navigator.of(context).pop();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.unknownError)));
      } finally {
        isSubmitting.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(g.changePasswordTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: oldPasswordController,
            obscureText: true,
            decoration: InputDecoration(labelText: g.oldPasswordLabel, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: InputDecoration(labelText: g.newPasswordLabel, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: confirmController,
            obscureText: true,
            decoration: InputDecoration(labelText: g.confirmPasswordLabel, border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: isSubmitting.value ? null : submit,
            child: Text(isSubmitting.value ? g.processing : g.submit),
          ),
        ],
      ),
    );
  }
}


