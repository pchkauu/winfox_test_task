import 'package:either_dart/either.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';

// ignore: one_member_abstracts
abstract interface class IFruitRepository {
  Future<Either<Failure, List<Fruit>>> fetchAllFruits();
}
