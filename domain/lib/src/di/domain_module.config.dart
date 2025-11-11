// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/src/repository/preferences_repository/preferences_repository.dart'
    as _i627;
import 'package:domain/src/repository/product_repository/product_repository.dart'
    as _i350;
import 'package:domain/src/usecase/clear_theme_mode/clear_theme_mode.dart'
    as _i699;
import 'package:domain/src/usecase/get_product_list/get_product_list.dart'
    as _i390;
import 'package:domain/src/usecase/get_theme_mode/get_theme_mode.dart'
    as _i1066;
import 'package:domain/src/usecase/save_theme_mode/save_theme_mode.dart'
    as _i123;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initDomainModule({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i390.GetProductListUseCase>(
      () => _i390.GetProductListUseCase(gh<_i350.ProductRepository>()),
    );
    gh.factory<_i699.ClearThemeModeUseCase>(
      () => _i699.ClearThemeModeUseCase(gh<_i627.PreferencesRepository>()),
    );
    gh.factory<_i1066.GetThemeModeUseCase>(
      () => _i1066.GetThemeModeUseCase(gh<_i627.PreferencesRepository>()),
    );
    gh.factory<_i123.SaveThemeModeUseCase>(
      () => _i123.SaveThemeModeUseCase(gh<_i627.PreferencesRepository>()),
    );
    return this;
  }
}
