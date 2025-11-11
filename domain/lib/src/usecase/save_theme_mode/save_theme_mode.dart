import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/repository/preferences_repository/preferences_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:injectable/injectable.dart';

class SaveThemeModeParams extends Params {
  SaveThemeModeParams({required this.isDarkMode});

  final bool isDarkMode;

  @override
  Map<String, dynamic> get toJson => {'isDarkMode': isDarkMode};
}

@injectable
class SaveThemeModeUseCase extends BaseUseCase<SaveThemeModeParams, void> {
  SaveThemeModeUseCase(this._preferencesRepository);

  final PreferencesRepository _preferencesRepository;

  @override
  Future<Either<NetworkError, void>> execute(SaveThemeModeParams params) async {
    return _preferencesRepository.saveThemeMode(params.isDarkMode);
  }
}
