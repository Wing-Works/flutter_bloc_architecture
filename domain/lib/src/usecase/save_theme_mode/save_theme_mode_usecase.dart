import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveThemeModeUseCase extends BaseUseCase<SaveThemeModeParams, void> {
  SaveThemeModeUseCase(this._preferencesRepository);

  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<DatabaseError, bool>> execute(
    SaveThemeModeParams params,
  ) async {
    return _preferencesRepository.saveThemeMode(params.isDarkMode);
  }
}

class SaveThemeModeParams extends Params {
  SaveThemeModeParams({required this.isDarkMode});

  final bool isDarkMode;

  @override
  Map<String, dynamic> get toJson => {'isDarkMode': isDarkMode};
}
