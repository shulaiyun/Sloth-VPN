import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_state_bus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class GatewayPlansPage extends HookConsumerWidget {
  const GatewayPlansPage({super.key});

  String _presentPrice(int cents) => 'CNY ${(cents / 100).toStringAsFixed(2)}';

  String _presentTraffic(int transferEnable) {
    final gb = transferEnable / (1024 * 1024 * 1024);
    if (gb >= 1) return '${gb.toStringAsFixed(0)} GB';
    final mb = transferEnable / (1024 * 1024);
    return '${mb.toStringAsFixed(0)} MB';
  }

  String _presentDateTime(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '--';
    final dt = DateTime.tryParse(raw.trim());
    if (dt == null) return raw;
    final local = dt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)} ${two(local.hour)}:${two(local.minute)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final refreshTick = ref.watch(slothGatewayUiRefreshTickProvider);
    final theme = Theme.of(context);

    final loading = useState(true);
    final plans = useState<List<GatewayPlan>>([]);
    final methods = useState<List<GatewayPaymentMethod>>([]);
    final orders = useState<List<GatewayOrderItem>>([]);
    final summary = useState<GatewayAccountSummary?>(null);
    final loggedIn = useState(false);
    final selectedMethodId = useState<int?>(null);
    final selectedPeriods = useState<Map<int, String>>({});
    final runningPlanId = useState<int?>(null);
    final runningOrderNo = useState<String?>(null);
    final watchingOrderNos = useState<Set<String>>(<String>{});
    final orderStatusFilter = useState<String>('all');
    final tabIndex = useState<int>(0);
    final errorText = useState<String?>(null);
    final couponTextController = useTextEditingController();
    final giftCardTextController = useTextEditingController();
    final promoBusy = useState(false);
    final giftHistoryLoading = useState(false);
    final couponPreviewText = useState<String?>(null);
    final giftCardPreviewText = useState<String?>(null);
    final giftCardHistory = useState<List<GatewayGiftCardHistoryItem>>([]);

    void showTip(String message, {Duration duration = const Duration(seconds: 6)}) {
      final messenger = ScaffoldMessenger.of(context);
      final bgColor = theme.brightness == Brightness.dark ? const Color(0xFF133564) : const Color(0xFF1C4DA1);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          backgroundColor: bgColor,
          content: Row(
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          duration: duration,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }

    void showOrderConflictWithAction(String message) {
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          backgroundColor: theme.brightness == Brightness.dark ? const Color(0xFF4A2B25) : const Color(0xFF7A311F),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 9),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          action: SnackBarAction(
            textColor: const Color(0xFF99E0FF),
            label: isZh ? '查看订单' : 'View Orders',
            onPressed: () {
              tabIndex.value = 1;
              orderStatusFilter.value = 'pending';
            },
          ),
        ),
      );
    }

    String? existingOrderNoFromError(GatewayApiException error) {
      final value = error.details?['existing_order_no']?.toString().trim() ?? '';
      return value.isEmpty ? null : value;
    }

    Future<void> loadGiftCardHistory() async {
      if (!loggedIn.value) {
        giftCardHistory.value = const [];
        return;
      }
      giftHistoryLoading.value = true;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final history = await portal.fetchGiftCardHistory();
        giftCardHistory.value = history.take(6).toList();
      } on GatewayApiException {
        giftCardHistory.value = const [];
      } finally {
        giftHistoryLoading.value = false;
      }
    }

    Future<void> load() async {
      loading.value = true;
      errorText.value = null;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        loggedIn.value = await portal.isLoggedIn();
        if (!loggedIn.value) {
          plans.value = const [];
          methods.value = const [];
          orders.value = const [];
          summary.value = null;
          giftCardHistory.value = const [];
          return;
        }

        final loadedSummary = await portal.fetchAccountSummary();
        final loadedPlans = await portal.fetchPlans();
        final loadedMethods = await portal.fetchPaymentMethods();
        final loadedOrders = await portal.fetchOrders(status: orderStatusFilter.value);

        summary.value = loadedSummary;
        plans.value = loadedPlans;
        methods.value = loadedMethods;
        orders.value = loadedOrders;

        if (selectedMethodId.value == null && loadedMethods.isNotEmpty) {
          selectedMethodId.value = loadedMethods.first.id;
        }

        final defaults = <int, String>{};
        for (final plan in loadedPlans) {
          if (plan.periods.isNotEmpty) {
            defaults[plan.id] = selectedPeriods.value[plan.id] ?? plan.periods.first.code;
          }
        }
        selectedPeriods.value = defaults;
        await loadGiftCardHistory();
      } on GatewayApiException catch (error) {
        errorText.value = error.message;
      } catch (_) {
        errorText.value = g.unknownError;
      } finally {
        loading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, [refreshTick, orderStatusFilter.value]);

    Future<void> syncAfterSuccess() async {
      await ref.read(slothGatewayPortalControllerProvider).syncNow();
      await load();
    }

    Future<void> watchOrderSettlement(String orderNo) async {
      if (watchingOrderNos.value.contains(orderNo)) return;
      watchingOrderNos.value = {...watchingOrderNos.value, orderNo};
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        for (final delay in const [
          Duration(seconds: 3),
          Duration(seconds: 5),
          Duration(seconds: 8),
          Duration(seconds: 12),
          Duration(seconds: 18),
          Duration(seconds: 25),
        ]) {
          await Future.delayed(delay);
          if (!context.mounted) return;
          try {
            final status = await portal.orderStatus(orderNo);
            if (status.isCompleted) {
              await syncAfterSuccess();
              if (!context.mounted) return;
              showTip(g.orderCompletedAndSynced, duration: const Duration(seconds: 8));
              return;
            }
          } on GatewayApiException {
            // keep waiting
          }
        }
      } finally {
        watchingOrderNos.value = {...watchingOrderNos.value}..remove(orderNo);
      }
    }

    Future<void> openPaymentTarget(String target, String orderNo) async {
      if (target.isEmpty) {
        if (!context.mounted) return;
        showTip(g.noPaymentUrl);
        return;
      }

      final uri = Uri.tryParse(target);
      if (uri == null || !uri.hasScheme) {
        if (!context.mounted) return;
        showTip(g.paymentPayload(target));
        return;
      }

      try {
        final openedInAppBrowser = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
        if (openedInAppBrowser) {
          if (!context.mounted) return;
          showTip(
            isZh ? '已在应用内支付页打开，返回后会自动刷新订单状态' : 'Payment opened in app browser, return and order will auto refresh',
            duration: const Duration(seconds: 8),
          );
          unawaited(watchOrderSettlement(orderNo));
          return;
        }
      } catch (_) {
        // fallback below
      }

      try {
        final openedExternal = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (openedExternal) {
          if (!context.mounted) return;
          showTip(
            isZh
                ? '已在系统浏览器打开支付页，返回应用后会自动刷新订单状态'
                : 'Payment opened in system browser, return and order will auto refresh',
            duration: const Duration(seconds: 8),
          );
          unawaited(watchOrderSettlement(orderNo));
          return;
        }
      } catch (_) {
        // Fall back to embedded webview route below.
      }

      if (!context.mounted) return;
      await context.push(
        '/gateway-account/webview',
        extra: <String, String>{'url': target, 'title': isZh ? '支付订单 $orderNo' : 'Pay Order $orderNo'},
      );

      if (!context.mounted) return;
      showTip(g.paymentPageOpened(orderNo), duration: const Duration(seconds: 8));
      unawaited(watchOrderSettlement(orderNo));
    }

    Future<bool> verifyCompletedAndSync(String orderNo) async {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      for (final delay in const [Duration(milliseconds: 400), Duration(milliseconds: 1200)]) {
        await Future.delayed(delay);
        final status = await portal.orderStatus(orderNo);
        if (status.isCompleted) {
          await syncAfterSuccess();
          return true;
        }
      }
      return false;
    }

    Future<void> showOrderDetail(GatewayOrderItem baseOrder) async {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      GatewayOrderItem order = baseOrder;
      try {
        final detail = await portal.orderDetail(baseOrder.orderNo);
        if (detail != null) order = detail;
      } catch (_) {
        // keep base order
      }
      if (!context.mounted) return;

      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          final textTheme = Theme.of(context).textTheme;
          Widget kv(String key, String value) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 120, child: Text(key, style: textTheme.bodyMedium)),
                Expanded(
                  child: Text(value, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          );

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(g.orderDetail, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                kv(isZh ? '订单号' : 'Order No', order.orderNo),
                kv(g.orderType, order.typeLabel.isEmpty ? order.type : order.typeLabel),
                kv(isZh ? '状态' : 'Status', g.orderStatusLabel(order.status)),
                kv(isZh ? '周期' : 'Period', g.periodLabel(order.period ?? '', order.period ?? '-')),
                if (order.planTransferEnable != null && (order.planTransferEnable ?? 0) > 0)
                  kv(g.planTraffic, _presentTraffic(order.planTransferEnable!)),
                kv(g.orderAmount, _presentPrice(order.totalAmount)),
                kv(g.orderBalanceAmount, _presentPrice(order.balanceAmount)),
                kv(g.orderDiscountAmount, _presentPrice(order.discountAmount)),
                kv(g.orderSurplusAmount, _presentPrice(order.surplusAmount)),
                kv(g.orderRefundAmount, _presentPrice(order.refundAmount)),
                if (order.createdAt != null) kv(g.orderCreatedAt, _presentDateTime(order.createdAt)),
                if (order.paidAt != null) kv(g.orderPaidAt, _presentDateTime(order.paidAt)),
              ],
            ),
          );
        },
      );
    }

    Future<void> continuePay(GatewayOrderItem order) async {
      if (selectedMethodId.value == null) {
        showTip(g.selectPeriodAndPayment);
        return;
      }
      runningOrderNo.value = order.orderNo;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final payment = await portal.payOrder(orderNo: order.orderNo, paymentMethodId: selectedMethodId.value!);
        if (payment.completed) {
          final confirmed = await verifyCompletedAndSync(order.orderNo);
          if (!context.mounted) return;
          if (confirmed) {
            showTip(g.orderCompletedAndSynced);
            return;
          }
          showTip(
            isZh
                ? 'Payment is being confirmed and will auto refresh'
                : 'Payment is being confirmed and will auto refresh',
            duration: const Duration(seconds: 8),
          );
        }
        final paymentTarget = (payment.paymentUrl ?? payment.paymentData).trim();
        if (paymentTarget.isNotEmpty) {
          await openPaymentTarget(paymentTarget, order.orderNo);
        } else if (!payment.completed) {
          if (!context.mounted) return;
          showTip(g.noPaymentUrl);
        }
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        if (error.code == 'ORDER_ALREADY_PAID') {
          final portal = ref.read(slothGatewayPortalControllerProvider);
          final status = await portal.orderStatus(order.orderNo);
          if (status.isCompleted) {
            await syncAfterSuccess();
          } else {
            await load();
          }
          if (!context.mounted) return;
          showTip(error.message, duration: const Duration(seconds: 8));
          return;
        }
        if (error.code == 'ORDER_PAYMENT_CHANNEL_EXPIRED') {
          showTip(
            isZh ? '支付通道失效，请先重建订单' : 'Payment channel expired, recreate order first',
            duration: const Duration(seconds: 8),
          );
          return;
        }
        showTip(g.orderFailed(error.message));
      } finally {
        runningOrderNo.value = null;
      }
    }

    Future<void> refreshOrderStatus(GatewayOrderItem order) async {
      runningOrderNo.value = order.orderNo;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final status = await portal.orderStatus(order.orderNo);
        if (status.isCompleted) {
          await syncAfterSuccess();
        } else {
          await load();
        }
        if (!context.mounted) return;
        showTip(g.orderStatusUpdated(order.orderNo, status.status));
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        showTip(g.orderFailed(error.message));
      } finally {
        runningOrderNo.value = null;
      }
    }

    Future<void> cancelOrder(GatewayOrderItem order) async {
      runningOrderNo.value = order.orderNo;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final ok = await portal.cancelOrder(order.orderNo);
        if (!context.mounted) return;
        showTip(ok ? g.orderCancelled : g.cancelOrderFailed(g.unknownError));
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        final code = error.code ?? '';
        if (code == 'ORDER_NOT_CANCELLABLE' || code == 'ORDER_ALREADY_PAID') {
          await load();
          if (!context.mounted) return;
          showTip(error.message);
        } else {
          showTip(g.cancelOrderFailed(error.message));
        }
      } finally {
        runningOrderNo.value = null;
      }
    }

    Future<void> closeAndRecreateOrder(GatewayOrderItem order) async {
      if (selectedMethodId.value == null) {
        showTip(g.selectPeriodAndPayment);
        return;
      }
      final period = order.period?.trim() ?? '';
      final planId = order.planId;
      if (planId == null || planId <= 0 || period.isEmpty) {
        showTip(isZh ? '该订单缺少套餐信息，无法重建' : 'Order missing plan data, cannot recreate');
        return;
      }
      runningOrderNo.value = order.orderNo;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        if (order.canCancel) {
          await portal.cancelOrder(order.orderNo);
        }
        final rebuiltOrderNo = await portal.createOrder(planId: planId, period: period);
        if (rebuiltOrderNo.isEmpty) {
          throw GatewayApiException(message: g.unknownError);
        }
        final payment = await portal.payOrder(orderNo: rebuiltOrderNo, paymentMethodId: selectedMethodId.value!);
        if (payment.completed) {
          final confirmed = await verifyCompletedAndSync(rebuiltOrderNo);
          if (confirmed) {
            showTip(g.orderCompletedAndSynced, duration: const Duration(seconds: 8));
          } else {
            showTip(
              isZh ? '订单已重建，支付结果确认中' : 'Order recreated, payment confirmation pending',
              duration: const Duration(seconds: 8),
            );
          }
        } else {
          final paymentTarget = (payment.paymentUrl ?? payment.paymentData).trim();
          if (paymentTarget.isNotEmpty) {
            await openPaymentTarget(paymentTarget, rebuiltOrderNo);
          } else {
            showTip(g.noPaymentUrl);
          }
        }
        tabIndex.value = 1;
        orderStatusFilter.value = 'pending';
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        showTip(error.message, duration: const Duration(seconds: 8));
      } finally {
        runningOrderNo.value = null;
      }
    }

    Future<bool> confirmBeforeBuy(GatewayPlan plan, String period) async {
      final currentPlan = summary.value?.planName?.trim();
      final isRenew = currentPlan != null && currentPlan.isNotEmpty && currentPlan == plan.name.trim();
      final title = isRenew ? (isZh ? '续费确认' : 'Renew Confirmation') : (isZh ? '切换套餐确认' : 'Plan Change Confirmation');
      final lines = <String>['1. ${g.renewRulesSamePlan}', '2. ${g.renewRulesUpgrade}', '3. ${g.renewRulesRefund}'];
      final selectedPeriod = plan.periods.firstWhere(
        (item) => item.code == period,
        orElse: () => GatewayPlanPeriod(code: period, label: period, price: 0),
      );
      final periodLabel = g.periodLabel(selectedPeriod.code, selectedPeriod.label);
      final amountText = _presentPrice(selectedPeriod.price);
      final content = StringBuffer()
        ..writeln(
          '${isZh ? '当前套餐' : 'Current plan'}: ${currentPlan == null || currentPlan.isEmpty ? '--' : currentPlan}',
        )
        ..writeln('${isZh ? '目标套餐' : 'Target plan'}: ${plan.name}')
        ..writeln('${isZh ? '购买周期' : 'Billing cycle'}: $periodLabel')
        ..writeln('${isZh ? '订单金额' : 'Order amount'}: $amountText')
        ..writeln()
        ..writeln(lines.join('\n'));

      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content.toString()),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: Text(isZh ? '取消' : 'Cancel')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(isZh ? '确认下单' : 'Confirm')),
          ],
        ),
      );
      return result == true;
    }

    Future<String?> resolveCouponCodeForBuy({required int planId, required String period}) async {
      final code = couponTextController.text.trim();
      if (code.isEmpty) return null;
      promoBusy.value = true;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final result = await portal.checkCoupon(code: code, planId: planId, period: period);
        if (!result.valid) {
          throw GatewayApiException(message: isZh ? '优惠券不可用，请更换后重试' : 'Coupon is not available');
        }
        final discountText = _presentPrice(result.discountAmount > 0 ? result.discountAmount : result.value);
        couponPreviewText.value = isZh ? '优惠券可用，预计减免 $discountText' : 'Coupon valid, estimated discount $discountText';
        return code;
      } on GatewayApiException catch (error) {
        couponPreviewText.value = null;
        if (!context.mounted) return null;
        showTip(error.message, duration: const Duration(seconds: 8));
        rethrow;
      } finally {
        promoBusy.value = false;
      }
    }

    Future<void> previewGiftCard() async {
      final code = giftCardTextController.text.trim();
      if (code.isEmpty) {
        showTip(isZh ? '请输入礼品卡/兑换码' : 'Please enter gift card code');
        return;
      }
      promoBusy.value = true;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final result = await portal.checkGiftCard(code);
        giftCardPreviewText.value = result.canRedeem
            ? (isZh ? '礼品卡可兑换，点击“立即兑换”即可到账' : 'Gift card is redeemable now')
            : (result.reason ?? (isZh ? '礼品卡暂不可兑换' : 'Gift card cannot be redeemed now'));
      } on GatewayApiException catch (error) {
        giftCardPreviewText.value = error.message;
      } finally {
        promoBusy.value = false;
      }
    }

    Future<void> redeemGiftCard() async {
      final code = giftCardTextController.text.trim();
      if (code.isEmpty) {
        showTip(isZh ? '请输入礼品卡/兑换码' : 'Please enter gift card code');
        return;
      }
      promoBusy.value = true;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final result = await portal.redeemGiftCard(code);
        if (!context.mounted) return;
        showTip(
          result.redeemed
              ? (isZh ? '礼品卡兑换成功，账户余额已更新' : 'Gift card redeemed and balance updated')
              : (isZh ? '礼品卡兑换未成功，请稍后重试' : 'Gift card redeem failed'),
          duration: const Duration(seconds: 8),
        );
        giftCardPreviewText.value = null;
        giftCardTextController.clear();
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        showTip(error.message, duration: const Duration(seconds: 8));
      } finally {
        promoBusy.value = false;
      }
    }

    Future<void> buy(GatewayPlan plan) async {
      final methodId = selectedMethodId.value;
      final period = selectedPeriods.value[plan.id];
      if (methodId == null || period == null || period.isEmpty) {
        showTip(g.selectPeriodAndPayment);
        return;
      }
      final confirmed = await confirmBeforeBuy(plan, period);
      if (!confirmed) return;

      runningPlanId.value = plan.id;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        final couponCode = await resolveCouponCodeForBuy(planId: plan.id, period: period);
        final orderNo = await portal.createOrder(planId: plan.id, period: period, couponCode: couponCode);
        if (orderNo.isEmpty) throw GatewayApiException(message: g.unknownError);

        final preview = await portal.orderDetail(orderNo);
        if (preview != null && context.mounted) {
          showTip(
            '${g.orderAmount} ${_presentPrice(preview.totalAmount)} / ${g.orderSurplusAmount} ${_presentPrice(preview.surplusAmount)} / ${g.orderRefundAmount} ${_presentPrice(preview.refundAmount)}',
            duration: const Duration(seconds: 7),
          );
        }

        final payment = await portal.payOrder(orderNo: orderNo, paymentMethodId: methodId);
        if (payment.completed) {
          final confirmed = await verifyCompletedAndSync(orderNo);
          if (!context.mounted) return;
          if (confirmed) {
            showTip(g.orderCompletedAndSynced);
            tabIndex.value = 1;
            return;
          }
          showTip(
            isZh
                ? 'Payment is being confirmed and will auto refresh'
                : 'Payment is being confirmed and will auto refresh',
            duration: const Duration(seconds: 8),
          );
        }

        final paymentTarget = (payment.paymentUrl ?? payment.paymentData).trim();
        if (paymentTarget.isNotEmpty) {
          await openPaymentTarget(paymentTarget, orderNo);
        } else if (!payment.completed) {
          if (!context.mounted) return;
          showTip(g.noPaymentUrl);
        }
        tabIndex.value = 1;
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        if (error.code == 'ORDER_PENDING_EXISTS' || error.code == 'ORDER_WAITING_EFFECTIVE') {
          final existingOrderNo = existingOrderNoFromError(error);
          final tip = existingOrderNo == null ? error.message : '${error.message} ($existingOrderNo)';
          showOrderConflictWithAction(tip);
          return;
        }
        showTip(g.orderFailed(error.message));
      } finally {
        runningPlanId.value = null;
      }
    }

    Widget rulesCard() {
      final summaryValue = summary.value;
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome, size: 18),
                  const SizedBox(width: 6),
                  Text(g.renewRulesTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 8),
              Text('1. ${g.renewRulesSamePlan}'),
              const SizedBox(height: 4),
              Text('2. ${g.renewRulesUpgrade}'),
              const SizedBox(height: 4),
              Text('3. ${g.renewRulesRefund}'),
              if (summaryValue != null) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.35),
                  ),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    children: [
                      Text('${g.accountPlan}: ${summaryValue.planName ?? '--'}'),
                      Text('${g.accountBalance}: ${_presentPrice(summaryValue.balance)}'),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    Widget promoCard() {
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.redeem_rounded, size: 18, color: theme.colorScheme.primary),
                  const SizedBox(width: 6),
                  Text(
                    isZh ? '优惠券 / 礼品卡' : 'Coupon / Gift Card',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: couponTextController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: isZh ? '优惠券代码（下单前自动校验）' : 'Coupon Code (validated before placing order)',
                  prefixIcon: const Icon(Icons.local_offer_outlined),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () {
                      couponTextController.clear();
                      couponPreviewText.value = null;
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (_) => couponPreviewText.value = null,
              ),
              if (couponPreviewText.value != null) ...[
                const SizedBox(height: 6),
                Text(
                  couponPreviewText.value!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              TextField(
                controller: giftCardTextController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: isZh ? '礼品卡 / 兑换码' : 'Gift Card Code',
                  prefixIcon: const Icon(Icons.card_giftcard_rounded),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () {
                      giftCardTextController.clear();
                      giftCardPreviewText.value = null;
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (_) => giftCardPreviewText.value = null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: promoBusy.value ? null : previewGiftCard,
                      icon: const Icon(Icons.verified_outlined),
                      label: Text(isZh ? '校验礼品卡' : 'Check Gift Card'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _GatewayPrimaryActionButton(
                      onPressed: promoBusy.value ? null : redeemGiftCard,
                      icon: const Icon(Icons.redeem_rounded, size: 18),
                      label: promoBusy.value ? g.processing : (isZh ? '立即兑换' : 'Redeem Now'),
                    ),
                  ),
                ],
              ),
              if (giftCardPreviewText.value != null) ...[
                const SizedBox(height: 6),
                Text(
                  giftCardPreviewText.value!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              if (giftHistoryLoading.value) ...[const SizedBox(height: 8), const LinearProgressIndicator(minHeight: 2)],
              if (giftCardHistory.value.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  isZh ? '最近礼品卡记录' : 'Recent Gift Card Records',
                  style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                ...giftCardHistory.value
                    .take(3)
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${item.code ?? '--'} · ${item.status ?? '--'} · ${_presentPrice(item.amount)}',
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
              ],
            ],
          ),
        ),
      );
    }

    Widget planTab() {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          rulesCard(),
          promoCard(),
          if (methods.value.isNotEmpty) ...[
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: DropdownButtonFormField<int>(
                  key: ValueKey('payment-method-${selectedMethodId.value}'),
                  initialValue: selectedMethodId.value,
                  decoration: InputDecoration(
                    labelText: g.paymentMethod,
                    prefixIcon: const Icon(Icons.account_balance_wallet_rounded),
                    border: const OutlineInputBorder(),
                  ),
                  items: methods.value
                      .map((m) => DropdownMenuItem(value: m.id, child: Text('${m.icon} ${m.name}')))
                      .toList(),
                  onChanged: (value) => selectedMethodId.value = value,
                ),
              ),
            ),
          ],
          ...plans.value.map(
            (plan) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.primary.withValues(alpha: 0.12),
                          ),
                          child: Icon(Icons.inventory_2_rounded, color: theme.colorScheme.primary, size: 18),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            plan.name,
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        if (!plan.sell) Chip(label: Text(isZh ? '暂停售卖' : 'Unavailable')),
                      ],
                    ),
                    if (plan.description.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(plan.description, style: theme.textTheme.bodySmall),
                    ],
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      runSpacing: 6,
                      children: [
                        _TagText(text: '${g.planTraffic}: ${_presentTraffic(plan.transferEnable)}'),
                        _TagText(text: '${g.planDevices}: ${plan.deviceLimit?.toString() ?? g.unlimited}'),
                        _TagText(text: '${g.planSpeed}: ${plan.speedLimit?.toString() ?? g.unlimited}'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      key: ValueKey('period-${plan.id}-${selectedPeriods.value[plan.id]}'),
                      initialValue: selectedPeriods.value[plan.id],
                      decoration: InputDecoration(labelText: g.billingPeriod, border: const OutlineInputBorder()),
                      items: plan.periods
                          .map(
                            (p) => DropdownMenuItem(
                              value: p.code,
                              child: Text('${g.periodLabel(p.code, p.label)}  ${_presentPrice(p.price)}'),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        selectedPeriods.value = {...selectedPeriods.value, plan.id: value};
                      },
                    ),
                    const SizedBox(height: 10),
                    _GatewayPrimaryActionButton(
                      onPressed: (plan.sell && runningPlanId.value != plan.id) ? () => buy(plan) : null,
                      icon: const Icon(Icons.payments_rounded),
                      label: runningPlanId.value == plan.id ? g.processing : g.buyNow,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (plans.value.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(child: Text(g.noPurchasablePlans)),
            ),
        ],
      );
    }

    Widget orderTab() {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _OrderFilterChip(
                label: g.allStatus,
                selected: orderStatusFilter.value == 'all',
                onTap: () => orderStatusFilter.value = 'all',
              ),
              _OrderFilterChip(
                label: g.pendingStatus,
                selected: orderStatusFilter.value == 'pending',
                onTap: () => orderStatusFilter.value = 'pending',
              ),
              _OrderFilterChip(
                label: g.paidStatus,
                selected: orderStatusFilter.value == 'paid',
                onTap: () => orderStatusFilter.value = 'paid',
              ),
              _OrderFilterChip(
                label: g.cancelledStatus,
                selected: orderStatusFilter.value == 'cancelled',
                onTap: () => orderStatusFilter.value = 'cancelled',
              ),
              _OrderFilterChip(
                label: g.expiredStatus,
                selected: orderStatusFilter.value == 'expired',
                onTap: () => orderStatusFilter.value = 'expired',
              ),
              _OrderFilterChip(
                label: isZh ? '已关闭' : 'Closed',
                selected: orderStatusFilter.value == 'closed',
                onTap: () => orderStatusFilter.value = 'closed',
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (orders.value.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(child: Text(g.noOrders)),
            ),
          ...orders.value.map((order) {
            final busy = runningOrderNo.value == order.orderNo;
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => showOrderDetail(order),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(order.planName ?? '-', style: theme.textTheme.titleMedium)),
                          Chip(label: Text(g.orderStatusLabel(order.status))),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('${isZh ? '订单号' : 'Order'}: ${order.orderNo}'),
                      Text('${g.orderType}: ${order.typeLabel.isEmpty ? order.type : order.typeLabel}'),
                      Text('${isZh ? '周期' : 'Period'}: ${g.periodLabel(order.period ?? '', order.period ?? '-')}'),
                      if (order.planTransferEnable != null && (order.planTransferEnable ?? 0) > 0)
                        Text('${g.planTraffic}: ${_presentTraffic(order.planTransferEnable!)}'),
                      Text('${g.orderAmount}: ${_presentPrice(order.totalAmount)}'),
                      Text('${g.orderSurplusAmount}: ${_presentPrice(order.surplusAmount)}'),
                      Text('${g.orderRefundAmount}: ${_presentPrice(order.refundAmount)}'),
                      if (order.createdAt != null) Text('${g.orderCreatedAt}: ${_presentDateTime(order.createdAt)}'),
                      if (order.paidAt != null) Text('${g.orderPaidAt}: ${_presentDateTime(order.paidAt)}'),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (order.isPayable)
                            _GatewayPrimaryActionButton(
                              onPressed: busy ? null : () => continuePay(order),
                              icon: const Icon(Icons.open_in_new_rounded, size: 18),
                              label: busy ? g.processing : g.continuePay,
                            ),
                          if (order.canCancel)
                            _GatewayOutlineActionButton(
                              onPressed: busy ? null : () => cancelOrder(order),
                              icon: const Icon(Icons.cancel_outlined, size: 18),
                              label: g.cancelOrder,
                            ),
                          if (order.isPayable && order.canCancel)
                            _GatewayOutlineActionButton(
                              onPressed: busy ? null : () => closeAndRecreateOrder(order),
                              icon: const Icon(Icons.autorenew_rounded, size: 18),
                              label: isZh ? '重建订单' : 'Recreate Order',
                            ),
                          _GatewayOutlineActionButton(
                            onPressed: busy ? null : () => refreshOrderStatus(order),
                            icon: const Icon(Icons.refresh_rounded, size: 18),
                            label: g.refreshOrderStatus,
                          ),
                          TextButton.icon(
                            onPressed: busy ? null : () => showOrderDetail(order),
                            icon: const Icon(Icons.receipt_long_rounded, size: 18),
                            label: Text(g.orderDetail),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      );
    }

    Widget body;
    if (loading.value) {
      body = const Center(child: CircularProgressIndicator());
    } else if (!loggedIn.value) {
      body = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF193F7A), Color(0xFF2766BF), Color(0xFF2CA8C9)],
              ),
              boxShadow: SlothShadows.card,
            ),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                  child: const Icon(Icons.local_fire_department_rounded, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isZh
                        ? '限时福利：登录后可查看专属折扣与返利活动，支付成功自动同步节点。'
                        : 'Limited offer: login to unlock discount plans and rebate campaigns.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _GatewayPrimaryActionButton(
            onPressed: () => context.push('/home/gateway-login?redirect=/gateway-plans'),
            icon: const Icon(Icons.login_rounded),
            label: g.login,
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => context.push('/home/gateway-register?redirect=/gateway-plans'),
            child: Text(g.register),
          ),
        ],
      );
    } else if (errorText.value != null) {
      final errorLower = errorText.value?.toLowerCase() ?? '';
      final authExpired =
          (errorText.value?.contains('登录状态已失效') ?? false) ||
          errorLower.contains('unauthorized') ||
          errorLower.contains('session') ||
          errorLower.contains('invalid access token') ||
          errorLower.contains('token expired');
      body = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(g.loadPlansFailed(errorText.value!)),
          const SizedBox(height: 8),
          FilledButton(onPressed: load, child: Text(g.retry)),
          if (authExpired) ...[
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => context.push('/home/gateway-login?redirect=/gateway-plans'),
              child: Text(isZh ? '重新登录' : 'Login Again'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                await ref.read(slothGatewayPortalControllerProvider).logout();
                if (!context.mounted) return;
                showTip(isZh ? '已退出当前账号' : 'Logged out');
                await load();
              },
              child: Text(isZh ? '退出当前账号' : 'Logout'),
            ),
          ],
        ],
      );
    } else {
      body = Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _GatewayTopTabButton(
                    selected: tabIndex.value == 0,
                    icon: Icons.inventory_2_rounded,
                    label: g.purchaseTabPlans,
                    onTap: () => tabIndex.value = 0,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _GatewayTopTabButton(
                    selected: tabIndex.value == 1,
                    icon: Icons.receipt_long_rounded,
                    label: g.purchaseTabOrders,
                    onTap: () => tabIndex.value = 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: tabIndex.value == 0 ? planTab() : orderTab()),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_bag_rounded, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text(g.plansTitle),
          ],
        ),
        actions: [IconButton(onPressed: load, icon: const Icon(Icons.refresh))],
      ),
      body: body,
    );
  }
}

class _GatewayTopTabButton extends StatelessWidget {
  const _GatewayTopTabButton({required this.selected, required this.icon, required this.label, required this.onTap});

  final bool selected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: selected
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF113D84), Color(0xFF2F72D4), Color(0xFF34BFD0)],
                )
              : null,
          color: selected ? null : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
          border: Border.all(
            color: selected ? Colors.transparent : theme.colorScheme.outlineVariant.withValues(alpha: 0.9),
          ),
          boxShadow: selected ? SlothShadows.card : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: selected ? Colors.white : theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 7),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GatewayPrimaryActionButton extends StatelessWidget {
  const _GatewayPrimaryActionButton({required this.onPressed, required this.icon, required this.label});

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
                colors: [Color(0xFF0D3B81), Color(0xFF2366CE), Color(0xFF2AB8CF)],
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

class _GatewayOutlineActionButton extends StatelessWidget {
  const _GatewayOutlineActionButton({required this.onPressed, required this.icon, required this.label});

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.26)),
      ),
    );
  }
}

class _OrderFilterChip extends StatelessWidget {
  const _OrderFilterChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
      selectedColor: theme.colorScheme.primary.withValues(alpha: 0.22),
      labelStyle: TextStyle(
        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
      ),
      side: BorderSide(
        color: selected ? theme.colorScheme.primary.withValues(alpha: 0.44) : theme.colorScheme.outlineVariant,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class _TagText extends StatelessWidget {
  const _TagText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withValues(alpha: 0.12),
            theme.colorScheme.secondary.withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Text(text, style: theme.textTheme.bodySmall),
    );
  }
}
