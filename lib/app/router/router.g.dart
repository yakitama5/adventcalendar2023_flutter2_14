// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
    ];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: AppShellRouteData.$restorationScopeId,
      navigatorContainerBuilder: AppShellRouteData.$navigatorContainerBuilder,
      factory: $AppShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/list',
              factory: $ListRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail/:id',
                  factory: $ListDetailRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/grid',
              factory: $GridRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail/:id',
                  factory: $GridDetailRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

extension $ListRouteDataExtension on ListRouteData {
  static ListRouteData _fromState(GoRouterState state) => const ListRouteData();

  String get location => GoRouteData.$location(
        '/list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListDetailRouteDataExtension on ListDetailRouteData {
  static ListDetailRouteData _fromState(GoRouterState state) =>
      ListDetailRouteData(
        int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/list/detail/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GridRouteDataExtension on GridRouteData {
  static GridRouteData _fromState(GoRouterState state) => const GridRouteData();

  String get location => GoRouteData.$location(
        '/grid',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GridDetailRouteDataExtension on GridDetailRouteData {
  static GridDetailRouteData _fromState(GoRouterState state) =>
      GridDetailRouteData(
        int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/grid/detail/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteDataExtension on SettingsRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
