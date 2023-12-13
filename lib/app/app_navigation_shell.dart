import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import 'app.dart';
import 'nav_destinations.dart';

const _bodyKey = Key('Body');
const _fabKey = Key('FAB');
const _bottomNavigationKey = Key('BottomNavigation');
const _primaryNavigationKey = Key('PrimaryNavigation');
const _primaryNavigationExtendedKey = Key('PrimaryNavigationExpanded');

/// このWidgetでは、`Primary Navigation`,`BottomNavigation`の管理のみとする
/// FABはレイアウトの都合上含めるが、`Body`,`SecondaryBody`は対象外
class AppNavigationShell extends StatelessWidget {
  const AppNavigationShell({
    super.key,
    required this.children,
    required this.navigationShell,
  });

  final List<Widget> children;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    // 遷移先をあらかじめ指定
    final destinations = NavDestination.values
        .map(
          (e) => NavigationDestination(
            icon: Icon(e.icon),
            selectedIcon: Icon(e.selectedIcon),
            tooltip: e.tooltip,
            label: e.label,
          ),
        )
        .toList();

// FABやメニューを追加する場合は`AdaptiveLayout`を利用する
// `AdaptiveScaffold`の内部実装と合わせるため、`Scaffold`でラッピング
    return Scaffold(
      body: AdaptiveLayout(
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: _bodyKey,
              // `_BranchSwitcher`で切り替え時のアニメーションを制御
              builder: (_) => Scaffold(
                appBar: AppBar(title: const Text(appName)),
                body: _BranchSwitcher(
                  currentIndex: navigationShell.currentIndex,
                  children: children,
                ),
                floatingActionButton: FloatingActionButton(
                  key: _fabKey,
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: _bodyKey,
              builder: (_) => Scaffold(
                appBar: AppBar(title: const Text(appName)),
                body: _BranchSwitcher(
                  currentIndex: navigationShell.currentIndex,
                  children: children,
                ),
              ),
            ),
          },
        ),
        // 画面左側に表示するNavigation領域
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            // 画面サイズがMediumの場合
            Breakpoints.medium: SlotLayout.from(
              key: _primaryNavigationKey,
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                // NavigationBarとNavigationRailで定義が異なるので変換を行う
                destinations: _toRailDestinations(destinations),
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: _onDestinationSelected,
                // ガイドラインのスペース指定に従うため、`Padding`を指定
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 56),
                  child: FloatingActionButton(
                    key: _fabKey,
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
            // 画面サイズがLarge(Expanded)の場合
            Breakpoints.large: SlotLayout.from(
              key: _primaryNavigationExtendedKey,
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                extended: true,
                destinations: _toRailDestinations(destinations),
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: _onDestinationSelected,
                leading: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 56, left: 12, right: 12),
                    child: FloatingActionButton.extended(
                      key: _fabKey,
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Add'),
                    ),
                  ),
                ),
              ),
            ),
          },
        ),
        // 画面下部に表示するNavigation領域
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            // 画面サイズがSmall(Compact)以上の場合
            Breakpoints.smallAndUp: SlotLayout.from(
              key: _bottomNavigationKey,
              inAnimation: AdaptiveScaffold.bottomToTop,
              outAnimation: AdaptiveScaffold.topToBottom,
              builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destinations,
                currentIndex: navigationShell.currentIndex,
                onDestinationSelected: _onDestinationSelected,
              ),
            ),
            // 画面サイズがMedium以上の場合
            Breakpoints.mediumAndUp: SlotLayoutConfig.empty(),
          },
        ),
      ),
    );

    // FABを利用しない場合、`AdaptiveScaffold`を純正利用できる
    // return AdaptiveScaffold(
    //   useDrawer: false,
    //   selectedIndex: navigationShell.currentIndex,
    //   onSelectedIndexChange: _onDestinationSelected,
    //   destinations: destinations,
    //   // `_BranchSwitcher`は切り替え時のアニメーションを制御
    //   body: (_) => Scaffold(
    //     appBar: AppBar(title: const Text(appName)),
    //     body: _BranchSwitcher(
    //       currentIndex: navigationShell.currentIndex,
    //       children: children,
    //     ),
    //   ),
    // );
  }

  /// 遷移先が選択された際のイベント
  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  /// `NavigationRailDestination`への変換
  List<NavigationRailDestination> _toRailDestinations(
    List<NavigationDestination> destinations,
  ) =>
      destinations
          .map(
            // `Navigation rail`がTooltip非対応
            // Notes: https://github.com/flutter/flutter/issues/113103
            AdaptiveScaffold.toRailDestination,
          )
          .toList();
}

class _BranchSwitcher extends StatelessWidget {
  const _BranchSwitcher({
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // `NoTransitionPage`と同様とするため、ただ表示を切り替えるのみ
    return children[currentIndex];
  }
}
