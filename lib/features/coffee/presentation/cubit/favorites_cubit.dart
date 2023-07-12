import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/coffee.dart';
import '../../domain/use_cases/use_cases.dart';

part 'favorites_cubit.freezed.dart';
part 'favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(
    this._getCoffeeList,
    this._addFavorite,
    this._deleteFavorite,
  ) : super(const FavoritesState.initial());

  final GetFavorites _getCoffeeList;
  final AddFavorite _addFavorite;
  final DeleteFavorite _deleteFavorite;

  Future<void> init() async {
    _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    emit(const FavoritesState.loading());

    final failureOrCoffees = await _getCoffeeList();
    failureOrCoffees.fold(
      (failure) => emit(FavoritesState.couldNotLoad(message: failure.message)),
      (coffees) => emit(FavoritesState.loaded(coffees)),
    );
  }

  Future<void> onFavoriteButtonPressed(Coffee coffee) async {
    coffee.isFavorite ? await _deleteFav(coffee.id) : await _addFav(coffee);

    if (state is FavoritesAdded || state is FavoritesDeleted) {
      _fetchFavorites();
    }
  }

  Future<void> _addFav(Coffee coffee) async {
    final failureOrSuccess = await _addFavorite(coffee);
    failureOrSuccess.fold(
      (failure) => emit(FavoritesState.couldNotAdd(message: failure.message)),
      (success) => emit(const FavoritesState.added()),
    );
  }

  Future<void> _deleteFav(int id) async {
    final failureOrSuccess = await _deleteFavorite(id.toString());
    failureOrSuccess.fold(
      (failure) => emit(FavoritesState.couldNotDelete(message: failure.message)),
      (success) => emit(const FavoritesState.deleted()),
    );
  }
}
