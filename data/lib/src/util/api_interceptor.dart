import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(options, handler) async {
    return handler.next(options);
  }
}
