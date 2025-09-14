import 'package:domain/src/model/error/base_error.dart';

class NetworkError extends BaseError {
  const NetworkError({int httpError = 0, super.cause, super.message = ''})
    : super(code: httpError);

  @override
  String getFriendlyMessage() {
    if (message.isNotEmpty) return message;

    // Provide a sensible default when no message is supplied.
    return 'Network error (HTTP $code). Please check your connection.';
  }

  @override
  String toString() {
    return '$runtimeType(httpError: $code, message: $message, cause: ${cause ?? 'none'})';
  }
}
