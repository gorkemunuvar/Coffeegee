// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/coffee/data/data_sources/remote/coffee.dart' as _i5;
import '../../features/coffee/data/repositories/coffee.dart' as _i7;
import '../../features/coffee/domain/repositories/coffee.dart' as _i6;
import '../../features/coffee/domain/use_cases/get_coffee_list.dart' as _i8;
import '../../features/coffee/domain/use_cases/use_cases.dart' as _i4;
import '../../features/coffee/presentation/cubit/coffee_list_cubit.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.ICoffeeRemoteDataSource>(() => _i5.CoffeeRemoteDataSource());
  gh.factory<_i6.ICoffeeRepository>(
      () => _i7.CoffeeRepository(get<_i5.ICoffeeRemoteDataSource>()));
  gh.factory<_i8.GetCoffeeList>(
      () => _i8.GetCoffeeList(get<_i6.ICoffeeRepository>()));
  return get;
}
