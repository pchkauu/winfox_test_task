import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:winfox_test_task/core/_barrel.dart';

class LogSpecific {
  const LogSpecific();

  static void init() {
    _setBlocObserver();
  }

  static void _setBlocObserver() {
    Bloc.observer = TalkerBlocObserver(
      talker: Log.talker,
      settings: const TalkerBlocLoggerSettings(
        printChanges: true,
        printClosings: true,
        printCreations: true,
      ),
    );
  }

  static TalkerDioLogger get dioInterceptor {
    return TalkerDioLogger(
      talker: Log.talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
      ),
    );
  }
}
