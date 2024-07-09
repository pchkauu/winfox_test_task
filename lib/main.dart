import 'dart:async';

import 'package:winfox_test_task/core/_barrel.dart';

Future<void> main() async {
  await runZonedGuarded(
    entry,
    Log.handleGlobal,
  );
}
