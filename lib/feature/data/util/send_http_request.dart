import 'package:dio/dio.dart';
import 'package:winfox_test_task/feature/data/_barrel.dart';

Future<T> sendHttpRequest<T>(
  Future<T> Function() requestLogic,
) async {
  try {
    return await requestLogic();
  } on DioException catch (exception) {
    return processBadResponse(
      badResponse: exception,
    );
  } on Object {
    rethrow;
  }
}
