import 'package:dartz/dartz.dart';
import 'package:data/src/source/preferences_data_source/preferences_local_ds.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PreferencesRepository)
class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl({required this.preferencesLocalDataSource});

  final PreferencesLocalDataSource preferencesLocalDataSource;

  @override
  Future<Either<NetworkError, void>> saveThemeMode(bool isDarkMode) async {
    try {
      await preferencesLocalDataSource.saveThemeMode(isDarkMode);
      return right(null);
    } catch (e) {
      return left(NetworkError(message: e.toString()));
    }
  }

  @override
  Future<Either<NetworkError, bool>> getThemeMode() async {
    try {
      final result = await preferencesLocalDataSource.getThemeMode();
      return right(result);
    } catch (e) {
      return left(NetworkError(message: e.toString()));
    }
  }

  @override
  Future<Either<NetworkError, void>> clearThemeMode() async {
    try {
      await preferencesLocalDataSource.clearThemeMode();
      return right(null);
    } catch (e) {
      return left(NetworkError(message: e.toString()));
    }
  }
}
