abstract class BaseError implements Exception {
  const BaseError({required this.code, required this.message, this.cause});

  final Exception? cause;
  final int code;
  final String message;

  String getFriendlyMessage() => message;

  @override
  String toString() {
    return '$runtimeType(message: $message, cause: ${cause ?? 'none'})';
  }
}
