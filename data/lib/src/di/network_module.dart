import 'package:data/src/network/retrofit_service.dart';
import 'package:data/src/util/api_interceptor.dart';
import 'package:data/src/util/network_constant.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio providerDio(List<Interceptor> interceptors) {
    final dio = Dio(BaseOptions(baseUrl: NetworkConstant.baseUrl));
    dio.interceptors.addAll(interceptors);
    return dio;
  }

  PrettyDioLogger get _logger {
    return PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    );
  }

  @singleton
  List<Interceptor> providerInterceptors(ApiInterceptor apiInterceptor) {
    return <Interceptor>[_logger, apiInterceptor];
  }

  @lazySingleton
  RetrofitService providerRetrofitService(Dio dio) => RetrofitService(dio);
}
