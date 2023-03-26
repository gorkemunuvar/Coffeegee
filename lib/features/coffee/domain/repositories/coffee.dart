import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/coffee.dart';

abstract class ICoffeeRepository {
  Future<Either<Failure, List<Coffee>>> getCoffeeList();
}
