// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i494;
import 'package:flutter_bloc_architecture/src/home/bloc/home_bloc.dart' as _i19;
import 'package:flutter_bloc_architecture/src/my_app/cubit/theme_cubit.dart'
    as _i499;
import 'package:flutter_bloc_architecture/src/product_page/bloc/product_page_bloc.dart'
    as _i834;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i19.HomeBloc>(
      () => _i19.HomeBloc(gh<_i494.GetProductListUseCase>()),
    );
    gh.factory<_i499.ThemeCubit>(
      () => _i499.ThemeCubit(
        gh<_i494.GetThemeModeUseCase>(),
        gh<_i494.SaveThemeModeUseCase>(),
        gh<_i494.ClearThemeModeUseCase>(),
      ),
    );
    gh.factory<_i834.ProductPageBloc>(
      () => _i834.ProductPageBloc(gh<_i494.GetProductDetailUseCase>()),
    );
    return this;
  }
}
