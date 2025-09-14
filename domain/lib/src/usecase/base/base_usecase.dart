import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/usecase/base/params.dart';

abstract class BaseUseCase<P extends Params, T> {
  Future<Either<NetworkError, T>> execute(P params);
}

abstract class BaseUsesCaseNoParams<T> {
  Future<Either<NetworkError, T>> execute();
}
