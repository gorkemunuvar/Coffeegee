import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/coffee.dart';

abstract class ICoffeeRepository {
  Future<Either<Failure, List<Coffee>>> getCoffeeList();
  Future<Either<Failure, List<Coffee>>> getFavorites();
  Future<Either<Failure, Success>> addFavorite(Coffee coffee);
  Future<Either<Failure, Success>> deleteFavorite(int id);
}
