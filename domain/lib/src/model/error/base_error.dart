import 'package:domain/src/model/error/error_info.dart';

abstract class BaseError implements Exception {
  BaseError({required this.error, required this.cause});
  final ErrorInfo error;
  final Exception cause;

  String getFriendlyMessage();

  void logError() {}
}
