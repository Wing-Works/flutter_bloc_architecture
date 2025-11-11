abstract class PreferencesLocalDataSource {
  Future<void> saveThemeMode(bool isDarkMode);

  Future<bool> getThemeMode();

  Future<void> clearThemeMode();
}
