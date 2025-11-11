import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(
    this._getThemeModeUseCase,
    this._saveThemeModeUseCase,
    this._clearThemeModeUseCase,
  ) : super(ThemeMode.light) {
    _loadTheme();
  }

  final GetThemeModeUseCase _getThemeModeUseCase;
  final SaveThemeModeUseCase _saveThemeModeUseCase;
  final ClearThemeModeUseCase _clearThemeModeUseCase;

  Future<void> _loadTheme() async {
    final result = await _getThemeModeUseCase
        .execute();
    result.fold(
      (error) {
        emit(ThemeMode.light);
      },
      (isDarkMode) {
        emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final result = await _saveThemeModeUseCase
        .execute(
          SaveThemeModeParams(isDarkMode: newMode == ThemeMode.dark),
    );
    result.fold(
      (error) => null,
      (_) => emit(newMode),
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    final result = await _saveThemeModeUseCase
        .execute(
          SaveThemeModeParams(isDarkMode: mode == ThemeMode.dark),
    );
    result.fold(
      (error) => null,
      (_) => emit(mode),
    );
  }

  Future<void> clearTheme() async {
    await _clearThemeModeUseCase.execute();
    emit(ThemeMode.light);
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
