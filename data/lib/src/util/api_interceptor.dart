import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
}
