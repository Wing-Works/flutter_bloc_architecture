import 'package:domain/src/model/error/base_error.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:twofold/twofold.dart';

abstract class BaseUseCase<P extends Params, T> {
  Future<Twofold<T, BaseError>> execute(P params);
}

abstract class UseCaseExecutor<T> {
  Future<Twofold<T, BaseError>> execute();
}
