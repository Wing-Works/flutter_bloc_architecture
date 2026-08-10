import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:twofold/twofold.dart';

@injectable
class SaveThemeModeUseCase extends BaseUseCase<SaveThemeModeParams, void> {
  SaveThemeModeUseCase(this._preferencesRepository);

  final PreferencesRepository _preferencesRepository;

  @override
  Future<Twofold<bool, DatabaseError>> execute(
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
