import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/database_error.dart';
import 'package:domain/src/repository/preferences_repository/preferences_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearThemeModeUseCase extends UseCaseExecutor<void> {
  ClearThemeModeUseCase(this._preferencesRepository);

  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<DatabaseError, bool>> execute() async {
    return _preferencesRepository.clearThemeMode();
  }
}
