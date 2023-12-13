import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
