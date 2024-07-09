// ignore_for_file: avoid_annotating_with_dynam, avoid_annotating_with_dynamic
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:winfox_test_task/core/_barrel.dart';

class Log {
  static Talker talker = Talker(
    logger: TalkerLogger(),
    settings: TalkerSettings(),
    filter: BaseTalkerFilter(),
  );

  const Log();

  static void init() {
    talker = TalkerFlutter.init(
      logger: TalkerLogger(),
      settings: TalkerSettings(
        maxHistoryItems: 3000,
      ),
      filter: BaseTalkerFilter(),
    );

    LogSpecific.init();
  }

  static void d(
    dynamic msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (kReleaseMode) return;

    talker.debug(
      msg,
      exception,
      stackTrace,
    );
  }

  static Future<void> f(
    Object exception,
    StackTrace? stackTrace,
  ) async {
    if (kReleaseMode) return;

    talker.handle(
      exception,
      stackTrace,
      exception.toString(),
    );
  }

  static Future<void> w(
    dynamic msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) async {
    if (kReleaseMode) return;

    talker.warning(
      msg,
      exception,
      stackTrace,
    );
  }

  static Future<void> handleGlobal(
    Object exception,
    StackTrace? stackTrace,
  ) async {
    if (kReleaseMode) return;

    talker.handle(
      exception,
      stackTrace,
      'Catched In Global Zone',
    );
  }
}
