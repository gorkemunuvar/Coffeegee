import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../entities/coffee.dart';
import '../repositories/coffee.dart';

@injectable
class GetFavorites {
  const GetFavorites(this._repository);

  final ICoffeeRepository _repository;

  Future<Either<Failure, List<Coffee>>> call() {
    return _repository.getFavorites();
  }
}
