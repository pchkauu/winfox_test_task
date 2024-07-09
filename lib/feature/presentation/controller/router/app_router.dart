import 'package:auto_route/auto_route.dart';

import 'package:injectable/injectable.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [];
}
