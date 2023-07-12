import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../entities/coffee.dart';
import '../repositories/coffee.dart';

@injectable
class AddFavorite {
  const AddFavorite(this._repository);

  final ICoffeeRepository _repository;

  Future<Either<Failure, Success>> call(Coffee coffee) async {
    return await _repository.addFavorite(coffee);
  }
}
