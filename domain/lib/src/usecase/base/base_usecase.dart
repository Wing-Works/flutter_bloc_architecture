import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/base_error.dart';
import 'package:domain/src/usecase/base/params.dart';

abstract class BaseUseCase<P extends Params, T> {
  Future<Either<BaseError, T>> execute(P params);
}

abstract class UseCaseExecutor<T> {
  Future<Either<BaseError, T>> execute();
}
