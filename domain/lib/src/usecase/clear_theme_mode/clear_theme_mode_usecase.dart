import 'package:domain/src/model/error/database_error.dart';
import 'package:domain/src/repository/preferences_repository/preferences_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:twofold/twofold.dart';

@injectable
class ClearThemeModeUseCase extends UseCaseExecutor<void> {
  ClearThemeModeUseCase(this._preferencesRepository);

  final PreferencesRepository _preferencesRepository;

  @override
  Future<Twofold<bool, DatabaseError>> execute() async {
    return _preferencesRepository.clearThemeMode();
  }
}
