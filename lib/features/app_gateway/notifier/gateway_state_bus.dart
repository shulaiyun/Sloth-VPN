import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final slothGatewayUiRefreshTickProvider = StateProvider<int>((_) => 0);
final slothGatewayTicketCacheProvider = StateProvider<List<GatewayTicketItem>>((_) => const <GatewayTicketItem>[]);
final slothGatewayTicketVisibleUntilProvider = StateProvider<Map<String, int>>((_) => const <String, int>{});

void bumpSlothGatewayUiRefresh(Ref ref) {
  ref.read(slothGatewayUiRefreshTickProvider.notifier).state++;
}
