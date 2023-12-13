import 'package:flutter/material.dart';

import 'router/branch_a_router.dart';
import 'router/router.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (_, i) => ListTile(
            title: Text('ListTile $i'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => ListDetailRouteData(i).go(context),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 50,
        ),
      ),
    );
  }
}
