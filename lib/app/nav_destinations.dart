import 'package:flutter/material.dart';

enum NavDestination {
  navA(
    'Nav A',
    'Nav A',
    Icons.view_list_outlined,
    Icons.view_list,
  ),
  navB(
    'Nav B',
    'Nav B',
    Icons.grid_view_outlined,
    Icons.grid_view_sharp,
  ),
  navC(
    'Nav C',
    'Nav C',
    Icons.settings_outlined,
    Icons.settings,
  );

  const NavDestination(
    this.label,
    this.tooltip,
    this.icon,
    this.selectedIcon,
  );

  final String label;
  final String tooltip;
  final IconData icon;
  final IconData selectedIcon;
}
