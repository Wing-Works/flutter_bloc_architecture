import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

mixin RequestController {
  Future<void> apiCall<T>(
    BaseUseCase<Params, T> createCall, {
    required Params params,
    required void Function(T) onSuccess,
    void Function(NetworkError)? onFailure,
  }) async {
    await createCall.execute(params).then((value) {
      value.fold((error) {
        onFailure?.call(error);
        log(''''══════════════════════════════════════════════════════════════════════════════════════════''');
        log('error: ${error.message}');
        log(''''══════════════════════════════════════════════════════════════════════════════════════════''');
      }, (data) {
        onSuccess(data);
      });
    });
  }
}
