// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:winfox_test_task/feature/data/_barrel.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

part 'fetch_all_fruits_response.freezed.dart';
part 'fetch_all_fruits_response.g.dart';

@freezed
class FetchAllFruitsResponse with _$FetchAllFruitsResponse {
  const factory FetchAllFruitsResponse({
    required List<FruitRemoteDto> fruits,
  }) = _FetchAllFruitsResponse;

  factory FetchAllFruitsResponse.fromJson(Map<String, Object?> json) =>
      _$FetchAllFruitsResponseFromJson(json);
}

extension FetchAllFruitsResponseConverter on FetchAllFruitsResponse {
  List<Fruit> toDomain() {
    return fruits.map((e) => e.toDomain()).toList();
  }
}
