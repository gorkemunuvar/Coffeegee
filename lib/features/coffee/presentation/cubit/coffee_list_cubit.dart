import 'package:cofeegee/core/logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/coffee.dart';
import '../../domain/use_cases/use_cases.dart';

part 'coffee_list_cubit.freezed.dart';
part 'coffee_list_state.dart';

@injectable
class CoffeeListCubit extends Cubit<CoffeeListState> {
  CoffeeListCubit(this._getCoffeeList) : super(const CoffeeListState.initial());

  final GetCoffeeList _getCoffeeList;

  Future<void> fetchCoffees() async {
    emit(const CoffeeListState.loading());

    final failureOrCoffees = await _getCoffeeList();
    failureOrCoffees.fold(
      (failure) => emit(CoffeeListState.couldNotLoad(message: failure.message)),
      (coffees) => emit(CoffeeListState.loaded(coffees)),
    );
  }
}
