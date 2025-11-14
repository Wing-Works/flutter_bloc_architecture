// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/di/network_module.dart' as _i377;
import 'package:data/src/network/retrofit_service.dart' as _i1066;
import 'package:data/src/repository/preferences_repository/preferences_repository_impl.dart'
    as _i712;
import 'package:data/src/repository/product_repository/product_repository_impl.dart'
    as _i363;
import 'package:data/src/source/preferences_data_source/preferences_local_ds.dart'
    as _i532;
import 'package:data/src/source/preferences_data_source/preferences_local_ds_impl.dart'
    as _i524;
import 'package:data/src/source/product_data_source/product_ds.dart' as _i328;
import 'package:data/src/source/product_data_source/product_ds_impl.dart'
    as _i69;
import 'package:data/src/util/api_interceptor.dart' as _i519;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initDataModule({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.singleton<_i519.ApiInterceptor>(() => _i519.ApiInterceptor());
    gh.factory<_i532.PreferencesLocalDataSource>(
      () => _i524.PreferencesLocalDataSourceImpl(),
    );
    gh.singleton<List<_i361.Interceptor>>(
      () => networkModule.providerInterceptors(gh<_i519.ApiInterceptor>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.providerDio(gh<List<_i361.Interceptor>>()),
    );
    gh.lazySingleton<_i1066.RetrofitService>(
      () => networkModule.providerRetrofitService(gh<_i361.Dio>()),
    );
    gh.factory<_i494.PreferencesRepository>(
      () => _i712.PreferencesRepositoryImpl(
        preferencesLocalDataSource: gh<_i532.PreferencesLocalDataSource>(),
      ),
    );
    gh.factory<_i328.ProductDataSource>(
      () => _i69.ArticleDataSourceImpl(gh<_i1066.RetrofitService>()),
    );
    gh.factory<_i494.ProductRepository>(
      () => _i363.ProductRepositoryImpl(
        articleDataSource: gh<_i328.ProductDataSource>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i377.NetworkModule {}
