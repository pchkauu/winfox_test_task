import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

@RoutePage(name: 'FruitDetails')
class FruitDetailsPage extends StatelessWidget {
  final Fruit fruit;

  const FruitDetailsPage({
    required this.fruit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Верстал быстро, не вижу смысла декомпозировать такую простую верстку

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.blueGrey.shade100,
        title: Text(
          fruit.name,
          style: textTheme.headlineLarge,
        ),
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(CupertinoIcons.arrow_left),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        children: [
          Align(
            child: Text(
              'Information',
              style: textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 24),
          FruitDetailSection(title: 'Family', value: fruit.family),
          const SizedBox(height: 12),
          FruitDetailSection(title: 'Genus', value: fruit.genus),
          const SizedBox(height: 32),
          Align(
            child: Text(
              'Nutritions',
              style: textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 24),
          FruitDetailSection(
            title: 'Caloriess',
            value: fruit.nutritions.calories,
          ),
          const SizedBox(height: 12),
          FruitDetailSection(
            title: 'Carbohydrates',
            value: fruit.nutritions.carbohydrates,
          ),
          const SizedBox(height: 12),
          FruitDetailSection(
            title: 'Fat',
            value: fruit.nutritions.fat,
          ),
          const SizedBox(height: 12),
          FruitDetailSection(
            title: 'Protein',
            value: fruit.nutritions.protein,
          ),
          const SizedBox(height: 12),
          FruitDetailSection(
            title: 'Sugar',
            value: fruit.nutritions.sugar,
          ),
        ],
      ),
    );
  }
}

class FruitDetailSection extends StatelessWidget {
  final String title;
  final Object value;

  const FruitDetailSection({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(color: Colors.black54),
        ),
        Text(
          value.toString(),
          style: textTheme.titleLarge,
        ),
      ],
    );
  }
}
