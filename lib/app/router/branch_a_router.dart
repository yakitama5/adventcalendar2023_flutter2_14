import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../adaptive_split_pane_scaffold.dart';
import '../detail_page.dart';
import '../list_page.dart';

final _navANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navA');

const branchA = TypedStatefulShellBranch<BranchAData>(
  routes: [
    TypedGoRoute<ListRouteData>(
      path: ListRouteData.path,
      routes: [
        TypedGoRoute<ListDetailRouteData>(path: ListDetailRouteData.path),
      ],
    ),
  ],
);

class BranchAData extends StatefulShellBranchData {
  const BranchAData();
}

class ListRouteData extends GoRouteData {
  const ListRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _navANavigatorKey;
  static const path = '/list';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdaptiveSplitPaneScaffold(
        body: ListPage(),
        // 空要素をデフォルト表示
        secondaryBody: Scaffold(
          body: Center(child: Text('Please select')),
        ),
        showSmallSecondary: false,
      );
}

class ListDetailRouteData extends GoRouteData {
  const ListDetailRouteData(this.id);

  static const path = 'detail/:id';

  final int id;

  /// 明細遷移時のちらつきを抑えるため、アニメーションをOFF
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(
        child: AdaptiveSplitPaneScaffold(
          body: const ListPage(),
          secondaryBody: DetailPage(id: id),
        ),
      );
}
