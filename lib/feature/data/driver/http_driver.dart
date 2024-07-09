import 'package:injectable/injectable.dart';
import 'package:winfox_test_task/core/_barrel.dart';
import 'package:winfox_test_task/feature/data/_barrel.dart';

@singleton
class HttpDriver {
  final HttpClient _httpClient;

  const HttpDriver({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<FetchAllFruitsResponse> fetchAllFruits() async {
    return sendHttpRequest<FetchAllFruitsResponse>(() async {
      final response = await _httpClient.send.get(FlavorConfig.allFruits);

      final list = (response.data as List<dynamic>)
          .map((json) => FruitRemoteDto.fromJson(json as Map<String, Object?>))
          .toList();

      return FetchAllFruitsResponse(fruits: list);
    });
  }
}
