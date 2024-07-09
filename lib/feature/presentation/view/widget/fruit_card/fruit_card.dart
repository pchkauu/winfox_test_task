import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

class FruitCard extends StatelessWidget {
  final Fruit fruit;

  const FruitCard({
    required this.fruit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () async {
          await context.router.push(FruitDetails(fruit: fruit));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fruit.name,
                style: textTheme.titleMedium?.copyWith(color: Colors.black87),
              ),
              const Icon(
                CupertinoIcons.arrow_right,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
