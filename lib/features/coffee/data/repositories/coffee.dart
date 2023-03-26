import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/logger/logger.dart';
import '../../domain/entities/coffee.dart';
import '../../domain/repositories/coffee.dart';
import '../data_sources/remote/coffee.dart';

@Injectable(as: ICoffeeRepository)
class CoffeeRepository implements ICoffeeRepository {
  const CoffeeRepository(this._remoteSource);

  final ICoffeeRemoteDataSource _remoteSource;

  @override
  Future<Either<Failure, List<Coffee>>> getCoffeeList() async {
    try {
      final coffeeModels = await _remoteSource.getCoffeeList();
      final coffees = coffeeModels.map((model) => Coffee.fromModel(model)).toList();
      return Right(coffees);
    } catch (error) {
      AppLogger.error('(CoffeeRepository) getCoffeeList: $error');
      return Left(Failure(message: error.toString()));
    }
  }
}
