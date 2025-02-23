import 'package:flutter/material.dart';
import 'package:winfox_test_task/core/_barrel.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

Future<void> entry() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await configureDependencies();

  runApp(const WinfoxApplication());
}
