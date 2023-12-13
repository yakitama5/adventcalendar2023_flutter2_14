import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router/branch_a_router.dart';
import 'router/router.dart';

const appName = 'AdaptiveScaffold Sample';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      debugLogDiagnostics: true,
      routes: $appRoutes,
      initialLocation: const ListRouteData().location,
    );

    return MaterialApp.router(
      title: appName,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
