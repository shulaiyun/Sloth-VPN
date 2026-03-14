import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayNoticesPage extends HookConsumerWidget {
  const GatewayNoticesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final loading = useState(true);
    final items = useState<List<GatewayNoticeItem>>(<GatewayNoticeItem>[]);
    final error = useState<String?>(null);

    Future<void> load() async {
      loading.value = true;
      error.value = null;
      try {
        items.value = await ref.read(slothGatewayPortalControllerProvider).fetchNotices(pageSize: 30);
      } on GatewayApiException catch (e) {
        error.value = e.message;
      } catch (_) {
        error.value = g.unknownError;
      } finally {
        loading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, const []);

    if (loading.value) {
      return Scaffold(appBar: AppBar(title: Text(g.noticesTitle)), body: const Center(child: CircularProgressIndicator()));
    }

    if (error.value != null) {
      return Scaffold(
        appBar: AppBar(title: Text(g.noticesTitle)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(error.value!),
            const SizedBox(height: 12),
            FilledButton(onPressed: load, child: Text(g.retry)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(g.noticesTitle),
        actions: [IconButton(onPressed: load, icon: const Icon(Icons.refresh))],
      ),
      body: items.value.isEmpty
          ? Center(child: Text(g.knowledgeEmpty))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.value.length,
              itemBuilder: (context, index) {
                final item = items.value[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 6),
                        if (item.updatedAt != null)
                          Text(item.updatedAt!, style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 10),
                        SelectableText(item.content),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class GatewayKnowledgePage extends HookConsumerWidget {
  const GatewayKnowledgePage({super.key});

  String _categoryLabel(String code) {
    switch (code) {
      case "android":
        return "安卓";
      case "ios":
        return "iPhone / iOS";
      case "windows":
        return "Windows";
      case "macos":
        return "macOS";
      case "linux":
        return "Linux";
      default:
        return "通用";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final loading = useState(true);
    final items = useState<List<GatewayKnowledgeItem>>(<GatewayKnowledgeItem>[]);
    final error = useState<String?>(null);
    final category = useState<String>("all");

    Future<void> load() async {
      loading.value = true;
      error.value = null;
      try {
        items.value = await ref.read(slothGatewayPortalControllerProvider).fetchKnowledge(language: "zh-CN");
      } on GatewayApiException catch (e) {
        error.value = e.message;
      } catch (_) {
        error.value = g.unknownError;
      } finally {
        loading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, const []);

    final allCategories = <String>{"all", ...items.value.map((item) => item.category)};
    final filtered = category.value == "all"
        ? items.value
        : items.value.where((item) => item.category == category.value).toList();

    if (loading.value) {
      return Scaffold(
        appBar: AppBar(title: Text(g.knowledgeTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (error.value != null) {
      return Scaffold(
        appBar: AppBar(title: Text(g.knowledgeTitle)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(error.value!),
            const SizedBox(height: 12),
            FilledButton(onPressed: load, child: Text(g.retry)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(g.knowledgeTitle),
        actions: [IconButton(onPressed: load, icon: const Icon(Icons.refresh))],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: allCategories
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(item == "all" ? "全部" : _categoryLabel(item)),
                        selected: category.value == item,
                        onSelected: (_) => category.value = item,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: filtered.isEmpty
                ? Center(child: Text(g.knowledgeEmpty))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(_categoryLabel(item.category)),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => context.push(
                            "/gateway-account/knowledge-detail",
                            extra: item,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class GatewayKnowledgeDetailPage extends HookConsumerWidget {
  const GatewayKnowledgeDetailPage({super.key, required this.item});

  final GatewayKnowledgeItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final loading = useState(true);
    final detail = useState<GatewayKnowledgeItem?>(item);
    final error = useState<String?>(null);

    Future<void> load() async {
      loading.value = true;
      error.value = null;
      try {
        detail.value = await ref.read(slothGatewayPortalControllerProvider).fetchKnowledgeDetail(item.id) ?? item;
      } on GatewayApiException catch (e) {
        error.value = e.message;
      } catch (_) {
        error.value = g.unknownError;
      } finally {
        loading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(title: Text(detail.value?.title ?? g.knowledgeTitle)),
      body: loading.value
          ? const Center(child: CircularProgressIndicator())
          : error.value != null
          ? ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(error.value!),
                const SizedBox(height: 12),
                FilledButton(onPressed: load, child: Text(g.retry)),
              ],
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(detail.value?.title ?? "-", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                if (detail.value?.updatedAt != null) Text(detail.value!.updatedAt!),
                const SizedBox(height: 12),
                MarkdownBody(data: detail.value?.body ?? ""),
              ],
            ),
    );
  }
}


