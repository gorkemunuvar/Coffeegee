part of 'coffee_list_cubit.dart';

@freezed
class CoffeeListState with _$CoffeeListState {
  const factory CoffeeListState.initial() = CoffeeListInitial;
  const factory CoffeeListState.loading() = CoffeeListLoading;
  const factory CoffeeListState.loaded(List<Coffee> coffees) = CoffeeListLoaded;
  const factory CoffeeListState.couldNotLoad({String? message}) = CoffeeListCouldNotLoad;
}
