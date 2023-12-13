import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/app.dart';

void main() {
  // WebのURLから "#" を削除
  usePathUrlStrategy();

  runApp(const AdaptiveApp());
}
