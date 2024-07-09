import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

@RoutePage(name: 'Home')
class HomeScreen extends StatefulWidget {
  static const pages = [
    FruitList(),
    WinfoxLogo(),
  ];

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: HomeScreen.pages,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: const HomeBottomNavigationBar(),
        );
      },
    );
  }
}
