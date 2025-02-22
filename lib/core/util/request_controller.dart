import 'package:domain/domain.dart';

mixin RequestController {
  Future<void> apiCall<T>(
    BaseUseCase<NetworkError, Params, T> createCall, {
    required Params params,
    required void Function(T) onSuccess,
    void Function(BaseError)? onFailure,
  }) async {
    await createCall.execute(params).then((value) {
      value.fold((error) {
        onFailure?.call(error);
      }, (data) {
        onSuccess(data);
      });
    });
  }
}
