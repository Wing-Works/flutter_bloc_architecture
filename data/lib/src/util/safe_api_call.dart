import 'dart:developer';
import 'dart:io';
import 'package:data/src/entity/remote/error/error_entity.dart';
import 'package:data/src/util/base_layer_transformer.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:twofold/twofold.dart';

/// Safely executes an API call and transforms errors into domain-specific [NetworkError].
///
/// Returns [Right] with transformed data on success, or [Left] with [NetworkError] on failure.
///
/// Example:
/// ```dart
/// final result = await safeApiCall(() => apiService.fetchUser(id));
/// result.fold(
///   (error) => print('Error: ${error.message}'),
///   (user) => print('Success: $user'),
/// );
/// ```
Future<Twofold<S, NetworkError>> safeApiCall<S>(
  Future<BaseLayerDataTransformer<S>> Function() apiCall,
) async {
  try {
    final response = await apiCall();
    return Twofold.success(response.transform);
  } on DioException catch (e, stackTrace) {
    return Twofold.error(_handleDioException(e, stackTrace));
  } on SocketException catch (e, stackTrace) {
    log('Socket exception occurred', error: e, stackTrace: stackTrace);
    return Twofold.error(
      NetworkError(
        message: 'No internet connection',
        httpError: HttpStatus.serviceUnavailable,
        cause: e,
      ),
    );
  } on IOException catch (e, stackTrace) {
    log('IO exception occurred', error: e, stackTrace: stackTrace);
    return Twofold.error(
      NetworkError(
        message: 'Network communication failed',
        httpError: HttpStatus.badGateway,
        cause: e,
      ),
    );
  } on FormatException catch (e, stackTrace) {
    log('Data format exception', error: e, stackTrace: stackTrace);
    return Twofold.error(
      NetworkError(
        message: 'Invalid data format received from server',
        httpError: HttpStatus.unprocessableEntity,
        cause: e,
      ),
    );
  } catch (e, stackTrace) {
    log('Unexpected error in API call', error: e, stackTrace: stackTrace);
    return Twofold.error(
      NetworkError(
        message: 'An unexpected error occurred',
        httpError: HttpStatus.internalServerError,
        cause: e is Exception ? e : Exception(e.toString()),
      ),
    );
  }
}

/// Handles [DioException] and converts it to [NetworkError].
NetworkError _handleDioException(DioException e, StackTrace stackTrace) {
  final statusCode = e.response?.statusCode;
  final statusMessage = e.response?.statusMessage;

  // Try to parse custom error response if available
  if (e.response?.data != null && e.response!.data is Map<String, dynamic>) {
    try {
      final errorEntity = ErrorEntity.fromJson(
        e.response!.data as Map<String, dynamic>,
      );
      return NetworkError(
        message: errorEntity.message,
        httpError: errorEntity.code,
        cause: e,
      );
    } catch (e) {
      log('Failed to parse custom error response', error: e);
    }
  }

  // Handle different DioException types
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return NetworkError(
        message: 'Connection timeout. Please check your internet connection.',
        httpError: HttpStatus.gatewayTimeout,
        cause: e,
      );

    case DioExceptionType.sendTimeout:
      return NetworkError(
        message: 'Request timeout. Please try again.',
        httpError: HttpStatus.gatewayTimeout,
        cause: e,
      );

    case DioExceptionType.receiveTimeout:
      return NetworkError(
        message: 'Server response timeout. Please try again.',
        httpError: HttpStatus.gatewayTimeout,
        cause: e,
      );

    case DioExceptionType.badCertificate:
      return NetworkError(
        message: 'Security certificate verification failed',
        httpError: HttpStatus.badGateway,
        cause: e,
      );

    case DioExceptionType.badResponse:
      return NetworkError(
        message: statusMessage ?? 'Server returned an error response',
        httpError: statusCode ?? HttpStatus.badRequest,
        cause: e,
      );

    case DioExceptionType.cancel:
      return NetworkError(
        message: 'Request was cancelled',
        httpError: 499, // Client Closed Request
        cause: e,
      );

    case DioExceptionType.connectionError:
      return NetworkError(
        message: 'Failed to connect to server. Please check your internet.',
        httpError: HttpStatus.serviceUnavailable,
        cause: e,
      );

    case DioExceptionType.unknown:
      return NetworkError(
        message: e.message ?? 'An unknown network error occurred',
        httpError: statusCode ?? HttpStatus.internalServerError,
        cause: e,
      );
  }
}
