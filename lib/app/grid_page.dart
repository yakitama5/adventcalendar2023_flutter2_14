import 'package:flutter/material.dart';

import 'router/branch_b_router.dart';
import 'router/router.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = List.generate(
      50,
      (index) => InkWell(
        child: GridTile(
          child: ColoredBox(
            color: Colors.red[100]!,
            child: Center(child: Text('GridTile $index')),
          ),
        ),
        onTap: () => GridDetailRouteData(index).go(context),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: list,
        ),
      ),
    );
  }
}
