import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GatewayWebViewPage extends StatefulWidget {
  const GatewayWebViewPage({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  State<GatewayWebViewPage> createState() => _GatewayWebViewPageState();
}

class _GatewayWebViewPageState extends State<GatewayWebViewPage> {
  late final WebViewController _controller;
  bool _loading = true;
  String? _errorText;

  bool get _isZh => Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setUserAgent(
        'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36',
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() {
            _loading = true;
            _errorText = null;
          }),
          onPageFinished: (_) => setState(() => _loading = false),
          onWebResourceError: (error) {
            if (!mounted) return;
            setState(() {
              _loading = false;
              _errorText = error.description;
            });
          },
          onNavigationRequest: (request) async {
            final uri = Uri.tryParse(request.url);
            if (uri == null) return NavigationDecision.prevent;
            if (uri.scheme == 'slothvpn') {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
              return NavigationDecision.prevent;
            }
            if (uri.scheme != 'http' && uri.scheme != 'https') {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    final parsed = Uri.tryParse(widget.url);
    if (parsed == null || !parsed.hasScheme) {
      _errorText = _isZh ? '页面地址无效' : 'Invalid page URL';
      _loading = false;
      return;
    }
    _controller.loadRequest(parsed);
  }

  Future<void> _openExternal() async {
    final uri = Uri.tryParse(widget.url);
    if (uri == null) return;
    final openedInApp = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    if (!openedInApp) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _openExternal, icon: const Icon(Icons.open_in_browser)),
          IconButton(onPressed: () => _controller.reload(), icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_errorText != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 32),
                    const SizedBox(height: 12),
                    Text(
                      _isZh ? '页面加载失败，请重试或在外部浏览器打开' : 'Failed to load page, retry or open in browser',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(_errorText!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: [
                        OutlinedButton(onPressed: () => _controller.reload(), child: Text(_isZh ? '重试' : 'Retry')),
                        FilledButton(onPressed: _openExternal, child: Text(_isZh ? '外部浏览器打开' : 'Open in browser')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (_loading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
