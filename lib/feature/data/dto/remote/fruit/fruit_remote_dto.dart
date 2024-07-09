// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:winfox_test_task/feature/data/_barrel.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

part 'fruit_remote_dto.freezed.dart';
part 'fruit_remote_dto.g.dart';

@freezed
class FruitRemoteDto with _$FruitRemoteDto {
  const factory FruitRemoteDto({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'family') required String family,
    @JsonKey(name: 'order') required String order,
    @JsonKey(name: 'genus') required String genus,
    @JsonKey(name: 'nutritions') required FruitNutritionsRemoteDto nutritions,
  }) = _FruitRemoteDto;

  factory FruitRemoteDto.fromJson(Map<String, Object?> json) =>
      _$FruitRemoteDtoFromJson(json);
}

extension FruitRemoteDtoConverter on FruitRemoteDto {
  Fruit toDomain() {
    return Fruit(
      id: id,
      name: name,
      family: family,
      order: order,
      genus: genus,
      nutritions: nutritions.toDomain(),
    );
  }
}
