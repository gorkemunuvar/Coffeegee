import 'package:cofeegee/core/logger/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../entities/coffee.dart';
import '../repositories/coffee.dart';

@injectable
class GetCoffeeList {
  const GetCoffeeList(this._repository);

  final ICoffeeRepository _repository;

  Future<Either<Failure, List<Coffee>>> call() async {
    final failureOrCoffees = await _repository.getCoffeeList();
    final failureOrFavorites = await _repository.getFavorites();

    bool hasFailure = false;

    List<Coffee> coffees = [];
    failureOrCoffees.fold(
      (failure) => hasFailure = true,
      (coffeeList) => coffees = coffeeList,
    );

    if (hasFailure) {
      AppLogger.error('(GetCoffeeList) Could not load coffee list');
      return const Left(Failure(message: 'Could not load coffee list'));
    }

    List<String> favoritesIds = [];
    failureOrFavorites.fold(
      (failure) => hasFailure = true,
      (favorites) => favoritesIds = favorites.map((e) => e.id.toString()).toList(),
    );

    if (hasFailure) {
      AppLogger.error('(GetCoffeeList) Could not load favorites');
      return const Left(Failure(message: 'Could not load favorites'));
    }

    final coffeesWithFavorites = coffees.map((e) {
      if (favoritesIds.contains(e.id.toString())) {
        return e.copyWith(isFavorite: true);
      } else {
        return e.copyWith(isFavorite: false);
      }
    }).toList();

    return Right(coffeesWithFavorites);
  }
}
