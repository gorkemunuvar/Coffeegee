// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/coffee/data/data_sources/local/coffee.dart' as _i6;
import '../../features/coffee/data/data_sources/remote/coffee.dart' as _i7;
import '../../features/coffee/data/repositories/coffee.dart' as _i9;
import '../../features/coffee/domain/repositories/coffee.dart' as _i8;
import '../../features/coffee/domain/use_cases/add_favorite.dart' as _i11;
import '../../features/coffee/domain/use_cases/delete_favorite.dart' as _i12;
import '../../features/coffee/domain/use_cases/get_coffee_list.dart' as _i13;
import '../../features/coffee/domain/use_cases/get_favorites.dart' as _i14;
import '../../features/coffee/domain/use_cases/use_cases.dart' as _i4;
import '../../features/coffee/presentation/cubit/coffee_list_cubit.dart' as _i3;
import '../../features/coffee/presentation/cubit/favorites_cubit.dart' as _i5;
import '../storage/local_storage.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CoffeeListCubit>(
      () => _i3.CoffeeListCubit(get<_i4.GetCoffeeList>()));
  gh.factory<_i5.FavoritesCubit>(() => _i5.FavoritesCubit(
        get<_i4.GetFavorites>(),
        get<_i4.AddFavorite>(),
        get<_i4.DeleteFavorite>(),
      ));
  gh.factory<_i6.ICoffeeLocalDataSource>(() => _i6.CoffeeLocalDataSource());
  gh.factory<_i7.ICoffeeRemoteDataSource>(() => _i7.CoffeeRemoteDataSource());
  gh.factory<_i8.ICoffeeRepository>(() => _i9.CoffeeRepository(
        get<_i7.ICoffeeRemoteDataSource>(),
        get<_i6.ICoffeeLocalDataSource>(),
      ));
  gh.factory<_i10.ILocalStorage>(() => _i10.SharedPrefStorage());
  gh.factory<_i11.AddFavorite>(
      () => _i11.AddFavorite(get<_i8.ICoffeeRepository>()));
  gh.factory<_i12.DeleteFavorite>(
      () => _i12.DeleteFavorite(get<_i8.ICoffeeRepository>()));
  gh.factory<_i13.GetCoffeeList>(
      () => _i13.GetCoffeeList(get<_i8.ICoffeeRepository>()));
  gh.factory<_i14.GetFavorites>(
      () => _i14.GetFavorites(get<_i8.ICoffeeRepository>()));
  return get;
}
