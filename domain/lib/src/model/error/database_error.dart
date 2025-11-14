import 'package:domain/src/model/error/base_error.dart';

class DatabaseError extends BaseError {
  DatabaseError({super.message = '', Exception? cause})
    : super(cause: cause ?? Exception(message));

  factory DatabaseError.withMessage(String message) {
    return DatabaseError(cause: Exception(message), message: message);
  }

  @override
  String getFriendlyMessage() {
    if (message.isNotEmpty) return message;

    if (code != null) {
      return 'Database error (code: $code). Please try again later.';
    }

    return 'A database error occurred. Please try again later.';
  }

  @override
  String toString() {
    return 'DatabaseError(code: $code, message: $message, cause: $cause)';
  }
}
