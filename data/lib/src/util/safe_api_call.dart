import 'dart:io';

import 'package:data/src/entity/remote/error/error_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

Future<(NetworkError?, T?)> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final response = await apiCall;
    return (null, response);
  } on DioException catch (e) {
    if (e.response != null) {
      try {
        final ErrorEntity errorResponseEntity =
            ErrorEntity.fromJson(e.response!.data);
        return (
          NetworkError(
            httpError: errorResponseEntity.code,
            message: errorResponseEntity.message,
            cause: Exception("Server Response Error"),
          ),
          null
        );
      } catch (_) {
        return (
          NetworkError(
            cause: Exception("Server Response Error"),
            httpError: e.response?.statusCode ?? 404,
            message: e.response?.statusMessage ?? '',
          ),
          null
        );
      }
    }

    // Handle Dio Error Types
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return (
          NetworkError(
            message: 'Connection timeout with API server',
            httpError: 504,
            cause: e,
          ),
          null
        );
      case DioExceptionType.sendTimeout:
        return (
          NetworkError(
            message: 'Send timeout exception',
            httpError: 504,
            cause: e,
          ),
          null
        );
      case DioExceptionType.receiveTimeout:
        return (
          NetworkError(
            message: 'Receive timeout in connection with API server',
            httpError: 504,
            cause: e,
          ),
          null
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return (
          NetworkError(
            message: e.message ?? 'Unknown error',
            httpError: 502,
            cause: e,
          ),
          null
        );
    }
  } on IOException catch (e) {
    return (
      NetworkError(
        message: e.toString(),
        httpError: 502,
        cause: e,
      ),
      null
    );
  } catch (e) {
    return (
      NetworkError(
        message: e.toString(),
        httpError: 500,
        cause: Exception(e),
      ),
      null
    );
  }
}