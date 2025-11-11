import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/repository/preferences_repository/preferences_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetThemeModeUseCase extends BaseUsesCaseNoParams<bool> {
  GetThemeModeUseCase(this._preferencesRepository);

  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<NetworkError, bool>> execute() async {
    return _preferencesRepository.getThemeMode();
  }
}
