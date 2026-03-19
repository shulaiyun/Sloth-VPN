String localizeProxyDisplay(String input, {required bool isZh}) {
  final raw = input.trim();
  if (!isZh || raw.isEmpty) return input;

  final lower = raw.toLowerCase();
  const exactMap = <String, String>{
    'balance': '均衡',
    'balancer': '负载均衡',
    'round-robin': '轮询',
    'lowest': '最低延迟',
    'selector': '选择器',
    'urltest': '自动测速',
    'auto': '自动',
    'direct': '直连',
    'block': '拦截',
    'dns': 'DNS',
  };

  if (exactMap.containsKey(lower)) {
    return exactMap[lower]!;
  }

  var output = raw;
  output = _replaceIgnoreCase(output, 'SlothVPN Managed Subscription', '树懒VPN 托管订阅');
  output = _replaceIgnoreCase(output, 'Managed Subscription', '托管订阅');
  output = _replaceIgnoreCase(output, 'round-robin', '轮询');
  output = _replaceIgnoreCase(output, 'lowest', '最低延迟');
  output = _replaceIgnoreCase(output, 'balance', '均衡');
  output = _replaceIgnoreCase(output, 'balancer', '负载均衡');
  output = _replaceIgnoreCase(output, 'selector', '选择器');

  return output;
}

String _replaceIgnoreCase(String source, String from, String to) {
  if (from.isEmpty) return source;
  return source.replaceAll(RegExp(RegExp.escape(from), caseSensitive: false), to);
}
