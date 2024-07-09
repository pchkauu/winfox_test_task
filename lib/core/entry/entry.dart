import 'package:flutter/material.dart';
import 'package:winfox_test_task/core/_barrel.dart';
import 'package:winfox_test_task/core/injection/configure_dependencies.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';
import 'package:winfox_test_task/feature/presentation/view/_barrel.dart';

Future<void> entry() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await configureDependencies();

  final result = await getIt<IFruitRepository>().fetchAllFruits();

  Log.d(result);

  runApp(const WinfoxApplication());
}
