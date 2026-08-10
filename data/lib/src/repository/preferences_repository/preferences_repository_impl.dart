import 'package:data/src/source/preferences_data_source/preferences_local_ds.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:twofold/twofold.dart';

@Injectable(as: PreferencesRepository)
class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl({required this.preferencesLocalDataSource});

  final PreferencesLocalDataSource preferencesLocalDataSource;

  @override
  Future<Twofold<bool, DatabaseError>> saveThemeMode(bool isDarkMode) async {
    try {
      final result = await preferencesLocalDataSource.saveThemeMode(isDarkMode);
      return Twofold.success(result);
    } catch (e) {
      return Twofold.error(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Twofold<bool, DatabaseError>> getThemeMode() async {
    try {
      final result = await preferencesLocalDataSource.getThemeMode();
      return Twofold.success(result);
    } catch (e) {
      return Twofold.error(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Twofold<bool, DatabaseError>> clearThemeMode() async {
    try {
      final result = await preferencesLocalDataSource.clearThemeMode();
      return Twofold.success(result);
    } catch (e) {
      return Twofold.error(DatabaseError(message: e.toString()));
    }
  }
}
