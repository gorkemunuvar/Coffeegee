import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../repositories/coffee.dart';

@injectable
class DeleteFavorite {
  const DeleteFavorite(this._repository);

  final ICoffeeRepository _repository;

  Future<Either<Failure, Success>> call(String id) async {
    return await _repository.deleteFavorite(int.parse(id));
  }
}
