part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = FavoritesInitial;

  const factory FavoritesState.loading() = FavoritesLoading;
  const factory FavoritesState.loaded(List<Coffee> coffees) = FavoritesLoaded;
  const factory FavoritesState.couldNotLoad({String? message}) = FavoritesCouldNotLoad;

  const factory FavoritesState.added({String? message}) = FavoritesAdded;
  const factory FavoritesState.couldNotAdd({String? message}) = FavoritesCouldNotAdd;

  const factory FavoritesState.deleted({String? message}) = FavoritesDeleted;
  const factory FavoritesState.couldNotDelete({String? message}) = FavoritesCouldNotDelete;
}
