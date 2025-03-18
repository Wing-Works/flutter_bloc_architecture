import 'package:domain/domain.dart';

mixin RequestController {
  Future<void> apiCall<T>(
    BaseUseCase<NetworkError, Params, T> createCall, {
    required Params params,
    required void Function(T) onSuccess,
    void Function(BaseError)? onFailure,
  }) async {
    final result = await createCall.execute(params);

    if (result case (null, T data)) {
      onSuccess(data);
    } else if (result case (NetworkError error, null)) {
      onFailure?.call(error);
    }
  }
}
