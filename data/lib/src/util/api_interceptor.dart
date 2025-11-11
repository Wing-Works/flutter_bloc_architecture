import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }
}
