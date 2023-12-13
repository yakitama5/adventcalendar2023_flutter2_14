import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_navigation_shell.dart';
import 'branch_a_router.dart';
import 'branch_b_router.dart';
import 'branch_c_router.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: [
    branchA,
    branchB,
    branchC,
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _rootNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      navigationShell;

  static const String $restorationScopeId = 'app_router';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) =>
      AppNavigationShell(navigationShell: navigationShell, children: children);
}
