import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'FruitList')
class FruitListPage extends StatelessWidget {
  const FruitListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('List Page'),
    );
  }
}
