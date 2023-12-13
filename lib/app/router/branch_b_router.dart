import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../adaptive_split_pane_scaffold.dart';
import '../detail_page.dart';
import '../grid_page.dart';

final _navBNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navB');

const branchB = TypedStatefulShellBranch<BranchBData>(
  routes: [
    TypedGoRoute<GridRouteData>(
      path: GridRouteData.path,
      routes: [
        TypedGoRoute<GridDetailRouteData>(path: GridDetailRouteData.path),
      ],
    ),
  ],
);

class BranchBData extends StatefulShellBranchData {
  const BranchBData();
}

class GridRouteData extends GoRouteData {
  const GridRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _navBNavigatorKey;
  static const path = '/grid';

  @override
  Widget build(BuildContext context, GoRouterState state) => const GridPage();
}

class GridDetailRouteData extends GoRouteData {
  const GridDetailRouteData(this.id);

  static const path = 'detail/:id';

  final int id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(
        child: AdaptiveSplitPaneScaffold(
          body: const GridPage(),
          secondaryBody: DetailPage(id: id),
        ),
      );
}
