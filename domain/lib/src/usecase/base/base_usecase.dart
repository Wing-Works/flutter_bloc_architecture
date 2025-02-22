import 'package:domain/src/model/error/base_error.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute(P params);
}
