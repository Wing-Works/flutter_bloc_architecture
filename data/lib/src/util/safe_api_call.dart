import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/src/entity/remote/error/error_entity.dart';
import 'package:data/src/util/base_layer_transformer.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

Future<Either<NetworkError, S>>
safeApiCall<T extends BaseLayerDataTransformer<S>, S>(Future<T> apiCall) async {
  try {
    final response = await apiCall;

    return right(response.transform);
  } on DioException catch (e) {
    if (e.response != null) {
      try {
        final errorResponseEntity = ErrorEntity.fromJson(
          e.response!.data as Map<String, dynamic>,
        );
        return left(
          NetworkError(
            httpError: errorResponseEntity.code,
            message: errorResponseEntity.message,
            cause: Exception('Server Response Error'),
          ),
        );
      } catch (_) {
        return left(
          NetworkError(
            cause: Exception('Server Response Error'),
            httpError: e.response?.statusCode ?? 404,
            message: e.response?.statusMessage ?? '',
          ),
        );
      }
    }

    // Handle Dio Error Types
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return left(
          NetworkError(
            message: 'Connection timeout with API server',
            httpError: 504,
            cause: e,
          ),
        );
      case DioExceptionType.sendTimeout:
        return left(
          NetworkError(
            message: 'Send timeout exception',
            httpError: 504,
            cause: e,
          ),
        );
      case DioExceptionType.receiveTimeout:
        return left(
          NetworkError(
            message: 'Receive timeout in connection with API server',
            httpError: 504,
            cause: e,
          ),
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return left(
          NetworkError(
            message: e.message ?? 'Unknown error',
            httpError: 502,
            cause: e,
          ),
        );
    }
  } on IOException catch (e) {
    return left(NetworkError(message: e.toString(), httpError: 502, cause: e));
  } catch (e) {
    return left(
      NetworkError(message: e.toString(), httpError: 500, cause: Exception(e)),
    );
  }
}
