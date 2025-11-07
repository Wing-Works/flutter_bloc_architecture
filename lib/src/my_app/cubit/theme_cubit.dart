import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/services/theme_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {

  ThemeCubit(this._themeService) : super(ThemeMode.light) {
    _loadTheme();
  }
  final ThemeService _themeService;

  Future<void> _loadTheme() async {
    final isDarkMode = await _themeService.getThemeMode();
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeService.saveThemeMode(newMode == ThemeMode.dark);
    emit(newMode);
  }

  Future<void> setTheme(ThemeMode mode) async {
    await _themeService.saveThemeMode(mode == ThemeMode.dark);
    emit(mode);
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
