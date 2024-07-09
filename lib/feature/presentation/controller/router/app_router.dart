import 'package:auto_route/auto_route.dart';

import 'package:injectable/injectable.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/',
          page: Home.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              path: 'fruit_list',
              page: FruitList.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: 'winfox_logo',
              page: WinfoxLogo.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
        CustomRoute(
          path: '/details',
          page: FruitDetails.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
