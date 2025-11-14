abstract class PreferencesLocalDataSource {
  Future<bool> saveThemeMode(bool isDarkMode);

  Future<bool> getThemeMode();

  Future<bool> clearThemeMode();
}
