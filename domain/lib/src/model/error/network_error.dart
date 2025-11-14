import 'package:domain/src/model/error/base_error.dart';

class NetworkError extends BaseError {
  const NetworkError({
    required super.cause,
    int httpError = 0,
    super.message = '',
  }) : super(code: httpError);

  @override
  String getFriendlyMessage() {
    if (message.isNotEmpty) return message;

    if (code != null) {
      return 'Network error (HTTP $code). Please check your connection.';
    }

    return 'Network error. Please check your connection.';
  }

  @override
  String toString() {
    return 'NetworkError(httpCode: $code, message: $message, cause: $cause)';
  }
}
