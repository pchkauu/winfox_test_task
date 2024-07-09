import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:winfox_test_task/core/_barrel.dart';

@singleton
class HttpClient {
  final Dio _dio = Dio();

  HttpClient() {
    _dio
      ..options = BaseOptions(
        baseUrl: FlavorConfig.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        followRedirects: false,
        persistentConnection: true,
      )
      ..interceptors.add(LogSpecific.dioInterceptor);
  }

  Dio get send {
    return _dio;
  }
}
