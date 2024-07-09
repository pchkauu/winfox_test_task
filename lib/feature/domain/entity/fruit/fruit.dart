import 'package:equatable/equatable.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

class Fruit extends Equatable {
  final int id;

  final String name;
  final String family;
  final String order;
  final String genus;

  final FruitNutritions nutritions;

  const Fruit({
    required this.id,
    required this.name,
    required this.family,
    required this.order,
    required this.genus,
    required this.nutritions,
  });

  Fruit copyWith({
    int? id,
    String? name,
    String? family,
    String? order,
    String? genus,
    FruitNutritions? nutritions,
  }) {
    return Fruit(
      id: id ?? this.id,
      name: name ?? this.name,
      family: family ?? this.family,
      order: order ?? this.order,
      genus: genus ?? this.genus,
      nutritions: nutritions ?? this.nutritions,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        family,
        order,
        genus,
        nutritions,
      ];
}
