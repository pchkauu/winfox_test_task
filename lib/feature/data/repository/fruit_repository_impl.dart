import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:winfox_test_task/feature/data/_barrel.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

@Singleton(as: IFruitRepository)
class FruitRepositoryImpl implements IFruitRepository {
  final HttpDriver _httpDriver;

  FruitRepositoryImpl({
    required HttpDriver httpDriver,
  }) : _httpDriver = httpDriver;

  @override
  Future<Either<Failure, List<Fruit>>> fetchAllFruits() async {
    return executeMethod<List<Fruit>>(
      () async {
        final response = await _httpDriver.fetchAllFruits();

        return response.toDomain();
      },
    );
  }
}
