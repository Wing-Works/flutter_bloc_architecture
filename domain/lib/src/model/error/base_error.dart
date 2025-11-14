abstract class BaseError implements Exception {
  const BaseError({required this.cause, this.code, this.message = ''});

  final Exception cause;
  final int? code;
  final String message;

  String getFriendlyMessage() => message;

  @override
  String toString() {
    return 'BaseError(message: $message, cause: $cause)';
  }
}
