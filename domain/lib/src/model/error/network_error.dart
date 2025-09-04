import 'package:domain/src/model/error/base_error.dart';
import 'package:domain/src/model/error/error_info.dart';

class NetworkError extends BaseError {
  NetworkError({
    required int httpError,
    required super.cause,
    String message = '',
  }) : super(error: ErrorInfo(code: httpError, message: message));

  @override
  String getFriendlyMessage() {
    return error.message;
  }
}
