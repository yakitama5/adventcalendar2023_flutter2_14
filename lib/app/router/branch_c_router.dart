import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../settings_page.dart';

final _navCNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navC');

const branchC = TypedStatefulShellBranch<BranchCData>(
  routes: [TypedGoRoute<SettingsRouteData>(path: SettingsRouteData.path)],
);

class BranchCData extends StatefulShellBranchData {
  const BranchCData();
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _navCNavigatorKey;
  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}
