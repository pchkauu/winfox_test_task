// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

part 'fruit_nutritions_remote_dto.freezed.dart';
part 'fruit_nutritions_remote_dto.g.dart';

@freezed
class FruitNutritionsRemoteDto with _$FruitNutritionsRemoteDto {
  const factory FruitNutritionsRemoteDto({
    @JsonKey(name: 'calories') required double calories,
    @JsonKey(name: 'fat') required double fat,
    @JsonKey(name: 'sugar') required double sugar,
    @JsonKey(name: 'carbohydrates') required double carbohydrates,
    @JsonKey(name: 'protein') required double protein,
  }) = _FruitNutritionsRemoteDto;

  factory FruitNutritionsRemoteDto.fromJson(Map<String, Object?> json) =>
      _$FruitNutritionsRemoteDtoFromJson(json);
}

extension FruitNutritionsRemoteDtoConverter on FruitNutritionsRemoteDto {
  FruitNutritions toDomain() {
    return FruitNutritions(
      calories: calories,
      fat: fat,
      sugar: sugar,
      carbohydrates: carbohydrates,
      protein: protein,
    );
  }
}
