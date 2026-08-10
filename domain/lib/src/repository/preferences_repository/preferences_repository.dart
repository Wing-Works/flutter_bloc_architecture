import 'package:domain/src/model/error/database_error.dart';
import 'package:twofold/twofold.dart';

abstract class PreferencesRepository {
  Future<Twofold<bool, DatabaseError>> saveThemeMode(bool isDarkMode);

  Future<Twofold<bool, DatabaseError>> getThemeMode();

  Future<Twofold<bool, DatabaseError>> clearThemeMode();
}
