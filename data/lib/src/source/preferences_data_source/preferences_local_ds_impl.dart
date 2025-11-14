import 'package:data/src/source/preferences_data_source/preferences_local_ds.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: PreferencesLocalDataSource)
class PreferencesLocalDataSourceImpl implements PreferencesLocalDataSource {
  static const String _themeKey = 'theme_mode';

  @override
  Future<bool> saveThemeMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_themeKey, isDarkMode);
  }

  @override
  Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  @override
  Future<bool> clearThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_themeKey);
  }
}
