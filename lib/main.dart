import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/injection/injection.dart';
import 'core/logger/logger.dart';

void main() async {
  await init();
  runApp(const Cofeegee());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.init();
  configureDependencies();
}
