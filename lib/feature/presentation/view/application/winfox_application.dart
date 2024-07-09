import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:winfox_test_task/core/_barrel.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

class WinfoxApplication extends StatelessWidget {
  const WinfoxApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue.shade400,
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Winfox Test Task',
      themeMode: ThemeMode.dark,
      theme: theme,
      routerConfig: getIt<AppRouter>().config(
        navigatorObservers: () => [
          TalkerRouteObserver(
            Log.talker,
          ),
        ],
      ),
    );
  }
}
