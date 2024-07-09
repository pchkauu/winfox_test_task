import 'package:either_dart/either.dart';
import 'package:winfox_test_task/core/_barrel.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

Future<Either<Failure, T>> executeMethod<T>(
  Future<T> Function() methodLogic,
) async {
  try {
    return Right(await methodLogic());
  } on Failure catch (failure) {
    await Log.f(
      failure.error ?? Error(),
      failure.stackTrace,
    );

    return Left(failure);
  } on Object catch (error, stackTrace) {
    await Log.f(
      error,
      stackTrace,
    );

    final failure = Failure(
      error: error,
      stackTrace: stackTrace,
      key: FailureKey(),
    );

    return Left(failure);
  }
}
