import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/core/router/adaptive_layout/shell_route_action.dart';
import 'package:hiddify/core/router/go_router/helper/active_breakpoint_notifier.dart';
import 'package:hiddify/core/router/go_router/routing_config_notifier.dart';
import 'package:hiddify/core/widget/sloth_icon.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/stats/widget/side_bar_stats_overview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyAdaptiveLayout extends HookConsumerWidget {
  const MyAdaptiveLayout({
    super.key,
    required this.navigationShell,
    required this.isMobileBreakpoint,
    required this.showProfilesAction,
  });
  // managed by go router(Shell Route)
  final StatefulNavigationShell navigationShell;
  final bool isMobileBreakpoint;
  final bool showProfilesAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider).requireValue;
    // focus switch management
    final primaryFocusHash = useState<int?>(null);
    final navScopeNode = useFocusScopeNode();
    useEffect(() {
      bool handler(KeyEvent event) {
        final arrows = isMobileBreakpoint ? KeyboardConst.verticalArrows : KeyboardConst.horizontalArrows;
        if (!arrows.contains(event.logicalKey)) return false;
        if (event is KeyDownEvent) {
          primaryFocusHash.value = FocusManager.instance.primaryFocus.hashCode;
        } else {
          // focus node does not change => true.
          if (primaryFocusHash.value == FocusManager.instance.primaryFocus.hashCode) {
            if (branchesScope.values.any((node) => node.hasFocus)) {
              navScopeNode.requestFocus();
            } else if (navScopeNode.hasFocus) {
              branchesScope[getNameOfBranch(isMobileBreakpoint, showProfilesAction, navigationShell.currentIndex)]
                  ?.requestFocus();
            }
          }
        }
        return true;
      }

      HardwareKeyboard.instance.addHandler(handler);
      return () {
        HardwareKeyboard.instance.removeHandler(handler);
      };
    }, [isMobileBreakpoint, showProfilesAction, navigationShell.currentIndex]);
    return Material(
      child: Scaffold(
        body: isMobileBreakpoint
            ? navigationShell
            : Row(
                children: [
                  FocusScope(
                    node: navScopeNode,
                    child: NavigationRail(
                      extended: Breakpoint(context).isDesktop(),
                      destinations: _navRailDests(_actions(context, t, showProfilesAction, isMobileBreakpoint)),
                      selectedIndex: navigationShell.currentIndex,
                      onDestinationSelected: (index) => _onTap(context, index),
                      trailing: Breakpoint(context).isDesktop()
                          ? const Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(width: 220, child: SideBarStatsOverview()),
                              ),
                            )
                          : null,
                    ),
                  ),
                  Expanded(child: navigationShell),
                ],
              ),
        bottomNavigationBar: isMobileBreakpoint
            ? FocusScope(
                node: navScopeNode,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    navigationBarTheme: NavigationBarThemeData(
                      height: 72,
                      elevation: 0,
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow.withValues(alpha: 0.95),
                      indicatorColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.18),
                      labelTextStyle: WidgetStateProperty.resolveWith((states) {
                        final selected = states.contains(WidgetState.selected);
                        return TextStyle(
                          fontSize: 13,
                          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        );
                      }),
                      iconTheme: WidgetStateProperty.resolveWith((states) {
                        final selected = states.contains(WidgetState.selected);
                        return IconThemeData(
                          size: 22,
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        );
                      }),
                    ),
                  ),
                  child: NavigationBar(
                    selectedIndex: navigationShell.currentIndex,
                    destinations: _navDests(context, _actions(context, t, showProfilesAction, isMobileBreakpoint)),
                    onDestinationSelected: (index) => _onTap(context, index),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  // shell route action onTap
  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  List<ShellRouteAction> _actions(
    BuildContext context,
    Translations t,
    bool showProfilesAction,
    bool isMobileBreakpoint,
  ) {
    final g = GatewayL10n.of(context);
    return [
      ShellRouteAction(SlothIconType.home, t.pages.home.title),
      ShellRouteAction(SlothIconType.subscription, g.plansTitle),
      ShellRouteAction(SlothIconType.cloud, g.accountCenterTitle),
      if (showProfilesAction && !isMobileBreakpoint)
        ShellRouteAction(SlothIconType.subscription, t.pages.profiles.title),
      ShellRouteAction(SlothIconType.settings, t.pages.settings.title),
      if (!isMobileBreakpoint) ShellRouteAction(SlothIconType.logs, t.pages.logs.title),
      if (!isMobileBreakpoint) ShellRouteAction(SlothIconType.info, t.pages.about.title),
    ];
  }

  List<NavigationDestination> _navDests(BuildContext context, List<ShellRouteAction> actions) {
    final scheme = Theme.of(context).colorScheme;
    IconData fallbackOutline(ShellRouteAction action) => switch (action.icon) {
      SlothIconType.home => Icons.home_outlined,
      SlothIconType.subscription => Icons.shopping_bag_outlined,
      SlothIconType.cloud => Icons.account_circle_outlined,
      SlothIconType.settings => Icons.tune_outlined,
      _ => Icons.circle_outlined,
    };

    IconData fallbackFilled(ShellRouteAction action) => switch (action.icon) {
      SlothIconType.home => Icons.home_rounded,
      SlothIconType.subscription => Icons.shopping_bag_rounded,
      SlothIconType.cloud => Icons.account_circle_rounded,
      SlothIconType.settings => Icons.tune_rounded,
      _ => Icons.circle,
    };

    return actions
        .map(
          (e) => NavigationDestination(
            icon: Icon(fallbackOutline(e), size: 22, color: scheme.onSurfaceVariant),
            selectedIcon: Icon(fallbackFilled(e), size: 22, color: scheme.primary),
            label: e.title,
          ),
        )
        .toList();
  }

  List<NavigationRailDestination> _navRailDests(List<ShellRouteAction> actions) => actions
      .map(
        (e) => NavigationRailDestination(
          icon: SlothIcon(e.icon, size: 22),
          selectedIcon: SlothIcon(e.icon, size: 22),
          label: Text(e.title),
        ),
      )
      .toList();
}
