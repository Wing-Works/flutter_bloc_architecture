import 'package:domain/src/model/error/base_error.dart';
import 'package:domain/src/usecase/base/params.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<(E?, T?)> execute(P params);
}
