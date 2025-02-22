import 'package:data/src/network/retrofit_service.dart';
import 'package:data/src/util/api_interceptor.dart';
import 'package:data/src/util/network_constant.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule with NetworkConstant {
  @lazySingleton
  Dio providerDio(List<Interceptor> interceptors) {
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.addAll(interceptors);
    return dio;
  }

  @singleton
  PrettyDioLogger logger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }

  @singleton
  ApiInterceptor provideApiInterceptor() {
    return ApiInterceptor();
  }

  @singleton
  List<Interceptor> providerInterceptors(ApiInterceptor apiInterceptor) {
    return <Interceptor>[
      logger(),
      apiInterceptor,
    ];
  }

  @lazySingleton
  RetrofitService providerRetrofitService(Dio dio) => RetrofitService(dio);
}
