import 'package:cofeegee/features/coffee/data/data_sources/local/coffee.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/logger/logger.dart';
import '../../domain/entities/coffee.dart';
import '../../domain/repositories/coffee.dart';
import '../data_sources/remote/coffee.dart';
import '../models/coffee.dart';

@Injectable(as: ICoffeeRepository)
class CoffeeRepository implements ICoffeeRepository {
  const CoffeeRepository(this._remoteSource, this._localSource);

  final ICoffeeRemoteDataSource _remoteSource;
  final ICoffeeLocalDataSource _localSource;

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

  @override
  Future<Either<Failure, List<Coffee>>> getFavorites() async {
    try {
      final coffeeModels = await _localSource.getFavorites();
      final coffees = coffeeModels.map((model) => Coffee.fromModel(model)).toList();
      return Right(coffees);
    } catch (error) {
      AppLogger.error('(CoffeeRepository) getFavorites: $error');
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> addFavorite(Coffee coffee) async {
    try {
      final coffeeModel = CoffeeModel.fromEntity(coffee);
      await _localSource.addFavorite(coffeeModel);
      return Right(Success());
    } catch (error) {
      AppLogger.error('(CoffeeRepository) addFavorite: $error');
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteFavorite(int id) async {
    try {
      await _localSource.deleteFavorite(id);
      return Right(Success());
    } catch (error) {
      AppLogger.error('(CoffeeRepository) deleteFavorite: $error');
      return Left(Failure(message: error.toString()));
    }
  }
}
