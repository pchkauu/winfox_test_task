import 'dart:async';

import 'package:dio/dio.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

Future<Never> processBadResponse({
  required DioException badResponse,
}) async {
  throw FailureKey();
}
