import 'package:equatable/equatable.dart';

class FruitNutritions extends Equatable {
  final double calories;
  final double fat;
  final double sugar;
  final double carbohydrates;
  final double protein;

  const FruitNutritions({
    required this.calories,
    required this.fat,
    required this.sugar,
    required this.carbohydrates,
    required this.protein,
  });

  FruitNutritions copyWith({
    double? calories,
    double? fat,
    double? sugar,
    double? carbohydrates,
    double? protein,
  }) {
    return FruitNutritions(
      calories: calories ?? this.calories,
      fat: fat ?? this.fat,
      sugar: sugar ?? this.sugar,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      protein: protein ?? this.protein,
    );
  }

  @override
  List<Object?> get props => [
        calories,
        fat,
        sugar,
        carbohydrates,
        protein,
      ];
}
