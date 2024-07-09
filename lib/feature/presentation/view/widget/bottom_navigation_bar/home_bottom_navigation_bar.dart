import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:winfox_test_task/core/_barrel.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int selectedIndex = 0;

  late final TabsRouter tabsRouter;

  @override
  void initState() {
    super.initState();
    tabsRouter = AutoTabsRouter.of(context);
  }

  @override
  Widget build(BuildContext context) {
    Log.d(tabsRouter.activeIndex);

    return BottomNavigationBar(
      onTap: (index) {
        tabsRouter.setActiveIndex(index);

        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blueGrey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: 'Fruits',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logo_dev_rounded),
          label: 'Logo',
        ),
      ],
    );
  }
}
